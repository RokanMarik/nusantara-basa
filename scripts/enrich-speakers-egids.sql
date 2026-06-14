-- Speaker count estimation based on EGIDS levels
-- Using conservative estimates for languages without speaker data

-- Level 4 (Educational) - typically 1M+ speakers
UPDATE bahasa 
SET jumlah_penutur = 1500000, sumber_referensi = 'Estimated from EGIDS Level 4'
WHERE egids_level = '4 - Educational' AND jumlah_penutur IS NULL;

-- Level 5 (Written) - typically 500K+ speakers  
UPDATE bahasa 
SET jumlah_penutur = 600000, sumber_referensi = 'Estimated from EGIDS Level 5'
WHERE egids_level = '5 - Written' AND jumlah_penutur IS NULL;

-- Level 5 (Developing) - typically 300K+ speakers
UPDATE bahasa 
SET jumlah_penutur = 350000, sumber_referensi = 'Estimated from EGIDS Level 5'
WHERE egids_level = '5 - Developing' AND jumlah_penutur IS NULL;

-- Level 6a (Vigorous) - typically 50K+ speakers
UPDATE bahasa 
SET jumlah_penutur = 75000, sumber_referensi = 'Estimated from EGIDS Level 6a'
WHERE egids_level = '6a - Vigorous' AND jumlah_penutur IS NULL;

-- Level 6b (Threatened) - typically 10K-50K speakers
UPDATE bahasa 
SET jumlah_penutur = 25000, sumber_referensi = 'Estimated from EGIDS Level 6b'
WHERE egids_level = '6b - Threatened' AND jumlah_penutur IS NULL;

-- Level 7 (Shifting) - typically 1K-10K speakers
UPDATE bahasa 
SET jumlah_penutur = 5000, sumber_referensi = 'Estimated from EGIDS Level 7'
WHERE egids_level = '7 - Shifting' AND jumlah_penutur IS NULL;

-- Level 8a (Moribund) - typically 100-1000 speakers
UPDATE bahasa 
SET jumlah_penutur = 500, sumber_referensi = 'Estimated from EGIDS Level 8a'
WHERE egids_level = '8a - Moribund' AND jumlah_penutur IS NULL;

-- Level 8b (Nearly Extinct) - typically 10-100 speakers
UPDATE bahasa 
SET jumlah_penutur = 50, sumber_referensi = 'Estimated from EGIDS Level 8b'
WHERE egids_level = '8b - Nearly Extinct' AND jumlah_penutur IS NULL;

-- Level 9 (Dormant) - 0 active speakers
UPDATE bahasa 
SET jumlah_penutur = 0, sumber_referensi = 'Estimated from EGIDS Level 9'
WHERE egids_level = '9 - Dormant' AND jumlah_penutur IS NULL;

-- Level 10 (Extinct) - 0 speakers
UPDATE bahasa 
SET jumlah_penutur = 0, sumber_referensi = 'Estimated from EGIDS Level 10'
WHERE egids_level = '10 - Extinct' AND jumlah_penutur IS NULL;

-- Check results
SELECT 
  COUNT(*) as total,
  COUNT(jumlah_penutur) as with_speakers,
  ROUND(COUNT(jumlah_penutur) * 100.0 / COUNT(*), 1) as pct_with_speakers,
  SUM(jumlah_penutur) as total_speakers
FROM bahasa;
