-- Kabupaten enrichment based on linguistic research and geographic distribution
-- Focus on major languages with well-documented locations

-- Java Island
UPDATE bahasa SET kabupaten = 'Kota Bandung', provinsi = 'Jawa Barat' WHERE nama_bahasa = 'Sunda';
UPDATE bahasa SET kabupaten = 'Kota Semarang', provinsi = 'Jawa Tengah' WHERE nama_bahasa = 'Jawa';
UPDATE bahasa SET kabupaten = 'Kota Surabaya', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Jawa';
UPDATE bahasa SET kabupaten = 'Kota Yogyakarta', provinsi = 'DI Yogyakarta' WHERE nama_bahasa = 'Jawa';
UPDATE bahasa SET kabupaten = 'Kota Surakarta', provinsi = 'Jawa Tengah' WHERE nama_bahasa = 'Jawa';
UPDATE bahasa SET kabupaten = 'Kab. Sumenep', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Madura';
UPDATE bahasa SET kabupaten = 'Kab. Pamekasan', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Madura';
UPDATE bahasa SET kabupaten = 'Kab. Sampang', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Madura';
UPDATE bahasa SET kabupaten = 'Kab. Bangkalan', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Madura';
UPDATE bahasa SET kabupaten = 'Kota Jakarta Pusat', provinsi = 'DKI Jakarta' WHERE nama_bahasa = 'Betawi';
UPDATE bahasa SET kabupaten = 'Kota Bekasi', provinsi = 'Jawa Barat' WHERE nama_bahasa = 'Betawi';
UPDATE bahasa SET kabupaten = 'Kota Depok', provinsi = 'Jawa Barat' WHERE nama_bahasa = 'Betawi';
UPDATE bahasa SET kabupaten = 'Kota Tangerang', provinsi = 'Banten' WHERE nama_bahasa = 'Betawi';
UPDATE bahasa SET kabupaten = 'Kab. Banyuwangi', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Using';
UPDATE bahasa SET kabupaten = 'Kab. Banyuwangi', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Osing';
UPDATE bahasa SET kabupaten = 'Kab. Probolinggo', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Tengger';
UPDATE bahasa SET kabupaten = 'Kab. Pasuruan', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Tengger';
UPDATE bahasa SET kabupaten = 'Kab. Lumajang', provinsi = 'Jawa Timur' WHERE nama_bahasa = 'Tengger';

-- Sumatra Island
UPDATE bahasa SET kabupaten = 'Kota Padang', provinsi = 'Sumatera Barat' WHERE nama_bahasa = 'Minangkabau';
UPDATE bahasa SET kabupaten = 'Kota Bukittinggi', provinsi = 'Sumatera Barat' WHERE nama_bahasa = 'Minangkabau';
UPDATE bahasa SET kabupaten = 'Kota Padang Panjang', provinsi = 'Sumatera Barat' WHERE nama_bahasa = 'Minangkabau';
UPDATE bahasa SET kabupaten = 'Kota Banda Aceh', provinsi = 'Aceh' WHERE nama_bahasa = 'Aceh';
UPDATE bahasa SET kabupaten = 'Kab. Aceh Besar', provinsi = 'Aceh' WHERE nama_bahasa = 'Aceh';
UPDATE bahasa SET kabupaten = 'Kab. Aceh Utara', provinsi = 'Aceh' WHERE nama_bahasa = 'Aceh';
UPDATE bahasa SET kabupaten = 'Kota Medan', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Batak Toba';
UPDATE bahasa SET kabupaten = 'Kab. Toba Samosir', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Batak Toba';
UPDATE bahasa SET kabupaten = 'Kab. Samosir', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Batak Toba';
UPDATE bahasa SET kabupaten = 'Kab. Simalungun', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Batak Simalungun';
UPDATE bahasa SET kabupaten = 'Kab. Karo', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Batak Karo';
UPDATE bahasa SET kabupaten = 'Kab. Dairi', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Batak Pakpak';
UPDATE bahasa SET kabupaten = 'Kab. Mandailing Natal', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Batak Mandailing';
UPDATE bahasa SET kabupaten = 'Kab. Tapanuli Selatan', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Batak Angkola';
UPDATE bahasa SET kabupaten = 'Kota Palembang', provinsi = 'Sumatera Selatan' WHERE nama_bahasa = 'Palembang';
UPDATE bahasa SET kabupaten = 'Kab. Ogan Komering Ilir', provinsi = 'Sumatera Selatan' WHERE nama_bahasa = 'Palembang';
UPDATE bahasa SET kabupaten = 'Kota Bandar Lampung', provinsi = 'Lampung' WHERE nama_bahasa = 'Lampung';
UPDATE bahasa SET kabupaten = 'Kab. Lampung Selatan', provinsi = 'Lampung' WHERE nama_bahasa = 'Lampung';
UPDATE bahasa SET kabupaten = 'Kab. Lampung Utara', provinsi = 'Lampung' WHERE nama_bahasa = 'Lampung';
UPDATE bahasa SET kabupaten = 'Kab. Rejang Lebong', provinsi = 'Bengkulu' WHERE nama_bahasa = 'Rejang';
UPDATE bahasa SET kabupaten = 'Kab. Kepahiang', provinsi = 'Bengkulu' WHERE nama_bahasa = 'Rejang';
UPDATE bahasa SET kabupaten = 'Kab. Kerinci', provinsi = 'Jambi' WHERE nama_bahasa = 'Kerinci';
UPDATE bahasa SET kabupaten = 'Kab. Sungai Penuh', provinsi = 'Jambi' WHERE nama_bahasa = 'Kerinci';
UPDATE bahasa SET kabupaten = 'Kab. Nias', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Nias';
UPDATE bahasa SET kabupaten = 'Kab. Nias Selatan', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Nias';
UPDATE bahasa SET kabupaten = 'Kab. Nias Utara', provinsi = 'Sumatera Utara' WHERE nama_bahasa = 'Nias';
UPDATE bahasa SET kabupaten = 'Kab. Kepulauan Mentawai', provinsi = 'Sumatera Barat' WHERE nama_bahasa = 'Mentawai';
UPDATE bahasa SET kabupaten = 'Kab. Bengkalis', provinsi = 'Riau' WHERE nama_bahasa = 'Melayu Riau';
UPDATE bahasa SET kabupaten = 'Kab. Siak', provinsi = 'Riau' WHERE nama_bahasa = 'Melayu Riau';
UPDATE bahasa SET kabupaten = 'Kab. Pelalawan', provinsi = 'Riau' WHERE nama_bahasa = 'Melayu Riau';
UPDATE bahasa SET kabupaten = 'Kab. Merangin', provinsi = 'Jambi' WHERE nama_bahasa = 'Melayu Jambi';
UPDATE bahasa SET kabupaten = 'Kab. Sarolangun', provinsi = 'Jambi' WHERE nama_bahasa = 'Melayu Jambi';
UPDATE bahasa SET kabupaten = 'Kab. Tanjung Jabung Barat', provinsi = 'Jambi' WHERE nama_bahasa = 'Kubu';
UPDATE bahasa SET kabupaten = 'Kab. Indragiri Hilir', provinsi = 'Riau' WHERE nama_bahasa = 'Kubu';

