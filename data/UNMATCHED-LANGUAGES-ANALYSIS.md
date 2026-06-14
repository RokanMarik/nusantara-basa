# Analisis Opsi untuk 57 Bahasa yang Belum Matched

## Latar Belakang

Dari total **106 bahasa** dengan data vitalitas di **Statistik Kebahasaan 2023**, hanya **49 bahasa (46.2%)** yang berhasil di-match dengan database Nusantara Basa. 

Sisa **57 bahasa** memerlukan penanganan khusus sebelum bisa di-import.

---

## 📊 Ringkasan Status 57 Bahasa

| Kategori | Jumlah | Contoh |
|----------|--------|--------|
| Rentan | 9 | Walsa, Dajub, Sentani, Minahasa |
| Mengalami Kemunduran | 18 | Senggi, Somu, Toba, Modole |
| Punah | 29 | Arguni, Bajau Tungkal Satu, Mander |
| Terancam Punah | 1* | "kategori kris" (parsing error) |

*Catatan: Entry "kategori kris" kemungkinan parsing error dari dokumen PDF

---

## 🔍 Perbandingan Opsi Penanganan

### ✅ Option 1: INSERT Semua sebagai Bahasa Baru

**Cara Kerja**: 
Tambahkan semua 57 bahasa ke tabel `bahasa` sebagai record baru, lengkap dengan status_vitalitas dari Statistik 2023.

#### Kelebihan (+)
- ✅ **Kompleteness tinggi** - Tidak ada kehilangan data dari sumber resmi
- ✅ **Fast execution** - Bisa otomatis generate INSERT SQL dalam 1x run
- ✅ **Data integrity** - Menyimpan informasi asli dari statistik resmi pemerintah
- ✅ **Easy to update** - Nanti bisa di-merge atau dikoreksi kapan saja
- ✅ **Zero risk** - Tidak merusak data existing, tambah safe
- ✅ **Good for research** - Data punah & terancam punah penting untuk studi linguistik
- ✅ **Coverage meningkat** - Database bertambah signifikan (+5.7% bahasa baru)

#### Kekurangan (-)
- ❌ **Duplicate names** - Ada nama yang sama/tapi beda ID, misal "Minahasa" muncul 2x
- ❌ **Nama tidak standar** - Format nama berbeda (contoh: "Bajau Tungkal Satu")
- ❌ **Metadata kurang** - Tidak ada info provinsi/kabupaten, wilayah = "Tidak diketahui"
- ❌ **Manual verification needed** - User mungkin bingung kenapa nama berbeda
- ⚠️ **Potential confusion** - "Minahasa" vs "Mandar" (alias typo?)

---

### ✅ Option 2: Manual Mapping dengan Nama Alternatif

**Cara Kerja**:
Review setiap bahasa yang unmatched, cari alias/cara penulisan alternatif di database, lalu mapping satu-satu.

#### Kelebihan (+)
- ✅ **Akurasi tertinggi** - Pastikan benar-benar match ke bahasa yang tepat
- ✅ **Data consistency** - Menggunakan nama resmi yang sudah standardize
- ✅ **Better UX** - User tidak bingung dengan nama variasi
- ✅ **Clean database** - Tidak ada duplikasi atau ambigu
- ✅ **Professional quality** - Database siap production ready

#### Kekurangan (-)
- ❌ **Time consuming** - Perlu review manual 57 entries (±2-3 jam work)
- ❌ **High effort** - Butuh expertise linguistik untuk validasi nama
- ❌ **Incomplete coverage** - Risky kalau salah mapping, jadi salah data
- ❌ **Complex process** - Perlu cross-reference banyak sumber
- ❌ **Subjective** - Keputusan mapping bisa berbeda tiap orang
- ❌ **Maintenance overhead** - Kalau nanti ada perubahan nama lagi?

**Estimasi Workload per entry**:
- Check database: 1 menit × 57 = 57 menit
- Research nama alternatif: 2 menit × 57 = 114 menit  
- Cross-validate source: 1 menit × 57 = 57 menit
- **Total: ~4-5 jam kerja manual**

---

### ⚠️ Option 3: Skip dan Dokumentasikan

**Cara Kerja**:
Jangan import 57 bahasa ini. Simpan info saja di file dokumentasi untuk referensi.

#### Kelebihan (+)
- ✅ **No risk** - 100% aman, tidak mengubah apapun
- ✅ **Zero cost** - No coding, no time spend
- ✅ **Simple** - Paling easy, tinggal catat
- ✅ **Preserves quality** - Database tetap clean dan verified

#### Kekurangan (-)
- ❌ **Lose valuable data** - Kehilangan 57 data vitalitas dari sumber resmi
- ❌ **Incomplete coverage** - Coverage cuma 46%, masih sangat rendah
- ❌ **Underutilized resource** - Investasi parsing document sia-sia
- ❌ **Lost opportunity** - Data punah/terancam punah hilang (sangat berharga!)
- ❌ **Inconsistent reporting** - Why import DapoBas tapi skip vitalitas?
- ⚠️ **Wasted effort** - Parsing sudah jalan percuma

**Impact on Coverage**:
```
Before vitality: 49/106 matched (46.2%)
After skipping:  49/106 matched (46.2%) ← SAME
```

---

### ✅ Option 4: Hybrid Approach (Recommended)

**Cara Kerja**:
Kombinasi optimal dari beberapa pendekatan berdasarkan karakteristik data.

#### Strategi Hybrid:

**A. Auto-INSERT (35 bahasa)** - Yang BENAR-BENAR baru
- Bahasa yang jelas tidak ada di database
- Contoh: Walsa, Aframa, Gresi, Tagalisa, Kuri, Meoswar
- Logic: Fuzzy matching < 60% → INSERT new

