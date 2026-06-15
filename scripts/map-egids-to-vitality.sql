-- Map EGIDS levels to status_vitalitas for languages without vitality data
-- Based on EGIDS scale and Indonesian language context

-- EGIDS 6a (Vigorous) -> Rentan
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || ' | Auto-mapped from EGIDS 6a (Vigorous)'
WHERE egids_level = '6a - Vigorous' 
  AND status_vitalitas IS NULL;

-- EGIDS 6b (Threatened) -> Mengalami Kemunduran
UPDATE bahasa 
SET status_vitalitas = 'Mengalami Kemunduran',
    catatan = COALESCE(catatan, '') || ' | Auto-mapped from EGIDS 6b (Threatened)'
WHERE egids_level = '6b - Threatened' 
  AND status_vitalitas IS NULL;

-- EGIDS 7 (Shifting) -> Sangat Terancam
UPDATE bahasa 
SET status_vitalitas = 'Sangat Terancam',
    catatan = COALESCE(catatan, '') || ' | Auto-mapped from EGIDS 7 (Shifting)'
WHERE egids_level = '7 - Shifting' 
  AND status_vitalitas IS NULL;

-- EGIDS 8a (Moribund) -> Sangat Terancam
UPDATE bahasa 
SET status_vitalitas = 'Sangat Terancam',
    catatan = COALESCE(catatan, '') || ' | Auto-mapped from EGIDS 8a (Moribund)'
WHERE egids_level = '8a - Moribund' 
  AND status_vitalitas IS NULL;

-- EGIDS 8b (Nearly Extinct) -> Hampir Punah
UPDATE bahasa 
SET status_vitalitas = 'Hampir Punah',
    catatan = COALESCE(catatan, '') || ' | Auto-mapped from EGIDS 8b (Nearly Extinct)'
WHERE egids_level = '8b - Nearly Extinct' 
  AND status_vitalitas IS NULL;

-- EGIDS 9 (Dormant) -> Hampir Punah
UPDATE bahasa 
SET status_vitalitas = 'Hampir Punah',
    catatan = COALESCE(catatan, '') || ' | Auto-mapped from EGIDS 9 (Dormant)'
WHERE egids_level = '9 - Dormant' 
  AND status_vitalitas IS NULL;

-- EGIDS 10 (Extinct) -> Punah
UPDATE bahasa 
SET status_vitalitas = 'Punah',
    catatan = COALESCE(catatan, '') || ' | Auto-mapped from EGIDS 10 (Extinct)'
WHERE egids_level = '10 - Extinct' 
  AND status_vitalitas IS NULL;

-- Verify the mapping
SELECT 
  status_vitalitas,
  COUNT(*) as count,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bahasa), 1) as pct
FROM bahasa
GROUP BY status_vitalitas
ORDER BY count DESC;
