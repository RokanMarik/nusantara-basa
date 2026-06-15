const fs = require('fs');

function readJSON(filePath) {
  const raw = fs.readFileSync(filePath, 'utf8');
  const lines = raw.split('\n');
  const jsonStart = lines.findIndex(line => line.trim().startsWith('[') || line.trim().startsWith('{'));
  const jsonData = lines.slice(jsonStart).join('\n');
  return JSON.parse(jsonData);
}

// Check existing data sources for ISO codes
console.log('=== Checking data sources for ISO codes ===\n');

// Petabahsa
const petabahsa = readJSON('data/petabahsa-parsed.json');
const petabahsaWithISO = petabahsa.filter(p => p.iso || p.iso_639_3 || p.kode_iso);
console.log(`Petabahsa: ${petabahsa.length} total, ${petabahsaWithISO.length} with ISO codes`);
if (petabahsaWithISO.length > 0) {
  console.log('Sample:', JSON.stringify(petabahsaWithISO[0], null, 2));
}

// Dapobas
const dapobas = readJSON('data/dapobas-all-parsed.json');
const dapobasWithISO = dapobas.filter(p => p.iso || p.iso_639_3 || p.kode_iso);
console.log(`\nDapobas: ${dapobas.length} total, ${dapobasWithISO.length} with ISO codes`);
if (dapobasWithISO.length > 0) {
  console.log('Sample:', JSON.stringify(dapobasWithISO[0], null, 2));
}

// Check what fields exist in petabahsa
console.log('\n=== Petabahsa fields ===');
console.log(Object.keys(petabahsa[0]));

console.log('\n=== Dapobas fields ===');
console.log(Object.keys(dapobas[0]));

// Check bahasa-list
const bahasaList = readJSON('data/bahasa-list.json');
const bahasaListWithISO = bahasaList.filter(p => p.iso || p.iso_639_3 || p.kode_iso);
console.log(`\nBahasa List: ${bahasaList.length} total, ${bahasaListWithISO.length} with ISO codes`);
console.log('Bahasa List fields:', Object.keys(bahasaList[0]));
