SELECT 
  'Total bahasa' as metric,
  COUNT(*) as value,
  ROUND(COUNT(*)::numeric / COUNT(*) * 100, 1) as percentage
FROM bahasa

UNION ALL

SELECT 
  'Dengan ISO code',
  COUNT(*),
  ROUND(COUNT(*)::numeric / (SELECT COUNT(*) FROM bahasa) * 100, 1)
FROM bahasa 
WHERE kode_iso_639 IS NOT NULL AND kode_iso_639 != ''

UNION ALL

SELECT 
  'Dengan koordinat',
  COUNT(*),
  ROUND(COUNT(*)::numeric / (SELECT COUNT(*) FROM bahasa) * 100, 1)
FROM bahasa 
WHERE koordinat_pusat IS NOT NULL

UNION ALL

SELECT 
  'Dengan vitalitas',
  COUNT(*),
  ROUND(COUNT(*)::numeric / (SELECT COUNT(*) FROM bahasa) * 100, 1)
FROM bahasa 
WHERE status_vitalitas IS NOT NULL AND status_vitalitas != ''

UNION ALL

SELECT 
  'Dengan kabupaten',
  COUNT(*),
  ROUND(COUNT(*)::numeric / (SELECT COUNT(*) FROM bahasa) * 100, 1)
FROM bahasa 
WHERE kabupaten IS NOT NULL AND kabupaten != ''

UNION ALL

SELECT 
  'Dengan penutur',
  COUNT(*),
  ROUND(COUNT(*)::numeric / (SELECT COUNT(*) FROM bahasa) * 100, 1)
FROM bahasa 
WHERE jumlah_penutur > 0

ORDER BY metric;
