# Database Analysis — Nusantara Basa

**Tanggal:** 2026-01-29
**Total Bahasa:** 71
**Total Lokasi:** 38

---

## Distribusi Rumpun

| Rumpun | Jumlah | Persentase |
|---|---|---|
| Austronesia | 69 | 97.2% |
| Papua | 1 | 1.4% |
| Trans-New Guinea | 1 | 1.4% |

## Distribusi Vitalitas

| Status | Jumlah | Persentase |
|---|---|---|
| Rentan | 18 | 25.4% |
| Sangat Terancam | 1 | 1.4% |
| Punah | 1 | 1.4% |
| Aman | 1 | 1.4% |
| Tidak diketahui | 50 | 70.4% |

## Data Completeness

| Field | Terisi | Kosong | % Terisi |
|---|---|---|---|
| Penutur | 31 | 40 | 43.7% |
| Lokasi | 38 | 33 | 53.5% |
| Summary | 20 | 51 | 28.2% |
| Fitur Linguistik | 20 | 51 | 28.2% |

---

## Masalah yang Terdeteksi

### 1. Data Sampah
Beberapa bahasa yang ter-insert bukan bahasa spesifik:
- "Rumpun bahasa Sulawesi Selatan" (rumpun, bukan bahasa)
- "Rumpun bahasa Filipina" (bukan bahasa Indonesia)
- "di Papua Nugini" (bukan nama bahasa)
- "Aram Alkitabiah" (bukan bahasa daerah Indonesia)

### 2. Bahasa Duplikat
- "Sunda Klasik" dan "Sunda Serang" (varian Sunda)
- "Madura Lumajang" dan "Madura Situbondo" (dialek Madura)

### 3. Data Tidak Lengkap
- 40 bahasa tanpa jumlah penutur
- 33 bahasa tanpa lokasi
- 51 bahasa tanpa summary AI

---

## Rekomendasi

### Short-term
1. **Clean data sampah** — hapus entry yang bukan bahasa spesifik
2. **Generate summary** — jalankan script summary untuk 51 bahasa yang belum punya
3. **Fix duplicate check** — pakai nama normalisasi (lowercase, trim)

### Medium-term
4. **Expand sumber data** — tambah Wikipedia bahasa Inggris (lebih lengkap)
5. **Ethnologue** — fetch langsung dari ethnologue.com untuk data akurat
6. **Generate summary** — pakai Jina + qd/kmodel untuk semua bahasa

### Long-term
7. **Target 700+ bahasa** — butuh sumber data yang lebih komprehensif
8. **Polygon wilayah** — butuh GeoJSON dari sumber geografis
9. **Cross-reference** — match dengan ISO 639-3 registry

---

## Sumber Data untuk Phase Berikutnya

| Sumber | Est. Bahasa | Format | Akses |
|---|---|---|---|
| Wikipedia ID | ~100 | API JSON | ✅ Gratis |
| Wikipedia EN | ~200 | API JSON | ✅ Gratis |
| Ethnologue | ~700 | Web | ⚠️ Partial free |
| Glottolog | ~700 | Web | ✅ Gratis |
| Badan Bahasa | ~600 | Web | ✅ Gratis |
| ISO 639-3 | ~700 | CSV | ✅ Gratis |
