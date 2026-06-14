const fs = require('fs');

console.log('=== PARSING DATA VITALITAS BAHASA DAERAH ===\n');

const content = fs.readFileSync('C:/Users/Rokan Akbar Marik/Downloads/statistik-kebahasaan-2023.md', 'utf-8');
const lines = content.split('\n');

// Definisi kategori vitalitas dengan indeks daya hidup
const vitalityCategories = {
  'Aman': { indeks: '0.81-1.00', description: 'Bahasa yang memiliki indeks daya hidup tinggi' },
  'Rentan': { indeks: '0.61-0.80', description: 'Bahasa yang memiliki indeks daya hidup sedang' },
  'Mengalami Kemunduran': { indeks: '0.41-0.60', description: 'Bahasa yang mengalami penurunan penggunaan' },
  'Terancam Punah': { indeks: '0.21-0.40', description: 'Bahasa dalam kondisi kritis' },
  'Punah': { indeks: '0.00-0.20', description: 'Bahasa yang sudah tidak digunakan' }
};

// Parse data vitalitas
const vitalityData = [];
let currentCategory = null;
let currentLanguages = [];
let i = 2078; // Start dari line setelah header

// Helper untuk normalize nama bahasa
function normalizeLanguageName(name) {
  return name
    .replace(/^Bahasa\s+/i, '')
    .replace(/\s*\(.*?\)\s*/g, '') // Remove parentheses
    .replace(/\s+dialek\s+.*/gi, '') // Remove dialect info
    .replace(/\s+/g, ' ')
    .trim();
}

// Helper untuk cek apakah line adalah nama bahasa
function isLanguageLine(line) {
  const trimmed = line.trim();
  return trimmed.startsWith('Bahasa ') && 
         !trimmed.includes('indeks daya hidup') &&
         !trimmed.includes('berdasarkan sepuluh') &&
         !trimmed.includes('faktor vitalitas');
}

// Helper untuk cek apakah line adalah nama provinsi
function isProvinceLine(line) {
  const provinces = [
    'Aceh', 'Sumatra', 'Sumatera', 'Riau', 'Jambi', 'Bengkulu', 'Lampung',
    'Jawa', 'Bali', 'Nusa Tenggara', 'Kalimantan', 'Sulawesi', 'Maluku',
    'Papua', 'Gorontalo', 'DKI', 'DIY', 'Banten'
  ];
  const trimmed = line.trim();
  return provinces.some(p => trimmed.includes(p)) || 
         trimmed.match(/^[A-Z][a-z]+\s*[A-Z]/);
}

console.log('Mulai parsing dari line 2078...\n');

// Loop sampai menemukan akhir section vitalitas
while (i < lines.length && i < 2500) {
  const line = lines[i].trim();
  
  // Skip empty lines dan code blocks
  if (!line || line === '```') {
    i++;
    continue;
  }
  
  // Deteksi kategori vitalitas
  if (vitalityCategories[line]) {
    // Simpan data kategori sebelumnya
    if (currentCategory && currentLanguages.length > 0) {
      vitalityData.push({
        category: currentCategory,
        indeks: vitalityCategories[currentCategory].indeks,
        languages: [...currentLanguages]
      });
      console.log(`✓ Kategori ${currentCategory}: ${currentLanguages.length} bahasa`);
    }
    
    // Mulai kategori baru
    currentCategory = line;
    currentLanguages = [];
    
    // Skip description lines (6 lines)
    i += 6;
    continue;
  }
  
  // Skip header tabel
  if (line.includes('TABEL/') || line.includes('VITALITAS BAHASA DAERAH') || 
      line.includes('LOCAL LANGUAGE VITALITY') || line.includes('DATA PER')) {
    i++;
    continue;
  }
  
  // Skip page markers
  if (line.includes('Stask Kebahasaan')) {
    i++;
    continue;
  }
  
  // Parse nama bahasa
  if (isLanguageLine(line)) {
    const originalName = line.trim();
    const normalizedName = normalizeLanguageName(originalName);
    
    // Cari wilayah di line berikutnya
    let wilayah = '';
    let j = i + 1;
    while (j < lines.length && j < i + 5) {
      const nextLine = lines[j].trim();
      if (nextLine && isProvinceLine(nextLine) && !nextLine.startsWith('Bahasa ')) {
        wilayah = nextLine;
        break;
      }
      if (nextLine.startsWith('Bahasa ')) break;
      j++;
    }
    
    currentLanguages.push({
      original: originalName,
      normalized: normalizedName,
      wilayah: wilayah || 'Tidak diketahui'
    });
  }
  
  i++;
}

