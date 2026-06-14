-- Create Historical Module Tables
-- Migration date: 2025-06-14

-- Table: peristiwa_sejarah (historical events)
CREATE TABLE IF NOT EXISTS peristiwa_sejarah (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bahasa_id UUID REFERENCES bahasa(id) ON DELETE CASCADE,
  judul VARCHAR(255) NOT NULL,
  deskripsi TEXT,
  tahun INTEGER,
  jenis_peristiwa VARCHAR(100),
  lokasi VARCHAR(255),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table: pengaruh_bahasa_lain (language influences)
CREATE TABLE IF NOT EXISTS pengaruh_bahasa_lain (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bahasa_id UUID REFERENCES bahasa(id) ON DELETE CASCADE,
  bahasa_pemberi VARCHAR(100) NOT NULL,
  jenis_pengaruh VARCHAR(100),
  persentase NUMERIC(5,2),
  contoh_kata TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table: penutur_historis (historical speakers data)
CREATE TABLE IF NOT EXISTS penutur_historis (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bahasa_id UUID REFERENCES bahasa(id) ON DELETE CASCADE,
  tahun INTEGER NOT NULL,
  jumlah_penutur INTEGER,
  sumber_data VARCHAR(255),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table: riwayat_nama (name history)
CREATE TABLE IF NOT EXISTS riwayat_nama (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bahasa_id UUID REFERENCES bahasa(id) ON DELETE CASCADE,
  nama_lama VARCHAR(255) NOT NULL,
  tahun_perubahan INTEGER,
  alasan_perubahan TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_peristiwa_sejarah_bahasa_id ON peristiwa_sejarah(bahasa_id);
CREATE INDEX IF NOT EXISTS idx_pengaruh_bahasa_lain_bahasa_id ON pengaruh_bahasa_lain(bahasa_id);
CREATE INDEX IF NOT EXISTS idx_penutur_historis_bahasa_id ON penutur_historis(bahasa_id);
CREATE INDEX IF NOT EXISTS idx_riwayat_nama_bahasa_id ON riwayat_nama(bahasa_id);
