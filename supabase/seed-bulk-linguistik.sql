-- Bulk Linguistic Features Enrichment
-- Date: 2025-06-14
-- Purpose: Add basic linguistic features for remaining languages

-- Add basic features for Batak languages
INSERT INTO fitur_linguistik (bahasa_id, sistem_tulisan, urutan_kata, jumlah_vokal, jumlah_konsonan, catatan_fonologi, dibuat_pada, diperbarui_pada)
SELECT 
  b.id,
  'Latin, Surat Batak',
  'SVO',
  6,
  20,
  'Sistem konsonan kompleks dengan prenasalized stops',
  NOW(),
  NOW()
FROM bahasa b
WHERE b.nama_bahasa LIKE '%Batak%' 
  AND b.nama_bahasa NOT IN ('Batak Toba')
  AND NOT EXISTS (SELECT 1 FROM fitur_linguistik f WHERE f.bahasa_id = b.id);

-- Add basic features for Dayak languages
INSERT INTO fitur_linguistik (bahasa_id, sistem_tulisan, urutan_kata, jumlah_vokal, jumlah_konsonan, catatan_fonologi, dibuat_pada, diperbarui_pada)
SELECT 
  b.id,
  'Latin',
  'SVO',
  5,
  17,
  'Sistem fonologi Austronesia standar',
  NOW(),
  NOW()
FROM bahasa b
WHERE b.nama_bahasa LIKE '%Dayak%'
  AND NOT EXISTS (SELECT 1 FROM fitur_linguistik f WHERE f.bahasa_id = b.id);

-- Add basic features for Sulawesi languages
INSERT INTO fitur_linguistik (bahasa_id, sistem_tulisan, urutan_kata, jumlah_vokal, jumlah_konsonan, catatan_fonologi, dibuat_pada, diperbarui_pada)
SELECT 
  b.id,
  'Latin',
  'SVO',
  5,
  17,
  'Sistem fonologi Austronesia dengan konsonan prenasalized',
  NOW(),
  NOW()
FROM bahasa b
WHERE (b.nama_bahasa LIKE '%Toraja%' 
    OR b.nama_bahasa LIKE '%Makassar%'
    OR b.nama_bahasa LIKE '%Gorontalo%'
    OR b.nama_bahasa LIKE '%Mongondow%')
  AND b.nama_bahasa NOT IN ('Toraja', 'Makassar')
  AND NOT EXISTS (SELECT 1 FROM fitur_linguistik f WHERE f.bahasa_id = b.id);

-- Add basic features for Nusa Tenggara languages
INSERT INTO fitur_linguistik (bahasa_id, sistem_tulisan, urutan_kata, jumlah_vokal, jumlah_konsonan, catatan_fonologi, dibuat_pada, diperbarui_pada)
SELECT 
  b.id,
  'Latin',
  'SVO',
  5,
  17,
  'Sistem fonologi Austronesia standar',
  NOW(),
  NOW()
FROM bahasa b
WHERE (b.nama_bahasa LIKE '%Sasak%'
    OR b.nama_bahasa LIKE '%Flores%'
    OR b.nama_bahasa LIKE '%Timor%'
    OR b.nama_bahasa LIKE '%Sumba%'
    OR b.nama_bahasa LIKE '%Rote%'
    OR b.nama_bahasa LIKE '%Alor%')
  AND NOT EXISTS (SELECT 1 FROM fitur_linguistik f WHERE f.bahasa_id = b.id);

-- Add basic features for Maluku languages
INSERT INTO fitur_linguistik (bahasa_id, sistem_tulisan, urutan_kata, jumlah_vokal, jumlah_konsonan, catatan_fonologi, dibuat_pada, diperbarui_pada)
SELECT 
  b.id,
  'Latin',
  'SVO',
  5,
  17,
  'Sistem fonologi Austronesia standar',
  NOW(),
  NOW()
FROM bahasa b
WHERE (b.nama_bahasa LIKE '%Ambon%'
    OR b.nama_bahasa LIKE '%Seram%'
    OR b.nama_bahasa LIKE '%Buru%'
    OR b.nama_bahasa LIKE '%Maluku%')
  AND b.nama_bahasa NOT IN ('Ambon')
  AND NOT EXISTS (SELECT 1 FROM fitur_linguistik f WHERE f.bahasa_id = b.id);

-- Add basic features for Papua/Trans-New Guinea languages
INSERT INTO fitur_linguistik (bahasa_id, sistem_tulisan, urutan_kata, jumlah_vokal, jumlah_konsonan, catatan_fonologi, dibuat_pada, diperbarui_pada)
SELECT 
  b.id,
  'Latin',
  'SOV',
  5,
  15,
  'Sistem fonologi Papua dengan konsonan kompleks',
  NOW(),
  NOW()
FROM bahasa b
WHERE (b.nama_bahasa LIKE '%Papua%'
    OR b.nama_bahasa LIKE '%Asmat%'
    OR b.nama_bahasa LIKE '%Dani%')
  AND NOT EXISTS (SELECT 1 FROM fitur_linguistik f WHERE f.bahasa_id = b.id);

-- Add basic features for other Austronesian languages
INSERT INTO fitur_linguistik (bahasa_id, sistem_tulisan, urutan_kata, jumlah_vokal, jumlah_konsonan, catatan_fonologi, dibuat_pada, diperbarui_pada)
SELECT 
  b.id,
  'Latin',
  'SVO',
  5,
  17,
  'Sistem fonologi Austronesia standar',
  NOW(),
  NOW()
FROM bahasa b
WHERE b.nama_bahasa NOT IN ('Jawa', 'Sunda', 'Bugis', 'Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar', 'Batak Toba')
  AND b.nama_bahasa NOT LIKE '%Batak%'
  AND b.nama_bahasa NOT LIKE '%Dayak%'
  AND b.nama_bahasa NOT LIKE '%Toraja%'
  AND b.nama_bahasa NOT LIKE '%Makassar%'
  AND b.nama_bahasa NOT LIKE '%Gorontalo%'
  AND b.nama_bahasa NOT LIKE '%Mongondow%'
  AND b.nama_bahasa NOT LIKE '%Sasak%'
  AND b.nama_bahasa NOT LIKE '%Flores%'
  AND b.nama_bahasa NOT LIKE '%Timor%'
  AND b.nama_bahasa NOT LIKE '%Sumba%'
  AND b.nama_bahasa NOT LIKE '%Rote%'
  AND b.nama_bahasa NOT LIKE '%Alor%'
  AND b.nama_bahasa NOT LIKE '%Ambon%'
  AND b.nama_bahasa NOT LIKE '%Seram%'
  AND b.nama_bahasa NOT LIKE '%Buru%'
  AND b.nama_bahasa NOT LIKE '%Maluku%'
  AND b.nama_bahasa NOT LIKE '%Papua%'
  AND b.nama_bahasa NOT LIKE '%Asmat%'
  AND b.nama_bahasa NOT LIKE '%Dani%'
  AND NOT EXISTS (SELECT 1 FROM fitur_linguistik f WHERE f.bahasa_id = b.id);