**B. Smart Mapping (15 bahasa)** - Yang punya potential match kuat
- Cari nama alternatif dulu
- Misal: "Toba" → "Batak Toba", "Benggaulu" → "Melayu Bengkulu"
- Logic: Fuzzy matching > 80% → UPDATE existing with mapping

**C. Flag for Review (5 bahasa)** - Ambigu, butuh human decision
- Minahasa (muncul 2x: Rentan & Punah)
- "Bajau Tungkal Satu" (bisa Sama-Bajau?)
- List lain dengan ketidakpastian tinggi
- Logic: 60-80% similarity OR multiple suggestions

**D. Discard (1-2 entries)** - Parsing errors
- "kategori kris" ← jelas error, bukan nama bahasa
- Entries terlalu pendek/generic (<3 karakter)
- Logic: Pattern validation fails

#### Kelebihan (+)
- ✅ **Balanced approach** - Good compromise antara speed & accuracy
- ✅ **Maximize utility** - Can import most of the data quickly
- ✅ **Risk mitigation** - Flag uncertain cases for later review
- ✅ **Scalable** - Repeatable for future imports
- ✅ **Efficient** - Auto-process 80%, manual-review only 20%
- ✅ **Transparent** - Clear documentation for each decision path

#### Kekurangan (-)
- ⚠️ **Complex logic** - Butuh careful implementation
- ⚠️ **Threshold tuning** - Need good thresholds for fuzzy matching
- ⚠️ **Maintenance** - Must maintain flagging system
- ⚠️ **Edge cases** - Rare languages might be tricky

---

## 📈 Impact Comparison

| Metric | Option 1 | Option 2 | Option 3 | Option 4 |
|--------|----------|----------|----------|----------|
| **Time Required** | 30 min | 4-5 hrs | 5 min | 2 hrs |
| **Data Imported** | 57 ✓ | 57 ✓ | 0 ✗ | ~45-50 |
| **Accuracy** | Medium | High | N/A | High |
| **Database Growth** | +5.7% | +5.7% | 0% | +4-5% |
| **Completeness** | 100% | 100% | 0% | ~90% |
| **Future Maintenance** | Low | Medium | None | Low |
| **Quality Score** | ★★★☆☆ | ★★★★★ | ★★☆☆☆ | ★★★★☆ |

---

## 💡 Recommendation by Use Case

### Untuk Production Database (User-facing):
🎯 **Best Choice: Option 4 (Hybrid) + Manual Verification**

Alasan:
- User-facing app needs high accuracy
- Don't want confusing duplicate names
- Can afford time for quality assurance

### Untuk Research/Learning:
🎯 **Best Choice: Option 1 (Insert All)**

Alasan:
- Complete dataset lebih penting untuk riset
- Researchers can filter/clean themselves
- Better to have excess than missing data

### Untuk Quick MVP:
🎯 **Best Choice: Option 1 (Auto-insert)**

Alasan:
- Launch cepat dengan basic functionality
- Can refine later in iteration #2
- Get stakeholder buy-in first

### Untuk Documentation/Report:
🎯 **Best Choice: Option 3 (Document Only)**

Alasan:
- For internal reference only
- Not committing to public database
- Safe backup strategy

---

## 🚀 Recommended Implementation Plan (Option 4)

### Phase 1: Setup & Analysis (Today)
1. ✅ Load semua 57 bahasa
2. ✅ Run fuzzy matching algorithm
3. ✅ Categorize into AUTO/REVIEW/DISCARD groups
4. ✅ Generate SQL statements

### Phase 2: Implementation (Next Sprint)
1. 🟢 Auto-INSERT 35 bahasa baru
2. 🟡 Smart-MAP 15 bahasa dengan pattern matching
3. ⚠️ FLAG 5-7 bahasa untuk manual review
4. ❌ DISCARD 1-2 parsing errors

### Phase 3: Quality Assurance (Week 2)
1. Verify all INSERTs dengan query
2. Review flagged items one-by-one
3. Finalize mapping decisions
4. Update documentation

### Phase 4: UI Integration (Week 3)
1. Add status_vitalitas filter
2. Show source metadata (Statistik 2023)
3. Enable user feedback mechanism

---

## 📋 Decision Matrix

Use this matrix to decide which category each language falls into:

| Criteria | Action | Examples |
|----------|--------|----------|
| Name completely unique | INSERT new | Walsa, Aframa, Gresi |
| Name variant of known language | MAP + UPDATE | Toba → Batak Toba |
| Name ambiguous (>2 matches) | FLAG for review | Minahasa |
| Name is too short/generic | DISCARD | "Le", "Ho" |
| Clearly NOT a language name | DISCARD | "kategori kris" |
| Alias format "(Something)" | STRIP and match | Senggi (Find) → Senggi |

---

## 🎯 Final Recommendation

**Go dengan Option 4 (Hybrid)** karena:

1. ✅ Practical - Balances speed vs accuracy
2. ✅ Scalable - Repeatable for future data sources
3. ✅ Transparent - Clear decision boundaries
4. ✅ Future-proof - Easy to refine over time
5. ✅ Maximum impact - Import ~45-50 languages immediately

**Next Steps:**
1. Approve Option 4 strategy
2. Build auto-categorization script
3. Execute INSERT/MAP operations
4. Schedule manual review session for flagged items
5. Document everything for audit trail

---

**Generated**: 2025-06-14  
**Status**: Ready for decision  
**Priority**: HIGH - Blocker for data completeness
