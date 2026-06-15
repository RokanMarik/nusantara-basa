# Plan: Quick Stats Widget

## Goal
Bikin widget di homepage yang nampilin top 5 bahasa daerah dengan jumlah penutur terbanyak, biar visitor langsung tau bahasa apa aja yang populer di Indonesia.

## Tasks
1. [ ] Fetch top 5 languages dari API `/api/bahasa?limit=5&sortBy=jumlahPenutur&order=desc`
2. [ ] Bikin component `QuickStatsWidget` di `components/quick-stats-widget.tsx`
3. [ ] Styling pakai Tailwind, match design homepage (amber/earth colors)
4. [ ] Integrate widget ke `app/page.tsx` setelah stats section
5. [ ] Test di browser, pastikan responsive di mobile

## Risks
- API response structure mungkin beda dari yang diharapkan
- Styling mungkin gak match sama homepage theme
- Performance impact kalau fetch data client-side

## Status: design ✅
- Created: 2026-01-09 12:00
- Estimated: 30-45 minutes
