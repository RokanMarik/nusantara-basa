-- Classify Language Vitality Status
-- Based on UNESCO Language Vitality and Endangerment framework
-- Adapted for Indonesian context

-- Classification criteria:
-- 1. Aman (Safe): > 1M speakers, used across all generations
-- 2. Rentan (Vulnerable): 100K-1M speakers, some intergenerational decline
-- 3. Mengalami Kemunduran (Endangered): 10K-100K speakers, significant decline
-- 4. Sangat Terancam (Severely Endangered): 1K-10K speakers
-- 5. Hampir Punah (Critically Endangered): < 1K speakers
-- 6. Punah (Extinct): 0 speakers or no native speakers

-- ========== MAJOR LANGUAGES (> 1M speakers) -> AMAN ==========

UPDATE bahasa 
SET status_vitalitas = 'Aman'
WHERE jumlah_penutur >= 1000000 
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== LARGE LANGUAGES (500K - 1M speakers) -> RENTAN ==========

UPDATE bahasa 
SET status_vitalitas = 'Rentan'
WHERE jumlah_penutur >= 500000 
  AND jumlah_penutur < 1000000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== MEDIUM LANGUAGES (100K - 500K speakers) -> RENTAN ==========

UPDATE bahasa 
SET status_vitalitas = 'Rentan'
WHERE jumlah_penutur >= 100000 
  AND jumlah_penutur < 500000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== SMALL LANGUAGES (50K - 100K speakers) -> MENGALAMI KEMUNDURAN ==========

UPDATE bahasa 
SET status_vitalitas = 'Mengalami Kemunduran'
WHERE jumlah_penutur >= 50000 
  AND jumlah_penutur < 100000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== VERY SMALL LANGUAGES (10K - 50K speakers) -> MENGALAMI KEMUNDURAN ==========

UPDATE bahasa 
SET status_vitalitas = 'Mengalami Kemunduran'
WHERE jumlah_penutur >= 10000 
  AND jumlah_penutur < 50000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== ENDANGERED LANGUAGES (1K - 10K speakers) -> SANGAT TERANCAM ==========

UPDATE bahasa 
SET status_vitalitas = 'Sangat Terancam'
WHERE jumlah_penutur >= 1000 
  AND jumlah_penutur < 10000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== CRITICALLY ENDANGERED (< 1K speakers) -> HAMPIR PUNAH ==========

UPDATE bahasa 
SET status_vitalitas = 'Hampir Punah'
WHERE jumlah_penutur > 0 
  AND jumlah_penutur < 1000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== SPECIFIC CASES - Override based on linguistic research ==========

-- Languages with strong institutional support despite smaller numbers
UPDATE bahasa 
SET status_vitalitas = 'Rentan'
WHERE nama_bahasa IN ('Mandar', 'Gayo', 'Simeulue')
  AND (status_vitalitas IS NULL OR status_vitalitas = '' OR status_vitalitas = 'Mengalami Kemunduran');

-- Languages known to be critically endangered regardless of reported numbers
UPDATE bahasa 
SET status_vitalitas = 'Sangat Terancam'
WHERE nama_bahasa IN ('Damal', 'Sawi', 'Marind')
  AND (status_vitalitas IS NULL OR status_vitalitas = '' OR status_vitalitas = 'Mengalami Kemunduran');

-- Languages with very few speakers (< 1000)
UPDATE bahasa 
SET status_vitalitas = 'Hampir Punah'
WHERE nama_bahasa IN ('Tandjung', 'Lom', 'Budong-Budong')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- Languages known to be extinct
UPDATE bahasa 
SET status_vitalitas = 'Punah'
WHERE nama_bahasa IN ('Hukumina', 'Kayupulau', 'Mapia', 'Kajeli')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== REGIONAL LANGUAGES WITH SPECIAL STATUS ==========

-- Papua languages with rapid decline
UPDATE bahasa 
SET status_vitalitas = 'Sangat Terancam'
WHERE provinsi IN ('Papua', 'Papua Barat')
  AND jumlah_penutur < 5000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- Kalimantan languages with moderate decline
UPDATE bahasa 
SET status_vitalitas = 'Mengalami Kemunduran'
WHERE provinsi IN ('Kalimantan Barat', 'Kalimantan Tengah', 'Kalimantan Timur', 'Kalimantan Utara', 'Kalimantan Selatan')
  AND jumlah_penutur < 20000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- Maluku languages with varying status
UPDATE bahasa 
SET status_vitalitas = 'Rentan'
WHERE provinsi IN ('Maluku', 'Maluku Utara')
  AND jumlah_penutur >= 50000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

UPDATE bahasa 
SET status_vitalitas = 'Mengalami Kemunduran'
WHERE provinsi IN ('Maluku', 'Maluku Utara')
  AND jumlah_penutur >= 10000
  AND jumlah_penutur < 50000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== BATAK LANGUAGES - Special classification ==========

-- Batak languages are generally stable due to strong ethnic identity
UPDATE bahasa 
SET status_vitalitas = 'Rentan'
WHERE nama_bahasa LIKE 'Batak%'
  AND jumlah_penutur >= 100000
  AND (status_vitalitas IS NULL OR status_vitalitas = '' OR status_vitalitas = 'Mengalami Kemunduran');

-- ========== DAYAK LANGUAGES - Special classification ==========

-- Dayak languages vary widely, but many are experiencing decline
UPDATE bahasa 
SET status_vitalitas = 'Mengalami Kemunduran'
WHERE nama_bahasa LIKE 'Dayak%'
  AND jumlah_penutur < 50000
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- ========== VERIFICATION AND STATISTICS ==========

SELECT 
  status_vitalitas,
  COUNT(*) as jumlah_bahasa,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bahasa WHERE status_vitalitas IS NOT NULL), 2) as persentase
FROM bahasa 
WHERE status_vitalitas IS NOT NULL
GROUP BY status_vitalitas
ORDER BY 
  CASE status_vitalitas
    WHEN 'Aman' THEN 1
    WHEN 'Rentan' THEN 2
    WHEN 'Mengalami Kemunduran' THEN 3
    WHEN 'Sangat Terancam' THEN 4
    WHEN 'Hampir Punah' THEN 5
    WHEN 'Punah' THEN 6
    ELSE 7
  END;

-- Show languages that still need classification
SELECT 
  COUNT(*) as belum_diklasifikasi
FROM bahasa 
WHERE status_vitalitas IS NULL OR status_vitalitas = '';
