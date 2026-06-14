-- Nusantara Basa - Historical Data Seeding Batch 2
-- Languages: Minangkabau, Madura, Bali, Aceh, Banjar
-- Date: 2025-06-14

-- ============================================================================
-- PERISTIWA SEJARAH
-- ============================================================================

-- MINANGKABAU
INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Kerajaan Pagaruyung', 1347, 'Politik dan Budaya',
  'Kerajaan Pagaruyung menjadi pusat kebudayaan Minangkabau. Bahasa Minangkabau Kuno digunakan dalam naskah dan prasasti kerajaan. Sistem matrilineal sudah mapan pada masa ini.',
  'Sumatera Barat'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Kerajaan Pagaruyung');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Tradisi Merantau Minangkabau', 1500, 'Sosial dan Budaya',
  'Tradisi merantau pemuda Minangkabau menyebarluaskan bahasa dan budaya ke seluruh Nusantara. Bahasa Minangkabau menjadi lingua franca perdagangan di pantai barat Sumatera.',
  'Nusantara'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Tradisi Merantau Minangkabau');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Perang Padri', 1803, 'Politik dan Agama',
  'Perang Padri membawa pengaruh Islam yang kuat pada bahasa Minangkabau. Banyak kosakata Arab masuk melalui pendidikan agama dan perdagangan.',
  'Sumatera Barat'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Perang Padri');

-- MADURA
INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Kerajaan Madura Kuno', 1300, 'Politik dan Budaya',
  'Kerajaan-kerajaan kecil di Pulau Madura menggunakan bahasa Madura Kuno. Tradisi lisan dan seni pertunjukan berkembang pesat.',
  'Pulau Madura'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Kerajaan Madura Kuno');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Migrasi ke Jawa Timur', 1800, 'Sosial dan Budaya',
  'Migrasi besar-besaran orang Madura ke Jawa Timur membawa bahasa Madura ke wilayah Tapal Kuda. Bahasa Madura bercampur dengan bahasa Jawa menciptakan dialek unik.',
  'Jawa Timur'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Migrasi ke Jawa Timur');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Tradisi Kerapan Sapi', 1700, 'Budaya',
  'Kerapan sapi menjadi tradisi budaya Madura yang unik. Bahasa Madura mengembangkan kosakata khusus terkait peternakan dan kompetisi tradisional.',
  'Pulau Madura'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Tradisi Kerapan Sapi');

-- BALI
INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Kerajaan Bali Kuno', 900, 'Politik dan Budaya',
  'Kerajaan-kerajaan Bali kuno seperti Bedahulu menggunakan bahasa Bali Kuno yang dipengaruhi Sanskerta. Aksara Bali dikembangkan dari aksara Pallawa.',
  'Pulau Bali'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Kerajaan Bali Kuno');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Kerajaan Majapahit di Bali', 1343, 'Politik dan Budaya',
  'Penaklukan Bali oleh Majapahit membawa pengaruh Jawa Kuno yang kuat pada bahasa Bali. Sistem kasta dan tingkatan bahasa (sor, singgih) mulai berkembang.',
  'Pulau Bali'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Kerajaan Majapahit di Bali');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Pariwisata Modern Bali', 1930, 'Sosial dan Budaya',
  'Pariwisata internasional membawa pengaruh bahasa asing pada bahasa Bali. Kosakata Inggris, Belanda, dan Jepang masuk melalui industri pariwisata.',
  'Pulau Bali'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Pariwisata Modern Bali');

-- ACEH
INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Kesultanan Aceh Darussalam', 1496, 'Politik dan Budaya',
  'Kesultanan Aceh menjadi pusat penyebaran Islam di Nusantara. Bahasa Aceh menyerap banyak kosakata Arab dan Persia melalui perdagangan dan pendidikan agama.',
  'Aceh'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Kesultanan Aceh Darussalam');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Perang Aceh', 1873, 'Politik',
  'Perang Aceh melawan Belanda selama 30 tahun. Bahasa Aceh menjadi simbol perlawanan dan identitas nasional. Banyak hikayat perang ditulis dalam bahasa Aceh.',
  'Aceh'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Perang Aceh');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Tsunami Aceh 2004', 2004, 'Bencana Alam',
  'Tsunami 2004 menghancurkan banyak komunitas penutur bahasa Aceh. Upaya revitalisasi bahasa dilakukan melalui pendidikan dan dokumentasi.',
  'Aceh'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Tsunami Aceh 2004');

-- BANJAR
INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Kesultanan Banjar', 1526, 'Politik dan Budaya',
  'Kesultanan Banjar menjadi pusat kebudayaan di Kalimantan Selatan. Bahasa Banjar berkembang sebagai lingua franca perdagangan sungai dan pantai.',
  'Kalimantan Selatan'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Kesultanan Banjar');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Perdagangan Rempah Banjarmasin', 1600, 'Ekonomi dan Budaya',
  'Banjarmasin menjadi pelabuhan perdagangan rempah internasional. Bahasa Banjar menyerap kosakata dari bahasa Melayu, Arab, dan Cina melalui perdagangan.',
  'Kalimantan Selatan'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Perdagangan Rempah Banjarmasin');

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 'Migrasi ke Kalimantan Timur', 1900, 'Sosial dan Budaya',
  'Migrasi orang Banjar ke Kalimantan Timur membawa bahasa Banjar ke wilayah baru. Bahasa Banjar menjadi bahasa perdagangan di Samarinda dan Balikpapan.',
  'Kalimantan Timur'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Migrasi ke Kalimantan Timur');

