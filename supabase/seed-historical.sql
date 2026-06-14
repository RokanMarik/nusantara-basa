-- Nusantara Basa - Historical Data Seeding
-- Date: 2025-06-14
-- Purpose: Seed historical module tables with sample data for major languages

-- ============================================================================
-- STEP 1: Peristiwa Sejarah (Historical Events)
-- ============================================================================

-- Jawa
INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 
  'Masa Keemasan Kerajaan Majapahit', 
  1350, 
  'Politik & Budaya',
  'Bahasa Jawa Kawi menjadi bahasa resmi kerajaan Majapahit. Karya sastra seperti Negarakertagama ditulis dalam bahasa ini.',
  'Jawa Timur'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Masa Keemasan Kerajaan Majapahit'
);

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 
  'Penyebaran Islam di Jawa', 
  1450, 
  'Agama & Budaya',
  'Bahasa Jawa menyerap banyak kosakata Arab. Aksara Pegon (Jawa-Arab) dikembangkan untuk menulis teks agama.',
  'Jawa Tengah, Jawa Timur'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Penyebaran Islam di Jawa'
);

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 
  'Kolonialisme Belanda', 
  1600, 
  'Politik',
  'Bahasa Belanda mempengaruhi kosakata Jawa. Sistem pendidikan kolonial memperkenalkan aksara Latin.',
  'Hindia Belanda'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Kolonialisme Belanda'
);

-- Sunda
INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 
  'Kerajaan Sunda Pajajaran', 
  1333, 
  'Politik & Budaya',
  'Bahasa Sunda Kuno digunakan dalam prasasti dan naskah kuno. Kerajaan Pajajaran menjadi pusat kebudayaan Sunda.',
  'Jawa Barat'
FROM bahasa b WHERE b.nama_bahasa = 'Sunda' AND NOT EXISTS (
  SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Kerajaan Sunda Pajajaran'
);

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 
  'Pengaruh Islam di Tatar Sunda', 
  1500, 
  'Agama & Budaya',
  'Penyebaran Islam membawa pengaruh besar pada bahasa Sunda. Banyak kosakata Arab masuk melalui perdagangan dan dakwah.',
  'Jawa Barat'
FROM bahasa b WHERE b.nama_bahasa = 'Sunda' AND NOT EXISTS (
  SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Pengaruh Islam di Tatar Sunda'
);

-- Bugis
INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 
  'Kerajaan Bugis Kuno', 
  1300, 
  'Politik & Budaya',
  'Kerajaan Bugis kuno seperti Luwu dan Bone menggunakan aksara Lontara. Naskah I La Galigo ditulis dalam bahasa Bugis Kuno.',
  'Sulawesi Selatan'
FROM bahasa b WHERE b.nama_bahasa = 'Bugis' AND NOT EXISTS (
  SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Kerajaan Bugis Kuno'
);

INSERT INTO peristiwa_sejarah (bahasa_id, judul, tahun, jenis_peristiwa, deskripsi, lokasi)
SELECT b.id, 
  'Ekspansi Maritim Bugis', 
  1650, 
  'Ekonomi & Budaya',
  'Pelaut Bugis melakukan ekspansi ke seluruh Nusantara. Bahasa Bugis menyebar ke Kalimantan, Sumatera, dan Semenanjung Malaya.',
  'Nusantara'
FROM bahasa b WHERE b.nama_bahasa = 'Bugis' AND NOT EXISTS (
  SELECT 1 FROM peristiwa_sejarah WHERE bahasa_id = b.id AND judul = 'Ekspansi Maritim Bugis'
);

-- ============================================================================
-- STEP 2: Pengaruh Bahasa Lain (Language Influences)
-- ============================================================================

-- Jawa
INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 
  'Sanskerta', 
  'Kosakata', 
  15.5,
  'kata, waktu, negara, raja, dewa, surga, neraka'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Sanskerta'
);

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 
  'Arab', 
  'Kosakata', 
  8.2,
  'kitab, waktu, pikir, kabar, selamat, berkah'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Arab'
);

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 
  'Belanda', 
  'Kosakata', 
  3.5,
  'kantor, polisi, sepeda, radio, televisi'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Belanda'
);

-- Sunda
INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 
  'Sanskerta', 
  'Kosakata', 
  12.3,
  'raja, negara, dewa, surga, waktu'
