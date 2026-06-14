# Laporan Peningkatan Data & UI - Nusantara Basa

**Tanggal**: 15 Januari 2025  
**Status**: ✅ SELESAI (5/5 tasks)

---

## Ringkasan Eksekutif

Berhasil menyelesaikan 5 prioritas peningkatan data dan UI:

1. ✅ **Verifikasi Bahasa Rentan → Aman** - Membersihkan 8 duplikat, update 7 bahasa besar
2. ✅ **UI Filter Status Vitalitas** - Sudah ada dan berfungsi di `/daftar-bahasa`
3. ✅ **Metadata Wilayah** - Menambahkan kolom wilayah/provinsi (789 wilayah, 699 provinsi)
4. ✅ **Cross-reference Ethnologue/Glottolog** - Menambahkan kolom EGIDS level dan metadata linguistik
5. ✅ **Dashboard Statistik** - Membuat halaman `/dashboard` dengan visualisasi Recharts

---

## Task 1: Verifikasi Bahasa Rentan → Aman

### Tindakan yang Dilakukan

**Pembersihan Data Duplikat** (8 entri):
- Aframa, Dajub, Gresi, Kuri, Meoswar, Sentani, Tagalisa, Walsa

**Update Status ke "Aman"** (7 bahasa besar):

| Bahasa | Penutur | EGIDS | Sumber |
|--------|---------|-------|--------|
| Makassar | 2.1 juta | 6a (Vigorous) | Ethnologue 2024 |
| Sasak | 2.1 juta | 6a (Vigorous) | Ethnologue 2024 |
| Toraja | 1 juta | 5 (Developing) | Ethnologue 2024 |
| Batak Karo | 600 ribu | 6a (Vigorous) | Ethnologue 2024 |
| Dayak Ngaju | 900 ribu | 5 (Developing) | Ethnologue 2024 |
| Batak Simalungun | 500 ribu | 6a (Vigorous) | Ethnologue 2024 |
| Mandar | 500 ribu+ | 5 (Developing) | Ethnologue 2024, DapoBas |

### Hasil Akhir

**Distribusi Status Vitalitas**:
- Aman: 15 bahasa
- Rentan: 29 bahasa
- Mengalami Kemunduran: 48 bahasa
- Punah: 61 bahasa
- **Total**: 153 bahasa dengan status

---

## Task 2: UI Filter Status Vitalitas

### Status

✅ **SUDAH ADA** di halaman `/daftar-bahasa`

### Fitur

- Dropdown filter "Semua Status" (line 188-205 di `app/daftar-bahasa/page.tsx`)
- Filter real-time berdasarkan status vitalitas
- Integrasi dengan search dan filter rumpun
- Sorting by status vitalitas

---

## Task 3: Tambah Metadata Wilayah Provinsi/Kabupaten

### Tindakan yang Dilakukan

**1. Tambah Kolom Baru**:
```sql
ALTER TABLE bahasa 
ADD COLUMN wilayah text,
ADD COLUMN provinsi text,
ADD COLUMN kabupaten text;
```

**2. Populate Data dari Kolom Catatan**:
```sql
UPDATE bahasa SET
  wilayah = REGEXP_REPLACE(SPLIT_PART(...), ...)
WHERE catatan LIKE '%Wilayah%';
```

### Hasil

- **789 bahasa** dengan data wilayah
- **699 bahasa** dengan data provinsi

**Contoh Data**:
- Abun → Papua, Papua Barat
- Makassar → Sulawesi, Sulawesi Selatan
- Bali → Bali, Bali

---

## Task 4: Cross-reference Ethnologue/Glottolog

### Tindakan yang Dilakukan

**1. Tambah Kolom Metadata Linguistik**:
```sql
ALTER TABLE bahasa 
ADD COLUMN egids_level text,
ADD COLUMN jumlah_penutur_tahun integer,
ADD COLUMN sumber_referensi text;
```

**2. Ekstraksi Data dari Catatan**:
- Parse EGIDS level dari text
- Extract tahun data penutur (2020/2024)
- Identifikasi sumber referensi

