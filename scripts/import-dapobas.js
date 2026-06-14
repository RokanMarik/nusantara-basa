const fs = require('fs');
const { execSync } = require('child_process');

// Load data
const dapobas = JSON.parse(fs.readFileSync('data/dapobas-all-parsed.json', 'utf-8'));
const dbLangs = JSON.parse(fs.readFileSync('data/bahasa-list.json', 'utf-8'));

console.log(`Loaded ${dapobas.length} languages from DapoBas`);
console.log(`Loaded ${dbLangs.length} languages from database`);

// Create maps
const dbMap = new Map();
dbLangs.forEach(lang => {
  dbMap.set(lang.nama_bahasa.toLowerCase(), lang);
});

// Match and separate
const matched = [];
const newLangs = [];

dapobas.forEach(lang => {
  const key = lang.nama.toLowerCase();
  if (dbMap.has(key)) {
    matched.push({ dapobas: lang, db: dbMap.get(key) });
  } else {
    newLangs.push(lang);
  }
});

console.log(`\nMatched: ${matched.length} languages (will update with wilayah/provinsi)`);
console.log(`New: ${newLangs.length} languages (will insert)`);

// Generate SQL
const sqlLines = [];
sqlLines.push('-- DapoBas Import Script');
sqlLines.push(`-- Generated: ${new Date().toISOString()}`);
sqlLines.push(`-- Matched: ${matched.length}, New: ${newLangs.length}`);
sqlLines.push('');

// UPDATE existing languages with wilayah/provinsi info
sqlLines.push('-- ============================================================');
sqlLines.push('-- UPDATE existing languages with DapoBas wilayah/provinsi');
sqlLines.push('-- ============================================================');
matched.forEach(({ dapobas, db }) => {
  const wilayah = dapobas.wilayah.replace(/'/g, "''");
  const provinsi = dapobas.provinsi.replace(/'/g, "''");
  
  sqlLines.push(`UPDATE bahasa SET`);
  sqlLines.push(`  catatan = CONCAT(`);
  sqlLines.push(`    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,`);
  sqlLines.push(`    'Wilayah DapoBas: ${wilayah} | Provinsi DapoBas: ${provinsi}'`);
  sqlLines.push(`  ),`);
  sqlLines.push(`  diperbarui_pada = NOW()`);
  sqlLines.push(`WHERE id = '${db.id}';`);
  sqlLines.push('');
});

// INSERT new languages
sqlLines.push('-- ============================================================');
sqlLines.push('-- INSERT new languages from DapoBas');
sqlLines.push('-- ============================================================');
newLangs.forEach(lang => {
  const nama = lang.nama.replace(/'/g, "''");
  const wilayah = lang.wilayah.replace(/'/g, "''");
  const provinsi = lang.provinsi.replace(/'/g, "''");
  
  // Extract local name from parentheses if present
  const localMatch = lang.nama.match(/\(([^)]+)\)/);
  const namaLokal = localMatch ? localMatch[1].replace(/'/g, "''") : '';
  const namaBersih = lang.nama.replace(/\s*\([^)]*\)\s*/g, '').trim().replace(/'/g, "''");
  
  sqlLines.push(`INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)`);
  sqlLines.push(`VALUES (`);
  sqlLines.push(`  '${namaBersih}',`);
  sqlLines.push(`  ${namaLokal ? `'${namaLokal}'` : 'NULL'},`);
  sqlLines.push(`  'Sumber: DapoBas Kemdikbud | Wilayah: ${wilayah} | Provinsi: ${provinsi}',`);
  sqlLines.push(`  NOW(),`);
  sqlLines.push(`  NOW()`);
  sqlLines.push(`) ON CONFLICT DO NOTHING;`);
  sqlLines.push('');
});

// Write SQL file
fs.writeFileSync('data/seed-dapobas-full.sql', sqlLines.join('\n'));
console.log(`\nGenerated SQL file: data/seed-dapobas-full.sql`);
console.log(`  UPDATE statements: ${matched.length}`);
console.log(`  INSERT statements: ${newLangs.length}`);

// Show samples
console.log('\n=== Sample Updates ===');
matched.slice(0, 5).forEach(({ dapobas, db }) => {
  console.log(`  ${db.nama_bahasa} -> ${dapobas.wilayah}, ${dapobas.provinsi}`);
});

console.log('\n=== Sample New Languages ===');
newLangs.slice(0, 10).forEach(lang => {
  console.log(`  ${lang.no}. ${lang.nama} (${lang.wilayah}) - ${lang.provinsi}`);
});

// Execute SQL
console.log('\n=== Executing SQL via Supabase CLI ===');
try {
  execSync('supabase db query --file data/seed-dapobas-full.sql --linked', {
    stdio: 'inherit',
    cwd: process.cwd()
  });
  console.log('\n✅ SQL execution completed successfully!');
} catch (error) {
  console.error('\n❌ SQL execution failed:', error.message);
  process.exit(1);
}
