# User Manual - Nusantara Basa untuk Peneliti

Panduan lengkap untuk peneliti, linguist, dan akademisi yang menggunakan platform Nusantara Basa untuk riset bahasa daerah Indonesia.

## Daftar Isi

- [Pengenalan](#pengenalan)
- [Memulai](#memulai)
- [Fitur-Fitur untuk Peneliti](#fitur-fitur-untuk-peneliti)
- [Language Explorer](#language-explorer)
- [Language Comparison Tool](#language-comparison-tool)
- [Family Tree Visualization](#family-tree-visualization)
- [Map Visualization](#map-visualization)
- [Data Export untuk Analisis](#data-export-untuk-analisis)
- [Dashboard & Statistics](#dashboard--statistics)
- [Data Quality & Validation](#data-quality--validation)
- [Tips untuk Peneliti](#tips-untuk-peneliti)
- [Citation & Attribution](#citation--attribution)
- [Data Sources](#data-sources)
- [FAQ untuk Peneliti](#faq-untuk-peneliti)

## Pengenalan

**Nusantara Basa** adalah platform dokumentasi dan preservasi bahasa daerah Indonesia yang menyediakan:

- Database 998 bahasa daerah dengan metadata lengkap
- Visualisasi geografis distribusi bahasa
- Analisis komparatif antar bahasa
- Klasifikasi rumpun bahasa (family tree)
- Status vitalitas berdasarkan standar UNESCO & EGIDS
- Data jumlah penutur dan tren historis
- Export data untuk analisis statistik

### Siapa yang Bisa Menggunakan Platform Ini?

- **Linguist** - Peneliti bahasa dan linguistik
- **Antropolog** - Peneliti budaya dan masyarakat
- **Sosiolog** - Peneliti sosial dan demografi
- **Pembuat Kebijakan** - Pemerintah dan NGO
- **Pendidik** - Guru dan dosen bahasa daerah
- **Mahasiswa** - Penelitian tugas akhir dan skripsi
- **Umum** - Siapa saja yang tertarik dengan bahasa daerah

## Memulai

### Akses Platform

1. Buka browser dan kunjungi: `https://nusantara-basa.vercel.app`
2. Tidak perlu login/registrasi - platform ini open access
3. Semua fitur tersedia langsung tanpa batasan

### Navigasi Utama

- **Dashboard** (`/dashboard`) - Overview dan statistik
- **Explorer** (`/explore`) - Cari dan jelajahi bahasa
- **Map** (`/map`) - Visualisasi peta interaktif
- **Compare** (`/compare`) - Bandingkan bahasa
- **Family Tree** (`/family-tree`) - Hierarki rumpun bahasa
- **Validation** (`/validate`) - Kualitas data
- **API Docs** (`/api-docs`) - Dokumentasi API

## Fitur-Fitur untuk Peneliti

### 1. Language Explorer
Cari dan telusuri 998 bahasa daerah dengan filter canggih.

### 2. Comparison Tool
Bandingkan 2-4 bahasa secara side-by-side dengan metrics lengkap.

### 3. Family Tree
Visualisasikan hierarki rumpun bahasa dari macro-family hingga individual languages.

### 4. Geographic Mapping
Lihat distribusi geografis bahasa di peta interaktif Indonesia.

### 5. Data Export
Export data dalam format JSON/CSV untuk analisis di Excel, R, Python, SPSS, dll.

### 6. Statistics Dashboard
Analisis statistik komprehensif tentang bahasa daerah Indonesia.

### 7. Validation Reports
Laporan kualitas data untuk memastikan reliabilitas penelitian.

## Language Explorer

### Akses
Buka: `https://nusantara-basa.vercel.app/explore`

### Cara Menggunakan

#### 1. Pencarian Bahasa

**Search bar** mendukung:
- Nama bahasa: `"Jawa"`, `"Sunda"`, `"Batak"`
- Kode ISO 639-3: `"jav"`, `"sun"`, `"btk"`
- Provinsi: `"Papua"`, `"Kalimantan"`, `"Sulawesi"`

**Contoh:**
```
Search: "Jawa"
Hasil: Bahasa Jawa, Jawa Tengah, Jawa Timur, dll.
```

#### 2. Filter Lanjutan

Klik **"Filter"** untuk membuka panel filter:

**Filter berdasarkan Status Vitalitas:**
- Aman - Bahasa masih digunakan aktif
- Rentan - Mulai mengalami penurunan
- Terancam - Penutur semakin sedikit
- Kritis - Hampir punah
- Punah - Tidak ada lagi penutur aktif

**Filter berdasarkan Provinsi:**
- Pilih satu atau beberapa provinsi
- Contoh: Papua, Papua Barat, Kalimantan Barat

**Filter berdasarkan Jumlah Penutur:**
- Min: Jumlah minimum penutur
- Max: Jumlah maksimum penutur
- Contoh: 1000 - 50000 penutur

**Filter berdasarkan Rumpun Bahasa:**
- Austronesia
- Trans-New Guinea
- West Papuan
- dll.

#### 3. Melihat Detail Bahasa

Klik nama bahasa untuk melihat detail lengkap:

**Informasi yang tersedia:**
- Nama bahasa (Indonesia & lokal)
- Kode ISO 639-3
- Jumlah penutur (dan tahun pendataan)
- Status vitalitas (UNESCO & EGIDS)
- Lokasi geografis (provinsi, kabupaten, kecamatan)
- Rumpun bahasa dan klasifikasi
- Koordinat GPS
- Catatan tambahan
- Sumber data

**Visualisasi:**
- Trend jumlah penutur (jika ada data historis)
- Lokasi di peta
- Badge status vitalitas dengan warna

#### 4. Studi Kasus

**Contoh 1: Meneliti Bahasa yang Terancam**

1. Buka Explorer
2. Filter: Status Vitalitas = "Kritis"
3. Sort by: Jumlah Penutur (terkecil)
4. Hasil: Daftar bahasa dengan penutur paling sedikit

**Contoh 2: Meneliti Bahasa di Papua**

1. Buka Explorer
2. Filter: Provinsi = "Papua"
3. Filter: Rumpun = "Trans-New Guinea"
4. Hasil: Bahasa Trans-New Guinea di Papua

## Language Comparison Tool

### Akses
Buka: `https://nusantara-basa.vercel.app/compare`

### Cara Menggunakan

#### 1. Pilih Bahasa untuk Dibandingkan

- Minimal 2 bahasa, maksimal 4 bahasa
- Ketik nama bahasa di search box
- Klik bahasa yang ingin ditambahkan
- Ulangi untuk bahasa kedua, ketiga, keempat

**Contoh:**
```
Bahasa 1: Jawa (85 juta penutur)
Bahasa 2: Sunda (42 juta penutur)
Bahasa 3: Madura (14 juta penutur)
```

#### 2. Klik "Compare"

Sistem akan menampilkan:

**A. Metrics Comparison**

Tabel side-by-side dengan kolom:
- **Speakers**: Jumlah penutur masing-masing bahasa
- **Vitality**: Status vitalitas dan level EGIDS
- **Geography**: Provinsi dan wilayah geografis
- **Proximity**: Jarak antar bahasa (jika ada koordinat)
- **Language Family**: Rumpun bahasa

**B. Insights Otomatis**

Sistem akan generate insights seperti:
- "Jawa has 2x more speakers than Sunda"
- "All languages belong to the same language family: Austronesia"
- "Closest pair: Jawa and Sunda (150 km apart)"

**C. Visualization**

- Bar chart perbandingan jumlah penutur
- Map dengan lokasi semua bahasa
- Color-coded vitality status

#### 3. Export Comparison

Klik **"Export CSV"** untuk download hasil perbandingan.

**Format CSV:**
```csv
Metric,Jawa,Sunda,Madura
Speakers,85000000,42000000,14000000
Vitality,Aman,Aman,Aman
EGIDS,6a,6a,6a
Family,Austronesia,Austronesia,Austronesia
```

#### 4. Studi Kasus

**Contoh 1: Membandingkan Bahasa Major vs Minor**

```
Bahasa 1: Jawa (85 juta)
Bahasa 2: Osing (0.5 juta)

Insight: Jawa has 170x more speakers than Osing
```

**Contoh 2: Membandingkan Bahasa Serumpun**

```
Bahasa 1: Batak Toba
Bahasa 2: Batak Karo
Bahasa 3: Batak Simalungun

Insight: All languages belong to the same family: Batak
```

## Family Tree Visualization

### Akses
Buka: `https://nusantara-basa.vercel.app/family-tree`

### Cara Menggunakan

#### 1. Overview Hierarki

Halaman menampilkan tree structure:

```
Austronesia
├── Malayo-Polynesian
│   ├── Sundic
│   │   ├── Malayic
│   │   │   ├── Melayu
│   │   │   ├── Banjar
│   │   │   └── ...
│   │   └── Javanic
│   │       ├── Jawa
│   │       ├── Sunda
│   │       └── ...
│   └── ...
└── ...

Trans-New Guinea
├── Greater Awyu
│   ├── Asmat
│   ├── Mandobo
│   └── ...
└── ...
```

#### 2. Expand/Collapse

- **Klik nama rumpun** untuk expand/collapse
- **Panah ▼** = expanded (terbuka)
- **Panah ▶** = collapsed (tertutup)

#### 3. Informasi per Node

Setiap node menampilkan:
- **Nama rumpun** (contoh: "Austronesia")
- **Jumlah bahasa** (contoh: "450 languages")
- **Level** (1 = macro-family, 2 = sub-family, 3 = individual language)

#### 4. Search dalam Tree

Gunakan search box untuk mencari:
- Nama rumpun: "Batak"
- Nama bahasa: "Jawa"
- Kode ISO: "jav"

#### 5. Studi Kasus

**Contoh 1: Meneliti Rumpun Austronesia**

1. Buka Family Tree
2. Expand "Austronesia"
3. Lihat sub-families: Malayo-Polynesian, dll.
4. Expand lebih dalam untuk lihat individual languages
5. Klik bahasa untuk lihat detail

**Contoh 2: Meneliti Bahasa Papua**

1. Buka Family Tree
2. Expand "Trans-New Guinea"
3. Lihat sub-families: Greater Awyu, Dani, dll.
4. Bandingkan jumlah bahasa di setiap sub-family

## Map Visualization

### Akses
Buka: `https://nusantara-basa.vercel.app/map`

### Cara Menggunakan

#### 1. Interactive Map

Peta Indonesia dengan markers:
- **Warna marker** = Status vitalitas
  - Hijau: Aman
  - Kuning: Rentan
  - Orange: Terancam
  - Merah: Kritis
- **Ukuran marker** = Jumlah penutur (relative)

#### 2. Pan & Zoom

- **Drag** untuk geser peta
- **Scroll** untuk zoom in/out
- **Double-click** untuk zoom in di lokasi tertentu

#### 3. Filter Map

Gunakan panel filter untuk:
- Filter berdasarkan vitalitas
- Filter berdasarkan provinsi
- Filter berdasarkan jumlah penutur minimum

#### 4. Klik Marker

Klik marker untuk melihat:
- Nama bahasa
- Jumlah penutur
- Status vitalitas
- Link ke detail page

#### 5. Studi Kasus

**Contoh 1: Melihat Distribusi Bahasa Kritis**

1. Buka Map
2. Filter: Vitalitas = "Kritis"
3. Lihat di peta: Bahasa kritis tersebar di mana?
4. Pattern: Banyak di Papua dan Maluku

**Contoh 2: Cluster Bahasa di Satu Provinsi**

1. Buka Map
2. Filter: Provinsi = "Kalimantan Barat"
3. Zoom in ke Kalimantan Barat
4. Lihat: Berapa banyak bahasa di provinsi ini?

## Data Export untuk Analisis

### Akses
Buka: `https://nusantara-basa.vercel.app/explore` dan klik **"Export"**

### Format Export

#### 1. JSON Format

**URL:**
```
/api/export?format=json
```

**Struktur:**
```json
[
  {
    "nama": "Jawa",
    "iso": "jav",
    "penutur": 85000000,
    "vitalitas": "Aman",
    "provinsi": "Jawa Tengah",
    ...
  },
  ...
]
```

**Gunakan untuk:**
- Import ke Python (pandas)
- Import ke R
- Import ke database lokal

#### 2. CSV Format

**URL:**
```
/api/export?format=csv
```

**Struktur:**
```csv
nama,iso,penutur,vitalitas,provinsi,...
Jawa,jav,85000000,Aman,Jawa Tengah,...
Sunda,sun,42000000,Aman,Jawa Barat,...
```

**Gunakan untuk:**
- Excel
- Google Sheets
- SPSS
- Stata

### Filter Export

Tambahkan parameter untuk filter:

**Contoh 1: Export bahasa yang terancam**
```
/api/export?format=csv&vitalitas=Terancam
```

**Contoh 2: Export bahasa Papua**
```
/api/export?format=csv&provinsi=Papua
```

**Contoh 3: Export bahasa dengan >10000 penutur**
```
/api/export?format=csv&min_penutur=10000
```

**Contoh 4: Export kolom tertentu saja**
```
/api/export?format=csv&fields=nama,iso,penutur,vitalitas
```

### Analisis dengan Tools Lain

#### Excel / Google Sheets

1. Download CSV
2. Buka di Excel/Sheets
3. Buat pivot table untuk analisis
4. Buat chart untuk visualisasi

**Contoh analisis:**
- Distribusi bahasa per provinsi
- Rata-rata penutur per status vitalitas
- Top 10 bahasa dengan penutur terbanyak

#### Python (pandas)

```python
import pandas as pd

# Load data
df = pd.read_csv('nusantara-basa.csv')

# Analisis
print(df['vitalitas'].value_counts())
print(df.groupby('provinsi')['penutur'].sum())

# Visualisasi
import matplotlib.pyplot as plt
df['vitalitas'].value_counts().plot(kind='bar')
plt.show()
```

#### R

```r
library(tidyverse)

# Load data
df <- read_csv('nusantara-basa.csv')

# Analisis
df %>% count(vitalitas)
df %>% group_by(provinsi) %>% summarise(total = sum(penutur))

# Visualisasi
ggplot(df, aes(x = vitalitas, fill = vitalitas)) +
  geom_bar() +
  theme_minimal()
```

## Dashboard & Statistics

### Akses
Buka: `https://nusantara-basa.vercel.app/dashboard`

### Statistik yang Tersedia

#### 1. Overview Cards

- **Total Bahasa**: 998 bahasa daerah
- **Total Penutur**: Jumlah kumulatif semua penutur
- **Bahasa Aman**: Bahasa dengan status "Aman"
- **Bahasa Terancam**: Bahasa dengan status "Terancam" atau lebih buruk

#### 2. Charts

**Chart 1: Distribusi Status Vitalitas**
- Pie chart atau bar chart
- Menunjukkan proporsi bahasa per status

**Chart 2: Top 10 Bahasa Terbesar**
- Bar chart horizontal
- Bahasa dengan penutur terbanyak

**Chart 3: Distribusi per Provinsi**
- Bar chart
- Jumlah bahasa per provinsi

**Chart 4: Distribusi per Rumpun**
- Bar chart
- Jumlah bahasa per rumpun bahasa

#### 3. Filter Dashboard

Filter berdasarkan:
- Provinsi
- Wilayah (Sumatera, Jawa, Kalimantan, dll.)

#### 4. Studi Kasus

**Contoh 1: Overview Bahasa di Indonesia**

1. Buka Dashboard
2. Lihat: 998 bahasa total
3. Lihat: 450 bahasa Aman, 300 bahasa Terancam
4. Insight: 45% bahasa masih aman, 30% terancam

**Contoh 2: Analisis per Provinsi**

1. Buka Dashboard
2. Filter: Provinsi = "Papua"
3. Lihat: Berapa bahasa di Papua?
4. Lihat: Berapa yang terancam?

## Data Quality & Validation

### Akses
Buka: `https://nusantara-basa.vercel.app/validate`

### Validasi yang Dilakukan

#### 1. Validation Score

Skor keseluruhan kualitas data (0-100):
- **90-100**: Excellent
- **80-89**: Good
- **70-79**: Fair
- **<70**: Needs Improvement

#### 2. Individual Checks

**Check 1: Duplicate Names**
- Cek apakah ada nama bahasa yang duplikat
- Severity: High

**Check 2: Missing ISO Codes**
- Cek bahasa tanpa kode ISO
- Severity: Medium

**Check 3: Missing Speaker Data**
- Cek bahasa tanpa data penutur
- Severity: Medium

**Check 4: Inconsistent Vitality**
- Cek inkonsistensi antara jumlah penutur dan status vitalitas
- Severity: High

**Check 5: Missing Geographic Data**
- Cek bahasa tanpa data provinsi/kabupaten
- Severity: Low

#### 3. Validation Logs

Lihat history validasi:
- Tanggal validasi
- Skor
- Jumlah issues
- Detail issues

#### 4. Implikasi untuk Penelitian

**Jika skor <80:**
- Hati-hati dengan kesimpulan
- Cross-check dengan sumber lain
- Catat limitasi dalam publikasi

**Jika skor >90:**
- Data reliable untuk analisis
- Tetap cross-check untuk data kritis

## Tips untuk Peneliti

### 1. Selalu Cross-Check Data

Platform ini menggunakan data dari berbagai sumber (DapoBas, Statistik Kebahasaan, dll.), tetapi:
- Tidak semua data 100% akurat
- Selalu verifikasi dengan sumber primer jika memungkinkan
- Catat limitasi dalam publikasi Anda

### 2. Gunakan Multiple Sources

Untuk penelitian serius:
- Bandingkan dengan Ethnologue
- Bandingkan dengan Glottolog
- Bandingkan dengan publikasi akademik

### 3. Pahami Status Vitalitas

**UNESCO Framework:**
- **Aman**: Bahasa digunakan oleh semua generasi
- **Rentan**: Anak-anak masih menggunakan, tapi terbatas
- **Terancam**: Hanya orang tua yang menggunakan
- **Kritis**: Sangat sedikit penutur tua
- **Punah**: Tidak ada lagi penutur aktif

**EGIDS Scale:**
- **0-4**: Bahasa masih kuat (Institutional, Educational, dll.)
- **5-6**: Bahasa mulai melemah (Developing, Vigorous)
- **7-8**: Bahasa terancam (Shifting, Moribund)
- **9-10**: Bahasa hampir/hilang punah (Dormant, Extinct)

### 4. Perhatikan Tahun Data

Data jumlah penutur bisa dari tahun yang berbeda:
- Cek kolom "Tahun" di detail bahasa
- Data lama mungkin tidak akurat untuk kondisi sekarang
- Prioritaskan data terbaru

### 5. Gunakan Filter dengan Bijak

Filter membantu, tapi bisa bias:
- Filter "min_penutur=10000" akan exclude bahasa kecil
- Filter "vitalitas=Aman" akan exclude bahasa terancam
- Selalu cek apa yang di-exclude

### 6. Dokumentasikan Metodologi

Dalam publikasi, cantumkan:
- Sumber data: "Nusantara Basa (2024)"
- Tanggal akses data
- Filter yang digunakan
- Limitasi data

### 7. Etika Penelitian

- Hormati komunitas penutur bahasa
- Jangan gunakan data untuk tujuan yang merugikan
- Berikan attribution yang layak
- Pertimbangkan kolaborasi dengan komunitas lokal

## Citation & Attribution

### Cara Cite Platform Ini

**Format APA:**
```
Nusantara Basa Team. (2024). Nusantara Basa: Platform Dokumentasi Bahasa Daerah Indonesia [Dataset]. Retrieved from https://nusantara-basa.vercel.app
```

**Format MLA:**
```
Nusantara Basa Team. "Nusantara Basa: Platform Dokumentasi Bahasa Daerah Indonesia." 2024, https://nusantara-basa.vercel.app.
```

**Format BibTeX:**
```bibtex
@misc{nusantara_basa_2024,
  title = {Nusantara Basa: Platform Dokumentasi Bahasa Daerah Indonesia},
  author = {{Nusantara Basa Team}},
  year = {2024},
  url = {https://nusantara-basa.vercel.app},
  note = {Accessed: [tanggal akses Anda]}
}
```

### Atribusi dalam Publikasi

**Contoh:**
> "Data bahasa daerah Indonesia diperoleh dari platform Nusantara Basa (2024), yang mengagregasi data dari DapoBas Kemendikbud, Statistik Kebahasaan 2023, dan sumber lainnya."

## Data Sources

### Sumber Utama

1. **DapoBas Kemendikbud**
   - Database bahasa dari Kementerian Pendidikan dan Kebudayaan
   - 603 bahasa baru + 107 update

2. **Statistik Kebahasaan 2023**
   - Data statistik dari Badan Bahasa
   - 49 bahasa tambahan

3. **Ethnologue (EGIDS)**
   - Expanded Graded Intergenerational Disruption Scale
   - Referensi untuk status vitalitas

4. **ISO 639-3**
   - Standar internasional untuk kode bahasa
   - SIL International

5. **Glottolog**
   - Database klasifikasi bahasa
   - Max Planck Institute

### Kualitas Data

**Coverage:**
- Total bahasa: 998
- Dengan data penutur: ~70%
- Dengan kode ISO: ~46%
- Dengan data provinsi: ~81%
- Dengan data kabupaten: ~10%

**Limitasi:**
- Tidak semua bahasa memiliki data lengkap
- Beberapa data mungkin outdated
- Koordinat GPS tidak selalu akurat

## FAQ untuk Peneliti

### Q: Apakah data ini bisa digunakan untuk publikasi akademik?

**A:** Ya, tapi dengan catatan:
- Cite platform ini dengan benar
- Cross-check data kritis dengan sumber lain
- Catat limitasi dalam publikasi
- Pertimbangkan peer review

### Q: Bagaimana cara mendapatkan data yang lebih lengkap?

**A:**
- Gunakan API untuk download semua data: `/api/bahasa?limit=1000`
- Export dengan filter yang sesuai
- Hubungi maintainer untuk request khusus

### Q: Apakah ada data historis?

**A:** Terbatas. Beberapa bahasa memiliki data historis di tabel `penutur_historis`. Cek detail bahasa untuk melihat trend.

### Q: Bagaimana cara mengetahui kualitas data?

**A:** Buka halaman Validation (`/validate`). Skor >80 dianggap good.

### Q: Apakah saya bisa berkontribusi data?

**A:** Saat ini belum ada sistem kontribusi publik. Hubungi maintainer untuk diskusi.

### Q: Bagaimana cara request fitur baru untuk penelitian?

**A:** Buka GitHub Issue dengan label "research request". Jelaskan kebutuhan Anda.

### Q: Apakah ada API untuk programmatic access?

**A:** Ya! Lihat `/api-docs` untuk dokumentasi lengkap. Semua endpoint open access.

### Q: Bagaimana cara membandingkan dengan data Ethnologue/Glottolog?

**A:**
1. Export data dari platform ini
2. Download data dari Ethnologue/Glottolog
3. Join berdasarkan kode ISO 639-3
4. Bandingkan metrics

### Q: Apakah data ini real-time?

**A:** Tidak. Data di-update berkala (manual). Cek halaman Validation untuk last update.

### Q: Bagaimana cara mengetahui sumber data per bahasa?

**A:** Lihat kolom "Sumber Data" di detail bahasa. Biasanya merujuk ke DapoBas atau Statistik Kebahasaan.

### Q: Apakah ada metadata lengkap?

**A:** Ya! Buka `/data-dictionary` untuk dokumentasi lengkap struktur database.

### Q: Bagaimana cara contact maintainer?

**A:** Buka GitHub repository dan buat Issue atau Discussion.

## Kontak & Support

- **GitHub Issues**: Untuk bug report dan feature request
- **GitHub Discussions**: Untuk pertanyaan dan diskusi
- **Email**: [contact email jika ada]

## Lisensi

Platform ini dirilis di bawah lisensi **MIT License**. Anda bebas menggunakan data untuk tujuan penelitian, komersial, atau non-komersial dengan memberikan attribution yang layak.

---

**Terakhir diupdate:** Januari 2024  
**Versi:** 1.0  
**Maintainer:** Nusantara Basa Team
