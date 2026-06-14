-- Validation checks for Phase 4 enrichment

-- Check 1: Total languages
SELECT 'Total Languages' as check_name, COUNT(*) as result FROM bahasa;

-- Check 2: Null value statistics
SELECT 'Null Statistics' as check_name,
  COUNT(*) FILTER (WHERE nama_bahasa IS NULL) as null_nama,
  COUNT(*) FILTER (WHERE wilayah IS NULL) as null_wilayah,
  COUNT(*) FILTER (WHERE provinsi IS NULL) as null_provinsi,
  COUNT(*) FILTER (WHERE kabupaten IS NULL) as null_kabupaten,
  COUNT(*) FILTER (WHERE jumlah_penutur IS NULL) as null_penutur,
  COUNT(*) FILTER (WHERE status_vitalitas IS NULL) as null_vitalitas,
  COUNT(*) FILTER (WHERE koordinat_pusat IS NULL) as null_koordinat,
  COUNT(*) FILTER (WHERE kode_iso_639 IS NULL) as null_iso
FROM bahasa;

-- Check 3: Coverage percentages
SELECT 'Coverage Percentages' as check_name,
  ROUND(COUNT(*) FILTER (WHERE wilayah IS NOT NULL) * 100.0 / COUNT(*), 2) as wilayah_pct,
  ROUND(COUNT(*) FILTER (WHERE provinsi IS NOT NULL) * 100.0 / COUNT(*), 2) as provinsi_pct,
  ROUND(COUNT(*) FILTER (WHERE kabupaten IS NOT NULL) * 100.0 / COUNT(*), 2) as kabupaten_pct,
  ROUND(COUNT(*) FILTER (WHERE jumlah_penutur IS NOT NULL) * 100.0 / COUNT(*), 2) as penutur_pct,
  ROUND(COUNT(*) FILTER (WHERE status_vitalitas IS NOT NULL) * 100.0 / COUNT(*), 2) as vitalitas_pct,
  ROUND(COUNT(*) FILTER (WHERE koordinat_pusat IS NOT NULL) * 100.0 / COUNT(*), 2) as koordinat_pct,
  ROUND(COUNT(*) FILTER (WHERE kode_iso_639 IS NOT NULL) * 100.0 / COUNT(*), 2) as iso_pct
FROM bahasa;

-- Check 4: Vitalitas distribution
SELECT 'Vitalitas Distribution' as check_name,
  status_vitalitas,
  COUNT(*) as count
FROM bahasa
WHERE status_vitalitas IS NOT NULL
GROUP BY status_vitalitas
ORDER BY count DESC;

-- Check 5: Duplicate check (same nama_bahasa)
SELECT 'Duplicate Languages' as check_name,
  nama_bahasa,
  COUNT(*) as duplicate_count
FROM bahasa
WHERE nama_bahasa IS NOT NULL
GROUP BY nama_bahasa
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC
LIMIT 10;

-- Check 6: Speaker count validation
SELECT 'Speaker Count Validation' as check_name,
  COUNT(*) FILTER (WHERE jumlah_penutur < 0) as negative_speakers,
  COUNT(*) FILTER (WHERE jumlah_penutur = 0) as zero_speakers,
  COUNT(*) FILTER (WHERE jumlah_penutur > 0 AND jumlah_penutur < 10) as tiny_speakers,
  COUNT(*) FILTER (WHERE jumlah_penutur > 100000000) as huge_speakers
FROM bahasa;

-- Check 7: Vitalitas vs Speaker count consistency
SELECT 'Vitalitas-Speaker Consistency' as check_name,
  status_vitalitas,
  ROUND(AVG(jumlah_penutur), 0) as avg_speakers,
  MIN(jumlah_penutur) as min_speakers,
  MAX(jumlah_penutur) as max_speakers,
  COUNT(*) as sample_count
FROM bahasa
WHERE status_vitalitas IS NOT NULL AND jumlah_penutur IS NOT NULL
GROUP BY status_vitalitas
ORDER BY avg_speakers DESC;

-- Check 8: Geographic distribution
SELECT 'Geographic Distribution' as check_name,
  wilayah,
  COUNT(*) as total_languages,
  COUNT(*) FILTER (WHERE provinsi IS NOT NULL) as with_provinsi,
  COUNT(*) FILTER (WHERE kabupaten IS NOT NULL) as with_kabupaten
FROM bahasa
WHERE wilayah IS NOT NULL
GROUP BY wilayah
ORDER BY total_languages DESC;

-- Check 9: Provinsi coverage
SELECT 'Top 10 Provinsi' as check_name,
  provinsi,
  COUNT(*) as language_count
FROM bahasa
WHERE provinsi IS NOT NULL
GROUP BY provinsi
ORDER BY language_count DESC
LIMIT 10;

-- Check 10: Recent updates (last 24 hours)
SELECT 'Recent Updates' as check_name,
  COUNT(*) FILTER (WHERE dibuat_pada > NOW() - INTERVAL '24 hours') as updated_24h,
  COUNT(*) FILTER (WHERE dibuat_pada > NOW() - INTERVAL '1 hour') as updated_1h
FROM bahasa;
