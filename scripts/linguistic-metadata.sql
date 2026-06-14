-- Tambahkan kolom untuk metadata linguistik dari Ethnologue/Glottolog
ALTER TABLE bahasa 
ADD COLUMN IF NOT EXISTS egids_level text,
ADD COLUMN IF NOT EXISTS jumlah_penutur_tahun integer,
ADD COLUMN IF NOT EXISTS sumber_referensi text;

-- Ekstrak EGIDS level dari kolom catatan
UPDATE bahasa 
SET egids_level = CASE
  WHEN catatan ILIKE '%EGIDS 1%' THEN '1 - National'
  WHEN catatan ILIKE '%EGIDS 2%' THEN '2 - Provincial'
  WHEN catatan ILIKE '%EGIDS 3%' THEN '3 - Wider Communication'
  WHEN catatan ILIKE '%EGIDS 4%' THEN '4 - Educational'
  WHEN catatan ILIKE '%EGIDS 5%' THEN '5 - Developing'
  WHEN catatan ILIKE '%EGIDS 6a%' THEN '6a - Vigorous'
  WHEN catatan ILIKE '%EGIDS 6b%' THEN '6b - Threatened'
  WHEN catatan ILIKE '%EGIDS 7%' THEN '7 - Shifting'
  WHEN catatan ILIKE '%EGIDS 8a%' THEN '8a - Moribund'
  WHEN catatan ILIKE '%EGIDS 8b%' THEN '8b - Nearly Extinct'
  WHEN catatan ILIKE '%EGIDS 9%' THEN '9 - Dormant'
  WHEN catatan ILIKE '%EGIDS 10%' THEN '10 - Extinct'
  ELSE NULL
END
WHERE catatan ILIKE '%EGIDS%';

-- Ekstrak tahun data penutur
UPDATE bahasa 
SET jumlah_penutur_tahun = 2024
WHERE catatan ILIKE '%2024%';

UPDATE bahasa 
SET jumlah_penutur_tahun = 2020
WHERE catatan ILIKE '%2020%' AND jumlah_penutur_tahun IS NULL;

-- Tandai sumber referensi
UPDATE bahasa 
SET sumber_referensi = 'Ethnologue 2024'
WHERE catatan ILIKE '%Ethnologue 2024%';

UPDATE bahasa 
SET sumber_referensi = 'Statistik Kebahasaan 2023'
WHERE catatan ILIKE '%Statistik Kebahasaan 2023%';

UPDATE bahasa 
SET sumber_referensi = 'DapoBas Kemdikbud'
WHERE catatan ILIKE '%DapoBas%';
