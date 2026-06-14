const fs = require('fs');

// Read parsed languages from Petabahsa
const petabahsaLangs = JSON.parse(fs.readFileSync('data/petabahsa-parsed.json', 'utf-8'));
console.log(`Loaded ${petabahsaLangs.length} languages from Petabahsa`);

// Query existing database languages
const dbLangs = JSON.parse(fs.readFileSync('data/bahasa-list.json', 'utf-8'));
console.log(`Found ${dbLangs.length} languages in database`);

// Create lookup map
const dbMap = new Map();
for (const lang of dbLangs) {
  dbMap.set(lang.nama_bahasa, lang.id);
}

let updatesNeeded = 0;
let alreadyMatched = 0;

const sqlStatements = [];

// Match and update
for (const pbLang of petabahsaLangs) {
  const dbLang = dbMap.get(pbLang.nama);
  
  if (!dbLang) {
    console.error(`Not found in DB: ${pbLang.nama}`);
    continue;
  }
  
  updatesNeeded++;
  
  // Escape strings for SQL
  const wilayah_escaped = pbLang.wilayah.replace(/'/g, "''");
  const provinsi_str = pbLang.provinsis.join(', ');
  const provinsi_escaped = provinsi_str.replace(/'/g, "''");
  
  sqlStatements.push(`UPDATE lokasi SET 
  provinsi = '${provinsi_escaped}',
  tipe_wilayah = CASE '${pbLang.wilayah}'
    WHEN 'Papua' THEN 'pulau'
    WHEN 'Nusa Tenggara Timur' THEN 'pulau'
    WHEN 'Nusa Tenggara Barat' THEN 'pulau'
    WHEN 'Kalimantan' THEN 'pulau'
    WHEN 'Sulawesi' THEN 'pulau'
    WHEN 'Sumatra' THEN 'pulau'
    WHEN 'Jawa dan Bali' THEN 'pulau'
    ELSE 'daratan'
  END,
  diperbarui_pada = NOW()
WHERE bahasa_id = '${dbLang.id}'
  AND tipe_wilayah IS NULL;

-- Insert missing location
INSERT INTO lokasi (bahasa_id, provinsi, kabupaten, kecamatan, tipe_wilayah, dibuat_pada)
SELECT '${dbLang.id}', '${provinsi_escaped}', NULL, NULL,
  CASE '${pbLang.wilayah}'
    WHEN 'Papua' THEN 'pulau'
    WHEN 'Nusa Tenggara Timur' THEN 'pulau'
    WHEN 'Nusa Tenggara Barat' THEN 'pulau'
    WHEN 'Kalimantan' THEN 'pulau'
    WHEN 'Sulawesi' THEN 'pulau'
    WHEN 'Sumatra' THEN 'pulau'
    WHEN 'Jawa dan Bali' THEN 'pulau'
    ELSE 'daratan'
  END,
  NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM lokasi l WHERE l.bahasa_id = '${dbLang.id}'
);`);
  
  alreadyMatched++;
}

console.log(`Generated ${sqlStatements.length} SQL statements for ${alreadyMatched} languages`);

// Write SQL file
fs.writeFileSync('data/update-lokasi.sql', sqlStatements.join('\n\n'));
console.log('Saved to data/update-lokasi.sql');

// Show some examples
console.log('\nExamples:');
for (let i = 0; i < Math.min(5, alreadyMatched); i++) {
  console.log(`\n${i+1}. ${petabahsaLangs[i].nama}`);
  console.log(`   Wilayah: ${petabahsaLangs[i].wilayah}`);
  console.log(`   Provinsi: ${petabahsaLangs[i].provinsis.join(', ')}`);
}
