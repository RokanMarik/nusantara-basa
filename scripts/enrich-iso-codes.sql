-- Update ISO 639-3 codes for Indonesian languages
-- Generated on 2026-06-15
-- Source: Ethnologue, Glottolog, ISO 639-3 registry
-- Total updates: 87

UPDATE bahasa SET kode_iso_639 = 'jav' WHERE nama_bahasa = 'Jawa' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'jav' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'sun' WHERE nama_bahasa = 'Sunda' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sun' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mad' WHERE nama_bahasa = 'Madura' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mad' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'min' WHERE nama_bahasa = 'Minangkabau' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'min' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bug' WHERE nama_bahasa = 'Bugis' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bug' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'ace' WHERE nama_bahasa = 'Aceh' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ace' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bjn' WHERE nama_bahasa = 'Banjar' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bjn' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'ban' WHERE nama_bahasa = 'Bali' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ban' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'sas' WHERE nama_bahasa = 'Sasak' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sas' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mak' WHERE nama_bahasa = 'Makassar' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mak' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bbc' WHERE nama_bahasa = 'Batak Toba' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bbc' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'btx' WHERE nama_bahasa = 'Batak Karo' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'btx' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bts' WHERE nama_bahasa = 'Batak Simalungun' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bts' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'btm' WHERE nama_bahasa = 'Batak Mandailing' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'btm' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'akb' WHERE nama_bahasa = 'Batak Angkola' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'akb' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bpd' WHERE nama_bahasa = 'Batak Pakpak' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bpd' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'lja' WHERE nama_bahasa = 'Lampung' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'lja' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'rej' WHERE nama_bahasa = 'Rejang' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'rej' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'gor' WHERE nama_bahasa = 'Gorontalo' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'gor' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'xmm' WHERE nama_bahasa = 'Manado' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'xmm' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'abs' WHERE nama_bahasa = 'Ambon' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'abs' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'tpi' WHERE nama_bahasa = 'Papua' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tpi' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'nij' WHERE nama_bahasa = 'Dayak Ngaju' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nij' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mhy' WHERE nama_bahasa = 'Dayak Maanyan' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mhy' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'sda' WHERE nama_bahasa = 'Toraja Sa''dan' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sda' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mqj' WHERE nama_bahasa = 'Toraja Mamasa' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mqj' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mdr' WHERE nama_bahasa = 'Mandar' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mdr' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bug' WHERE nama_bahasa = 'Bugis Sinjai' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bug' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msa' WHERE nama_bahasa = 'Melayu Riau' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msa' WHERE nama_bahasa = 'Melayu Jambi' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msa' WHERE nama_bahasa = 'Melayu Palembang' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msa' WHERE nama_bahasa = 'Melayu Pontianak' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msa' WHERE nama_bahasa = 'Melayu Sambas' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msa' WHERE nama_bahasa = 'Melayu Bangka' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msa' WHERE nama_bahasa = 'Melayu Belitung' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msa' WHERE nama_bahasa = 'Melayu Bengkulu' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'abz' WHERE nama_bahasa = 'Abui' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'abz' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'adr' WHERE nama_bahasa = 'Adonara' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'adr' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'aol' WHERE nama_bahasa = 'Alor' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'aol' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'aol' WHERE nama_bahasa = 'Alorese' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'aol' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'aaz' WHERE nama_bahasa = 'Amarasi' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'aaz' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'amk' WHERE nama_bahasa = 'Ambai' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'amk' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'and' WHERE nama_bahasa = 'Ansus' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'and' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'tml' WHERE nama_bahasa = 'Asmat' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tml' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bvz' WHERE nama_bahasa = 'Bauzi' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bvz' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bhw' WHERE nama_bahasa = 'Biak' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bhw' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mhs' WHERE nama_bahasa = 'Buru' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mhs' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'txt' WHERE nama_bahasa = 'Citak' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'txt' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'dnr' WHERE nama_bahasa = 'Dani' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'dnr' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'ekg' WHERE nama_bahasa = 'Ekari' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ekg' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'gbi' WHERE nama_bahasa = 'Galela' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'gbi' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'had' WHERE nama_bahasa = 'Hatam' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'had' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'ihp' WHERE nama_bahasa = 'Iha' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ihp' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'kgx' WHERE nama_bahasa = 'Kamoro' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kgx' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'khe' WHERE nama_bahasa = 'Korowai' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'khe' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mej' WHERE nama_bahasa = 'Meyah' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mej' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mnz' WHERE nama_bahasa = 'Moni' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mnz' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mtj' WHERE nama_bahasa = 'Moskona' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mtj' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'nap' WHERE nama_bahasa = 'Napu' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nap' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'szp' WHERE nama_bahasa = 'Ngalum' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'szp' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'set' WHERE nama_bahasa = 'Sentani' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'set' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'tlb' WHERE nama_bahasa = 'Tobelo' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tlb' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'wms' WHERE nama_bahasa = 'Wambon' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'wms' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'yac' WHERE nama_bahasa = 'Yali' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'yac' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'yap' WHERE nama_bahasa = 'Yapen' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'yap' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'ind' WHERE nama_bahasa = 'Bahasa Indonesia' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ind' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'sun' WHERE nama_bahasa = 'Basa Sunda' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sun' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'jav' WHERE nama_bahasa = 'Basa Jawa' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'jav' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'msa' WHERE nama_bahasa = 'Bahasa Melayu' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'msa' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mad' WHERE nama_bahasa = 'Bahasa Madura' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mad' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'min' WHERE nama_bahasa = 'Bahasa Minangkabau' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'min' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bug' WHERE nama_bahasa = 'Bahasa Bugis' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bug' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'ace' WHERE nama_bahasa = 'Bahasa Aceh' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ace' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bjn' WHERE nama_bahasa = 'Bahasa Banjar' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bjn' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'ban' WHERE nama_bahasa = 'Bahasa Bali' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ban' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'sas' WHERE nama_bahasa = 'Bahasa Sasak' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sas' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mak' WHERE nama_bahasa = 'Bahasa Makassar' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mak' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'bbc' WHERE nama_bahasa = 'Bahasa Batak' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bbc' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'lja' WHERE nama_bahasa = 'Bahasa Lampung' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'lja' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'rej' WHERE nama_bahasa = 'Bahasa Rejang' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'rej' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'gor' WHERE nama_bahasa = 'Bahasa Gorontalo' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'gor' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'xmm' WHERE nama_bahasa = 'Bahasa Manado' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'xmm' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'abs' WHERE nama_bahasa = 'Bahasa Ambon' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'abs' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'tpi' WHERE nama_bahasa = 'Bahasa Papua' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tpi' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'nij' WHERE nama_bahasa = 'Bahasa Dayak' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nij' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'sda' WHERE nama_bahasa = 'Bahasa Toraja' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sda' AND b2.id != bahasa.id);
UPDATE bahasa SET kode_iso_639 = 'mdr' WHERE nama_bahasa = 'Bahasa Mandar' AND (kode_iso_639 IS NULL OR kode_iso_639 = '') AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mdr' AND b2.id != bahasa.id);

-- Verification: Check ISO coverage
SELECT 
  COUNT(*) as total,
  COUNT(kode_iso_639) as with_iso,
  ROUND(COUNT(kode_iso_639) * 100.0 / COUNT(*), 1) as coverage_pct
FROM bahasa;
