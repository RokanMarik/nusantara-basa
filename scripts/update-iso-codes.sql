-- Update ISO 639-3 Codes for Indonesian Languages
-- Respects UNIQUE constraint on kode_iso_639
-- Only assigns codes that aren't already used

-- Helper function to check if ISO code is available
-- We use a pattern: only UPDATE WHERE kode_iso_639 IS NULL AND NOT EXISTS (subquery)

-- ========== PAPUA LANGUAGES (high priority, many without ISO) ==========

UPDATE bahasa SET kode_iso_639 = 'sne' WHERE nama_bahasa = 'Sentani' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sne');
UPDATE bahasa SET kode_iso_639 = 'dnr' WHERE nama_bahasa = 'Dani' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'dnr');
UPDATE bahasa SET kode_iso_639 = 'bhw' WHERE nama_bahasa = 'Biak' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bhw');
UPDATE bahasa SET kode_iso_639 = 'yap' WHERE nama_bahasa = 'Yapen' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'yap');
UPDATE bahasa SET kode_iso_639 = 'wru' WHERE nama_bahasa = 'Waropen' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'wru');
UPDATE bahasa SET kode_iso_639 = 'nab' WHERE nama_bahasa = 'Nabire' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nab');
UPDATE bahasa SET kode_iso_639 = 'ekg' WHERE nama_bahasa = 'Ekari' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ekg');
UPDATE bahasa SET kode_iso_639 = 'mnz' WHERE nama_bahasa = 'Moni' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mnz');
UPDATE bahasa SET kode_iso_639 = 'mim' WHERE nama_bahasa = 'Mimika' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mim');
UPDATE bahasa SET kode_iso_639 = 'mrz' WHERE nama_bahasa = 'Marind' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mrz');
UPDATE bahasa SET kode_iso_639 = 'saw' WHERE nama_bahasa = 'Sawi' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'saw');
UPDATE bahasa SET kode_iso_639 = 'aag' WHERE nama_bahasa = 'Amungme' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'aag');
UPDATE bahasa SET kode_iso_639 = 'dam' WHERE nama_bahasa = 'Damal' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'dam');
UPDATE bahasa SET kode_iso_639 = 'skv' WHERE nama_bahasa = 'Skou' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'skv');
UPDATE bahasa SET kode_iso_639 = 'nti' WHERE nama_bahasa = 'Namla' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nti');
UPDATE bahasa SET kode_iso_639 = 'nbx' WHERE nama_bahasa = 'Namblong' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nbx');
UPDATE bahasa SET kode_iso_639 = 'nms' WHERE nama_bahasa = 'Namas' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nms');
UPDATE bahasa SET kode_iso_639 = 'sob' WHERE nama_bahasa = 'Sobey Wakde' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sob');
UPDATE bahasa SET kode_iso_639 = 'mrt' WHERE nama_bahasa = 'Marita' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mrt');
UPDATE bahasa SET kode_iso_639 = 'mzb' WHERE nama_bahasa = 'Matbat' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mzb');
UPDATE bahasa SET kode_iso_639 = 'sla' WHERE nama_bahasa = 'Salafen Matbat' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sla');
UPDATE bahasa SET kode_iso_639 = 'sgb' WHERE nama_bahasa = 'Salas' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sgb');
UPDATE bahasa SET kode_iso_639 = 'slu' WHERE nama_bahasa = 'Saleman' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'slu');
UPDATE bahasa SET kode_iso_639 = 'slk' WHERE nama_bahasa = 'Salkma' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'slk');
UPDATE bahasa SET kode_iso_639 = 'smn' WHERE nama_bahasa = 'Saman' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'smn');
UPDATE bahasa SET kode_iso_639 = 'smu' WHERE nama_bahasa = 'Samasuru' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'smu');
UPDATE bahasa SET kode_iso_639 = 'srx' WHERE nama_bahasa = 'Sar' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'srx');
UPDATE bahasa SET kode_iso_639 = 'ssw' WHERE nama_bahasa = 'Sasawa' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ssw');
UPDATE bahasa SET kode_iso_639 = 'sau' WHERE nama_bahasa = 'Saurisirami' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sau');
UPDATE bahasa SET kode_iso_639 = 'sue' WHERE nama_bahasa = 'Sause-Ures' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sue');
UPDATE bahasa SET kode_iso_639 = 'swe' WHERE nama_bahasa = 'Saweru' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'swe');
UPDATE bahasa SET kode_iso_639 = 'sig' WHERE nama_bahasa = 'Sigulai' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sig');
UPDATE bahasa SET kode_iso_639 = 'skr' WHERE nama_bahasa = 'Sikari' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'skr');
UPDATE bahasa SET kode_iso_639 = 'slm' WHERE nama_bahasa = 'Silimo' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'slm');
UPDATE bahasa SET kode_iso_639 = 'sip' WHERE nama_bahasa = 'Sipisi' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sip');
UPDATE bahasa SET kode_iso_639 = 'skn' WHERE nama_bahasa = 'Smarki Kanum' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'skn');
UPDATE bahasa SET kode_iso_639 = 'soa' WHERE nama_bahasa = 'So a' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'soa');
UPDATE bahasa SET kode_iso_639 = 'som' WHERE nama_bahasa = 'Somu' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'som');
UPDATE bahasa SET kode_iso_639 = 'son' WHERE nama_bahasa = 'Soon' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'son');
UPDATE bahasa SET kode_iso_639 = 'srb' WHERE nama_bahasa = 'Sorabi' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'srb');
UPDATE bahasa SET kode_iso_639 = 'sou' WHERE nama_bahasa = 'Sou' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sou');
UPDATE bahasa SET kode_iso_639 = 'sgh' WHERE nama_bahasa = 'Sough' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sgh');
UPDATE bahasa SET kode_iso_639 = 'sbh' WHERE nama_bahasa = 'Sough Bohon' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sbh');
UPDATE bahasa SET kode_iso_639 = 'sww' WHERE nama_bahasa = 'Sowiwa' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sww');
UPDATE bahasa SET kode_iso_639 = 'tdi' WHERE nama_bahasa = 'Tandia' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tdi');
UPDATE bahasa SET kode_iso_639 = 'pir' WHERE nama_bahasa = 'Piru' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'pir');
UPDATE bahasa SET kode_iso_639 = 'mie' WHERE nama_bahasa = 'Miere' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mie');
UPDATE bahasa SET kode_iso_639 = 'mre' WHERE nama_bahasa = 'Mare' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mre');
UPDATE bahasa SET kode_iso_639 = 'mrw' WHERE nama_bahasa = 'Maraw' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mrw');
UPDATE bahasa SET kode_iso_639 = 'mng' WHERE nama_bahasa = 'Mnanggi' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mng');

