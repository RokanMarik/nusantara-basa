-- Enrich coordinates based on province mapping
-- Using central coordinates for each Indonesian province

-- Aceh
UPDATE bahasa SET koordinat_pusat = '{"lat": 5.5483, "lng": 95.3238}'
WHERE provinsi = 'Aceh' AND koordinat_pusat IS NULL;

-- Sumatera Utara
UPDATE bahasa SET koordinat_pusat = '{"lat": 2.5873, "lng": 99.0766}'
WHERE provinsi = 'Sumatera Utara' AND koordinat_pusat IS NULL;

-- Sumatera Barat
UPDATE bahasa SET koordinat_pusat = '{"lat": -0.7399, "lng": 100.8000}'
WHERE provinsi = 'Sumatera Barat' AND koordinat_pusat IS NULL;

-- Riau
UPDATE bahasa SET koordinat_pusat = '{"lat": 1.5003, "lng": 101.4479}'
WHERE provinsi = 'Riau' AND koordinat_pusat IS NULL;

-- Jambi
UPDATE bahasa SET koordinat_pusat = '{"lat": -1.5980, "lng": 103.6179}'
WHERE provinsi = 'Jambi' AND koordinat_pusat IS NULL;

-- Sumatera Selatan
UPDATE bahasa SET koordinat_pusat = '{"lat": -3.3194, "lng": 103.9144}'
WHERE provinsi = 'Sumatera Selatan' AND koordinat_pusat IS NULL;

-- Bengkulu
UPDATE bahasa SET koordinat_pusat = '{"lat": -3.7928, "lng": 102.2608}'
WHERE provinsi = 'Bengkulu' AND koordinat_pusat IS NULL;

-- Lampung
UPDATE bahasa SET koordinat_pusat = '{"lat": -4.5586, "lng": 105.4068}'
WHERE provinsi = 'Lampung' AND koordinat_pusat IS NULL;

-- Kepulauan Bangka Belitung
UPDATE bahasa SET koordinat_pusat = '{"lat": -2.7411, "lng": 106.4406}'
WHERE provinsi = 'Kepulauan Bangka Belitung' AND koordinat_pusat IS NULL;

-- Kepulauan Riau
UPDATE bahasa SET koordinat_pusat = '{"lat": 3.9457, "lng": 108.1429}'
WHERE provinsi = 'Kepulauan Riau' AND koordinat_pusat IS NULL;

-- DKI Jakarta
UPDATE bahasa SET koordinat_pusat = '{"lat": -6.2088, "lng": 106.8456}'
WHERE provinsi = 'DKI Jakarta' AND koordinat_pusat IS NULL;

-- Jawa Barat
UPDATE bahasa SET koordinat_pusat = '{"lat": -6.8886, "lng": 107.6406}'
WHERE provinsi = 'Jawa Barat' AND koordinat_pusat IS NULL;

-- Jawa Tengah
UPDATE bahasa SET koordinat_pusat = '{"lat": -7.1509, "lng": 110.1403}'
WHERE provinsi = 'Jawa Tengah' AND koordinat_pusat IS NULL;

-- DI Yogyakarta
UPDATE bahasa SET koordinat_pusat = '{"lat": -7.7956, "lng": 110.3695}'
WHERE provinsi = 'DI Yogyakarta' AND koordinat_pusat IS NULL;

-- Jawa Timur
UPDATE bahasa SET koordinat_pusat = '{"lat": -7.5361, "lng": 112.2384}'
WHERE provinsi = 'Jawa Timur' AND koordinat_pusat IS NULL;

-- Banten
UPDATE bahasa SET koordinat_pusat = '{"lat": -6.4058, "lng": 106.0640}'
WHERE provinsi = 'Banten' AND koordinat_pusat IS NULL;

-- Bali
UPDATE bahasa SET koordinat_pusat = '{"lat": -8.4095, "lng": 115.1889}'
WHERE provinsi = 'Bali' AND koordinat_pusat IS NULL;

-- Nusa Tenggara Barat
UPDATE bahasa SET koordinat_pusat = '{"lat": -8.6529, "lng": 117.3680}'
WHERE provinsi = 'Nusa Tenggara Barat' AND koordinat_pusat IS NULL;

-- Nusa Tenggara Timur
UPDATE bahasa SET koordinat_pusat = '{"lat": -8.6574, "lng": 121.0794}'
WHERE provinsi = 'Nusa Tenggara Timur' AND koordinat_pusat IS NULL;

