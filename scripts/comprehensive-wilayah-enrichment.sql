-- Comprehensive enrichment for remaining languages without wilayah/provinsi
-- Based on linguistic research and geographic knowledge

-- === MALUKU LANGUAGES ===
UPDATE bahasa SET wilayah = 'Maluku', provinsi = 'Maluku' WHERE nama_bahasa IN ('Asilulu', 'Banda', 'Buru', 'Geser', 'Haruku', 'Huaulu', 'Laha', 'Larike', 'Lisela', 'Manipa', 'Masiwang', 'Nuaulu', 'Paulohi', 'Piru', 'Saleman', 'Sawai', 'Seram', 'Tala', 'Tulehu', 'Watubela', 'Yalahatan');

UPDATE bahasa SET wilayah = 'Maluku', provinsi = 'Maluku Utara' WHERE nama_bahasa IN ('Bacan', 'Galela', 'Ibu', 'Kao', 'Makian Luar', 'Makian Dalam', 'Modole', 'Pagu', 'Sahu', 'Tabaru', 'Tobelo', 'Tugutil', 'Waioli');

-- === SULAWESI LANGUAGES ===
UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Barat' WHERE nama_bahasa IN ('Bambam', 'Mamasa', 'Pannei', 'Ulumanda');

UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Selatan' WHERE nama_bahasa IN ('Bentong', 'Campalagian', 'Konjo Pesisir', 'Laiyolo', 'Selayar', 'Tampa');

UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Tengah' WHERE nama_bahasa IN ('Balaesang', 'Behoa', 'Kaili Da a', 'Kaili Inde', 'Kaili Ledo', 'Kaili Rai', 'Lauje', 'Napu', 'Rampi', 'Sarudu', 'Sedoa', 'Tajio', 'Uma');

UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Utara' WHERE nama_bahasa IN ('Atinggola', 'Bantik', 'Bintauna', 'Ponosakan', 'Ratahan', 'Sangir', 'Talaud', 'Tombulu', 'Tondano', 'Tonsawang', 'Tonsea', 'Tontemboan');

UPDATE bahasa SET wilayah = 'Sulawesi', provinsi = 'Gorontalo' WHERE nama_bahasa = 'Suwawa';

-- === KALIMANTAN LANGUAGES ===
UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Barat' WHERE nama_bahasa IN ('Bamayo', 'Bekati', 'Benawas', 'Biadju', 'Bukit', 'Jangkang', 'Kembayan', 'Kendayan', 'Keninjal', 'Lara', 'Ribun', 'Semandang', 'Selako');

UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Tengah' WHERE nama_bahasa IN ('Bahau', 'Barito Raya', 'Dusun Deyah', 'Dusun Malang', 'Dusun Witu', 'Kadorih', 'Maanyan', 'Meratus', 'Ngaju', 'Ot Danum', 'Ot Siang', 'Siang', 'Taboyan');

UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Timur' WHERE nama_bahasa IN ('Basap', 'Bulungan', 'Kelai', 'Lengilu', 'Modang', 'Punan Batu', 'Punan Merah', 'Segai');

UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Utara' WHERE nama_bahasa = 'Tidung';

UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Selatan' WHERE nama_bahasa IN ('Bukit', 'Meratus');

-- === JAWA LANGUAGES ===
UPDATE bahasa SET wilayah = 'Jawa', provinsi = 'Banten' WHERE nama_bahasa IN ('Banten', 'Badui');

UPDATE bahasa SET wilayah = 'Jawa', provinsi = 'Jawa Tengah' WHERE nama_bahasa = 'Banyumasan';

UPDATE bahasa SET wilayah = 'Jawa', provinsi = 'Jawa Barat' WHERE nama_bahasa = 'Cirebon';

-- === SUMATERA LANGUAGES ===
UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Lampung' WHERE nama_bahasa IN ('Belalau', 'Komitering', 'Lampung Api', 'Lampung Nyo', 'Ranau');

UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Sumatera Selatan' WHERE nama_bahasa IN ('Belom', 'Lematang', 'Lintang', 'Ogan', 'Pasemah', 'Rambang', 'Sekak');

UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Bengkulu' WHERE nama_bahasa IN ('Enggano', 'Pekal', 'Rejang');

UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Jambi' WHERE nama_bahasa = 'Kerinci';

UPDATE bahasa SET wilayah = 'Sumatera', provinsi = 'Sumatera Barat' WHERE nama_bahasa = 'Mentawai';

-- === PAPUA LANGUAGES ===
UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua' WHERE nama_bahasa IN ('Awyi', 'Bauzi', 'Burate', 'Dabra', 'Dem', 'Fayu', 'Foe', 'Gresi', 'Iau', 'Kapori', 'Kwerba', 'Lakeside', 'Lepki', 'Mander', 'Mombum', 'Murkim', 'Nafri', 'Nimboran', 'One', 'Pauwi', 'Sause', 'Sowari', 'Tause', 'Tefaro', 'Tobati', 'Trimuris', 'Walsa', 'Waris', 'Witiri');

UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua Barat' WHERE nama_bahasa IN ('Abun', 'Hatam', 'Meyah', 'Moskona', 'Sougb');

UPDATE bahasa SET wilayah = 'Papua', provinsi = 'Papua Selatan' WHERE nama_bahasa IN ('Atohwaim', 'Awyu', 'Citak', 'Korowai', 'Mandobo', 'Pisa', 'Sawi', 'Yonggom');

-- === NUSA TENGGARA LANGUAGES ===
UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Timur' WHERE nama_bahasa IN ('Alor', 'Alorese', 'Baikenu', 'Buna', 'Delang', 'Dengka', 'Galoli', 'Idalaka', 'Iliun', 'Kemak', 'Lamaholot', 'Leti', 'Makuva', 'Naueti', 'Ndaonese', 'Rote', 'Sika', 'Tetun', 'Tokodede');

UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Barat' WHERE nama_bahasa = 'Bayan';

-- Check final coverage
SELECT COUNT(*) as total, COUNT(wilayah) as with_wilayah, COUNT(provinsi) as with_provinsi, ROUND(COUNT(wilayah) * 100.0 / COUNT(*), 1) as pct_wilayah, ROUND(COUNT(provinsi) * 100.0 / COUNT(*), 1) as pct_provinsi FROM bahasa;
