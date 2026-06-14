-- Data Quality Audit Script
-- Identifies various data quality issues in bahasa table

SELECT 'Missing nama_bahasa' as issue_type, COUNT(*) as count
FROM bahasa WHERE nama_bahasa IS NULL OR TRIM(nama_bahasa) = ''

UNION ALL

SELECT 'Missing wilayah' as issue_type, COUNT(*) as count
FROM bahasa WHERE wilayah IS NULL OR TRIM(wilayah) = ''

UNION ALL

SELECT 'Missing provinsi' as issue_type, COUNT(*) as count
FROM bahasa WHERE provinsi IS NULL OR TRIM(provinsi) = ''

UNION ALL

SELECT 'Negative speaker count' as issue_type, COUNT(*) as count
FROM bahasa WHERE jumlah_penutur < 0

UNION ALL

SELECT 'Zero speaker count' as issue_type, COUNT(*) as count
FROM bahasa WHERE jumlah_penutur = 0

UNION ALL

SELECT 'Punah but has speakers' as issue_type, COUNT(*) as count
FROM bahasa WHERE status_vitalitas = 'Punah' AND jumlah_penutur > 0

UNION ALL

SELECT 'Aman but no speakers recorded' as issue_type, COUNT(*) as count
FROM bahasa WHERE status_vitalitas = 'Aman' AND (jumlah_penutur IS NULL OR jumlah_penutur = 0)

UNION ALL

SELECT 'Invalid ISO code format' as issue_type, COUNT(*) as count
FROM bahasa WHERE kode_iso_639 IS NOT NULL AND kode_iso_639 != '' AND (LENGTH(kode_iso_639) != 3 OR kode_iso_639 ~ '[^a-z]')

UNION ALL

SELECT 'Minimal data (only name)' as issue_type, COUNT(*) as count
FROM bahasa WHERE (wilayah IS NULL OR TRIM(wilayah) = '')
  AND (provinsi IS NULL OR TRIM(provinsi) = '')
  AND jumlah_penutur IS NULL
  AND status_vitalitas IS NULL
  AND kode_iso_639 IS NULL
  AND koordinat_pusat IS NULL

ORDER BY count DESC;
