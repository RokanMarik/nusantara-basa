-- Verified Papua ISO Code Enrichment
-- Source: Wiktionary ISO 639-3 Codes for Melanesia
-- Date: 2026-01-07
-- Confidence: HIGH - Direct matches from authoritative source
-- Total mappings: 72

BEGIN;

UPDATE bahasa SET kode_iso_639 = 'asc' WHERE nama_bahasa = 'Asmat Bets Mbup' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'asc' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'cns' WHERE nama_bahasa = 'Asmat Safan' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'cns' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'asy' WHERE nama_bahasa = 'Asmat Sawa' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'asy' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'nks' WHERE nama_bahasa = 'Asmat Sirat' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nks' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Asmat Unir Sirau -> asy
-- SKIPPED (duplicate ISO): Asmat Waijens -> asy
UPDATE bahasa SET kode_iso_639 = 'yir' WHERE nama_bahasa = 'Awyu Anggai' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'yir' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'awu' WHERE nama_bahasa = 'Awyu Darat Kotiak' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'awu' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Awyu Darat Yagatsu-Kiki -> awu
UPDATE bahasa SET kode_iso_639 = 'psa' WHERE nama_bahasa = 'Awyu Laut' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'psa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'awe' WHERE nama_bahasa = 'Awyu Meto' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'awe' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'awv' WHERE nama_bahasa = 'Awyu Tokompatu' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'awv' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'dnt' WHERE nama_bahasa = 'Dani Atas' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'dnt' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'dni' WHERE nama_bahasa = 'Dani Bawah' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'dni' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Dani Tengah -> dnt
UPDATE bahasa SET kode_iso_639 = 'yac' WHERE nama_bahasa = 'Yali Anggruk' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'yac' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'kkl' WHERE nama_bahasa = 'Yali Kosarek' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kkl' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Yali Ninia -> kkl
-- SKIPPED (duplicate ISO): Yali Pass Valley -> yac
UPDATE bahasa SET kode_iso_639 = 'khe' WHERE nama_bahasa = 'Korowai Baigun' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'khe' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Korowai Karuwage -> khe
-- SKIPPED (duplicate ISO): Korowai Selatan -> khe
UPDATE bahasa SET kode_iso_639 = 'ekg' WHERE nama_bahasa = 'Mee Ugia' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ekg' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Mee Wosokuno -> ekg
UPDATE bahasa SET kode_iso_639 = 'mnz' WHERE nama_bahasa = 'Moni Bibida' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mnz' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Moni-Kegouda -> mnz
UPDATE bahasa SET kode_iso_639 = 'kts' WHERE nama_bahasa = 'Muyu' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kts' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Muyu Selatan -> kts
UPDATE bahasa SET kode_iso_639 = 'kcd' WHERE nama_bahasa = 'Kanum Barkari' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kcd' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'kxq' WHERE nama_bahasa = 'Smarki Kanum' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kxq' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'had' WHERE nama_bahasa = 'Hatam' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'had' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Hatam Mole -> had
UPDATE bahasa SET kode_iso_639 = 'mej' WHERE nama_bahasa = 'Meyah' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mej' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'xsu' WHERE nama_bahasa = 'Sougb' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'xsu' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msg' WHERE nama_bahasa = 'Moraid' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msg' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'akc' WHERE nama_bahasa = 'Mpur Pantai' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'akc' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'sbg' WHERE nama_bahasa = 'Seget' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sbg' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'kgr' WHERE nama_bahasa = 'Abun Gii' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kgr' AND b2.id != bahasa.id);
-- SKIPPED (duplicate ISO): Abun Ji -> kgr
UPDATE bahasa SET kode_iso_639 = 'tmu' WHERE nama_bahasa = 'Iau' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tmu' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'srl' WHERE nama_bahasa = 'Isirawa' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'srl' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'kbx' WHERE nama_bahasa = 'Kamberau' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kbx' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'zrs' WHERE nama_bahasa = 'Mairasi' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'zrs' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'set' WHERE nama_bahasa = 'Sentani' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'set' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'tfo' WHERE nama_bahasa = 'Tefaro' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tfo' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'twe' WHERE nama_bahasa = 'Towe' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'twe' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'wor' WHERE nama_bahasa = 'Woria' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'wor' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'jel' WHERE nama_bahasa = 'Yelmek' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'jel' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mrf' WHERE nama_bahasa = 'Elseng' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mrf' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'ury' WHERE nama_bahasa = 'Orya' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ury' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'dbe' WHERE nama_bahasa = 'Dabe' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'dbe' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'auu' WHERE nama_bahasa = 'Auye' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'auu' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'asi' WHERE nama_bahasa = 'Buruwai' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'asi' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'dem' WHERE nama_bahasa = 'Dem' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'dem' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'kzv' WHERE nama_bahasa = 'Komyandaret' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kzv' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'kpa' WHERE nama_bahasa = 'Kopkaka' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kpa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'lpe' WHERE nama_bahasa = 'Lepki' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'lpe' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'lio' WHERE nama_bahasa = 'Liki' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'lio' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'jet' WHERE nama_bahasa = 'Manem' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'jet' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mok' WHERE nama_bahasa = 'Marori' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mok' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mqf' WHERE nama_bahasa = 'Momuna' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mqf' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'pou' WHERE nama_bahasa = 'Molof' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'pou' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'nqm' WHERE nama_bahasa = 'Ndom' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nqm' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bhw' WHERE nama_bahasa = 'Numfor' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bhw' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'orm' WHERE nama_bahasa = 'Ormu' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'orm' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'ran' WHERE nama_bahasa = 'Riantana' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ran' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'swt' WHERE nama_bahasa = 'Saweru' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'swt' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'skv' WHERE nama_bahasa = 'Skou' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'skv' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'tni' WHERE nama_bahasa = 'Tandia' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tni' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'wod' WHERE nama_bahasa = 'Wolani' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'wod' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'yet' WHERE nama_bahasa = 'Yetfa' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'yet' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'yki' WHERE nama_bahasa = 'Yoke' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'yki' AND b2.id != bahasa.id);

COMMIT;

-- Verification query
SELECT COUNT(*) as updated_count FROM bahasa WHERE kode_iso_639 IS NOT NULL AND provinsi IN ('Papua', 'Papua Barat');
