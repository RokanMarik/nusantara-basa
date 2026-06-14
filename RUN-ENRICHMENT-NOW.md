# 🚀 Panduan Eksekusi Data Enrichment Nusantara Basa

## ⚠️ Situasi

Environment AI tidak memiliki akses network ke Supabase (`hkeheukewxsvaarxaket.supabase.co`). Semua script harus dijalankan dari **local machine Anda**.

## 📋 Persiapan

### 1. Pastikan Anda di folder project

```bash
cd "C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa"
```

### 2. Verifikasi Node.js terinstall

```bash
node --version
```

Harus menampilkan versi (v18 atau lebih baru).

### 3. Verifikasi dependencies terinstall

```bash
npm install
```

### 4. Verifikasi file `.env` ada

```bash
cat .env
```

Harus ada:
- `NEXT_PUBLIC_SUPABASE_URL=https://hkeheukewxsvaarxaket.supabase.co`
- `SUPABASE_SERVICE_ROLE_KEY=eyJhbG...` (token panjang)

## 🎯 Langkah Eksekusi

### **Step 1: Data Enrichment** (Enrich existing 71 bahasa)

Menambah fitur linguistik, lokasi, dan kosakata untuk bahasa yang sudah ada.

```bash
node scripts/enrich-data-comprehensive.js
```

**Expected output:**
- Processing fitur linguistik untuk 71 bahasa
- Inserting lokasi data untuk 33 bahasa
- Generating auto summary untuk 51 bahasa
- Inserting kosakata Swadesh list

**Estimasi waktu:** 2-5 menit

---

### **Step 2: Bulk Insert 700+ Bahasa** (Expand database)

Menambah ratusan bahasa baru ke database.

```bash
node scripts/phase1-fast-insert.js
```

**Expected output:**
- Total languages in list: 464
- Batch processing in chunks
- Success/failure count

**Estimasi waktu:** 10-20 menit

---

### **Step 3: Historical Data** (Sejarah bahasa)

Menambah data peristiwa sejarah, pengaruh bahasa, dan nama historis.

```bash
node scripts/seed-historical.js
```

**Expected output:**
- Inserting peristiwa sejarah untuk Jawa, Sunda, Melayu
- Inserting pengaruh bahasa lain
- Inserting penutur historis
- Inserting riwayat nama

**Estimasi waktu:** 2-3 menit

---

## 🔍 Verifikasi

Setelah semua script selesai, jalankan query verifikasi di Supabase Dashboard:

### Buka Supabase SQL Editor:
https://supabase.com/dashboard/project/hkeheukewxsvaarxaket/sql/new

### Copy-paste query berikut:

```sql
-- Verifikasi jumlah bahasa
SELECT COUNT(*) as total_bahasa FROM bahasa;

-- Verifikasi fitur linguistik
SELECT COUNT(*) as bahasa_dengan_fitur FROM fitur_linguistik;

-- Verifikasi lokasi
SELECT COUNT(*) as bahasa_dengan_lokasi FROM lokasi_bahasa;

-- Verifikasi kosakata
SELECT COUNT(*) as total_kosakata FROM kosakata;

-- Verifikasi peristiwa sejarah
SELECT COUNT(*) as total_peristiwa FROM peristiwa_sejarah;

-- Verifikasi pengaruh bahasa
SELECT COUNT(*) as total_pengaruh FROM pengaruh_bahasa_lain;

-- Verifikasi auto summary
SELECT COUNT(*) as bahasa_dengan_summary 
FROM bahasa 
WHERE auto_summary IS NOT NULL;
```

### Expected results:
- `total_bahasa`: 700+ (awalnya 71, ditambah 464)
- `bahasa_dengan_fitur`: 71+
- `bahasa_dengan_lokasi`: 71+
- `total_kosakata`: 1000+ (Swadesh lists)
- `total_peristiwa`: 20+ (sample historical events)
- `total_pengaruh`: 15+ (language influences)
- `bahasa_dengan_summary`: 71+

---

## 🛠️ Troubleshooting

### Error: `ENOTFOUND hkeheukewxsvaarxaket.supabase.co`

**Solusi:** Pastikan koneksi internet aktif dan tidak ada firewall yang memblokir akses ke Supabase.

### Error: `Cannot find module '@supabase/supabase-js'`

**Solusi:** Jalankan `npm install` dulu.

### Error: `Missing SUPABASE_SERVICE_ROLE_KEY`

**Solusi:** Pastikan file `.env` ada dan berisi key yang benar.

### Script hang atau timeout

**Solusi:** 
1. Tekan `Ctrl+C` untuk stop
2. Coba jalankan lagi
3. Jika masih gagal, cek koneksi internet

---

## 📊 Alternative: Via Supabase Dashboard

Jika script Node.js tidak bisa dijalankan, Anda bisa langsung eksekusi SQL di Supabase Dashboard:

### 1. Buka Supabase SQL Editor
https://supabase.com/dashboard/project/hkeheukewxsvaarxaket/sql/new

### 2. Copy file SQL berikut ke editor:

**File:** `prisma/migrations/002_enrich_data.sql`

### 3. Klik "Run"

---

## ✅ Setelah Enrichment Selesai

1. **Test lokal:**
   ```bash
   npm run dev
   ```
   Buka http://localhost:3000

2. **Commit changes:**
   ```bash
   git add .
   git commit -m "feat: complete data enrichment for 700+ languages"
   git push
   ```

3. **Deploy ke Vercel:**
   ```bash
   npx vercel --prod
   ```

---

## 📞 Butuh Bantuan?

Jika ada error yang tidak terdokumentasi, hubungi saya dengan:
1. Screenshot error
2. Output dari `node --version`
3. Output dari `npm list @supabase/supabase-js`

---

**Status:** Siap dijalankan dari local machine Anda! 🚀
