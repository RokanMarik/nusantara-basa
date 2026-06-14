# 📋 Nusantara Basa - Execution Guide

## ⚠️ Important Note

**Network connectivity issue detected:** Environment ini tidak bisa connect ke Supabase. Semua script perlu dijalankan dari **local machine** kamu atau langsung di **Supabase Dashboard**.

---

## ✅ Current Status

### Phase 1: Database Migration ✓ COMPLETE
- [x] Prisma schema updated dengan 6 tabel baru
- [x] SQL migration file created: `001_add_complete_tables.sql`
- [x] All 13 tables verified in Supabase

---

## 🔄 Manual Execution Required

### Phase 2: Data Enrichment

**File:** `prisma/migrations/002_enrich_data.sql`

**Steps:**
1. Open Supabase Dashboard: https://app.supabase.com/project/hkeheukewxsvaarxaket
2. Go to SQL Editor
3. Click "New Query"
4. Copy-paste seluruh isi file `prisma/migrations/002_enrich_data.sql`
5. Click "Run" atau tekan Ctrl+Enter

**Expected Results:**
- ✅ 15 bahasa major mendapatkan fitur linguistik
- ✅ 30 bahasa mendapatkan data lokasi
- ✅ 30 bahasa mendapatkan status preservasi
- ✅ 10 bahasa major mendapatkan auto-summary

---

### Phase 3: Historical Data

**File:** `scripts/seed-historical.js`

**Steps (dari local machine):**
```bash
cd "C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa"
node scripts/seed-historical.js
```

**Expected Results:**
- ✅ 3 bahasa (Jawa, Sunda, Melayu) mendapatkan peristiwa sejarah
- ✅ 3 bahasa mendapatkan pengaruh bahasa lain
- ✅ 3 bahasa mendapatkan penutur historis
- ✅ 3 bahasa mendapatkan riwayat nama

---

### Phase 4: Bulk Insert 700+ Bahasa

**File:** `scripts/phase1-fast-insert.js`

**Steps (dari local machine):**
```bash
cd "C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa"
node scripts/phase1-fast-insert.js
```

**Expected Results:**
- ✅ 700+ bahasa dari ISO 639-3 ditambahkan ke database
- ✅ Data dasar: nama, ISO code, provinsi
- ⚠️ Perlu enrichment lanjutan setelah insert

---

## 📊 Verification Queries

Jalankan query ini di Supabase SQL Editor untuk verify hasil:

### Check total bahasa
```sql
SELECT COUNT(*) as total_bahasa FROM bahasa;
-- Expected: 71 (sebelum bulk insert) atau 700+ (setelah bulk insert)
```

### Check bahasa dengan fitur linguistik
```sql
SELECT COUNT(*) as dengan_fitur 
FROM bahasa b
INNER JOIN fitur_linguistik f ON b.id = f.bahasa_id;
-- Expected: 15 (setelah enrichment)
```

### Check bahasa dengan lokasi
```sql
SELECT COUNT(*) as dengan_lokasi 
FROM bahasa b
INNER JOIN lokasi l ON b.id = l.bahasa_id;
-- Expected: 30 (setelah enrichment)
```

### Check bahasa dengan status preservasi
```sql
SELECT COUNT(*) as dengan_status 
FROM bahasa b
INNER JOIN status_preservasi s ON b.id = s.bahasa_id;
-- Expected: 30 (setelah enrichment)
```

### Check bahasa dengan auto-summary
```sql
SELECT COUNT(*) as dengan_summary 
FROM bahasa 
WHERE auto_summary IS NOT NULL;
-- Expected: 10 (setelah enrichment)
```

---

## 🎯 Next Steps After Manual Execution

### 1. Review Data Quality
- Buka Supabase Table Editor
- Browse tabel: bahasa, fitur_linguistik, lokasi
- Pastikan tidak ada data kosong atau duplikat

### 2. Test API Routes (Phase 6)
Setelah data enrichment selesai, kita bisa lanjut ke Web Integration:
- Update API routes untuk new tables
- Build UI components untuk new data
- Integrate map visualization

### 3. Deploy ke Vercel (Phase 7)
- Setup Vercel project
- Configure environment variables
- Deploy production

---

## 📝 Alternative: Run from Local Machine

Jika kamu mau jalankan semua script dari local:

```bash
# 1. Navigate ke project folder
cd "C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa"

# 2. Install dependencies (jika belum)
npm install

# 3. Run enrichment via Node.js (optional - SQL lebih cepat)
node scripts/enrich-data-comprehensive.js

# 4. Run historical seeding
node scripts/seed-historical.js

# 5. Run bulk insert
node scripts/phase1-fast-insert.js

# 6. Verify results
node scripts/run-migration.js
```

---

## 🚨 Troubleshooting

### Network Error
**Problem:** "TypeError: fetch failed" atau "ENOTFOUND"
**Solution:** 
- Gunakan SQL script langsung di Supabase Dashboard
- Atau jalankan dari local machine dengan internet stabil

### Script Error
**Problem:** Script berhenti dengan error
**Solution:**
- Check error message
- Pastikan .env file ada credentials yang benar
- Restart script

### Data Duplication
**Problem:** Data ter-insert duplikat
**Solution:**
- SQL scripts sudah ada `ON CONFLICT` clause
- Jika tetap duplikat, jalankan:
```sql
-- Delete duplicate entries
DELETE FROM bahasa a
USING bahasa b
WHERE a.id < b.id
AND a.nama_bahasa = b.nama_bahasa;
```

---

## 📞 Need Help?

Jika ada masalah:
1. Check error logs di console
2. Review script comments
3. Check Supabase logs (Database → Logs)
4. Contact via GitHub Issues

---

**Last Updated:** 2024-01-14  
**Status:** Ready for manual execution  
**Estimated Time:** 30-60 minutes untuk complete semua phases
