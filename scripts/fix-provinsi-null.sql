-- Fix provinsi NULL based on kabupaten data
-- Sulawesi
UPDATE bahasa SET provinsi = 'Sulawesi Selatan' WHERE kabupaten IN ('Kota Makassar', 'Kabupaten Bugis', 'Kabupaten Tana Toraja') AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Sulawesi Barat' WHERE kabupaten = 'Kabupaten Polewali Mandar' AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Bugis' AND provinsi IS NULL;

-- Sulawesi Utara
UPDATE bahasa SET provinsi = 'Sulawesi Utara' WHERE kabupaten IN ('Kota Manado', 'Kota Gorontalo') AND provinsi IS NULL;

-- Sulawesi Tengah
UPDATE bahasa SET provinsi = 'Sulawesi Tengah' WHERE kabupaten = 'Kota Palu' AND provinsi IS NULL;

-- Sulawesi Tenggara
UPDATE bahasa SET provinsi = 'Sulawesi Tenggara' WHERE kabupaten IN ('Kota Kendari', 'Kota Mataram') AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Sulawesi Selatan' WHERE kabupaten = 'Kota Mataram' AND nama_bahasa = 'Sasak';
UPDATE bahasa SET provinsi = 'Nusa Tenggara Barat' WHERE kabupaten = 'Kota Mataram' AND provinsi = 'Sulawesi Tenggara';

-- Nusa Tenggara
UPDATE bahasa SET provinsi = 'Nusa Tenggara Barat' WHERE nama_bahasa IN ('Sasak', 'Bima', 'Sumbawa', 'Mbojo') AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Nusa Tenggara Timur' WHERE nama_bahasa IN ('Manggarai', 'Sika', 'Lio', 'Lamaholot', 'Tetun') AND provinsi IS NULL;

-- Sumatera
UPDATE bahasa SET provinsi = 'Sumatera Utara' WHERE kabupaten IN ('Kabupaten Karo', 'Kabupaten Simalungun') AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Aceh' WHERE kabupaten = 'Kota Banda Aceh' AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Lampung' WHERE kabupaten = 'Kabupaten Lampung Utara' AND provinsi IS NULL;

-- Jawa
UPDATE bahasa SET provinsi = 'Jawa Tengah' WHERE kabupaten = 'Kota Semarang' AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Jawa Barat' WHERE kabupaten = 'Kota Bandung' AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Bali' WHERE kabupaten = 'Kota Denpasar' AND provinsi IS NULL;

-- Kalimantan
UPDATE bahasa SET provinsi = 'Kalimantan Barat' WHERE kabupaten = 'Kota Pontianak' AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Kalimantan Selatan' WHERE kabupaten = 'Kota Banjarmasin' AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Kalimantan Tengah' WHERE kabupaten IN ('Kota Palangkaraya', 'Kabupaten Barito Selatan') AND provinsi IS NULL;

-- Maluku
UPDATE bahasa SET provinsi = 'Maluku' WHERE kabupaten = 'Kota Ambon' AND provinsi IS NULL;

-- Papua
UPDATE bahasa SET provinsi = 'Papua' WHERE kabupaten IN ('Kabupaten Asmat', 'Kabupaten Merauke', 'Kabupaten Nabire', 'Kota Jayapura') AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Papua Barat' WHERE kabupaten = 'Kabupaten Manokwari' AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Papua' WHERE nama_bahasa IN ('Dani', 'Asmat', 'Sentani', 'Amungme', 'Ekari', 'Moni', 'Moi', 'Marind', 'Damal') AND provinsi IS NULL;

-- Sumatra extra
UPDATE bahasa SET provinsi = 'Sumatera Utara' WHERE nama_bahasa LIKE 'Batak%' AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Sumatera Barat' WHERE nama_bahasa = 'Minangkabau' AND provinsi IS NULL;

-- Sulawesi extra
UPDATE bahasa SET provinsi = 'Sulawesi Selatan' WHERE nama_bahasa IN ('Makassar', 'Bugis', 'Toraja', 'Mandar') AND provinsi IS NULL;
UPDATE bahasa SET provinsi = 'Sulawesi Barat' WHERE nama_bahasa = 'Mandar' AND provinsi IS NULL;

-- Kalimantan extra
UPDATE bahasa SET provinsi = 'Kalimantan Tengah' WHERE nama_bahasa LIKE 'Dayak%' AND provinsi IS NULL;

-- Verify final results
SELECT 
  provinsi,
  COUNT(*) as jumlah_bahasa,
  COUNT(kabupaten) as dengan_kabupaten
FROM bahasa 
WHERE provinsi IS NOT NULL
GROUP BY provinsi
ORDER BY jumlah_bahasa DESC;
