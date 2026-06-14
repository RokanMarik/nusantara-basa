const fs = require('fs');

// Load DapoBas data
const dapobasLangs = JSON.parse(fs.readFileSync('data/dapobas-all-parsed.json', 'utf-8'));
console.log('DapoBas languages:', dapobasLangs.length);

// Load existing database languages
const dbLangs = JSON.parse(fs.readFileSync('data/bahasa-list.json', 'utf-8'));
console.log('Database languages:', dbLangs.length);

// Create lookup maps
const dbByName = new Map();
for (const lang of dbLangs) {
    dbByName.set(lang.nama_bahasa.toLowerCase(), lang);
}

const dapobasByName = new Map();
for (const lang of dapobasLangs) {
    dapobasByName.set(lang.nama.toLowerCase(), lang);
}

// Find matches
const matched = [];
const newLangs = [];
const unmatchedDb = [];

// Check which DapoBas languages are already in DB
for (const dbLang of dapobasLangs) {
    const dbName = dbLang.nama.toLowerCase();
    
    // Try exact match first
    if (dbByName.has(dbName)) {
        matched.push({ dapobas: dbLang, db: dbByName.get(dbName) });
    } else {
        // Try fuzzy match (remove parenthetical, trim)
        const cleanName = dbName.replace(/\s*\([^)]*\)\s*/g, '').trim();
        let found = false;
        for (const [key, val] of dbByName.entries()) {
            if (key.replace(/\s*\([^)]*\)\s*/g, '').trim() === cleanName) {
                matched.push({ dapobas: dbLang, db: val });
                found = true;
                break;
            }
        }
        if (!found) {
            newLangs.push(dbLang);
        }
    }
}

// Check which DB languages are not in DapoBas
for (const dbLang of dbLangs) {
    const dbName = dbLang.nama_bahasa.toLowerCase();
    if (!dapobasByName.has(dbName)) {
        unmatchedDb.push(dbLang);
    }
}

console.log('\nMatching results:');
console.log('  Matched:', matched.length);
console.log('  New (to insert):', newLangs.length);
console.log('  In DB but not in DapoBas:', unmatchedDb.length);

// Generate SQL for updates
const sqlLines = [];
sqlLines.push('-- Nusantara Basa - DapoBas Data Import');
sqlLines.push('-- Source: https://dapobas.kemendikdasmen.go.id/');
sqlLines.push('-- Date: ' + new Date().toISOString());
sqlLines.push('-- Total DapoBas: ' + dapobasLangs.length);
sqlLines.push('-- Matched: ' + matched.length);
sqlLines.push('-- New: ' + newLangs.length);
sqlLines.push('');

// 1. Update existing languages with wilayah & provinsi from DapoBas
sqlLines.push('-- ============================================================');
sqlLines.push('-- UPDATE existing languages with DapoBas region/province data');
sqlLines.push('-- ============================================================');
for (const { dapobas, db } of matched) {
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
}

// 2. Insert new languages
sqlLines.push('-- ============================================================');
sqlLines.push('-- INSERT new languages from DapoBas');
sqlLines.push('-- ============================================================');
for (const lang of newLangs) {
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
}

// Write SQL file
fs.writeFileSync('data/seed-dapobas-full.sql', sqlLines.join('\n'));
console.log('\nGenerated seed-dapobas-full.sql');
console.log('  UPDATE statements:', matched.length);
console.log('  INSERT statements:', newLangs.length);

// Show sample new languages
console.log('\nSample new languages to insert:');
for (let i = 0; i < Math.min(10, newLangs.length); i++) {
    console.log(`  ${newLangs[i].no}. ${newLangs[i].nama} (${newLangs[i].wilayah}) - ${newLangs[i].provinsi}`);
}

// Show sample matched languages
console.log('\nSample matched languages:');
for (let i = 0; i < Math.min(10, matched.length); i++) {
    console.log(`  ${matched[i].dapobas.nama} -> DB: ${matched[i].db.nama_bahasa}`);
}