### Hasil

**15 bahasa** dengan metadata linguistik lengkap:

| Bahasa | EGIDS | Tahun | Sumber |
|--------|-------|-------|--------|
| Jawa | 4 - Educational | 2020 | Ethnologue 2024 |
| Sunda | 6a - Vigorous | 2020 | Ethnologue 2024 |
| Bali | 6a - Vigorous | 2024 | Ethnologue 2024 |
| Makassar | 6a - Vigorous | 2024 | Ethnologue 2024 |
| Batak Karo | 6a - Vigorous | 2024 | Ethnologue 2024 |
| ... | ... | ... | ... |

### EGIDS Scale Reference

- **1 - National**: Bahasa nasional (Indonesian)
- **4 - Educational**: Digunakan di pendidikan (Javanese)
- **5 - Developing**: Masih berkembang (Bugis, Aceh, Madura)
- **6a - Vigorous**: Aktif digunakan (Sunda, Bali, Minangkabau, Banjar)
- **6b - Threatened**: Terancam
- **7+ - Endangered**: Terancam punah

---

## Task 5: Dashboard Statistik Visualisasi Bahasa

### Tindakan yang Dilakukan

**1. Install Dependencies**:
```bash
npm install recharts
```

**2. Buat API Endpoint**:
- `app/api/stats/route.ts`
- Fetch data dari Supabase
- Return JSON dengan statistik lengkap

**3. Buat Halaman Dashboard**:
- `app/dashboard/page.tsx`
- 4 jenis visualisasi chart (Recharts)
- Responsive design dengan Tailwind CSS

### Fitur Dashboard

**Summary Cards**:
- Total bahasa
- Bahasa dengan data penutur
- Bahasa dengan status "Aman"

**Visualisasi Charts**:

1. **Pie Chart**: Distribusi status vitalitas
   - Warna-coded (Aman=green, Rentan=yellow, Punah=gray)

2. **Bar Chart**: Distribusi level EGIDS
   - Sorted by level (1-10)

3. **Horizontal Bar Chart**: Top 10 bahasa dengan penutur terbanyak
   - Interactive tooltip dengan jumlah penutur

4. **Bar Chart**: Distribusi wilayah
   - Sorted by count

5. **Horizontal Bar Chart**: Top 15 provinsi
   - Interactive tooltip

### Teknologi

- **Framework**: Next.js 14 (App Router)
- **Charting Library**: Recharts
- **Styling**: Tailwind CSS
- **Data**: Supabase PostgreSQL

### Akses Dashboard

```bash
# Development
npm run dev
# Visit: http://localhost:3000/dashboard

# Production
npm run build
npm start
```

---

## Statistik Akhir Database

### Total Data

| Metrik | Jumlah |
|--------|--------|
| Total Bahasa | 1,091 |
| Dengan Status Vitalitas | 153 |
| Dengan Data Wilayah | 789 |
| Dengan Data Provinsi | 699 |
| Dengan Metadata Linguistik | 15 |
| Dengan Data Penutur | 54 |

### Distribusi Status Vitalitas

| Status | Jumlah | Persentase |
|--------|--------|------------|
| Aman | 15 | 9.8% |
| Rentan | 29 | 19.0% |
| Mengalami Kemunduran | 48 | 31.4% |
| Punah | 61 | 39.9% |
| **Total** | **153** | **100%** |

### Top 5 Bahasa dengan Penutur Terbanyak

1. **Jawa** - 85+ juta penutur
2. **Sunda** - 40+ juta penutur
3. **Madura** - 6+ juta penutur
4. **Minangkabau** - 5.5+ juta penutur
5. **Bugis** - 5+ juta penutur

---

## File yang Dibuat/Diubah

### SQL Scripts

1. `scripts/update-wilayah-provinsi.sql` - Update kolom wilayah/provinsi
2. `scripts/linguistic-metadata.sql` - Update metadata linguistik

### Backend

1. `app/api/stats/route.ts` - API endpoint untuk statistik

### Frontend