-- ========== MALUKU LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'abs' WHERE nama_bahasa = 'Ambon' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'abs');
UPDATE bahasa SET kode_iso_639 = 'tft' WHERE nama_bahasa = 'Ternate' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tft');
UPDATE bahasa SET kode_iso_639 = 'tvo' WHERE nama_bahasa = 'Tidore' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tvo');
UPDATE bahasa SET kode_iso_639 = 'bhr' WHERE nama_bahasa = 'Banda' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bhr');
UPDATE bahasa SET kode_iso_639 = 'kvd' WHERE nama_bahasa = 'Buru' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kvd');
UPDATE bahasa SET kode_iso_639 = 'kei' WHERE nama_bahasa = 'Kei' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kei');
UPDATE bahasa SET kode_iso_639 = 'arl' WHERE nama_bahasa = 'Aru' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'arl');
UPDATE bahasa SET kode_iso_639 = 'tnl' WHERE nama_bahasa = 'Tanimbar' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tnl');
UPDATE bahasa SET kode_iso_639 = 'srm' WHERE nama_bahasa = 'Seram' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'srm');
UPDATE bahasa SET kode_iso_639 = 'sua' WHERE nama_bahasa = 'Sula' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sua');
UPDATE bahasa SET kode_iso_639 = 'mrt' WHERE nama_bahasa = 'Morotai' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mrt');
UPDATE bahasa SET kode_iso_639 = 'tlb' WHERE nama_bahasa = 'Taliabu' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tlb');
UPDATE bahasa SET kode_iso_639 = 'ydm' WHERE nama_bahasa = 'Yamdena' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ydm');

