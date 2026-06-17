# Ringkasan Session — Nusantara Basa (untuk Session Berikutnya)

Copy-paste teks di bawah ini ke chat baru untuk melanjutkan project:

---

## PROMPT UNTUK SESSION BARU

```
Lanjutkan project Nusantara Basa. Ini konteks lengkapnya:

### Project
Nusantara Basa — platform dokumentasi bahasa daerah Indonesia. Tech stack: Next.js 14, Supabase, Prisma, Recharts, Leaflet. Project path: C:\Users\Rokan Akbar Marik\Documents\projects\nusantara-basa. Supabase project: hkeheukewxsvaarxaket.

### Yang Sudah Selesai (Phase 1-3)

**Phase 1 — Data Import & Enrichment:**
- 1,091 bahasa diimpor dari DapoBas Kemendikbud (603 baru + 107 update) dan Statistik Kebahasaan 2023 (49 bahasa)
- Metadata enrichment: wilayah (789), provinsi (733), kabupaten (103), ISO codes (387), speaker data (71), vitality status (186)
- Koreksi data: duplikat Minahasa, status Mandar, 8+ bahasa besar diupdate ke "Aman" berdasarkan Ethnologue EGIDS

**Phase 2 — UI & Dashboard:**
- Dashboard dengan filter provinsi/wilayah, charts (Recharts), export buttons
- API stats endpoint dengan query parameters (?provinsi=&wilayah=)
- Data validation: 12 checks, skor 76.7% → 82.3%

**Phase 3 — GeoJSON, Validation, UI Polish:**
- Province Heatmap API (`/api/stats/provinces`) — agregasi per provinsi dengan vitality score 0-100
- Province Panel (`components/map/ProvincePanel.tsx`) — sidebar dengan pie chart, toggle di map page
- Geo Data API (`/api/geo`) — data geografis dengan filter provinsi/vitalitas/min_speakers
- MapComponent (`components/map/MapComponent.tsx`) — Leaflet map dengan marker color-coded
- Dashboard map integration — interactive map di dashboard page
- Speaker Trend Chart (`components/bahasa/SpeakerTrendChart.tsx`) — LineChart dari tabel penutur_historis
- Language Detail Page (`app/explore/bahasa/[slug]/page.tsx`) — trend chart, vitality badges
- Export Enhancement (`app/api/export/route.ts`) — filter vitalitas, provinsi, wilayah, min_penutur
- Validation API (`/api/validate`) — 10 quality checks
- Validation Dashboard (`/validate`) — score card, check list, severity badges, recommendations
- Cron Endpoint (`/api/cron/validate`) — scheduled validation dengan auth
- Cron docs (`CRON-SETUP.md`) — Vercel Cron, GitHub Actions, cron-job.org setup
- Navigation: Dashboard & Validasi links di Header

### Constraints Penting
- Gunakan Supabase CLI: `supabase db query --linked -f <file.sql>` (jangan multiline SQL)
- Gunakan `Record<K, V>` bukan `Map<string, V>` untuk string-keyed lookup (project rule)
- Gunakan `import type` untuk type-only imports (project rule)
- Tool `edit` sering gagal, gunakan `write` untuk file modifications
- `scripts/` di-exclude dari TypeScript compilation di tsconfig.json
- Supabase JS client TIDAK support `.group()` / `.having()`

### Database Tables
- `bahasa` — data utama (1,091 rows)
- `penutur_historis` — historical speaker counts (id, bahasa_id, tahun, jumlah_penutur, sumber_data)
- `rumpun_bahasa` — language families
- `sumber_data` — data sources
- `validation_logs` — validation run results (created Phase 3)

### Build Status
- Build passes ✅
- Deployed ke Vercel via GitHub (commit bb96a8a)
- 140 files committed

### Future Enhancements (belum dikerjakan)
1. Expand speaker data coverage (currently 6.5%)
2. Classify remaining languages vitality (currently 17%)
3. Add more kabupaten data (currently 9.4%)
4. Email/Slack alerts for critical validation issues
5. More historical years in penutur_historis
6. Map clustering for nearby languages
7. Province GeoJSON polygon boundaries
8. User contribution system

Baca juga file `PHASE3-COMPLETE.md` di root project untuk detail teknis lengkap.

Sekarang kita mulai Phase 4 atau enhancement apa yang mau dikerjakan?
```

---

**Cara pakai:** Copy semua teks di dalam blok ``` di atas, paste ke chat baru sebagai pesan pertama.
