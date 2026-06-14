/**
 * Extract languages from PetaBahasa Kemdikbud website
 * Usage: node scripts/extract-petabahasa.js > petabahsa-data.sql
 */

const fs = require('fs');
const path = require('path');

// Read the HTML file
const htmlFile = path.join(__dirname, '..', 'data', 'petabahsa.html');
let htmlContent;

try {
  htmlContent = fs.readFileSync(htmlFile, 'utf-8');
} catch (error) {
  console.error('Error reading HTML file:', error.message);
  process.exit(1);
}

// Parse HTML to extract language data
const tableRegex = /<tr[^>]*class="isi"[^>]*>[\s\n]*<td align=center><a name=(\d+)><\/a>(\d+)\.\/<\/td>\s*\n\s*<td valign=top>(.*?)<\/td>\s*\n\s*<td valign=top>(?:<b>(.+?)<\/b>)?<\/td>\s*\n\s*<td valign=top>(?<divclass="stat1"><a href=[^>]*><u>([^\)]+)<\/u><\/a></div>(?:<div[^>]*>[^<]*(?:<a[^>]*><u>[^<]*<\/u><\/a><\/div>)?)*<\/td>\s*\n\s*<td valign=top>(?:<b>(.+?)<\/b>)?<\/td>/gi;

// Alternative regex for simpler parsing
const rowRegex = /<tr[^>]*bgcolor=#(?:dfe2e3|cccdce)[^>]*>[\s\n]*\s*<td align=center><a name=\d+><\/a>\d+\.<\/td>\s*\n\s*<td valign=top><strong>(.*?)<\/strong>\s*\n\s*<\/td>\s*\n\s*<td valign=top> <b>(.*?)<\/b><\/td>\s*\n\s*<td valign=top><div class="stat1"><a[^>]*><u>([^)]+)<\/u><\/a>/gim;

// Simpler extraction approach - find all tr tags with bgcolor
const rows = [];
const trMatches = htmlContent.match(/<tr[^>]*bgcolor=#(?:dfe2e3|cccdce)[^>]*>[\s\S]*?<\/tr>/g);

console.log(`-- Data Bahasa Indonesia dari Petabahsa Kemdikbud`);
console.log(`-- Date: ${new Date().toISOString()}`);
console.log(`-- Total entries found in HTML: ${htmlContent.split('<tr').length - 1}`);
console.log();

if (trMatches && trMatches.length > 0) {
  console.log(`Found ${trMatches.length} potential rows.`);
  
  // Process each row
  let processedCount = 0;
  let errors = 0;
  
  const insertStatements = [];
  
  for (const row of trMatches) {
    try {
      // Extract language name
      const nameMatch = row.match(/<td valign=top><strong>(.*?)<\/strong>/i);
      if (!nameMatch) continue;
      
      let bahasaName = nameMatch[1].trim();
      // Clean up name
      bahasaName = bahasaName.replace(/\s+/g, ' ');
      
      // Extract region (Wilayah)
      const regionMatch = row.match(/<td valign=top> <b>(.*?)<\/b>/i);
      const wilayah = regionMatch ? regionMatch[1].trim() : null;
      
      // Extract province
      const provinceMatch = row.match(/<a[^>]*><u>([^)]+)<\/u><\/a>/i);
      const provinces = [];
      if (provinceMatch) {
        provinces.push(provinceMatch[1].trim());
        
        // Check for multiple provinces
        const allProvinceMatches = row.matchAll(/<a[^>]*><u>([^)]+)<\/u><\/a>/gi);
        for (const match of allProvinceMatches) {
          const p = match[1].trim();
          if (!provinces.includes(p)) {
            provinces.push(p);
          }
        }
      }
      
      // Normalize region mapping
      const normalizedWilayah = wilayah ? mapWilayah(wilayah) : null;
      
      rows.push({
        bahasa: bahasaName,
        wilayah: normalizedWilayah || wilayah,
        provinsis: provinces
      });
      
      processedCount++;
      
    } catch (error) {
      errors++;
      console.error(`Error processing row: ${error.message}`);
    }
  }
  
  console.log(`Successfully extracted ${processedCount} rows.`);
  if (errors > 0) console.log(`${errors} rows had errors.`);
  
  // Output as JSON for easy processing
  console.log('\n-- EXTRACTED_DATA_START');
  console.log(JSON.stringify(rows, null, 2));
  console.log('-- EXTRACTED_DATA_END');
  
} else {
  console.log('No rows found matching expected pattern.');
}

function mapWilayah(wilayah) {
  const map = {
    'Sumatra': 'sumatera',
    'Jawa dan Bali': 'jawa-bali',
    'Kalimantan': 'kalimantan',
    'Sulawesi': 'sulawesi',
    'Papua': 'papua',
    'Nusa Tenggara Barat': 'ntb',
    'Nusa Tenggara Timur': 'ntl'
  };
  return map[wilayah] || wilayah.toLowerCase();
}