-- ============================================================================
-- PENGARUH BAHASA LAIN
-- ============================================================================

-- MINANGKABAU
INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Sanskerta', 'Kosakata', 10.2, 'raja, negara, dewa, waktu'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Sanskerta');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Arab', 'Kosakata', 9.5, 'kitab, waktu, pikir, kabar, selamat'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Arab');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Melayu', 'Kosakata dan Tata Bahasa', 15.8, 'bahasa, negara, waktu, orang'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Melayu');

-- MADURA
INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Jawa', 'Kosakata dan Tata Bahasa', 18.5, 'waktu, orang, tempat, besar'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Jawa');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Arab', 'Kosakata', 6.3, 'kitab, waktu, pikir, kabar'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Arab');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Melayu', 'Kosakata', 8.7, 'bahasa, negara, raja'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Melayu');

-- BALI
INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Sanskerta', 'Kosakata', 20.3, 'raja, dewa, surga, neraka, waktu'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Sanskerta');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Jawa Kuno', 'Kosakata dan Tingkatan Bahasa', 25.5, 'raja, negara, waktu, orang'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Jawa Kuno');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Inggris', 'Kosakata', 4.2, 'hotel, restoran, turis, pantai'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Inggris');

-- ACEH
INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Arab', 'Kosakata', 18.7, 'kitab, waktu, pikir, kabar, selamat, berkah'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Arab');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Melayu', 'Kosakata', 12.4, 'bahasa, negara, raja, waktu'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Melayu');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Persia', 'Kosakata', 5.8, 'surga, neraka, malaikat, nabi'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Persia');

-- BANJAR
INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Melayu', 'Kosakata dan Tata Bahasa', 22.5, 'bahasa, negara, raja, waktu, orang'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Melayu');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Jawa', 'Kosakata', 15.3, 'waktu, orang, tempat, besar'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Jawa');

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 'Arab', 'Kosakata', 7.2, 'kitab, waktu, pikir, kabar'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Arab');

-- ============================================================================
-- PENUTUR HISTORIS
-- ============================================================================

-- MINANGKABAU
INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1930, 2500000, 'Sensus Hindia Belanda'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1930);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1980, 4500000, 'Sensus Nasional'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1980);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 2020, 5500000, 'Sensus BPS 2020'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 2020);

-- MADURA
INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1930, 5000000, 'Sensus Hindia Belanda'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1930);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1980, 10000000, 'Sensus Nasional'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1980);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 2020, 13600000, 'Sensus BPS 2020'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 2020);

-- BALI
INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1930, 1500000, 'Sensus Hindia Belanda'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1930);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1980, 2500000, 'Sensus Nasional'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1980);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 2020, 3300000, 'Sensus BPS 2020'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 2020);

-- ACEH
INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1930, 1500000, 'Sensus Hindia Belanda'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1930);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1980, 2500000, 'Sensus Nasional'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1980);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 2020, 3500000, 'Sensus BPS 2020'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 2020);

-- BANJAR
INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1930, 1500000, 'Sensus Hindia Belanda'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1930);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1980, 2500000, 'Sensus Nasional'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1980);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 2020, 3500000, 'Sensus BPS 2020'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 2020);

-- ============================================================================
-- RIWAYAT NAMA
-- ============================================================================

INSERT INTO riwayat_nama (bahasa_id, nama_lama, tahun_perubahan, alasan_perubahan)
SELECT b.id, 'Minangkabau', 1900, 'Standardisasi penulisan dalam aksara Latin'
FROM bahasa b WHERE b.nama_bahasa = 'Minangkabau'
AND NOT EXISTS (SELECT 1 FROM riwayat_nama WHERE bahasa_id = b.id AND nama_lama = 'Minangkabau');

INSERT INTO riwayat_nama (bahasa_id, nama_lama, tahun_perubahan, alasan_perubahan)
SELECT b.id, 'Madoera', 1900, 'Standardisasi penulisan dalam aksara Latin'
FROM bahasa b WHERE b.nama_bahasa = 'Madura'
AND NOT EXISTS (SELECT 1 FROM riwayat_nama WHERE bahasa_id = b.id AND nama_lama = 'Madoera');

INSERT INTO riwayat_nama (bahasa_id, nama_lama, tahun_perubahan, alasan_perubahan)
SELECT b.id, 'Balineesch', 1900, 'Standardisasi penulisan dalam aksara Latin'
FROM bahasa b WHERE b.nama_bahasa = 'Bali'
AND NOT EXISTS (SELECT 1 FROM riwayat_nama WHERE bahasa_id = b.id AND nama_lama = 'Balineesch');

INSERT INTO riwayat_nama (bahasa_id, nama_lama, tahun_perubahan, alasan_perubahan)
SELECT b.id, 'Atjeh', 1900, 'Standardisasi penulisan dalam aksara Latin'
FROM bahasa b WHERE b.nama_bahasa = 'Aceh'
AND NOT EXISTS (SELECT 1 FROM riwayat_nama WHERE bahasa_id = b.id AND nama_lama = 'Atjeh');

INSERT INTO riwayat_nama (bahasa_id, nama_lama, tahun_perubahan, alasan_perubahan)
SELECT b.id, 'Bandjar', 1900, 'Standardisasi penulisan dalam aksara Latin'
FROM bahasa b WHERE b.nama_bahasa = 'Banjar'
AND NOT EXISTS (SELECT 1 FROM riwayat_nama WHERE bahasa_id = b.id AND nama_lama = 'Bandjar');
