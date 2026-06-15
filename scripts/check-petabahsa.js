const fs = require('fs');

const petabahsa = JSON.parse(fs.readFileSync('data/petabahsa-parsed.json', 'utf8'));

console.log('=== Petabahsa Data Analysis ===');
console.log('Total entries:', petabahsa.length);

// Count entries with coordinates
const withCoords = petabahsa.filter(p => p.latitude && p.longitude);
console.log('With coordinates:', withCoords.length);

// Count entries with wilayah/provinsi
const withWilayah = petabahsa.filter(p => p.wilayah);
console.log('With wilayah:', withWilayah.length);

const withProvinsi = petabahsa.filter(p => p.provinsi);
console.log('With provinsi:', withProvinsi.length);

// Show sample
console.log('\n=== Sample with coordinates ===');
withCoords.slice(0, 5).forEach(p => {
  console.log(`${p.nama_bahasa}: lat=${p.latitude}, lng=${p.longitude}, wilayah=${p.wilayah}, provinsi=${p.provinsi}`);
});

// Check for "Aceh" specifically
const aceh = petabahsa.find(p => p.nama_bahasa === 'Aceh');
console.log('\n=== Aceh entry ===');
console.log(aceh);
