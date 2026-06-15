const fs = require('fs');

function readJSON(filePath) {
  const raw = fs.readFileSync(filePath, 'utf8');
  const lines = raw.split('\n');
  const jsonStart = lines.findIndex(line => line.trim().startsWith('[') || line.trim().startsWith('{'));
  const jsonData = lines.slice(jsonStart).join('\n');
  return JSON.parse(jsonData);
}

console.log('=== Checking for coordinate data in source files ===\n');

// Check petabahasa-parsed.json
const petabahsa = readJSON('data/petabahsa-parsed.json');

// Check dapobas-all-parsed.json
const dapobas = JSON.parse(fs.readFileSync('data/dapobas-all-parsed.json', 'utf8'));
const dapobasWithCoords = dapobas.filter(p => p.latitude || p.longitude || p.koordinat);
console.log(`\nDapobas: ${dapobas.length} total, ${dapobasWithCoords.length} with coordinates`);
if (dapobasWithCoords.length > 0) {
  console.log('Sample:', dapobasWithCoords[0]);
}

// Check db-lang-raw.json
const dbLang = JSON.parse(fs.readFileSync('data/db-lang-raw.json', 'utf8'));
const dbLangWithCoords = dbLang.filter(p => p.latitude || p.longitude || p.koordinat);
console.log(`\nDB Lang Raw: ${dbLang.length} total, ${dbLangWithCoords.length} with coordinates`);
if (dbLangWithCoords.length > 0) {
  console.log('Sample:', dbLangWithCoords[0]);
}

// Check bahasa-list.json
const bahasaList = JSON.parse(fs.readFileSync('data/bahasa-list.json', 'utf8'));
const bahasaListWithCoords = bahasaList.filter(p => p.latitude || p.longitude || p.koordinat);
console.log(`\nBahasa List: ${bahasaList.length} total, ${bahasaListWithCoords.length} with coordinates`);
if (bahasaListWithCoords.length > 0) {
  console.log('Sample:', bahasaListWithCoords[0]);
}

console.log('\n=== Summary ===');
console.log(`Total sources with coordinates: ${petabahsaWithCoords.length + dapobasWithCoords.length + dbLangWithCoords.length + bahasaListWithCoords.length}`);