1. `app/dashboard/page.tsx` - Halaman dashboard dengan visualisasi

### Dependencies

- `recharts` ^2.x - Library charting untuk React

### Dokumentasi

1. `data/ENHANCEMENT-SUMMARY.md` - Laporan ini

---

## Kualitas Data

### Sebelum Peningkatan

- Status vitalitas: 157 bahasa (banyak duplikat)
- Metadata wilayah: hanya di kolom `catatan`
- Tidak ada cross-reference linguistik
- Tidak ada dashboard visualisasi

### Setelah Peningkatan

✅ Status vitalitas: 153 bahasa (bersih, akurat)  
✅ Metadata wilayah: 789 bahasa dengan kolom terstruktur  
✅ Cross-reference: 15 bahasa dengan metadata EGIDS  
✅ Dashboard: Visualisasi interaktif dengan 5 jenis chart  

### Data Quality Improvements

1. **Deduplication**: Hapus 8 entri duplikat
2. **Accuracy**: Update 7 bahasa besar ke status yang benar
3. **Structure**: Kolom terpisah untuk wilayah/provinsi
4. **Metadata**: EGIDS level dan sumber referensi
5. **Visualization**: Dashboard real-time

---

## Rekomendasi Next Steps

### Priority 1: Expand Metadata Linguistik

- Fetch data dari Glottolog API (gratis)
- Cross-reference dengan Ethnologue (berbayar)
- Update metadata untuk bahasa lainnya

### Priority 2: Enrich Wilayah Data

- Tambah data kabupaten/kota
- Integrate dengan GeoJSON boundaries
- Display di peta interaktif

### Priority 3: UI Enhancements

- Add link ke dashboard dari homepage
- Export data ke CSV/PDF
- Filter dashboard by wilayah/provinsi

### Priority 4: Data Validation

- Cross-check dengan BPS (Badan Pusat Statistik)
- Verify dengan lembaga bahasa daerah
- Update data dari sensus terbaru

### Priority 5: Community Features

- User submission untuk data bahasa
- Verification workflow
- Crowdsourcing metadata

---

## Kesimpulan

Kelima prioritas peningkatan berhasil diselesaikan:

✅ **Data Quality**: Bersih, akurat, terstruktur  
✅ **UI/UX**: Filter berfungsi, dashboard interaktif  
✅ **Metadata**: EGIDS level, wilayah, provinsi  
✅ **Visualization**: 5 jenis chart dengan Recharts  
✅ **Documentation**: Laporan lengkap dan terstruktur  

Database Nusantara Basa sekarang memiliki:
- **1,091 bahasa** terdokumentasi
- **153 bahasa** dengan status vitalitas yang akurat
- **789 bahasa** dengan metadata wilayah
- **Dashboard** dengan visualisasi statistik real-time

---

## Lampiran

### Query untuk Verifikasi

```sql
-- Cek total bahasa dengan status vitalitas
SELECT status_vitalitas, COUNT(*) as jumlah 
FROM bahasa 
WHERE status_vitalitas IS NOT NULL 
GROUP BY status_vitalitas 
ORDER BY jumlah DESC;

-- Cek metadata linguistik
SELECT nama_bahasa, egids_level, jumlah_penutur_tahun, sumber_referensi 
FROM bahasa 
WHERE egids_level IS NOT NULL 
ORDER BY nama_bahasa;

-- Cek distribusi wilayah
SELECT wilayah, COUNT(*) as jumlah 
FROM bahasa 
WHERE wilayah IS NOT NULL 
GROUP BY wilayah 
ORDER BY jumlah DESC;

-- Cek top languages
SELECT nama_bahasa, jumlah_penutur, status_vitalitas 
FROM bahasa 
WHERE jumlah_penutur IS NOT NULL 
ORDER BY jumlah_penutur DESC 
LIMIT 10;
```

### Akses Dashboard

```bash
# Development
npm run dev
# Visit: http://localhost:3000/dashboard
```

---

**Laporan ini dibuat pada**: 15 Januari 2025  
**Oleh**: Nusantara Basa Team  
**Versi**: 1.0
