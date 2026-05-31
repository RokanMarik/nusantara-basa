# Data Collection Plan — Nusantara Basa

**Tujuan:** 700+ bahasa Indonesia, data lengkap, clean, tanpa bug

---

## Phase 1: Fast Insert (30 detik)

**Script:** `scripts/phase1-fast-insert.js`

**Cara kerja:**
1. Loop 700+ bahasa dari ISO list
2. Insert ke Supabase: nama, nama_lokal, kode_iso_639
3. Skip yang sudah ada (duplicate check)
4. **Tidak ada** Jina/qd/kmodel → super cepat

**Output:**
```
✅ 700 bahasa ter-insert (basic data)
⏱️ Waktu: ~30 detik
📊 Database: nama + ISO terisi, field lain NULL
```

**Data status setelah Phase 1:**
| Field | Status |
|---|---|
| nama_bahasa | ✅ Terisi |
| nama_lokal | ✅ Terisi (sama dengan nama) |
| kode_iso_639 | ✅ Terisi |
| rumpun_id | ✅ Terisi (default Austronesia) |
| jumlah_penutur | ❌ NULL |
| status_vitalitas | ❌ NULL |
| auto_summary | ❌ NULL |
| lokasi | ❌ Kosong |
| fitur_linguistik | ❌ Kosong |

---

## Phase 2: Clean Data (10 detik)

**Script:** `scripts/clean-data.js` (sudah ada)

**Cara kerja:**
1. Scan semua bahasa
2. Deteksi garbage pattern: "Rumpun...", "Daftar...", "di ...", dll
3. Hapus entry sampah + data related (lokasi, fitur)

**Output:**
```
✅ Data bersih, tidak ada sampah
⏱️ Waktu: ~10 detik
📊 Database: ~650-680 bahasa valid
```

---

## Phase 3: Enrich Batch (Prioritas)

**Script:** `scripts/phase3-enrich.js`

**Cara kerja:**
1. Ambil 50 bahasa per batch (configurable)
2. Untuk tiap bahasa:
   a. **Jina fetch** Wikipedia page (`https://id.wikipedia.org/wiki/Bahasa_{nama}`)
   b. **Regex extract** data dari text:
      - Penutur: pola `"(\d[\d.]*)\s*(juta|ribu)\s*penutur"`
      - Vitalitas: pola `"status[^:]*:\s*(aman|rentan|terancam|kritis)"`
      - Provinsi: pola `"dituturkan\s*(?:di|pada)\s*([A-Z][a-z\s]+)"`
      - Sistem tulisan: pola `"aksara|tulisan\s*[:\(]\s*([^,\)]+)"`
      - Morfologi: pola `"morfologi\s*[:\(]\s*(aglutinatif|isolatif|flektif)"`
      - Urutan kata: pola `"(SVO|SOV|VSO|VOS|OVS|OSV)"`
   c. **qd/kmodel fallback** — kalau regex tidak dapat, baru panggil AI
   d. **Update database**
3. Rate limit: 2 detik antar request

**Prioritas batch:**
1. **Batch 1:** Bahasa besar (Jawa, Sunda, Madura, Batak, Bali, Bugis, dll) — 30 bahasa
2. **Batch 2:** Bahasa sedang (Dayak, Melayu variants, Gorontalo, dll) — 50 bahasa
3. **Batch 3:** Bahasa kecil (Papua, Maluku, NTT) — 100 bahasa
4. **Batch 4+:** Sisa bahasa — loop sampai selesai

**Output per batch:**
```
✅ 50 bahasa di-enrich
⏱️ Waktu: ~3-5 menit
📊 Data: penutur, vitalitas, provinsi, fitur terisi
```

**Data status setelah Phase 3:**
| Field | Terisi | Estimasi |
|---|---|---|
| jumlah_penutur | ~60% | Wikipedia tidak selalu sebut angka |
| status_vitalitas | ~40% | Hanya bahasa yang terdokumentasi |
| provinsi | ~70% | Kebanyakan Wikipedia sebut lokasi |
| sistem_tulisan | ~50% | Bahasa besar punya data |
| tipe_morfologi | ~30% | Butuh sumber linguistik |
| urutan_kata | ~25% | Butuh sumber linguistik |

---

## Phase 4: Generate Summary AI

**Script:** `scripts/generate-summaries.js` (sudah ada, pakai qd/kmodel)

**Cara kerja:**
1. Loop bahasa yang auto_summary-nya NULL
2. qd/kmodel generate 3 paragraf dari data yang ada
3. Update database
4. Rate limit: 2 detik

**Output:**
```
✅ Semua bahasa punya summary
⏱️ Waktu: ~500 bahasa × 5 detik = ~40 menit
📊 Database: auto_summary terisi semua
```

---

## Phase 5: Validate & Fix

**Script:** `scripts/validate-data.js`

**Cara kerja:**
1. **Cross-check** ISO code — cocokkan dengan registry resmi
2. **Detect anomalies** — penutur negatif, vitalitas tidak valid
3. **Merge duplicates** — "Batak Toba" vs "Bataktoba" (normalisasi)
4. **Fill gaps** — bahasa tanpa rumpun → assign default

**Output:**
```
✅ Data validated, anomalies fixed
📊 Database: clean, consistent, ready for production
```

---

## Timeline Estimasi

| Phase | Waktu | Output |
|---|---|---|
| Phase 1: Fast Insert | 30 detik | 700+ basic entries |
| Phase 2: Clean | 10 detik | Data bersih |
| Phase 3: Enrich Batch 1 | 5 menit | 30 bahasa lengkap |
| Phase 3: Enrich Batch 2 | 5 menit | 50 bahasa lengkap |
| Phase 3: Enrich Batch 3 | 10 menit | 100 bahasa lengkap |
| Phase 3: Enrich Batch 4+ | 30 menit | Sisa ~400 bahasa |
| Phase 4: Summary AI | 40 menit | Semua punya summary |
| Phase 5: Validate | 5 menit | Data final |
| **TOTAL** | **~1.5 jam** | **700+ bahasa, data lengkap** |

---

## Error Handling

Setiap script punya:
1. **Try-catch** per bahasa — 1 error tidak stop semua
2. **Retry logic** — failed request → retry 2x
3. **Logging** — success/skip/failed per bahasa
4. **Resume support** — offset parameter, bisa lanjut dari mana saja
5. **Dry run mode** — `--dry-run` flag untuk test tanpa insert

---

## File Structure

```
scripts/
├── phase1-fast-insert.js     # Fast insert 700+ bahasa
├── clean-data.js             # Clean garbage (sudah ada)
├── phase3-enrich.js          # Enrich with Jina + regex
├── generate-summaries.js     # AI summary (sudah ada, updated)
└── validate-data.js          # Final validation
```

---

## Next Steps

1. ✅ Buat `phase1-fast-insert.js`
2. ✅ Update `phase3-enrich.js` dengan regex extraction
3. ✅ Buat `validate-data.js`
4. ✅ Jalankan Phase 1 → 2 → 3 → 4 → 5