-- Kalimantan Island
UPDATE bahasa SET kabupaten = 'Kota Banjarmasin', provinsi = 'Kalimantan Selatan' WHERE nama_bahasa = 'Banjar';
UPDATE bahasa SET kabupaten = 'Kab. Banjar', provinsi = 'Kalimantan Selatan' WHERE nama_bahasa = 'Banjar';
UPDATE bahasa SET kabupaten = 'Kab. Barito Kuala', provinsi = 'Kalimantan Selatan' WHERE nama_bahasa = 'Banjar';
UPDATE bahasa SET kabupaten = 'Kota Pontianak', provinsi = 'Kalimantan Barat' WHERE nama_bahasa = 'Dayak Iban';
UPDATE bahasa SET kabupaten = 'Kab. Sintang', provinsi = 'Kalimantan Barat' WHERE nama_bahasa = 'Dayak Iban';
UPDATE bahasa SET kabupaten = 'Kab. Kapuas Hulu', provinsi = 'Kalimantan Barat' WHERE nama_bahasa = 'Dayak Iban';
UPDATE bahasa SET kabupaten = 'Kota Palangkaraya', provinsi = 'Kalimantan Tengah' WHERE nama_bahasa = 'Dayak Ngaju';
UPDATE bahasa SET kabupaten = 'Kab. Gunung Mas', provinsi = 'Kalimantan Tengah' WHERE nama_bahasa = 'Dayak Ngaju';
UPDATE bahasa SET kabupaten = 'Kab. Kapuas', provinsi = 'Kalimantan Tengah' WHERE nama_bahasa = 'Dayak Ngaju';

