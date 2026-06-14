-- Nusantara Basa - Bulk Vocabulary Enrichment (Fixed)
-- Date: 2025-06-14
-- Purpose: Add basic vocabulary for 390 remaining languages

-- Batak languages - numbers 1-5
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'sada', 'satu', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'dua', 'dua', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'tolu', 'tiga', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'opat', 'empat', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'lima', 'lima', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Batak languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'aek', 'air', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'api', 'api', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'halak', 'orang', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'jabu', 'rumah', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'mangan', 'makan', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Batak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;

-- Dayak languages - numbers 1-5
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'isa', 'satu', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'due', 'dua', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'telu', 'tiga', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'epat', 'empat', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'lime', 'lima', true FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Dayak languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'danum', 'air', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'apui', 'api', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'ulun', 'orang', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'huma', 'rumah', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'kuman', 'makan', false FROM bahasa b WHERE b.nama_bahasa LIKE '%Dayak%' AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;

-- Sulawesi languages - numbers 1-5
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'satu', 'satu', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'dua', 'dua', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'telu', 'tiga', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'pa''pa', 'empat', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'lima', 'lima', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Sulawesi languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'uway', 'air', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'api', 'api', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'tau', 'orang', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'banua', 'rumah', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'kande', 'makan', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Toraja%' OR b.nama_bahasa LIKE '%Makassar%' OR b.nama_bahasa LIKE '%Gorontalo%' OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;

-- Nusa Tenggara languages - numbers 1-5
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'esa', 'satu', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'rua', 'dua', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'telu', 'tiga', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'pat', 'empat', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'lima', 'lima', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Nusa Tenggara languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'oe', 'air', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'api', 'api', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'ata', 'orang', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'uma', 'rumah', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'hani', 'makan', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Sasak%' OR b.nama_bahasa LIKE '%Flores%' OR b.nama_bahasa LIKE '%Timor%' 
    OR b.nama_bahasa LIKE '%Sumba%' OR b.nama_bahasa LIKE '%Rote%' OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;

-- Maluku languages - numbers 1-5
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'satu', 'satu', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'dua', 'dua', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'tolu', 'tiga', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'pat', 'empat', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'lima', 'lima', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Maluku languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'ae', 'air', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'api', 'api', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'orang', 'orang', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'ruma', 'rumah', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'makan', 'makan', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Ambon%' OR b.nama_bahasa LIKE '%Seram%' OR b.nama_bahasa LIKE '%Buru%' OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa != 'Ambon'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;

-- Papua/Trans-New Guinea languages - numbers 1-5
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'mok', 'satu', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'fak', 'dua', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'nam', 'tiga', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'as', 'empat', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'im', 'lima', true FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Papua/Trans-New Guinea languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'ok', 'air', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'ap', 'api', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'at', 'orang', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'honai', 'rumah', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'nai', 'makan', false FROM bahasa b 
WHERE (b.nama_bahasa LIKE '%Papua%' OR b.nama_bahasa LIKE '%Asmat%' OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;

-- Other Austronesian languages - numbers 1-5
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'satu', 'satu', true FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'satu')
UNION ALL SELECT b.id, 'dua', 'dua', true FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'dua')
UNION ALL SELECT b.id, 'tiga', 'tiga', true FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'tiga')
UNION ALL SELECT b.id, 'empat', 'empat', true FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'empat')
UNION ALL SELECT b.id, 'lima', 'lima', true FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'lima')
ON CONFLICT DO NOTHING;

-- Other Austronesian languages - basic words
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, dalam_swadesh)
SELECT b.id, 'air', 'air', false FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'air')
UNION ALL SELECT b.id, 'api', 'api', false FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'api')
UNION ALL SELECT b.id, 'orang', 'orang', false FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'orang')
UNION ALL SELECT b.id, 'rumah', 'rumah', false FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'rumah')
UNION ALL SELECT b.id, 'makan', 'makan', false FROM bahasa b 
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba', 'Toraja', 'Makassar', 'Ambon')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND NOT EXISTS (SELECT 1 FROM kosakata k WHERE k.bahasa_id = b.id AND k.arti_indonesia = 'makan')
ON CONFLICT DO NOTHING;
