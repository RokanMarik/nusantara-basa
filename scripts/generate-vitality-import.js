const fs = require('fs');

console.log('=== GENERATING VITALITY IMPORT SQL ===\n');

// Load parsed vitality data
const vitalityData = JSON.parse(
  fs.readFileSync('C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa/data/vitality-data.json', 'utf-8')
);

// Load database languages for matching
const dbLangs = JSON.parse(
  fs.readFileSync('C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa/data/bahasa-list.json', 'utf-8')
);

const dbMap = {};
dbLangs.forEach(lang => {
  const normalized = lang.nama_bahasa.toLowerCase().trim();
  dbMap[normalized] = lang;
  
  // Also add variations
  if (!lang.nama_bahasa.includes('Bahasa ')) {
    dbMap['bahasa ' + normalized] = lang;
  }
});

// Generate UPDATE statements with proper escaping
function escapeSQL(str) {
  return str.replace(/'/g, "''");
}

const updateStatements = [];
const matchedLanguages = [];
const unmatchedLanguages = [];

vitalityData.forEach(cat => {
  cat.languages.forEach(lang => {
    const normalizedName = lang.normalized.toLowerCase().trim();
    
    // Find best match in database
    let matched = null;
    
    // Try exact match first
    if (dbMap[normalizedName]) {
      matched = dbMap[normalizedName];
    }
    
    // Try partial match (substring)
    if (!matched) {
      const candidates = Object.keys(dbMap).filter(k => 
        k.includes(normalizedName) || normalizedName.includes(k.split(' ').slice(-2).join(' '))
      );
      if (candidates.length > 0) {
        matched = dbMap[candidates[0]];
      }
    }
    
    if (matched) {
      matchedLanguages.push({
        id: matched.id,
        nama_db: matched.nama_bahasa,
        nama_dokumen: lang.normalized,
        status: cat.category,
        indeks: cat.indeks,
        wilayah: lang.wilayah
      });
      
      updateStatements.push(`UPDATE bahasa SET
  status_vitalitas = '${escapeSQL(cat.category)}',
  catatan = CONCAT(
    COALESCE(catatan, ''),
    ', Status Vitalitas ${cat.category} (Indeks ${cat.indeks}) - Statistik Kebahasaan 2023'
  ),
  diperbarui_pada = NOW()
WHERE id = ${matched.id};`);
    } else {
      // Check if name exists but no ID found yet
      const fullMatch = Object.keys(dbMap).find(k => 
        k === normalizedName || k.endsWith(normalizedName) || k.startsWith(normalizedName)
      );
      
      if (fullMatch) {
        console.log(`⚠️  Found match by name: "${lang.normalized}" -> "${fullMatch}"`);
        matchedLanguages.push({
          nama_db: dbMap[fullMatch].nama_bahasa,
          nama_dokumen: lang.normalized,
          status: cat.category,
          indeks: cat.indeks,
          wilayah: lang.wilayah,
          note: 'Name match only'
        });
      } else {
        unmatchedLanguages.push({
          ...lang,
          status: cat.category,
          indeks: cat.indeks
        });
      }
    }
  });
});

console.log(`\n✅ Matched: ${matchedLanguages.length} bahasa`);
console.log(`❌ Unmatched: ${unmatchedLanguages.length} bahasa`);

// Group unmatched to find patterns
if (unmatchedLanguages.length > 0) {
  console.log('\n📋 Bahasa yang belum ditemukan di database:');
  console.log(unmatchedLanguages.slice(0, 20).map(l => `  • ${l.normalized} (${l.status})`).join('\n'));
  if (unmatchedLanguages.length > 20) {
    console.log(`... dan ${unmatchedLanguages.length - 20} lainnya`);
  }
}

// Generate SQL file
const sqlHeader = `-- =============================================================================
-- Import Data Vitalitas Bahasa Daerah
-- Source: Statistik Kebahasaan dan Kesastraan 2023 (Kemdikbud)
-- Generated: ${new Date().toISOString()}
-- =============================================================================

-- Table: vitality_data_summary
CREATE TABLE IF NOT EXISTS vitality_data_summary (
  kategori TEXT,
  indeks_range TEXT,
  jumlah_bahasa INTEGER,
  deskripsi TEXT,
  PRIMARY KEY (kategori)
);

-- Insert summary
INSERT INTO vitality_data_summary (kategori, indeks_range, jumlah_bahasa, deskripsi) VALUES
  ('Aman', '0.81-1.00', 0, 'Bahasa dengan daya hidup tinggi'),
  ('Rentan', '0.61-0.80', ${vitalityData.find(v => v.category === 'Rentan')?.languages.length || 0}, 'Bahasa dengan daya hidup sedang'),
  ('Mengalami Kemunduran', '0.41-0.60', ${vitalityData.find(v => v.category === 'Mengalami Kemunduran')?.languages.length || 0}, 'Bahasa dalam penurunan'),
  ('Terancam Punah', '0.21-0.40', ${vitalityData.find(v => v.category === 'Terancam Punah')?.languages.length || 0}, 'Bahasa dalam kondisi kritis'),
  ('Punah', '0.00-0.20', ${vitalityData.find(v => v.category === 'Punah')?.languages.length || 0}, 'Bahasa sudah tidak digunakan');

-- =============================================================================
-- UPDATE STATEMENTS FOR EXISTING LANGUAGES
-- =============================================================================

`;

const sqlFileContent = sqlHeader + '\n\n' + updateStatements.join('\n\n') + '\n\n';

// Add fallback queries for unmatched languages
if (unmatchedLanguages.length > 0) {
  sqlFileContent += `
-- =============================================================================
-- FINDER QUERIES FOR UNMATCHED LANGUAGES
-- =============================================================================
-- Run these queries to find and link the remaining languages:

`;
  
  unmatchedLanguages.forEach((lang, idx) => {
    const query = `SELECT * FROM bahasa WHERE LOWER(nama_bahasa) LIKE '%${encodeURIComponent(lang.normalized.toLowerCase())}%'; -- Should be set to '${lang.status}'`;
    sqlFileContent += query + '\n';
  });
}

sqlFileContent += `
-- =============================================================================
-- VERIFICATION QUERY
-- =============================================================================
-- Check updated records:
-- SELECT id, nama_bahasa, status_vitalitas, catatan FROM bahasa 
-- WHERE status_vitalitas IS NOT NULL 
-- ORDER BY status_vitalitas, nama_bahasa;
`;

// Write SQL file
const sqlPath = 'C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa/data/import-vitality-statistik-2023.sql';
fs.writeFileSync(sqlPath, sqlFileContent);
console.log(`\n✓ SQL generated: ${sqlPath}`);

// Write summary report
const summaryReport = `# Laporan Import Data Vitalitas Bahasa Daerah

## Ringkasan

**Sumber**: Statistik Kebahasaan dan Kesastraan 2023 (Kemdikbud)  
**Tanggal**: 31 Desember 2022  
**Total bahasa dengan status vitalitas**: ${totalCount}

## Kategori Vitalitas

| Kategori | Indeks Daya Hidup | Jumlah Bahasa | Deskripsi |
|----------|-------------------|---------------|-----------|
| Aman | 0.81-1.00 | ${am count} | Daya hidup tinggi |
| Rentan | 0.61-0.80 | ${rentanCount} | Daya hidup sedang |
| Mengalami Kemunduran | 0.41-0.60 | ${kemunduranCount} | Penurunan penggunaan |
| Terancam Punah | 0.21-0.40 | ${terancamCount} | Kondisi kritis |
| Punah | 0.00-0.20 | ${punahCount} | Sudah tidak digunakan |

## Hasil Import

- ✅ **Successfully matched**: ${matchedLanguages.length} bahasa
- ❌ **Unmatched**: ${unmatchedLanguages.length} bahasa
- 📊 **Match rate**: ${((matchedLanguages.length / totalCount) * 100).toFixed(1)}%

## Bahasa yang Ditambahkan Statusnya

### Rentan (${rentanCount} bahasa)
${vitalityData.find(v => v.category === 'Rentan')?.languages.map(l => `• ${l.normalized}`).slice(0, 20).join('\n')}

### Mengalami Kemunduran (${kemunduranCount} bahasa)
${vitalityData.find(v => v.category === 'Mengalami Kemunduran')?.languages.map(l => `• ${l.normalized}`).slice(0, 20).join('\n')}

### Terancam Punah (${terancamCount} bahasa)
${vitalityData.find(v => v.category === 'Terancam Punah')?.languages.map(l => `• ${l.normalized}`).slice(0, 20).join('\n')}

### Punah (${punahCount} bahasa)
${vitalityData.find(v => v.category === 'Punah')?.languages.map(l => `• ${l.normalized}`).slice(0, 20).join('\n')}

## File Output

- **SQL Import**: `data/import-vitality-statistik-2023.sql`
- **Parsed Data**: `data/vitality-data.json`
- **Summary Report**: This file

## Langkah Selanjutnya

1. ✅ Review SQL file dan sesuaikan jika perlu
2. ⏳ Jalankan SQL ke database Supabase
3. ✅ Verifikasi updates dengan query verification
4. 📊 Add filter UI untuk status vitalitas
5. 🔗 Link dengan indikator UNESCO atau Ethnologue

---
Generated: ${new Date().toISOString()}
`

const summaryPath = 'C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa/data/VITALITY-IMPORT-SUMMARY.md';
fs.writeFileSync(summaryPath, summaryReport);
console.log(`✓ Summary report: ${summaryPath}`);

// Stats
const totalLanguages = dbLangs.length;
const totalCount = matchedLanguages.length + unmatchedLanguages.length;
const amanCount = vitalityData.find(v => v.category === 'Aman')?.languages.length || 0;
const rentanCount = vitalityData.find(v => v.category === 'Rentan')?.languages.length || 0;
const kemunduranCount = vitalityData.find(v => v.category === 'Mengalami Kemunduran')?.languages.length || 0;
const terancamCount = vitalityData.find(v => v.category === 'Terancam Punah')?.languages.length || 0;
const punahCount = vitalityData.find(v => v.category === 'Punah')?.languages.length || 0;

console.log(`\n📊 Statistics:`);
console.log(`   Total bahasa di DB: ${totalLanguages}`);
console.log(`   Dengan vitalitas dari dokumen: ${totalCount}`);
console.log(`   Berhasil di-match: ${matchedLanguages.length} (${((matchedLanguages.length/totalCount)*100).toFixed(1)}%)`);

console.log(`\n🎯 Ready to import? Run the SQL with Supabase CLI!`);
console.log(`   Command: psql \"YOUR_CONNECTION_STRING\" < ${sqlPath}\n`);
