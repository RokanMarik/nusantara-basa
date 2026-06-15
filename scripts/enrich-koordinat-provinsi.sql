-- Enrich koordinat berdasarkan provinsi
-- Menggunakan koordinat ibukota provinsi sebagai center point

-- Aceh - Banda Aceh
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [95.3167, 5.5577]}' 
WHERE provinsi = 'Aceh' AND koordinat_pusat IS NULL;

-- Sumatera Utara - Medan
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [98.6722, 3.5952]}' 
WHERE provinsi = 'Sumatera Utara' AND koordinat_pusat IS NULL;

-- Sumatera Barat - Padang
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [100.3531, -0.9475]}' 
WHERE provinsi = 'Sumatera Barat' AND koordinat_pusat IS NULL;

-- Riau - Pekanbaru
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [101.4333, 0.5333]}' 
WHERE provinsi = 'Riau' AND koordinat_pusat IS NULL;

-- Jambi - Kota Jambi
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [103.6167, -1.6000]}' 
WHERE provinsi = 'Jambi' AND koordinat_pusat IS NULL;

-- Sumatera Selatan - Palembang
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [104.7575, -2.9761]}' 
WHERE provinsi = 'Sumatera Selatan' AND koordinat_pusat IS NULL;

-- Bengkulu - Kota Bengkulu
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [102.2500, -3.8000]}' 
WHERE provinsi = 'Bengkulu' AND koordinat_pusat IS NULL;

-- Lampung - Bandar Lampung
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [105.2833, -5.4500]}' 
WHERE provinsi = 'Lampung' AND koordinat_pusat IS NULL;

-- Kepulauan Bangka Belitung - Pangkalpinang
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [106.1167, -2.1333]}' 
WHERE provinsi = 'Kepulauan Bangka Belitung' AND koordinat_pusat IS NULL;

-- Kepulauan Riau - Tanjungpinang
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [104.4500, 0.9167]}' 
WHERE provinsi = 'Kepulauan Riau' AND koordinat_pusat IS NULL;

-- DKI Jakarta - Jakarta
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [106.8456, -6.2088]}' 
WHERE provinsi = 'DKI Jakarta' AND koordinat_pusat IS NULL;

-- Jawa Barat - Bandung
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [107.6139, -6.9175]}' 
WHERE provinsi = 'Jawa Barat' AND koordinat_pusat IS NULL;

-- Jawa Tengah - Semarang
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [110.4203, -6.9667]}' 
WHERE provinsi = 'Jawa Tengah' AND koordinat_pusat IS NULL;

-- DI Yogyakarta - Yogyakarta
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [110.3667, -7.8000]}' 
WHERE provinsi = 'DI Yogyakarta' AND koordinat_pusat IS NULL;

-- Jawa Timur - Surabaya
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [112.7500, -7.2833]}' 
WHERE provinsi = 'Jawa Timur' AND koordinat_pusat IS NULL;

-- Banten - Serang
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [106.1500, -6.1167]}' 
WHERE provinsi = 'Banten' AND koordinat_pusat IS NULL;

-- Bali - Denpasar
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [115.2167, -8.6500]}' 
WHERE provinsi = 'Bali' AND koordinat_pusat IS NULL;

-- Nusa Tenggara Barat - Mataram
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [116.1167, -8.5833]}' 
WHERE provinsi = 'Nusa Tenggara Barat' AND koordinat_pusat IS NULL;

-- Nusa Tenggara Timur - Kupang
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [123.5833, -10.1667]}' 
WHERE provinsi = 'Nusa Tenggara Timur' AND koordinat_pusat IS NULL;

-- Kalimantan Barat - Pontianak
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [109.3425, -0.0263]}' 
WHERE provinsi = 'Kalimantan Barat' AND koordinat_pusat IS NULL;

-- Kalimantan Tengah - Palangka Raya
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [113.9333, -2.2167]}' 
WHERE provinsi = 'Kalimantan Tengah' AND koordinat_pusat IS NULL;

-- Kalimantan Selatan - Banjarmasin
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [114.5833, -3.3167]}' 
WHERE provinsi = 'Kalimantan Selatan' AND koordinat_pusat IS NULL;

-- Kalimantan Timur - Samarinda
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [117.1500, -0.5000]}' 
WHERE provinsi = 'Kalimantan Timur' AND koordinat_pusat IS NULL;

-- Kalimantan Utara - Tanjung Selor
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [117.4833, 3.0000]}' 
WHERE provinsi = 'Kalimantan Utara' AND koordinat_pusat IS NULL;

-- Sulawesi Utara - Manado
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [124.8422, 1.4748]}' 
WHERE provinsi = 'Sulawesi Utara' AND koordinat_pusat IS NULL;

-- Sulawesi Tengah - Palu
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [119.8667, -0.8985]}' 
WHERE provinsi = 'Sulawesi Tengah' AND koordinat_pusat IS NULL;

-- Sulawesi Selatan - Makassar
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [119.4333, -5.1333]}' 
WHERE provinsi = 'Sulawesi Selatan' AND koordinat_pusat IS NULL;

-- Sulawesi Tenggara - Kendari
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [122.5000, -3.9500]}' 
WHERE provinsi = 'Sulawesi Tenggara' AND koordinat_pusat IS NULL;

-- Gorontalo - Kota Gorontalo
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [123.0833, 0.5333]}' 
WHERE provinsi = 'Gorontalo' AND koordinat_pusat IS NULL;

-- Sulawesi Barat - Mamuju
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [118.8833, -2.6833]}' 
WHERE provinsi = 'Sulawesi Barat' AND koordinat_pusat IS NULL;

-- Maluku - Ambon
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [128.1833, -3.7000]}' 
WHERE provinsi = 'Maluku' AND koordinat_pusat IS NULL;

-- Maluku Utara - Sofifi
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [127.5833, 0.7500]}' 
WHERE provinsi = 'Maluku Utara' AND koordinat_pusat IS NULL;

-- Papua Barat - Manokwari
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [134.0833, -0.8833]}' 
WHERE provinsi = 'Papua Barat' AND koordinat_pusat IS NULL;

-- Papua - Jayapura
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [140.7167, -2.5333]}' 
WHERE provinsi = 'Papua' AND koordinat_pusat IS NULL;

-- Papua Selatan - Merauke
UPDATE bahasa SET koordinat_pusat = '{"type": "Point", "coordinates": [140.4333, -8.4833]}' 
WHERE provinsi = 'Papua Selatan' AND koordinat_pusat IS NULL;

-- Check hasil
SELECT 
  COUNT(*) as total_bahasa,
  COUNT(koordinat_pusat) as dengan_koordinat,
  ROUND(COUNT(koordinat_pusat) * 100.0 / COUNT(*), 1) as persentase_koordinat
FROM bahasa;
