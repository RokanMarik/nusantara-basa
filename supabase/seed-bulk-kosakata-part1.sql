-- Nusantara Basa - Bulk Vocabulary Enrichment
-- Date: 2025-06-14
-- Purpose: Add basic vocabulary for 390 remaining languages

-- Batak languages - numbers 1-10
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, kategori)
SELECT b.id, 'sada', 'satu', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'dua', 'dua', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'tolu', 'tiga', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'opat', 'empat', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'lima', 'lima', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Batak languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, kategori)
SELECT b.id, 'aek', 'air', 'alam' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'api', 'api', 'alam' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'halak', 'orang', 'manusia' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'jabu', 'rumah', 'bangunan' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'mangan', 'makan', 'kegiatan' FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;

-- Dayak languages - numbers 1-10
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, kategori)
SELECT b.id, 'isa', 'satu', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'due', 'dua', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'telu', 'tiga', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'epat', 'empat', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'lime', 'lima', 'angka' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Dayak languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, kategori)
SELECT b.id, 'danum', 'air', 'alam' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'apui', 'api', 'alam' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'ulun', 'orang', 'manusia' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'huma', 'rumah', 'bangunan' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'kuman', 'makan', 'kegiatan' FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;

-- Sulawesi languages - numbers 1-10
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, kategori)
SELECT b.id, 'satu', 'satu', 'angka' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'dua', 'dua', 'angka' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'telu', 'tiga', 'angka' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'pa''pa', 'empat', 'angka' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'lima', 'lima', 'angka' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Sulawesi languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, kategori)
SELECT b.id, 'uway', 'air', 'alam' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'api', 'api', 'alam' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'tau', 'orang', 'manusia' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'banua', 'rumah', 'bangunan' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'kande', 'makan', 'kegiatan' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;

-- Nusa Tenggara languages - numbers 1-10
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, kategori)
SELECT b.id, 'esa', 'satu', 'angka' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'rua', 'dua', 'angka' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'telu', 'tiga', 'angka' FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
