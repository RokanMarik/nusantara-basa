-- Cleanup invalid ISO 639-3 codes
-- Date: 2026-01-08
-- Source: ISO 639-3 Registry validation (SIL International)
-- Invalid codes: 49 (9.6% of 510 total)

-- First, count how many languages will be affected
SELECT COUNT(*) as affected_languages
FROM bahasa
WHERE kode_iso_639 IN (
  'arf', 'bke', 'cnn', 'dcn', 'dmp', 'dqm', 'drz', 'dwd', 'epu', 'gmk',
  'htl', 'idl', 'jkg', 'jli', 'kgm', 'khi', 'kox', 'kxg', 'lmm', 'lmt',
  'lyo', 'mld', 'mnt', 'nvt', 'ogn', 'plm', 'pou', 'pts', 'ptz', 'qte',
  'rbo', 'rgh', 'rht', 'rjb', 'rkr', 'rnt', 'rnu', 'skk', 'skl', 'smd',
  'snb', 'srj', 'tgg', 'tqc', 'ttx', 'udn', 'wko', 'wot', 'zdm'
);

-- Preview which languages will be affected
SELECT id, nama_bahasa, kode_iso_639, provinsi, jumlah_penutur
FROM bahasa
WHERE kode_iso_639 IN (
  'arf', 'bke', 'cnn', 'dcn', 'dmp', 'dqm', 'drz', 'dwd', 'epu', 'gmk',
  'htl', 'idl', 'jkg', 'jli', 'kgm', 'khi', 'kox', 'kxg', 'lmm', 'lmt',
  'lyo', 'mld', 'mnt', 'nvt', 'ogn', 'plm', 'pou', 'pts', 'ptz', 'qte',
  'rbo', 'rgh', 'rht', 'rjb', 'rkr', 'rnt', 'rnu', 'skk', 'skl', 'smd',
  'snb', 'srj', 'tgg', 'tqc', 'ttx', 'udn', 'wko', 'wot', 'zdm'
)
ORDER BY jumlah_penutur DESC;

-- Update: Set invalid ISO codes to NULL
UPDATE bahasa
SET kode_iso_639 = NULL,
    catatan = COALESCE(catatan, '') || ' [ISO code removed: not found in ISO 639-3 registry]'
WHERE kode_iso_639 IN (
  'arf', 'bke', 'cnn', 'dcn', 'dmp', 'dqm', 'drz', 'dwd', 'epu', 'gmk',
  'htl', 'idl', 'jkg', 'jli', 'kgm', 'khi', 'kox', 'kxg', 'lmm', 'lmt',
  'lyo', 'mld', 'mnt', 'nvt', 'ogn', 'plm', 'pou', 'pts', 'ptz', 'qte',
  'rbo', 'rgh', 'rht', 'rjb', 'rkr', 'rnt', 'rnu', 'skk', 'skl', 'smd',
  'snb', 'srj', 'tgg', 'tqc', 'ttx', 'udn', 'wko', 'wot', 'zdm'
);

-- Verify cleanup
SELECT COUNT(*) as remaining_invalid_codes
FROM bahasa
WHERE kode_iso_639 IN (
  'arf', 'bke', 'cnn', 'dcn', 'dmp', 'dqm', 'drz', 'dwd', 'epu', 'gmk',
  'htl', 'idl', 'jkg', 'jli', 'kgm', 'khi', 'kox', 'kxg', 'lmm', 'lmt',
  'lyo', 'mld', 'mnt', 'nvt', 'ogn', 'plm', 'pou', 'pts', 'ptz', 'qte',
  'rbo', 'rgh', 'rht', 'rjb', 'rkr', 'rnt', 'rnu', 'skk', 'skl', 'smd',
  'snb', 'srj', 'tgg', 'tqc', 'ttx', 'udn', 'wko', 'wot', 'zdm'
);

-- Final ISO code coverage
SELECT 
  COUNT(*) as total_languages,
  COUNT(kode_iso_639) as with_iso_codes,
  ROUND(COUNT(kode_iso_639)::NUMERIC / COUNT(*)::NUMERIC * 100, 1) as iso_coverage_percent
FROM bahasa;
