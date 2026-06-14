-- Update ISO 639-3 Codes for Indonesian Languages (Simple Version)
-- Only updates rows where kode_iso_639 IS NULL
-- Skips if code already exists in database

-- ========== PAPUA LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'sne' WHERE nama_bahasa = 'Sentani' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'bhw' WHERE nama_bahasa = 'Biak' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'yap' WHERE nama_bahasa = 'Yapen' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'wru' WHERE nama_bahasa = 'Waropen' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'nab' WHERE nama_bahasa = 'Nabire' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'ekg' WHERE nama_bahasa = 'Ekari' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mnz' WHERE nama_bahasa = 'Moni' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mim' WHERE nama_bahasa = 'Mimika' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mrz' WHERE nama_bahasa = 'Marind' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'saw' WHERE nama_bahasa = 'Sawi' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'aag' WHERE nama_bahasa = 'Amungme' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'dam' WHERE nama_bahasa = 'Damal' AND kode_iso_639 IS NULL;

-- ========== MALUKU LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'abs' WHERE nama_bahasa = 'Ambon' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'tft' WHERE nama_bahasa = 'Ternate' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'tvo' WHERE nama_bahasa = 'Tidore' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'kvd' WHERE nama_bahasa = 'Buru' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'kei' WHERE nama_bahasa = 'Kei' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'arl' WHERE nama_bahasa = 'Aru' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'tnl' WHERE nama_bahasa = 'Tanimbar' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'srm' WHERE nama_bahasa = 'Seram' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'sua' WHERE nama_bahasa = 'Sula' AND kode_iso_639 IS NULL;

-- ========== SULAWESI LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'mak' WHERE nama_bahasa = 'Makassar' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'sda' WHERE nama_bahasa = 'Toraja' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mdr' WHERE nama_bahasa = 'Mandar' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mhl' WHERE nama_bahasa = 'Minahasa' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mog' WHERE nama_bahasa = 'Mongondow' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'gor' WHERE nama_bahasa = 'Gorontalo' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'tki' WHERE nama_bahasa = 'Tolaki' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'kzf' WHERE nama_bahasa = 'Kaili' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'pmf' WHERE nama_bahasa = 'Pamona' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mnb' WHERE nama_bahasa = 'Muna' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'bhn' WHERE nama_bahasa = 'Buton' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mhp' WHERE nama_bahasa = 'Massenrengpulu' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'bne' WHERE nama_bahasa = 'Bonerate' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mhs' WHERE nama_bahasa = 'Minahasa Tonsawang' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mhn' WHERE nama_bahasa = 'Minahasa Tonsea' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'sxh' WHERE nama_bahasa = 'Sangihe' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'tld' WHERE nama_bahasa = 'Talaud' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'tti' WHERE nama_bahasa = 'Toli-Toli' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'bln' WHERE nama_bahasa = 'Buol' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'bgz' WHERE nama_bahasa = 'Banggai' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mqj' WHERE nama_bahasa = 'Mamasa' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mqx' WHERE nama_bahasa = 'Mamuju' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mor' WHERE nama_bahasa = 'Morowali' AND kode_iso_639 IS NULL;

-- ========== NUSA TENGGARA LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'sas' WHERE nama_bahasa = 'Sasak' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'smw' WHERE nama_bahasa = 'Sumbawa' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'bhp' WHERE nama_bahasa = 'Bima' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mqy' WHERE nama_bahasa = 'Manggarai' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'nxg' WHERE nama_bahasa = 'Ngada' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'end' WHERE nama_bahasa = 'Ende' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'slp' WHERE nama_bahasa = 'Lamaholot' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'tet' WHERE nama_bahasa = 'Tetun' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'aom' WHERE nama_bahasa = 'Atoni' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'adn' WHERE nama_bahasa = 'Adang' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'alr' WHERE nama_bahasa = 'Alor' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'skx' WHERE nama_bahasa = 'Sikka' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'lio' WHERE nama_bahasa = 'Lio' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'nak' WHERE nama_bahasa = 'Nagekeo' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'rote' WHERE nama_bahasa = 'Rote' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'sbn' WHERE nama_bahasa = 'Sabu' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'kup' WHERE nama_bahasa = 'Kupang' AND kode_iso_639 IS NULL;

-- ========== KALIMANTAN LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'nij' WHERE nama_bahasa = 'Dayak Ngaju' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'iba' WHERE nama_bahasa = 'Dayak Iban' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mhy' WHERE nama_bahasa = 'Dayak Maanyan' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'ktj' WHERE nama_bahasa = 'Kutai' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'tid' WHERE nama_bahasa = 'Tidung' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'brr' WHERE nama_bahasa = 'Berau' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'psr' WHERE nama_bahasa = 'Paser' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'blk' WHERE nama_bahasa = 'Bulungan' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'nnn' WHERE nama_bahasa = 'Nunukan' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mli' WHERE nama_bahasa = 'Malinau' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mty' WHERE nama_bahasa = 'Mentaya' AND kode_iso_639 IS NULL;

-- ========== SUMATRA LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'ljp' WHERE nama_bahasa = 'Lampung' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'rej' WHERE nama_bahasa = 'Rejang' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'kvr' WHERE nama_bahasa = 'Kerinci' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mwv' WHERE nama_bahasa = 'Mentawai' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'nia' WHERE nama_bahasa = 'Nias' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'smr' WHERE nama_bahasa = 'Simeulue' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'gay' WHERE nama_bahasa = 'Gayo' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'kge' WHERE nama_bahasa = 'Komering' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'pse' WHERE nama_bahasa = 'Pidie' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'btm' WHERE nama_bahasa = 'Mandailing' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mui' WHERE nama_bahasa = 'Melayu Palembang' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'jax' WHERE nama_bahasa = 'Melayu Jambi' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'mly' WHERE nama_bahasa = 'Melayu Bangka' AND kode_iso_639 IS NULL;
UPDATE bahasa SET kode_iso_639 = 'bew' WHERE nama_bahasa = 'Betawi' AND kode_iso_639 IS NULL;

-- Verify results
SELECT COUNT(*) as total_bahasa, COUNT(kode_iso_639) as dengan_iso, COUNT(*) - COUNT(kode_iso_639) as tanpa_iso FROM bahasa;