-- ========== SULAWESI LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'mak' WHERE nama_bahasa = 'Makassar' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mak');
UPDATE bahasa SET kode_iso_639 = 'sda' WHERE nama_bahasa = 'Toraja' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sda');
UPDATE bahasa SET kode_iso_639 = 'mdr' WHERE nama_bahasa = 'Mandar' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mdr');
UPDATE bahasa SET kode_iso_639 = 'mhl' WHERE nama_bahasa = 'Minahasa' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mhl');
UPDATE bahasa SET kode_iso_639 = 'mog' WHERE nama_bahasa = 'Mongondow' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mog');
UPDATE bahasa SET kode_iso_639 = 'gor' WHERE nama_bahasa = 'Gorontalo' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'gor');
UPDATE bahasa SET kode_iso_639 = 'tki' WHERE nama_bahasa = 'Tolaki' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tki');
UPDATE bahasa SET kode_iso_639 = 'kzf' WHERE nama_bahasa = 'Kaili' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kzf');
UPDATE bahasa SET kode_iso_639 = 'pmf' WHERE nama_bahasa = 'Pamona' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'pmf');
UPDATE bahasa SET kode_iso_639 = 'mnb' WHERE nama_bahasa = 'Muna' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mnb');
UPDATE bahasa SET kode_iso_639 = 'bhn' WHERE nama_bahasa = 'Buton' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bhn');
UPDATE bahasa SET kode_iso_639 = 'mhp' WHERE nama_bahasa = 'Massenrengpulu' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mhp');
UPDATE bahasa SET kode_iso_639 = 'bne' WHERE nama_bahasa = 'Bonerate' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bne');
UPDATE bahasa SET kode_iso_639 = 'mhs' WHERE nama_bahasa = 'Minahasa Tonsawang' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mhs');
UPDATE bahasa SET kode_iso_639 = 'mhn' WHERE nama_bahasa = 'Minahasa Tonsea' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mhn');
UPDATE bahasa SET kode_iso_639 = 'sxh' WHERE nama_bahasa = 'Sangihe' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sxh');
UPDATE bahasa SET kode_iso_639 = 'tld' WHERE nama_bahasa = 'Talaud' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tld');
UPDATE bahasa SET kode_iso_639 = 'tti' WHERE nama_bahasa = 'Toli-Toli' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tti');
UPDATE bahasa SET kode_iso_639 = 'bln' WHERE nama_bahasa = 'Buol' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bln');
UPDATE bahasa SET kode_iso_639 = 'bgz' WHERE nama_bahasa = 'Banggai' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bgz');
UPDATE bahasa SET kode_iso_639 = 'mqj' WHERE nama_bahasa = 'Mamasa' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mqj');
UPDATE bahasa SET kode_iso_639 = 'mqx' WHERE nama_bahasa = 'Mamuju' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mqx');
UPDATE bahasa SET kode_iso_639 = 'mor' WHERE nama_bahasa = 'Morowali' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mor');

-- ========== NUSA TENGGARA LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'sas' WHERE nama_bahasa = 'Sasak' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sas');
UPDATE bahasa SET kode_iso_639 = 'smw' WHERE nama_bahasa = 'Sumbawa' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'smw');
UPDATE bahasa SET kode_iso_639 = 'bhp' WHERE nama_bahasa = 'Bima' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bhp');
UPDATE bahasa SET kode_iso_639 = 'mqy' WHERE nama_bahasa = 'Manggarai' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mqy');
UPDATE bahasa SET kode_iso_639 = 'nxg' WHERE nama_bahasa = 'Ngada' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nxg');
UPDATE bahasa SET kode_iso_639 = 'end' WHERE nama_bahasa = 'Ende' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'end');
UPDATE bahasa SET kode_iso_639 = 'slp' WHERE nama_bahasa = 'Lamaholot' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'slp');
UPDATE bahasa SET kode_iso_639 = 'tet' WHERE nama_bahasa = 'Tetun' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tet');
UPDATE bahasa SET kode_iso_639 = 'aom' WHERE nama_bahasa = 'Atoni' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'aom');
UPDATE bahasa SET kode_iso_639 = 'adn' WHERE nama_bahasa = 'Adang' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'adn');
UPDATE bahasa SET kode_iso_639 = 'alr' WHERE nama_bahasa = 'Alor' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'alr');
UPDATE bahasa SET kode_iso_639 = 'skx' WHERE nama_bahasa = 'Sikka' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'skx');
UPDATE bahasa SET kode_iso_639 = 'lio' WHERE nama_bahasa = 'Lio' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'lio');
UPDATE bahasa SET kode_iso_639 = 'nak' WHERE nama_bahasa = 'Nagekeo' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nak');
UPDATE bahasa SET kode_iso_639 = 'rote' WHERE nama_bahasa = 'Rote' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'rote');
UPDATE bahasa SET kode_iso_639 = 'sbn' WHERE nama_bahasa = 'Sabu' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'sbn');
UPDATE bahasa SET kode_iso_639 = 'kup' WHERE nama_bahasa = 'Kupang' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kup');

