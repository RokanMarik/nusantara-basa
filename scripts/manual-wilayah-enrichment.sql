-- Manual enrichment for languages based on known geographic locations
-- Based on linguistic research and common knowledge

-- Lampung region
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Lampung' WHERE nama_bahasa = 'Abung';

-- Nusa Tenggara Timur
UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Timur' WHERE nama_bahasa = 'Adonara';
UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Timur' WHERE nama_bahasa = 'Amarasi';
UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Timur' WHERE nama_bahasa = 'Anakalangu';

-- Aceh
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Aceh' WHERE nama_bahasa = 'Alas';
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Aceh' WHERE nama_bahasa = 'Aneuk Jamee';

-- Maluku
UPDATE bahasa SET wilayah = 'Maluku', provinsi = 'Maluku' WHERE nama_bahasa = 'Amahai';
UPDATE bahasa SET wilayah = 'Maluku', provinsi = 'Maluku' WHERE nama_bahasa = 'Ambelau';

-- Kalimantan
UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Barat' WHERE nama_bahasa = 'Ampanang';

-- Papua
UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua' WHERE nama_bahasa = 'Amung';
UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua Barat' WHERE nama_bahasa = 'Ansus';

-- Sulawesi
UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Andio';

-- Jawa
UPDATE bahasa SET wilayah = 'Jawa', provinsi = 'Jawa Tengah' WHERE nama_bahasa = 'Arab-Jawa Klego';

-- Sulawesi
UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Barat' WHERE nama_bahasa = 'Aralle-Tabulahan';

-- Papua
UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua Barat' WHERE nama_bahasa = 'Arfak';

-- Check coverage after enrichment
SELECT 
  COUNT(*) as total,
  COUNT(wilayah) as with_wilayah,
  COUNT(provinsi) as with_provinsi,
  ROUND(COUNT(wilayah) * 100.0 / COUNT(*), 1) as pct_wilayah,
  ROUND(COUNT(provinsi) * 100.0 / COUNT(*), 1) as pct_provinsi
FROM bahasa;
