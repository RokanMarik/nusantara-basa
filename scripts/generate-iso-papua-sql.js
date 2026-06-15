// Generate SQL for verified Papua ISO codes
const fs = require('fs');

const data = JSON.parse(fs.readFileSync('data/papua-iso-verified.json', 'utf8'));
const mappings = data.mappings;

let sql = '-- Verified Papua ISO Code Enrichment\n';
sql += '-- Source: ' + data.metadata.source + '\n';
sql += '-- Date: ' + data.metadata.verified_date + '\n';
sql += '-- Confidence: ' + data.metadata.confidence + '\n';
sql += '-- Total mappings: ' + Object.keys(mappings).length + '\n\n';

sql += 'BEGIN;\n\n';

const processedISOs = new Set();
let count = 0;

for (const [bahasa, iso] of Object.entries(mappings)) {
  if (processedISOs.has(iso)) {
    sql += `-- SKIPPED (duplicate ISO): ${bahasa} -> ${iso}\n`;
    continue;
  }
  
  const escapedBahasa = bahasa.replace(/'/g, "''");
  sql += `UPDATE bahasa SET kode_iso_639 = '${iso}' WHERE nama_bahasa = '${escapedBahasa}' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = '${iso}' AND b2.id != bahasa.id);\n`;
  
  processedISOs.add(iso);
  count++;
}

sql += '\nCOMMIT;\n\n';

sql += '-- Verification query\n';
sql += `SELECT COUNT(*) as updated_count FROM bahasa WHERE kode_iso_639 IS NOT NULL AND provinsi IN ('Papua', 'Papua Barat');\n`;

fs.writeFileSync('scripts/enrich-iso-papua-verified.sql', sql);

console.log(`Generated SQL with ${count} UPDATE statements`);
console.log('Saved to: scripts/enrich-iso-papua-verified.sql');