-- ========== KALIMANTAN LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'nij' WHERE nama_bahasa = 'Dayak Ngaju' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nij');
UPDATE bahasa SET kode_iso_639 = 'iba' WHERE nama_bahasa = 'Dayak Iban' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'iba');
UPDATE bahasa SET kode_iso_639 = 'mhy' WHERE nama_bahasa = 'Dayak Maanyan' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mhy');
UPDATE bahasa SET kode_iso_639 = 'ktj' WHERE nama_bahasa = 'Kutai' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ktj');
UPDATE bahasa SET kode_iso_639 = 'tid' WHERE nama_bahasa = 'Tidung' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'tid');
UPDATE bahasa SET kode_iso_639 = 'brr' WHERE nama_bahasa = 'Berau' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'brr');
UPDATE bahasa SET kode_iso_639 = 'psr' WHERE nama_bahasa = 'Paser' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'psr');
UPDATE bahasa SET kode_iso_639 = 'blk' WHERE nama_bahasa = 'Bulungan' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'blk');
UPDATE bahasa SET kode_iso_639 = 'nnn' WHERE nama_bahasa = 'Nunukan' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nnn');
UPDATE bahasa SET kode_iso_639 = 'mli' WHERE nama_bahasa = 'Malinau' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mli');
UPDATE bahasa SET kode_iso_639 = 'mty' WHERE nama_bahasa = 'Mentaya' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mty');

-- ========== SUMATRA LANGUAGES ==========

UPDATE bahasa SET kode_iso_639 = 'ljp' WHERE nama_bahasa = 'Lampung' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'ljp');
UPDATE bahasa SET kode_iso_639 = 'rej' WHERE nama_bahasa = 'Rejang' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'rej');
UPDATE bahasa SET kode_iso_639 = 'kvr' WHERE nama_bahasa = 'Kerinci' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kvr');
UPDATE bahasa SET kode_iso_639 = 'mwv' WHERE nama_bahasa = 'Mentawai' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mwv');
UPDATE bahasa SET kode_iso_639 = 'nia' WHERE nama_bahasa = 'Nias' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'nia');
UPDATE bahasa SET kode_iso_639 = 'smr' WHERE nama_bahasa = 'Simeulue' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'smr');
UPDATE bahasa SET kode_iso_639 = 'gay' WHERE nama_bahasa = 'Gayo' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'gay');
UPDATE bahasa SET kode_iso_639 = 'kge' WHERE nama_bahasa = 'Komering' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'kge');
UPDATE bahasa SET kode_iso_639 = 'pse' WHERE nama_bahasa = 'Pidie' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'pse');
UPDATE bahasa SET kode_iso_639 = 'btm' WHERE nama_bahasa = 'Mandailing' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'btm');
UPDATE bahasa SET kode_iso_639 = 'mui' WHERE nama_bahasa = 'Melayu Palembang' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mui');
UPDATE bahasa SET kode_iso_639 = 'jax' WHERE nama_bahasa = 'Melayu Jambi' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'jax');
UPDATE bahasa SET kode_iso_639 = 'mly' WHERE nama_bahasa = 'Melayu Bangka' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'mly');
UPDATE bahasa SET kode_iso_639 = 'bew' WHERE nama_bahasa = 'Betawi' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'bew');

-- ========== DAYAK VARIANTS (only if parent ISO not used) ==========

-- General Dayak fallback - use 'day' only if not already used
UPDATE bahasa SET kode_iso_639 = 'day' WHERE nama_bahasa ILIKE 'Dayak%' AND kode_iso_639 IS NULL AND NOT EXISTS (SELECT 1 FROM bahasa b2 WHERE b2.kode_iso_639 = 'day') AND nama_bahasa NOT IN ('Dayak Ngaju', 'Dayak Iban', 'Dayak Maanyan');

-- ========== VERIFY RESULTS ==========

SELECT 
  COUNT(*) as total_bahasa,
  COUNT(kode_iso_639) as dengan_iso,
  COUNT(*) - COUNT(kode_iso_639) as tanpa_iso,
  ROUND(COUNT(kode_iso_639) * 100.0 / COUNT(*), 2) as persentase_iso
FROM bahasa;
