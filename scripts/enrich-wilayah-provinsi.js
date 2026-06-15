const fs = require('fs');

// Read petabahsa data (skip header lines)
const rawData = fs.readFileSync('data/petabahsa-parsed.json', 'utf8');
const lines = rawData.split('\n');
const jsonStart = lines.findIndex(line => line.trim().startsWith('['));
const jsonData = lines.slice(jsonStart).join('\n');
const petabahsa = JSON.parse(jsonData);

console.log('=== Petabahsa Data Analysis ===');
console.log('Total entries:', petabahsa.length);

// Count entries with wilayah/provinsi
const withWilayah = petabahsa.filter(p => p.wilayah);
console.log('With wilayah:', withWilayah.length);

const withProvinsi = petabahsa.filter(p => p.provinsi_str);
console.log('With provinsi:', withProvinsi.length);

// Show sample
console.log('\n=== Sample ===');
petabahsa.slice(0, 5).forEach(p => {
  console.log(`${p.nama}: wilayah=${p.wilayah}, provinsi=${p.provinsi_str}`);
});

// Create mapping for enrichment
const mapping = {};
petabahsa.forEach(p => {
  if (p.wilayah || p.provinsi_str) {
    mapping[p.nama] = {
      wilayah: p.wilayah,
      provinsi: p.provinsi_str
    };
  }
});

console.log('\n=== Generated mapping entries:', Object.keys(mapping).length);

// Generate SQL for enrichment
let sql = '-- Enrich wilayah and provinsi from petabahsa data\n\n';
let count = 0;

Object.keys(mapping).forEach(nama => {
  const data = mapping[nama];
  if (data.wilayah && data.provinsi) {
    sql += `UPDATE bahasa SET wilayah = '${data.wilayah}', provinsi = '${data.provinsi}' WHERE nama_bahasa = '${nama}' AND (wilayah IS NULL OR provinsi IS NULL);\n`;
    count++;
  }
});

console.log('Generated SQL statements:', count);

// Write SQL file
fs.writeFileSync('scripts/enrich-wilayah-provinsi-from-petabahsa.sql', sql);
console.log('\nSQL file written: scripts/enrich-wilayah-provinsi-from-petabahsa.sql');
