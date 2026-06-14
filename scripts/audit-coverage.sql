-- Comprehensive data coverage audit
-- Run against Supabase linked project

SELECT 'Total Bahasa' AS metric, COUNT(*)::int AS value FROM bahasa
UNION ALL
SELECT 'Dengan ISO Code', COUNT(*)::int FROM bahasa WHERE kode_iso_639 IS NOT NULL AND kode_iso_639 != ''
UNION ALL
SELECT 'Tanpa ISO Code', COUNT(*)::int FROM bahasa WHERE kode_iso_639 IS NULL OR kode_iso_639 = ''
UNION ALL
SELECT 'Dengan Provinsi', COUNT(*)::int FROM bahasa WHERE provinsi IS NOT NULL AND provinsi != ''
UNION ALL
SELECT 'Tanpa Provinsi', COUNT(*)::int FROM bahasa WHERE provinsi IS NULL OR provinsi = ''
UNION ALL
SELECT 'Dengan Wilayah', COUNT(*)::int FROM bahasa WHERE wilayah IS NOT NULL AND wilayah != ''
UNION ALL
SELECT 'Tanpa Wilayah', COUNT(*)::int FROM bahasa WHERE wilayah IS NULL OR wilayah = ''
UNION ALL
SELECT 'Dengan Kabupaten', COUNT(*)::int FROM bahasa WHERE kabupaten IS NOT NULL AND kabupaten != ''
UNION ALL
SELECT 'Tanpa Kabupaten', COUNT(*)::int FROM bahasa WHERE kabupaten IS NULL OR kabupaten = ''
UNION ALL
SELECT 'Dengan Vitalitas', COUNT(*)::int FROM bahasa WHERE status_vitalitas IS NOT NULL AND status_vitalitas != ''
UNION ALL
SELECT 'Tanpa Vitalitas', COUNT(*)::int FROM bahasa WHERE status_vitalitas IS NULL OR status_vitalitas = ''
UNION ALL
SELECT 'Dengan Jumlah Penutur', COUNT(*)::int FROM bahasa WHERE jumlah_penutur IS NOT NULL AND jumlah_penutur > 0
UNION ALL
SELECT 'Tanpa Jumlah Penutur', COUNT(*)::int FROM bahasa WHERE jumlah_penutur IS NULL OR jumlah_penutur = 0
UNION ALL
SELECT 'Dengan Koordinat (JSONB)', COUNT(*)::int FROM bahasa WHERE koordinat_pusat IS NOT NULL AND koordinat_pusat::text != 'null'
UNION ALL
SELECT 'Tanpa Koordinat', COUNT(*)::int FROM bahasa WHERE koordinat_pusat IS NULL OR koordinat_pusat::text = 'null'
UNION ALL
SELECT 'Dengan Rumpun', COUNT(*)::int FROM bahasa WHERE rumpun_id IS NOT NULL
UNION ALL
SELECT 'Tanpa Rumpun', COUNT(*)::int FROM bahasa WHERE rumpun_id IS NULL
UNION ALL
SELECT 'Dengan EGIDS Level', COUNT(*)::int FROM bahasa WHERE egids_level IS NOT NULL AND egids_level != ''
UNION ALL
SELECT 'Tanpa EGIDS Level', COUNT(*)::int FROM bahasa WHERE egids_level IS NULL OR egids_level = ''
UNION ALL
SELECT 'Dengan Glottolog ID', COUNT(*)::int FROM bahasa WHERE glottolog_id IS NOT NULL AND glottolog_id != ''
UNION ALL
SELECT 'Tanpa Glottolog ID', COUNT(*)::int FROM bahasa WHERE glottolog_id IS NULL OR glottolog_id = ''
UNION ALL
SELECT 'Dengan Sumber Referensi', COUNT(*)::int FROM bahasa WHERE sumber_referensi IS NOT NULL AND sumber_referensi != ''
UNION ALL
SELECT 'Tanpa Sumber Referensi', COUNT(*)::int FROM bahasa WHERE sumber_referensi IS NULL OR sumber_referensi = ''
ORDER BY metric;
