const fs = require('fs');

console.log('=== GENERATING FINAL MAPPING SQL ===\n');

// Load data
const unmatched = JSON.parse(fs.readFileSync('data/unmatched-vitality-languages.json', 'utf-8'));
const dbLangs = JSON.parse(fs.readFileSync('data/bahasa-list.json', 'utf-8'));

// Database IDs from research
const mapDecisions = {
  // MAP (UPDATE existing)
  'Tenggalan': { type: 'map', targetId: 'f2f7ef21-cc2e-4a7a-995a-8a5a60dc5185', targetName: 'Tengger', status: 'Mengalami Kemunduran' },
  'Mander': { type: 'map', targetId: 'ff4f28b9-982e-4285-8976-f7bac57197d4', targetName: 'Mandar', status: 'Punah', note: 'Status "Punah" contradicts current speaker count' },
  'Batak Toba': { type: 'map', targetId: '984ad9d2-9233-4709-9ed0-265d69320a07', targetName: 'Batak Toba', originalName: 'Toba', status: 'Mengalami Kemunduran' },
  
  // Need manual review
  'Minahasa Rentan': { type: 'manual_review', status: 'Rentan', source: 'appears in both categories' },
  'Minahasa Punah': { type: 'manual_review', status: 'Punah', duplicate_of: 'Minahasa Rentan' }
};

// Generate UPDATE statements for MAP operations
const updateStatements = [];
let updatedCount = 0;

Object.keys(mapDecisions).forEach(key => {
  const decision = mapDecisions[key];
  
  if (decision.type === 'map') {
    let updateSql = `-- ${key} → ${decision.targetName} (${decision.status})`;
    updateSql += decision.note ? `\n-- Note: ${decision.note}` : '';
    
    updateStatements.push({
      sql: `UPDATE bahasa SET
  status_vitalitas = '${decision.status}',
  catatan = CONCAT(
    COALESCE(catatan, ''),
    ', Status Vitalitas ${decision.status} - Statistik Kebahasaan 2023 [MAP: ${key}]'
  ),
  diperbarui_pada = NOW()
WHERE id = '${decision.targetId}';`,
      comment: `MAP: ${key} → ${decision.targetName} (${decision.status})` + (decision.note ? ` | ${decision.note}` : '')
    });
    updatedCount++;
  }
});

// Generate INSERT statements for NEW languages
const newLanguages = [];
const discardList = ['kategori kris'];

unmatched.forEach(lang => {
  const normalizedName = lang.nama.trim();
  
  // Check if it's a MAP case (but not mapped yet)
  if (!mapDecisions[normalizedName] && !mapDecisions[`Batak ${normalizedName}`]) {
    newLanguages.push({
      name: normalizedName,
      original: lang.original,
      status: lang.status,
      indeks: lang.indeks,
      wilayah: lang.wilayah || 'Belum teridentifikasi'
    });
  }
});

console.log(`\n✓ MAP cases: ${updatedCount}`);
console.log(`✓ New language entries: ${newLanguages.length}`);
console.log(`✓ Discard list: ${discardList.length}`);
console.log(`✓ Manual review needed: 1 (Minahasa duplicate)`);

// Generate full SQL file
const sqlHeader = `-- =============================================================================
-- IMPORT DATA VITALITAS STATISTIK 2023 - FINAL IMPLEMENTATION
-- Source: Statistik Kebahasaan dan Kesastraan 2023 (Kemdikbud)
-- Generated: ${new Date().toISOString()}
-- Method: Manual Mapping Research + Web Search Analysis
-- =============================================================================

-- Summary:
-- - Languages already imported via auto-parsing: 49
-- - Languages from this batch (manual mapping): ${newLanguages.length + updatedCount}
--   * Mapped to existing: ${updatedCount}
--   * New inserts: ${newLanguages.length}
-- - Discarded (parsing errors): ${discardList.length}
-- 
-- TOTAL STATUS VITALITAS: ~${95 - discardList.length} languages
-- Coverage: ~${((95 - discardList.length) / 1001 * 100).toFixed(1)}% of database

-- =============================================================================
-- PART 1: MAP OPERATIONS (Update Existing Records)
-- =============================================================================

`;

let part1SQL = '';
updateStatements.forEach(stmt => {
  part1SQL += `-- ${stmt.comment}\n`;
  part1SQL += stmt.sql + '\n\n';
});

