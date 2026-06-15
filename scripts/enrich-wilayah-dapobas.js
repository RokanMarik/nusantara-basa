const fs = require('fs');

// Read dapobas data (skip header lines)
const rawData = fs.readFileSync('data/dapobas-all-parsed.json', 'utf8');
const lines = rawData.split('\n');
const jsonStart = lines.findIndex(line => line.trim().startsWith('['));
const jsonData = lines.slice(jsonStart).join('\n');
const dapobas = JSON.parse(jsonData);

console.log('=== DapoBas Data Analysis ===');
console.log('Total entries:', dapobas.length);

// Count entries with wilayah/provinsi
const withWilayah = dapobas.filter(p => p.wilayah);
console.log('With wilayah:', withWilayah.length);

const withProvinsi = dapobas.filter(p => p.provinsi);
console.log('With provinsi:', withProvinsi.length);

// Check for unique names
const names = new Set(dapobas.map(p => p.nama));
console.log('Unique names:', names.size);

// Show sample
console.log('\n=== Sample ===');
dapobas.slice(0, 5).forEach(p => {
  console.log(`${p.nama}: wilayah=${p.wilayah}, provinsi=${p.provinsi}`);
});

// Generate SQL for enrichment
let sql = '-- Enrich wilayah and provinsi from dapobas data\n\n';
let count = 0;
let dupes = 0;

dapobas.forEach(p => {
  if (p.wilayah && p.provinsi && p.nama) {
    const nama = p.nama.replace(/'/g, "''");
    const wilayah = p.wilayah.replace(/'/g, "''");
    const provinsi = p.provinsi.replace(/'/g, "''");
    sql += `UPDATE bahasa SET wilayah = '${wilayah}', provinsi = '${provinsi}' WHERE nama_bahasa = '${nama}' AND (wilayah IS NULL OR provinsi IS NULL);\n`;
    count++;
  }
});

console.log('Generated SQL statements:', count);

// Write SQL file
fs.writeFileSync('scripts/enrich-wilayah-provinsi-from-dapobas.sql', sql);
console.log('\nSQL file written: scripts/enrich-wilayah-provinsi-from-dapobas.sql');
