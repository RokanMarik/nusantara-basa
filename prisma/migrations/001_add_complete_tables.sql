-- ============================================
-- NUSANTARA BASA: Schema Migration
-- Tambah 6 Tabel Baru (Media, Referensi, Sejarah)
-- ============================================
-- Jalankan di Supabase SQL Editor:
-- Dashboard → SQL Editor → New Query → Paste & Run
-- ============================================

-- 1. TABEL MEDIA DAN DOKUMEN
-- Menyimpan audio, video, gambar, dokumen untuk setiap bahasa
CREATE TABLE IF NOT EXISTS media_dokumen (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bahasa_id UUID NOT NULL REFERENCES bahasa(id) ON DELETE CASCADE,
    tipe_media VARCHAR(50) NOT NULL CHECK (tipe_media IN ('audio', 'video', 'gambar', 'dokumen', 'teks')),
    url_file TEXT NOT NULL,
    deskripsi TEXT,
    tanggal_unggah TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    format VARCHAR(20),
    ukuran VARCHAR(20),
    dibuat_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    diperbarui_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_media_dokumen_bahasa_id ON media_dokumen(bahasa_id);
CREATE INDEX IF NOT EXISTS idx_media_dokumen_tipe ON media_dokumen(tipe_media);

-- Auto-update diperbarui_pada
CREATE OR REPLACE TRIGGER update_media_dokumen_timestamp
    BEFORE UPDATE ON media_dokumen
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 2. TABEL SUMBER REFERENSI
-- Track sumber data untuk kredibilitas akademis
CREATE TABLE IF NOT EXISTS sumber_referensi (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bahasa_id UUID NOT NULL REFERENCES bahasa(id) ON DELETE CASCADE,
    nama_lembaga VARCHAR(200) NOT NULL,
    jenis_sumber VARCHAR(50) NOT NULL CHECK (jenis_sumber IN ('buku', 'jurnal', 'website', 'laporan', 'skripsi', 'tesis', 'disertasi', 'surat_kabar')),
    tahun_terbit INT,
    url_doi TEXT,
    kredibilitas VARCHAR(20) CHECK (kredibilitas IN ('tinggi', 'sedang', 'rendah')),
    catatan TEXT,
    dibuat_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    diperbarui_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_sumber_referensi_bahasa_id ON sumber_referensi(bahasa_id);
CREATE INDEX IF NOT EXISTS idx_sumber_referensi_jenis ON sumber_referensi(jenis_sumber);

CREATE OR REPLACE TRIGGER update_sumber_referensi_timestamp
    BEFORE UPDATE ON sumber_referensi
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 3. TABEL PERISTIWA SEJARAH
-- Mencatat peristiwa historis yang berdampak pada bahasa
CREATE TABLE IF NOT EXISTS peristiwa_sejarah (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bahasa_id UUID NOT NULL REFERENCES bahasa(id) ON DELETE CASCADE,
    tahun_mulai INT,
    tahun_selesai INT,
    jenis_peristiwa VARCHAR(100) NOT NULL,
    era_historis VARCHAR(50),
    dampak_pada_bahasa TEXT,
    wilayah_terdampak TEXT,
    sumber_sejarah TEXT,
    catatan TEXT,
    dibuat_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    diperbarui_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_peristiwa_sejarah_bahasa_id ON peristiwa_sejarah(bahasa_id);
CREATE INDEX IF NOT EXISTS idx_peristiwa_sejarah_jenis ON peristiwa_sejarah(jenis_peristiwa);
CREATE INDEX IF NOT EXISTS idx_peristiwa_sejarah_era ON peristiwa_sejarah(era_historis);

CREATE OR REPLACE TRIGGER update_peristiwa_sejarah_timestamp
    BEFORE UPDATE ON peristiwa_sejarah
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 4. TABEL PENGARUH BAHASA LAIN
-- Mencatat pengaruh bahasa asing ke bahasa daerah
CREATE TABLE IF NOT EXISTS pengaruh_bahasa_lain (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bahasa_id UUID NOT NULL REFERENCES bahasa(id) ON DELETE CASCADE,
    bahasa_asal VARCHAR(100) NOT NULL,
    periode_pengaruh VARCHAR(100),
    jenis_pengaruh VARCHAR(50),
    contoh_kosakata JSONB,
    estimasi_serapan INT,
    jalur_masuk VARCHAR(50),
    catatan TEXT,
    dibuat_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    diperbarui_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_pengaruh_bahasa_lain_bahasa_id ON pengaruh_bahasa_lain(bahasa_id);
CREATE INDEX IF NOT EXISTS idx_pengaruh_bahasa_lain_asal ON pengaruh_bahasa_lain(bahasa_asal);
CREATE INDEX IF NOT EXISTS idx_pengaruh_bahasa_lain_jenis ON pengaruh_bahasa_lain(jenis_pengaruh);

CREATE OR REPLACE TRIGGER update_pengaruh_bahasa_lain_timestamp
    BEFORE UPDATE ON pengaruh_bahasa_lain
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 5. TABEL PENUTUR HISTORIS
-- Track jumlah penutur dari sensus-sensus lama
CREATE TABLE IF NOT EXISTS penutur_historis (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bahasa_id UUID NOT NULL REFERENCES bahasa(id) ON DELETE CASCADE,
    tahun_sensus INT NOT NULL,
    jumlah_penutur INT NOT NULL,
    metode_pencacahan VARCHAR(100),
    sumber_data VARCHAR(200),
    wilayah_cakupan TEXT,
    catatan TEXT,
    dibuat_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    diperbarui_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_penutur_historis_bahasa_id ON penutur_historis(bahasa_id);
CREATE INDEX IF NOT EXISTS idx_penutur_historis_tahun ON penutur_historis(tahun_sensus);

CREATE OR REPLACE TRIGGER update_penutur_historis_timestamp
    BEFORE UPDATE ON penutur_historis
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- 6. TABEL RIWAYAT NAMA
-- Track perubahan nama bahasa sepanjang sejarah
CREATE TABLE IF NOT EXISTS riwayat_nama (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bahasa_id UUID NOT NULL REFERENCES bahasa(id) ON DELETE CASCADE,
    nama_lama VARCHAR(200) NOT NULL,
    periode_digunakan VARCHAR(100),
    digunakan_oleh VARCHAR(200),
    aksara_asli VARCHAR(100),
    alasan_perubahan TEXT,
    catatan TEXT,
    dibuat_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    diperbarui_pada TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_riwayat_nama_bahasa_id ON riwayat_nama(bahasa_id);
CREATE INDEX IF NOT EXISTS idx_riwayat_nama_nama_lama ON riwayat_nama(nama_lama);

CREATE OR REPLACE TRIGGER update_riwayat_nama_timestamp
    BEFORE UPDATE ON riwayat_nama
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- ENABLE ROW LEVEL SECURITY (RLS)
-- ============================================
ALTER TABLE media_dokumen ENABLE ROW LEVEL SECURITY;
ALTER TABLE sumber_referensi ENABLE ROW LEVEL SECURITY;
ALTER TABLE peristiwa_sejarah ENABLE ROW LEVEL SECURITY;
ALTER TABLE pengaruh_bahasa_lain ENABLE ROW LEVEL SECURITY;
ALTER TABLE penutur_historis ENABLE ROW LEVEL SECURITY;
ALTER TABLE riwayat_nama ENABLE ROW LEVEL SECURITY;

-- Policy: Semua tabel bisa dibaca publik (read-only)
CREATE POLICY "Public can read media_dokumen" ON media_dokumen FOR SELECT USING (true);
CREATE POLICY "Public can read sumber_referensi" ON sumber_referensi FOR SELECT USING (true);
CREATE POLICY "Public can read peristiwa_sejarah" ON peristiwa_sejarah FOR SELECT USING (true);
CREATE POLICY "Public can read pengaruh_bahasa_lain" ON pengaruh_bahasa_lain FOR SELECT USING (true);
CREATE POLICY "Public can read penutur_historis" ON penutur_historis FOR SELECT USING (true);
CREATE POLICY "Public can read riwayat_nama" ON riwayat_nama FOR SELECT USING (true);

-- Policy: Service role bisa insert/update/delete
CREATE POLICY "Service role can insert media_dokumen" ON media_dokumen FOR INSERT WITH CHECK (true);
CREATE POLICY "Service role can insert sumber_referensi" ON sumber_referensi FOR INSERT WITH CHECK (true);
CREATE POLICY "Service role can insert peristiwa_sejarah" ON peristiwa_sejarah FOR INSERT WITH CHECK (true);
CREATE POLICY "Service role can insert pengaruh_bahasa_lain" ON pengaruh_bahasa_lain FOR INSERT WITH CHECK (true);
CREATE POLICY "Service role can insert penutur_historis" ON penutur_historis FOR INSERT WITH CHECK (true);
CREATE POLICY "Service role can insert riwayat_nama" ON riwayat_nama FOR INSERT WITH CHECK (true);

-- ============================================
-- SELESAI!
-- ============================================
-- Total: 6 tabel baru + 6 index + 6 trigger + 12 policy
-- Tabel total: 12 (8 existing + 6 baru - 2 overlap)
-- ============================================