-- Kalimantan Barat
UPDATE bahasa SET koordinat_pusat = '{"lat": 0.0263, "lng": 109.3425}'
WHERE provinsi = 'Kalimantan Barat' AND koordinat_pusat IS NULL;

-- Kalimantan Tengah
UPDATE bahasa SET koordinat_pusat = '{"lat": -1.6815, "lng": 113.3824}'
WHERE provinsi = 'Kalimantan Tengah' AND koordinat_pusat IS NULL;

-- Kalimantan Selatan
UPDATE bahasa SET koordinat_pusat = '{"lat": -3.0926, "lng": 115.2868}'
WHERE provinsi = 'Kalimantan Selatan' AND koordinat_pusat IS NULL;

-- Kalimantan Timur
UPDATE bahasa SET koordinat_pusat = '{"lat": 0.5387, "lng": 116.4124}'
WHERE provinsi = 'Kalimantan Timur' AND koordinat_pusat IS NULL;

-- Kalimantan Utara
UPDATE bahasa SET koordinat_pusat = '{"lat": 3.0731, "lng": 116.0414}'
WHERE provinsi = 'Kalimantan Utara' AND koordinat_pusat IS NULL;

-- Sulawesi Utara
UPDATE bahasa SET koordinat_pusat = '{"lat": 1.4871, "lng": 124.8459}'
WHERE provinsi = 'Sulawesi Utara' AND koordinat_pusat IS NULL;

-- Sulawesi Tengah
UPDATE bahasa SET koordinat_pusat = '{"lat": -0.8955, "lng": 119.8381}'
WHERE provinsi = 'Sulawesi Tengah' AND koordinat_pusat IS NULL;

-- Sulawesi Selatan
UPDATE bahasa SET koordinat_pusat = '{"lat": -4.7419, "lng": 119.4104}'
WHERE provinsi = 'Sulawesi Selatan' AND koordinat_pusat IS NULL;

-- Sulawesi Tenggara
UPDATE bahasa SET koordinat_pusat = '{"lat": -3.5985, "lng": 121.8939}'
WHERE provinsi = 'Sulawesi Tenggara' AND koordinat_pusat IS NULL;

-- Gorontalo
UPDATE bahasa SET koordinat_pusat = '{"lat": 0.5334, "lng": 122.0647}'
WHERE provinsi = 'Gorontalo' AND koordinat_pusat IS NULL;

-- Sulawesi Barat
UPDATE bahasa SET koordinat_pusat = '{"lat": -2.8441, "lng": 119.2388}'
WHERE provinsi = 'Sulawesi Barat' AND koordinat_pusat IS NULL;

-- Maluku
UPDATE bahasa SET koordinat_pusat = '{"lat": -3.2385, "lng": 130.1453}'
WHERE provinsi = 'Maluku' AND koordinat_pusat IS NULL;

-- Maluku Utara
UPDATE bahasa SET koordinat_pusat = '{"lat": 1.5710, "lng": 127.8126}'
WHERE provinsi = 'Maluku Utara' AND koordinat_pusat IS NULL;

-- Papua
UPDATE bahasa SET koordinat_pusat = '{"lat": -4.2699, "lng": 138.0804}'
WHERE provinsi = 'Papua' AND koordinat_pusat IS NULL;

-- Papua Barat
UPDATE bahasa SET koordinat_pusat = '{"lat": -1.3361, "lng": 133.1797}'
WHERE provinsi = 'Papua Barat' AND koordinat_pusat IS NULL;

-- Papua Selatan
UPDATE bahasa SET koordinat_pusat = '{"lat": -7.4522, "lng": 140.5964}'
WHERE provinsi = 'Papua Selatan' AND koordinat_pusat IS NULL;

-- Papua Tengah
UPDATE bahasa SET koordinat_pusat = '{"lat": -3.6789, "lng": 137.7456}'
WHERE provinsi = 'Papua Tengah' AND koordinat_pusat IS NULL;

-- Papua Pegunungan
UPDATE bahasa SET koordinat_pusat = '{"lat": -4.0892, "lng": 139.5678}'
WHERE provinsi = 'Papua Pegunungan' AND koordinat_pusat IS NULL;

-- Papua Barat Daya
UPDATE bahasa SET koordinat_pusat = '{"lat": -1.5678, "lng": 131.2345}'
WHERE provinsi = 'Papua Barat Daya' AND koordinat_pusat IS NULL;

-- Check results
SELECT 
  COUNT(*) as total,
  COUNT(koordinat_pusat) as with_coords,
  ROUND(COUNT(koordinat_pusat) * 100.0 / COUNT(*), 1) as pct_coords
FROM bahasa;
