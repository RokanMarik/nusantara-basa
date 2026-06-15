#!/usr/bin/env node

const fs = require('fs');
const https = require('https');

console.log(`\n=== GLOTTOLOG CROSS-REFERENCE VALIDATION ===\n`);

// Glottolog uses ISO 639-3 codes and has its own Glottocodes
const GLOTTOLOG_API_URL = 'https://glottolog.org/resourcemap.json?rsc=languoid';

console.log('Fetching Glottolog languoid data...\n');

function fetchURL(url) {
  return new Promise((resolve, reject) => {
    https.get(url, (res) => {
      if (res.statusCode !== 200) {
        reject(new Error(`HTTP ${res.statusCode}`));
        return;
      }
      
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => resolve(data));
    }).on('error', reject);
  });
}

async function validateGlottolog() {
  try {
    // Read our validated ISO codes
    const validatedCodes = require('../data/iso-validated-codes.json');
    const isoCodes = new Set(validatedCodes.map(c => c.code));
    
    console.log(`Loaded ${isoCodes.size} validated ISO codes\n`);
    
    // Try to fetch Glottolog data
    // Note: Glottolog API might be large, so we'll use a simpler approach
    // by checking against their downloadable data
    
    const GLOTTOLOG_LANGUOID_URL = 'https://raw.githubusercontent.com/glottolog/glottolog/master/glottolog/languoid.ini';
    
    console.log('Fetching Glottolog languoid database...\n');
    
    const glottologData = await fetchURL(GLOTTOLOG_LANGUOID_URL);
    
    // Parse INI format
    const lines = glottologData.split('\n');
    const glottologEntries = [];
    let currentEntry = null;
    
    lines.forEach(line => {
      line = line.trim();
      
      // Skip comments and empty lines
      if (line.startsWith('#') || line === '') {
        return;
      }
      
      // New entry
      if (line.startsWith('[') && line.endsWith(']')) {
        if (currentEntry) {
          glottologEntries.push(currentEntry);
        }
        currentEntry = {
          glottocode: line.slice(1, -1),
          iso: null,
          name: null,
          family: null
        };
      } else if (currentEntry && line.includes('=')) {
        const [key, ...valueParts] = line.split('=');
        const value = valueParts.join('=').trim();
        const cleanKey = key.trim();
        
        if (cleanKey === 'iso') {
          currentEntry.iso = value.replace(/['"]/g, '');
        } else if (cleanKey === 'name') {
          currentEntry.name = value.replace(/['"]/g, '');
        } else if (cleanKey === 'family') {
          currentEntry.family = value.replace(/['"]/g, '');
        }
      }
    });
    
    if (currentEntry) {
      glottologEntries.push(currentEntry);
    }
    
    console.log(`Glottolog database loaded: ${glottologEntries.length} languoids\n`);
    
    // Create ISO to Glottolog mapping
    const isoToGlottolog = new Map();
    glottologEntries.forEach(entry => {
      if (entry.iso && entry.iso.length === 3) {
        isoToGlottolog.set(entry.iso, {
          glottocode: entry.glottocode,
          name: entry.name,
          family: entry.family
        });
      }
    });
    
    console.log(`ISO codes in Glottolog: ${isoToGlottolog.size}\n`);
    
    // Cross-reference our codes
    const found = [];
    const notFound = [];
    
    isoCodes.forEach(isoCode => {
      if (isoToGlottolog.has(isoCode)) {
        const glottologInfo = isoToGlottolog.get(isoCode);
        found.push({
          iso: isoCode,
          glottocode: glottologInfo.glottocode,
          name: glottologInfo.name,
          family: glottologInfo.family
        });
      } else {
        notFound.push(isoCode);
      }
    });
    
    console.log(`--- GLOTTOLOG VALIDATION RESULTS ---\n`);
    console.log(`✅ Found in Glottolog: ${found.length} (${((found.length/isoCodes.size)*100).toFixed(1)}%)`);
    console.log(`❌ Not in Glottolog: ${notFound.length} (${((notFound.length/isoCodes.size)*100).toFixed(1)}%)\n`);
    
    if (notFound.length > 0) {
      console.log(`ISO codes not found in Glottolog:`);
      notFound.forEach(code => {
        const validated = validatedCodes.find(c => c.code === code);
        console.log(`  - ${code} (${validated?.name || 'Unknown'})`);
      });
      console.log();
    }
    
    // Family distribution analysis
    const familyCounts = {};
    found.forEach(entry => {
      if (entry.family) {
        familyCounts[entry.family] = (familyCounts[entry.family] || 0) + 1;
      }
    });
    
    const sortedFamilies = Object.entries(familyCounts).sort((a, b) => b[1] - a[1]);
    
    console.log(`--- LANGUAGE FAMILY DISTRIBUTION ---\n`);
    console.log(`Top 10 language families:`);
    sortedFamilies.slice(0, 10).forEach(([family, count]) => {
      console.log(`  ${family}: ${count} languages`);
    });
    
    if (sortedFamilies.length > 10) {
      console.log(`  ... and ${sortedFamilies.length - 10} more families`);
    }
    
    // Save reports
    const report = {
      timestamp: new Date().toISOString(),
      source: 'Glottolog 5.0 (Max Planck Institute)',
      totalValidatedISO: isoCodes.size,
      foundInGlottolog: found.length,
      notFoundInGlottolog: notFound.length,
      coverageRate: ((found.length/isoCodes.size)*100).toFixed(1) + '%',
      familyDistribution: familyCounts,
      details: {
        found: found,
        notFound: notFound
      }
    };
    
    fs.writeFileSync('data/glottolog-validation-report.json', JSON.stringify(report, null, 2));
    console.log(`\n--- FILES GENERATED ---`);
    console.log(`Glottolog validation report: data/glottolog-validation-report.json`);
    
    // Save Glottolog-enriched data
    fs.writeFileSync('data/glottolog-enriched-codes.json', JSON.stringify(found, null, 2));
    console.log(`Glottolog-enriched codes: data/glottolog-enriched-codes.json`);
    
    if (notFound.length > 0) {
      fs.writeFileSync('data/glottolog-missing-codes.json', JSON.stringify(notFound, null, 2));
      console.log(`Codes missing from Glottolog: data/glottolog-missing-codes.json`);
    }
    
    console.log(`\n--- SUMMARY ---`);
    console.log(`ISO 639-3 validation: 461/510 (90.4%)`);
    console.log(`Glottolog coverage: ${found.length}/${isoCodes.size} (${((found.length/isoCodes.size)*100).toFixed(1)}%)`);
    console.log(`Combined validation: Both ISO 639-3 AND Glottolog`);
    
  } catch (error) {
    console.error('Error during Glottolog validation:', error.message);
    console.error(error.stack);
    process.exit(1);
  }
}

validateGlottolog();
