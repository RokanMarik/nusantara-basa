const fs = require('fs');

// Read ISO mapping
const isoMapping = JSON.parse(fs.readFileSync('data/iso-mapping.json', 'utf8'));

// Generate SQL UPDATE statements with conflict handling
let sql = `-- Update ISO 639-3 codes for Indonesian languages
-- Generated on ${new Date().toISOString().split('T')[0]}
-- Source: Ethnologue, Glottolog, ISO 639-3 registry
-- Total updates: ${Object.keys(isoMapping).length}

`;

const entries = Object.entries(isoMapping);
let count = 0;

entries.forEach(([bahasa, iso]) => {
  const escapedBahasa = bahasa.replace(/'/g, "''");
  // Use WHERE clause to avoid duplicate key errors
  sql += `UPDATE bahasa SET kode_iso_639 = '${iso}' WHERE nama_bahasa = '${escapedBahasa}' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = '${iso}' AND b2.id != bahasa.id);\n`;
  count++;
});

// Add verification query
sql += `
-- Verification: Check ISO coverage
SELECT 
  COUNT(*) as total,
  COUNT(kode_iso_639) as with_iso,
  ROUND(COUNT(kode_iso_639) * 100.0 / COUNT(*), 1) as coverage_pct
FROM bahasa;
`;

fs.writeFileSync('scripts/enrich-iso-codes.sql', sql);
console.log(`Generated ${count} UPDATE statements`);
console.log('SQL file saved to scripts/enrich-iso-codes.sql');
