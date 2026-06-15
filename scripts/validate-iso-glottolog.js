#!/usr/bin/env node

const fs = require('fs');
const https = require('https');

// Read ISO codes
const isoCodes = require('../data/iso-codes-for-validation.json');

console.log(`\n=== GLOTTOLOG VALIDATION ===`);
console.log(`Total ISO codes to validate: ${isoCodes.length}\n`);

// Glottolog uses ISO 639-3 codes as identifiers
// We'll validate by checking against Glottolog's downloadable data

const GLOTTOLOG_DATA_URL = 'https://raw.githubusercontent.com/glottolog/glottolog/master/glottolog/languoid.ini';
const ISO_639_3_URL = 'https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso-639-3.tab';

console.log('Fetching ISO 639-3 registry from SIL International...\n');

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

async function validateISO() {
  try {
    // Fetch ISO 639-3 registry
    const isoData = await fetchURL(ISO_639_3_URL);
    
    // Parse TSV (Id, Part2B, Part2T, Part1, Scope, Language_Type, Ref_Name, Comment)
    const lines = isoData.split('\n').slice(1); // Skip header
    const validISOCodes = new Set();
    const isoDetails = {};
    
    lines.forEach(line => {
      if (!line.trim()) return;
      const parts = line.split('\t');
      if (parts.length >= 7) {
        const code = parts[0];
        const refName = parts[6];
        const scope = parts[4];
        const langType = parts[5];
        
        if (code && code.length === 3) {
          validISOCodes.add(code);
          isoDetails[code] = {
            name: refName,
            scope: scope,
            type: langType
          };
        }
      }
    });
    
    console.log(`ISO 639-3 Registry loaded: ${validISOCodes.size} codes\n`);
    
    // Validate our codes
    const valid = [];
    const invalid = [];
    const details = {
      valid: [],
      invalid: []
    };
    
    isoCodes.forEach(code => {
      if (validISOCodes.has(code)) {
        valid.push(code);
        details.valid.push({
          code: code,
          name: isoDetails[code].name,
          scope: isoDetails[code].scope,
          type: isoDetails[code].type
        });
      } else {
        invalid.push(code);
        details.invalid.push({ code: code, reason: 'Not found in ISO 639-3 registry' });
      }
    });
    
    console.log(`--- VALIDATION RESULTS ---\n`);
    console.log(`✅ Valid ISO codes: ${valid.length} (${((valid.length/isoCodes.length)*100).toFixed(1)}%)`);
    console.log(`❌ Invalid ISO codes: ${invalid.length} (${((invalid.length/isoCodes.length)*100).toFixed(1)}%)\n`);
    
    if (invalid.length > 0) {
      console.log(`Invalid codes:`);
      invalid.forEach(code => {
        console.log(`  - ${code}`);
      });
      console.log();
    }
    
    // Scope analysis
    const scopeAnalysis = {
      'Individual': 0,
      'Macrolanguage': 0,
      'Special': 0
    };
    
    details.valid.forEach(item => {
      if (scopeAnalysis[item.scope] !== undefined) {
        scopeAnalysis[item.scope]++;
      }
    });
    
    console.log(`--- SCOPE ANALYSIS ---\n`);
    Object.entries(scopeAnalysis).forEach(([scope, count]) => {
      if (count > 0) {
        console.log(`${scope}: ${count} languages`);
      }
    });
    
    // Type analysis
    const typeAnalysis = {
      'L': 0, // Living
      'E': 0, // Extinct
      'A': 0, // Ancient
      'H': 0, // Historical
      'C': 0  // Constructed
    };
    
    details.valid.forEach(item => {
      if (typeAnalysis[item.type] !== undefined) {
        typeAnalysis[item.type]++;
      }
    });
    
    console.log(`\n--- LANGUAGE TYPE ANALYSIS ---\n`);
    const typeLabels = {
      'L': 'Living',
      'E': 'Extinct',
      'A': 'Ancient',
      'H': 'Historical',
      'C': 'Constructed'
    };
    
    Object.entries(typeAnalysis).forEach(([type, count]) => {
      if (count > 0) {
        console.log(`${typeLabels[type]}: ${count} languages`);
      }
    });
    
    // Save report
    const report = {
      timestamp: new Date().toISOString(),
      source: 'ISO 639-3 Registry (SIL International)',
      totalCodes: isoCodes.length,
      valid: valid.length,
      invalid: invalid.length,
      validationRate: ((valid.length/isoCodes.length)*100).toFixed(1) + '%',
      scopeAnalysis: scopeAnalysis,
      typeAnalysis: {
        living: typeAnalysis.L,
        extinct: typeAnalysis.E,
        ancient: typeAnalysis.A,
        historical: typeAnalysis.H,
        constructed: typeAnalysis.C
      },
      details: details
    };
    
    fs.writeFileSync('data/iso-validation-report.json', JSON.stringify(report, null, 2));
    console.log(`\n--- FILES GENERATED ---`);
    console.log(`Validation report: data/iso-validation-report.json`);
    
    // Save valid codes with details for reference
    fs.writeFileSync('data/iso-validated-codes.json', JSON.stringify(details.valid, null, 2));
    console.log(`Validated codes: data/iso-validated-codes.json`);
    
    if (invalid.length > 0) {
      fs.writeFileSync('data/iso-invalid-codes.json', JSON.stringify(details.invalid, null, 2));
      console.log(`Invalid codes: data/iso-invalid-codes.json`);
    }
    
  } catch (error) {
    console.error('Error during validation:', error.message);
    process.exit(1);
  }
}

validateISO();