// Simpan kategori terakhir
if (currentCategory && currentLanguages.length > 0) {
  vitalityData.push({
    category: currentCategory,
    indeks: vitalityCategories[currentCategory].indeks,
    languages: [...currentLanguages]
  });
  console.log(`✓ Kategori ${currentCategory}: ${currentLanguages.length} bahasa`);
}

console.log('\n' + '='.repeat(60));
console.log('RINGKASAN DATA VITALITAS');
console.log('='.repeat(60));

let totalLanguages = 0;
vitalityData.forEach(cat => {
  console.log(`\n${cat.category} (Indeks: ${cat.indeks}):`);
  console.log(`  Jumlah: ${cat.languages.length} bahasa`);
  console.log(`  Contoh: ${cat.languages.slice(0, 5).map(l => l.normalized).join(', ')}`);
  totalLanguages += cat.languages.length;
});

console.log(`\n${'─'.repeat(60)}`);
console.log(`Total bahasa dengan data vitalitas: ${totalLanguages}`);
console.log(`${'─'.repeat(60)}`);

// Export ke JSON
const outputPath = 'C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa/data/vitality-data.json';
fs.writeFileSync(outputPath, JSON.stringify(vitalityData, null, 2));
console.log(`\n✓ Data disimpan ke: ${outputPath}`);

// Preview SQL yang akan di-generate
console.log('\n' + '='.repeat(60));
console.log('PREVIEW SQL UPDATE STATEMENTS');
console.log('='.repeat(60));

let sqlPreview = '';
let count = 0;

vitalityData.forEach(cat => {
  cat.languages.slice(0, 3).forEach(lang => {
    if (count < 5) {
      sqlPreview += `\nUPDATE bahasa SET\n`;
      sqlPreview += `  status_vitalitas = '${cat.category}',\n`;
      sqlPreview += `  catatan = CONCAT(\n`;
      sqlPreview += `    COALESCE(catatan, ''),\n`;
      sqlPreview += `    ' | Status Vitalitas: ${cat.category} (${cat.indeks}) - Statistik 2023'\n`;
      sqlPreview += `  ),\n`;
      sqlPreview += `  diperbarui_pada = NOW()\n`;
      sqlPreview += `WHERE LOWER(nama_bahasa) LIKE '%${lang.normalized.toLowerCase()}%';\n`;
      count++;
    }
  });
});

console.log(sqlPreview);
console.log('\n... (dan ratusan UPDATE statements lainnya)\n');

// Statistik matching dengan database
console.log('='.repeat(60));
console.log('ANALISIS MATCHING DENGAN DATABASE');
console.log('='.repeat(60));

try {
  const dbLangs = JSON.parse(fs.readFileSync('data/bahasa-list.json', 'utf-8'));
  const dbNames = dbLangs.map(l => l.nama_bahasa.toLowerCase());
  
  let matchCount = 0;
  const matchedLangs = [];
  
  vitalityData.forEach(cat => {
    cat.languages.forEach(lang => {
      const normalized = lang.normalized.toLowerCase();
      const found = dbNames.some(dbName => 
        dbName.includes(normalized) || normalized.includes(dbName)
      );
      
      if (found) {
        matchCount++;
        matchedLangs.push({
          nama: lang.normalized,
          status: cat.category,
          wilayah: lang.wilayah
        });
      }
    });
  });
  
  console.log(`\nBahasa di database: ${dbLangs.length}`);
  console.log(`Bahasa dengan data vitalitas: ${totalLanguages}`);
  console.log(`Matched (bisa di-update): ${matchCount}`);
  console.log(`Match rate: ${((matchCount/totalLanguages)*100).toFixed(1)}%`);
  
  console.log('\nContoh bahasa yang matched:');
  matchedLangs.slice(0, 10).forEach(m => {
    console.log(`  • ${m.nama} - ${m.status} (${m.wilayah})`);
  });
  
} catch (err) {
  console.log('⚠️  Tidak bisa load database untuk matching:', err.message);
}

console.log('\n' + '='.repeat(60));
console.log('✅ PARSING SELESAI');
console.log('='.repeat(60));
console.log('\nNext step: Generate SQL dan import ke database?');
