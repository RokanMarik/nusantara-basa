const fs = require('fs');

const content = fs.readFileSync('C:\\Users\\Rokan Akbar Marik\\Downloads\\statistik-kebahasaan-2023.md', 'utf-8');
const lines = content.split('\n');

console.log('=== ANALISIS DOKUMEN STATISTIK KEBAHASAAN 2023 ===\n');

// Fungsi untuk membaca range lines
function readRange(start, end) {
  return lines.slice(start, end + 1).join('\n');
}

// 1. Cari Tabel Persebaran Bahasa menurut Provinsi (halaman 2 = sekitar line ~1400)
console.log('1. MENCARI TABEL PERSEBARAN BAHASA MENURUT PROVINSI');
console.log('-'.repeat(60));

// Cari "MENURUT PROVINSI" pertama yang bukan daftar isi
let provinsiTableStart = -1;
for (let i = 500; i < lines.length; i++) {
  if (lines[i].includes('PERSEBARAN BAHASA') || 
      (lines[i].includes('MENURUT PROVINSI') && !lines[i].includes('...'))) {
    provinsiTableStart = i;
    break;
  }
}

if (provinsiTableStart > 0) {
  console.log(`Ditemukan di line ${provinsiTableStart}`);
  console.log(readRange(provinsiTableStart, provinsiTableStart + 50));
}

// 2. Cari Tabel Vitalitas (halaman 15 = ~2076)
console.log('\n\n2. TABEL VITALITAS BAHASA DAERAH (halaman 15)');
console.log('-'.repeat(60));
console.log(readRange(2070, 2170));

// 3. Cari tabel jumlah bahasa per provinsi (angka 718/801/total)
console.log('\n\n3. MENCARI TOTAL BAHASA DAERAH DI INDONESIA');
console.log('-'.repeat(60));

const totalLines = [];
for (let i = 0; i < lines.length; i++) {
  const line = lines[i];
  if (line.match(/\b(718|801|718|700|800)\b/) && 
      (line.includes('Bahasa') || line.includes('bahasa') || line.includes('Daerah'))) {
    totalLines.push(`Line ${i}: ${line}`);
    if (i > 0) totalLines.push(`Line ${i-1}: ${lines[i-1]}`);
    if (i < lines.length-1) totalLines.push(`Line ${i+1}: ${lines[i+1]}`);
    totalLines.push('---');
  }
}
console.log(totalLines.slice(0, 30).join('\n'));

// 4. Cari tabel status vitalitas (Aman, Rentan, dst)
console.log('\n\n4. STATUS VITALITAS LENGKAP');
console.log('-'.repeat(60));

const statusKeywords = ['Aman', 'Rentan', 'Mengalami Kemunduran', 'Rentan Punah', 'Punah'];
const statusSummary = {};
for (let i = 0; i < lines.length; i++) {
  for (const keyword of statusKeywords) {
    if (lines[i].trim() === keyword || lines[i].includes(keyword)) {
      if (!statusSummary[keyword]) statusSummary[keyword] = [];
      if (statusSummary[keyword].length < 3) {
        statusSummary[keyword].push(`Line ${i}: ${lines[i].substring(0, 100)}`);
      }
    }
  }
}
console.log(JSON.stringify(statusSummary, null, 2));

// 5. Cari data yang cocok untuk enrich database
console.log('\n\n5. DATA YANG BISA MEMPERKAYA NUSANTARA BASA');
console.log('-'.repeat(60));

// Cari jumlah bahasa per provinsi
const provinsiData = [];
const provinsiNames = [
  'Aceh', 'Sumatera Utara', 'Sumatera Barat', 'Riau', 'Jambi',
  'Sumatera Selatan', 'Bengkulu', 'Lampung', 'Kepulauan Bangka',
  'Kepulauan Riau', 'DKI Jakarta', 'Jawa Barat', 'Jawa Tengah',
  'DI Yogyakarta', 'Jawa Timur', 'Banten', 'Bali', 'Nusa Tenggara',
  'Kalimantan', 'Sulawesi', 'Maluku', 'Papua', 'Gorontalo'
];

for (let i = 1400; i < 1800 && i < lines.length; i++) {
  const line = lines[i];
  for (const prov of provinsiNames) {
    if (line.includes(prov)) {
      // Cari angka di sekitarnya
      const context = readRange(i-1, i+2);
      if (context.match(/\b\d+\b/)) {
        provinsiData.push({ line: i, province: prov, context: context.replace(/\n/g, ' | ') });
        break;
      }
    }
  }
}
console.log(`Ditemukan ${provinsiData.length} baris data provinsi`);
provinsiData.slice(0, 20).forEach(p => {
  console.log(`  Line ${p.line} [${p.province}]: ${p.context}`);
});

// 6. Ringkasan nilai dokumen
console.log('\n\n=== RINGKASAN NILAI DOKUMEN UNTUK NUSANTARA BASA ===');
console.log('-'.repeat(60));
console.log(`✓ Total halaman dokumen: ~106 halaman`);
console.log(`✓ Berisi data vitalitas bahasa daerah (Aman, Rentan, Kemunduran, dst)`);
console.log(`✓ Data persebaran bahasa per provinsi & per kabupaten`);
console.log(`✓ Daftar bahasa dengan status vitalitas eksplisit`);
console.log(`✓ Data dari Badan Pengembangan dan Pembinaan Bahasa Kemdikbud`);