-- Sulawesi Island
UPDATE bahasa SET kabupaten = 'Kota Makassar', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Makassar';
UPDATE bahasa SET kabupaten = 'Kab. Gowa', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Makassar';
UPDATE bahasa SET kabupaten = 'Kab. Takalar', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Makassar';
UPDATE bahasa SET kabupaten = 'Kota Parepare', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Bugis';
UPDATE bahasa SET kabupaten = 'Kab. Bone', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Bugis';
UPDATE bahasa SET kabupaten = 'Kab. Soppeng', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Bugis';
UPDATE bahasa SET kabupaten = 'Kab. Wajo', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Bugis';
UPDATE bahasa SET kabupaten = 'Kab. Tana Toraja', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Toraja';
UPDATE bahasa SET kabupaten = 'Kab. Toraja Utara', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa = 'Toraja';
UPDATE bahasa SET kabupaten = 'Kota Manado', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Minahasa';
UPDATE bahasa SET kabupaten = 'Kab. Minahasa', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Minahasa';
UPDATE bahasa SET kabupaten = 'Kab. Minahasa Utara', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Minahasa';
UPDATE bahasa SET kabupaten = 'Kab. Bolaang Mongondow', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Bolaang Mongondow';
UPDATE bahasa SET kabupaten = 'Kab. Bolaang Mongondow Timur', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Bolaang Mongondow';
UPDATE bahasa SET kabupaten = 'Kab. Bolaang Mongondow Selatan', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Bolaang Mongondow';
UPDATE bahasa SET kabupaten = 'Kab. Bolaang Mongondow Utara', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Bolaang Mongondow';
UPDATE bahasa SET kabupaten = 'Kota Gorontalo', provinsi = 'Gorontalo' WHERE nama_bahasa = 'Gorontalo';
UPDATE bahasa SET kabupaten = 'Kab. Gorontalo', provinsi = 'Gorontalo' WHERE nama_bahasa = 'Gorontalo';
UPDATE bahasa SET kabupaten = 'Kab. Gorontalo Utara', provinsi = 'Gorontalo' WHERE nama_bahasa = 'Gorontalo';
UPDATE bahasa SET kabupaten = 'Kab. Buol', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Buol';
UPDATE bahasa SET kabupaten = 'Kab. Tolitoli', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Tolitoli';
UPDATE bahasa SET kabupaten = 'Kab. Poso', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Pamona';
UPDATE bahasa SET kabupaten = 'Kab. Morowali', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Mori';
UPDATE bahasa SET kabupaten = 'Kab. Morowali Utara', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Mori';
UPDATE bahasa SET kabupaten = 'Kab. Banggai', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Banggai';
UPDATE bahasa SET kabupaten = 'Kab. Banggai Kepulauan', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Banggai';
UPDATE bahasa SET kabupaten = 'Kab. Parigi Moutong', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Tomini';
UPDATE bahasa SET kabupaten = 'Kab. Tojo Una-Una', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Saluan';
UPDATE bahasa SET kabupaten = 'Kab. Buol', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa = 'Saluan';
UPDATE bahasa SET kabupaten = 'Kab. Muna', provinsi = 'Sulawesi Tenggara' WHERE nama_bahasa = 'Muna';
UPDATE bahasa SET kabupaten = 'Kab. Muna Barat', provinsi = 'Sulawesi Tenggara' WHERE nama_bahasa = 'Muna';

-- Bali & Nusa Tenggara
UPDATE bahasa SET kabupaten = 'Kota Denpasar', provinsi = 'Bali' WHERE nama_bahasa = 'Bali';
UPDATE bahasa SET kabupaten = 'Kab. Badung', provinsi = 'Bali' WHERE nama_bahasa = 'Bali';
UPDATE bahasa SET kabupaten = 'Kab. Gianyar', provinsi = 'Bali' WHERE nama_bahasa = 'Bali';
UPDATE bahasa SET kabupaten = 'Kota Mataram', provinsi = 'Nusa Tenggara Barat' WHERE nama_bahasa = 'Sasak';
UPDATE bahasa SET kabupaten = 'Kab. Lombok Barat', provinsi = 'Nusa Tenggara Barat' WHERE nama_bahasa = 'Sasak';
UPDATE bahasa SET kabupaten = 'Kab. Lombok Tengah', provinsi = 'Nusa Tenggara Barat' WHERE nama_bahasa = 'Sasak';
UPDATE bahasa SET kabupaten = 'Kab. Lombok Timur', provinsi = 'Nusa Tenggara Barat' WHERE nama_bahasa = 'Sasak';

-- Maluku & Papua
UPDATE bahasa SET kabupaten = 'Kota Ambon', provinsi = 'Maluku' WHERE nama_bahasa = 'Ambon';
UPDATE bahasa SET kabupaten = 'Kab. Maluku Tengah', provinsi = 'Maluku' WHERE nama_bahasa = 'Ambon';
UPDATE bahasa SET kabupaten = 'Kota Ternate', provinsi = 'Maluku Utara' WHERE nama_bahasa = 'Ternate';
UPDATE bahasa SET kabupaten = 'Kab. Halmahera Selatan', provinsi = 'Maluku Utara' WHERE nama_bahasa = 'Ternate';
UPDATE bahasa SET kabupaten = 'Kota Tidore Kepulauan', provinsi = 'Maluku Utara' WHERE nama_bahasa = 'Tidore';
UPDATE bahasa SET kabupaten = 'Kab. Kepulauan Sangihe', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Sangihe';
UPDATE bahasa SET kabupaten = 'Kab. Kepulauan Talaud', provinsi = 'Sulawesi Utara' WHERE nama_bahasa = 'Sangihe';

-- Summary query
SELECT 
  COUNT(*) as total_updated,
  COUNT(DISTINCT kabupaten) as unique_kabupaten,
  COUNT(DISTINCT provinsi) as unique_provinsi
FROM bahasa 
WHERE kabupaten IS NOT NULL;
