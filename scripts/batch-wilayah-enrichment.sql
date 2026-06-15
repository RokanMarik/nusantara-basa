-- Batch enrichment based on language name patterns and geographic knowledge

-- Batak languages (Sumatera Utara)
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Sumatera Utara' 
WHERE nama_bahasa LIKE '%Batak%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Dayak languages (Kalimantan)
UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Tengah' 
WHERE nama_bahasa LIKE '%Dayak%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Asmat languages (Papua)
UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua' 
WHERE nama_bahasa LIKE '%Asmat%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Toraja languages (Sulawesi Selatan)
UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Selatan' 
WHERE nama_bahasa LIKE '%Toraja%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Dani languages (Papua)
UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua' 
WHERE nama_bahasa LIKE '%Dani%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Melayu dialects (various)
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Riau' 
WHERE nama_bahasa LIKE '%Melayu%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Minangkabau dialects (Sumatera Barat)
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Sumatera Barat' 
WHERE nama_bahasa LIKE '%Minang%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Bugis dialects (Sulawesi Selatan)
UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Selatan' 
WHERE nama_bahasa LIKE '%Bugis%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Makassar dialects (Sulawesi Selatan)
UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Selatan' 
WHERE nama_bahasa LIKE '%Makassar%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Sasak dialects (Nusa Tenggara Barat)
UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Barat' 
WHERE nama_bahasa LIKE '%Sasak%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Balinese dialects (Bali)
UPDATE bahasa SET wilayah = 'Bali', provinsi = 'Bali' 
WHERE nama_bahasa LIKE '%Bali%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Javanese dialects (Jawa)
UPDATE bahasa SET wilayah = 'Jawa', provinsi = 'Jawa Tengah' 
WHERE nama_bahasa LIKE '%Jawa%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Sundanese dialects (Jawa Barat)
UPDATE bahasa SET wilayah = 'Jawa', provinsi = 'Jawa Barat' 
WHERE nama_bahasa LIKE '%Sunda%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Madura dialects (Jawa Timur)
UPDATE bahasa SET wilayah = 'Jawa', provinsi = 'Jawa Timur' 
WHERE nama_bahasa LIKE '%Madura%' AND (wilayah IS NULL OR provinsi IS NULL);

-- Specific known languages
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Sumatera Selatan' WHERE nama_bahasa = 'Komering';
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Sumatera Selatan' WHERE nama_bahasa = 'Ogan';
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Sumatera Selatan' WHERE nama_bahasa = 'Rejang';
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Bangka Belitung' WHERE nama_bahasa = 'Bangka';
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Bangka Belitung' WHERE nama_bahasa = 'Belitung';

UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Selatan' WHERE nama_bahasa = 'Banjar';
UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Barat' WHERE nama_bahasa = 'Mualang';
UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Barat' WHERE nama_bahasa = 'Iban';

UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Minahasa';
UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Mongondow';
UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Gorontalo' WHERE nama_bahasa = 'Gorontalo';

UPDATE bahasa SET wilayah = 'Maluku', provinsi = 'Maluku Utara' WHERE nama_bahasa = 'Ternate';
UPDATE bahasa SET wilayah = 'Maluku', provinsi = 'Maluku Utara' WHERE nama_bahasa = 'Tidore';

UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Barat' WHERE nama_bahasa = 'Sumbawa';
UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Barat' WHERE nama_bahasa = 'Bima';

UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua Barat' WHERE nama_bahasa = 'Biak';
UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua' WHERE nama_bahasa = 'Sentani';

-- Check final coverage
SELECT 
  COUNT(*) as total,
  COUNT(wilayah) as with_wilayah,
  COUNT(provinsi) as with_provinsi,
  ROUND(COUNT(wilayah) * 100.0 / COUNT(*), 1) as pct_wilayah,
  ROUND(COUNT(provinsi) * 100.0 / COUNT(*), 1) as pct_provinsi
FROM bahasa;