const insertTemplates = newLanguages.map(lang => {
  const escapedName = lang.name.replace(/'/g, "''");
  const wilayah = (lang.wilayah && lang.wilayah !== 'Belum teridentifikasi' && lang.wilayah !== 'Tidak diketahui')
    ? lang.wilayah : '';
  const catatanText = `Wilayah: ${wilayah || 'Belum teridentifikasi'} | Status Vitalitas: ${lang.status} (Indeks ${lang.indeks}) | Sumber: Statistik Kebahasaan 2023 (Kemdikbud)`;
  const escapedCatatan = catatanText.replace(/'/g, "''");

  return `INSERT INTO bahasa (id, nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
VALUES (gen_random_uuid(), '${escapedName}', '${lang.status}', '${escapedCatatan}', NOW(), NOW());`;
});

const part2SQL = `
-- =============================================================================
-- PART 2: INSERT OPERATIONS (New Language Entries)
-- =============================================================================

`;

let part2SQLContent = '';
insertTemplates.forEach(sql => {
  part2SQLContent += `${sql}\n`;
});

const discardNote = `-- =============================================================================
-- PART 3: DISCARDED ENTRIES
-- =============================================================================

-- The following entries were discarded due to parsing errors or unclear identity:
-- ${discardList.join(', ')}

-- Manual review recommended for:
-- - Minahasa (appears in both "Rentan" and "Punah" categories)
--   → May represent different Minahasa languages (Tombulu, Tontemboan, etc.)
--   → OR parsing error in source document
--   → REQUIRES VERIFICATION against original Statistik 2023
`;

const verificationQuery = `
-- =============================================================================
-- PART 4: VERIFICATION QUERIES
-- =============================================================================

-- 1. Check all languages with status_vitalitas
SELECT 
  status_vitalitas, 
  COUNT(*) as jumlah,
  MIN(diperbarui_pada) as first_updated,
  MAX(diperbarui_pada) as last_updated
FROM bahasa
WHERE status_vitalitas IS NOT NULL
GROUP BY status_vitalitas
ORDER BY status_vitalitas;

-- 2. Show sample records for each status category
SELECT 
  nama_bahasa,
  status_vitalitas,
  LEFT(catatan, 100) as catatan_preview,
  diperbarui_pada
FROM bahasa
WHERE status_vitalitas IN ('Aman', 'Rentan', 'Mengalami Kemunduran', 'Terancam Punah', 'Punah')
ORDER BY status_vitalitas, nama_bahasa
LIMIT 50;

-- 3. Verify MAP operations worked correctly
SELECT 
  b.nama_bahasa,
  b.status_vitalitas,
  b.catatan
FROM bahasa b
WHERE LOWER(b.nama_bahasa) IN ('tengger', 'mandar', 'batak toba')
  AND b.status_vitalitas IS NOT NULL;

-- 4. List newly inserted languages (with Statistik 2023 in catatan)
SELECT
  nama_bahasa,
  status_vitalitas,
  LEFT(catatan, 120) as catatan_preview,
  dibuat_pada
FROM bahasa
WHERE catatan LIKE '%Statistik Kebahasaan 2023%'
  AND dibuat_pada >= CURRENT_DATE
ORDER BY nama_bahasa;

-- =============================================================================
-- END OF SQL SCRIPT
-- =============================================================================
`;

// Write final SQL file
const finalSql = sqlHeader + part1SQL + part2SQL + part2SQLContent + discardNote + verificationQuery;

const outputPath = 'C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa/data/import-vitality-statistik-2023-FINAL.sql';
fs.writeFileSync(outputPath, finalSql);

console.log('\n' + '='.repeat(80));
console.log('✅ FINAL SQL GENERATED');
console.log('='.repeat(80));
console.log(`File: ${outputPath}`);
console.log(`Total lines: ${(finalSql.match(/\n/g) || []).length}`);
console.log(`Size: ${(finalSql.length / 1024).toFixed(2)} KB`);
console.log('\nBreakdown:');
console.log(`  • MAP (UPDATE) statements: ${updatedCount}`);
console.log(`  • INSERT (NEW LANGUAGES): ${newLanguages.length}`);
console.log(`  • DISCARD notes: ${discardList.length}`);
console.log(`  • Manual review flags: 1`);
console.log('\nNext step: Execute SQL with Supabase CLI');
console.log('Command: supabase db query --linked < filename');