FROM bahasa b WHERE b.nama_bahasa = 'Sunda' AND NOT EXISTS (
  SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Sanskerta'
);

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 
  'Arab', 
  'Kosakata', 
  7.8,
  'kitab, waktu, pikir, kabar, selamat'
FROM bahasa b WHERE b.nama_bahasa = 'Sunda' AND NOT EXISTS (
  SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Arab'
);

-- Bugis
INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 
  'Melayu', 
  'Kosakata', 
  10.5,
  'bahasa, negara, raja, waktu'
FROM bahasa b WHERE b.nama_bahasa = 'Bugis' AND NOT EXISTS (
  SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Melayu'
);

INSERT INTO pengaruh_bahasa_lain (bahasa_id, bahasa_pemberi, jenis_pengaruh, persentase, contoh_kata)
SELECT b.id, 
  'Arab', 
  'Kosakata', 
  6.2,
  'kitab, waktu, pikir, kabar'
FROM bahasa b WHERE b.nama_bahasa = 'Bugis' AND NOT EXISTS (
  SELECT 1 FROM pengaruh_bahasa_lain WHERE bahasa_id = b.id AND bahasa_pemberi = 'Arab'
);

-- ============================================================================
-- STEP 3: Penutur Historis (Historical Speaker Data)
-- ============================================================================

-- Jawa
INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1930, 20000000, 'Sensus Hindia Belanda'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1930
);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1980, 60000000, 'Sensus Nasional'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1980
);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 2020, 80000000, 'Sensus BPS 2020'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 2020
);

-- Sunda
INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1930, 8000000, 'Sensus Hindia Belanda'
FROM bahasa b WHERE b.nama_bahasa = 'Sunda' AND NOT EXISTS (
  SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1930
);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1980, 25000000, 'Sensus Nasional'
FROM bahasa b WHERE b.nama_bahasa = 'Sunda' AND NOT EXISTS (
  SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1980
);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 2020, 42000000, 'Sensus BPS 2020'
FROM bahasa b WHERE b.nama_bahasa = 'Sunda' AND NOT EXISTS (
  SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 2020
);

-- Bugis
INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1930, 2000000, 'Sensus Hindia Belanda'
FROM bahasa b WHERE b.nama_bahasa = 'Bugis' AND NOT EXISTS (
  SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1930
);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 1980, 3500000, 'Sensus Nasional'
FROM bahasa b WHERE b.nama_bahasa = 'Bugis' AND NOT EXISTS (
  SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 1980
);

INSERT INTO penutur_historis (bahasa_id, tahun, jumlah_penutur, sumber_data)
SELECT b.id, 2020, 5000000, 'Sensus BPS 2020'
FROM bahasa b WHERE b.nama_bahasa = 'Bugis' AND NOT EXISTS (
  SELECT 1 FROM penutur_historis WHERE bahasa_id = b.id AND tahun = 2020
);

-- ============================================================================
-- STEP 4: Riwayat Nama (Name History)
-- ============================================================================

-- Jawa
INSERT INTO riwayat_nama (bahasa_id, nama_lama, tahun_perubahan, alasan_perubahan)
SELECT b.id, 'Jawi', 1900, 'Standardisasi penulisan dalam aksara Latin'
FROM bahasa b WHERE b.nama_bahasa = 'Jawa' AND NOT EXISTS (
  SELECT 1 FROM riwayat_nama WHERE bahasa_id = b.id AND nama_lama = 'Jawi'
);

-- Sunda
INSERT INTO riwayat_nama (bahasa_id, nama_lama, tahun_perubahan, alasan_perubahan)
SELECT b.id, 'Soenda', 1900, 'Standardisasi penulisan dalam aksara Latin'
FROM bahasa b WHERE b.nama_bahasa = 'Sunda' AND NOT EXISTS (
  SELECT 1 FROM riwayat_nama WHERE bahasa_id = b.id AND nama_lama = 'Soenda'
);

-- Bugis
INSERT INTO riwayat_nama (bahasa_id, nama_lama, tahun_perubahan, alasan_perubahan)
SELECT b.id, 'Boegis', 1900, 'Standardisasi penulisan dalam aksara Latin'
FROM bahasa b WHERE b.nama_bahasa = 'Bugis' AND NOT EXISTS (
  SELECT 1 FROM riwayat_nama WHERE bahasa_id = b.id AND nama_lama = 'Boegis'
);
