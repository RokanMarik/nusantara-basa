-- Data Validation Script
-- Check data quality and inconsistencies

-- 1. Check duplicates by nama_bahasa
SELECT 
  'DUPLICATES' as check_type,
  nama_bahasa,
  COUNT(*) as count
FROM bahasa
GROUP BY nama_bahasa
HAVING COUNT(*) > 1
ORDER BY count DESC;

-- 2. Check languages without ISO code
SELECT 
  'MISSING ISO CODE' as check_type,
  COUNT(*) as count
FROM bahasa
WHERE kode_iso_639 IS NULL OR kode_iso_639 = '';

-- 3. Check languages with status but no speaker count
SELECT 
  'STATUS WITHOUT SPEAKERS' as check_type,
  status_vitalitas,
  COUNT(*) as count
FROM bahasa
WHERE status_vitalitas IS NOT NULL
  AND jumlah_penutur IS NULL
GROUP BY status_vitalitas
ORDER BY count DESC;

-- 4. Check inconsistent vitalitas status
-- Languages marked as "Aman" but with < 1000 speakers
SELECT 
  'SUSPICIOUS AMAN STATUS' as check_type,
  nama_bahasa,
  jumlah_penutur,
  status_vitalitas,
  egids_level
FROM bahasa
WHERE status_vitalitas = 'Aman'
  AND jumlah_penutur IS NOT NULL
  AND jumlah_penutur < 1000
ORDER BY jumlah_penutur;

-- 5. Check languages marked as "Punah" but have speakers
SELECT 
  'PUNAH WITH SPEAKERS' as check_type,
  nama_bahasa,
  jumlah_penutur,
  status_vitalitas
FROM bahasa
WHERE status_vitalitas = 'Punah'
  AND jumlah_penutur IS NOT NULL
  AND jumlah_penutur > 0;

-- 6. Check provinsi without wilayah
SELECT 
  'PROVINSI WITHOUT WILAYAH' as check_type,
  provinsi,
  COUNT(*) as count
FROM bahasa
WHERE provinsi IS NOT NULL
  AND wilayah IS NULL
GROUP BY provinsi
ORDER BY count DESC
LIMIT 10;

-- 7. Check kabupaten without provinsi
SELECT 
  'KABUPATEN WITHOUT PROVINSI' as check_type,
  kabupaten,
  COUNT(*) as count
FROM bahasa
WHERE kabupaten IS NOT NULL
  AND provinsi IS NULL
GROUP BY kabupaten;

-- 8. Check EGIDS level inconsistencies
-- EGIDS 6b-10 should not be "Aman"
SELECT 
  'EGIDS VITALITAS MISMATCH' as check_type,
  nama_bahasa,
  egids_level,
  status_vitalitas
FROM bahasa
WHERE egids_level IS NOT NULL
  AND status_vitalitas IS NOT NULL
  AND (
    (egids_level LIKE '6b%' OR egids_level LIKE '7%' OR egids_level LIKE '8%' OR egids_level LIKE '9%' OR egids_level LIKE '10%')
    AND status_vitalitas = 'Aman'
  );

-- 9. Check ISO code format (should be 3 lowercase letters)
SELECT 
  'INVALID ISO FORMAT' as check_type,
  nama_bahasa,
  kode_iso_639
FROM bahasa
WHERE kode_iso_639 IS NOT NULL
  AND kode_iso_639 !~ '^[a-z]{3}$';

-- 10. Check languages with wilayah but no provinsi mapping
SELECT 
  'WILAYAH WITHOUT PROVINSI' as check_type,
  wilayah,
  COUNT(*) as count
FROM bahasa
WHERE wilayah IS NOT NULL
  AND provinsi IS NULL
GROUP BY wilayah
ORDER BY count DESC;

-- 11. Summary statistics
SELECT 
  'SUMMARY' as check_type,
  COUNT(*) as total_bahasa,
  COUNT(kode_iso_639) as with_iso,
  COUNT(jumlah_penutur) as with_speakers,
  COUNT(status_vitalitas) as with_vitalitas,
  COUNT(wilayah) as with_wilayah,
  COUNT(provinsi) as with_provinsi,
  COUNT(kabupaten) as with_kabupaten,
  COUNT(egids_level) as with_egids
FROM bahasa;

-- 12. Check for potential duplicates by ISO code
SELECT 
  'DUPLICATE ISO' as check_type,
  kode_iso_639,
  COUNT(*) as count,
  ARRAY_AGG(nama_bahasa) as languages
FROM bahasa
WHERE kode_iso_639 IS NOT NULL
GROUP BY kode_iso_639
HAVING COUNT(*) > 1
ORDER BY count DESC;
