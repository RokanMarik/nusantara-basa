-- Update Kabupaten/Kota Data
-- Parse detailed location info from catatan column

-- Update kabupaten from catatan (pattern: "Kabupaten X" or "Kota X")
UPDATE bahasa 
SET kabupaten = TRIM(
  REGEXP_REPLACE(
    CASE 
      WHEN catatan ~ 'Kabupaten [A-Za-z ]+' THEN
        REGEXP_REPLACE(catatan, '.*Kabupaten ([A-Za-z ]+).*', 'Kabupaten \1')
      WHEN catatan ~ 'Kota [A-Za-z ]+' THEN
        REGEXP_REPLACE(catatan, '.*Kota ([A-Za-z ]+).*', 'Kota \1')
      WHEN catatan ~ 'Kab\. [A-Za-z ]+' THEN
        REGEXP_REPLACE(catatan, '.*Kab\. ([A-Za-z ]+).*', 'Kabupaten \1')
      ELSE kabupaten
    END,
    ',.*$', ''
  )
)
WHERE catatan IS NOT NULL 
  AND kabupaten IS NULL
  AND (catatan ~ 'Kabupaten |Kota |Kab\. ');

-- Update specific kabupaten data based on known mappings
UPDATE bahasa SET kabupaten = 'Kabupaten Manokwari' WHERE nama_bahasa = 'Abun' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sarmi' WHERE nama_bahasa = 'Anus' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayapura' WHERE nama_bahasa = 'Awyu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Biak Numfor' WHERE nama_bahasa = 'Biak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mimika' WHERE nama_bahasa = 'Amungme' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Paniai' WHERE nama_bahasa = 'Ekari' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Merauke' WHERE nama_bahasa = 'Marind' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Moi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nabire' WHERE nama_bahasa = 'Moni' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayawijaya' WHERE nama_bahasa = 'Dani' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Puncak Jaya' WHERE nama_bahasa = 'Damal' AND kabupaten IS NULL;

-- Update major languages with their main kabupaten
UPDATE bahasa SET kabupaten = 'Kota Makassar' WHERE nama_bahasa = 'Makassar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Mataram' WHERE nama_bahasa = 'Sasak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tana Toraja' WHERE nama_bahasa = 'Toraja' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Karo' WHERE nama_bahasa = 'Batak Karo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Simalungun' WHERE nama_bahasa = 'Batak Simalungun' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Barito Selatan' WHERE nama_bahasa = 'Dayak Ngaju' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Polewali Mandar' WHERE nama_bahasa = 'Mandar' AND kabupaten IS NULL;

-- Update Javanese languages
UPDATE bahasa SET kabupaten = 'Kota Semarang' WHERE nama_bahasa = 'Jawa' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Bandung' WHERE nama_bahasa = 'Sunda' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Denpasar' WHERE nama_bahasa = 'Bali' AND kabupaten IS NULL;

-- Update Sumatran languages
UPDATE bahasa SET kabupaten = 'Kota Padang' WHERE nama_bahasa = 'Minangkabau' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Banda Aceh' WHERE nama_bahasa = 'Aceh' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lampung Utara' WHERE nama_bahasa = 'Lampung' AND kabupaten IS NULL;

-- Update Kalimantan languages
UPDATE bahasa SET kabupaten = 'Kota Pontianak' WHERE nama_bahasa = 'Dayak Iban' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Banjarmasin' WHERE nama_bahasa = 'Banjar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Palangkaraya' WHERE nama_bahasa = 'Dayak Maanyan' AND kabupaten IS NULL;

-- Update Sulawesi languages
UPDATE bahasa SET kabupaten = 'Kota Manado' WHERE nama_bahasa = 'Minahasa' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Gorontalo' WHERE nama_bahasa = 'Gorontalo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Kendari' WHERE nama_bahasa = 'Tolaki' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Palu' WHERE nama_bahasa = 'Kaili' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bugis' WHERE nama_bahasa = 'Bugis' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Toraja' WHERE nama_bahasa = 'Toraja' AND kabupaten IS NULL;

-- Update Maluku languages
UPDATE bahasa SET kabupaten = 'Kota Ambon' WHERE nama_bahasa = 'Ambon' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Maluku Tengah' WHERE nama_bahasa = 'Banda' AND kabupaten IS NULL;

-- Update Papua languages
UPDATE bahasa SET kabupaten = 'Kota Jayapura' WHERE nama_bahasa = 'Sentani' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Asmat' WHERE nama_bahasa = 'Asmat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Boven Digoel' WHERE nama_bahasa = 'Awyu' AND kabupaten IS NULL;

-- Verify results
SELECT 
  provinsi,
  kabupaten,
  COUNT(*) as jumlah
FROM bahasa 
WHERE kabupaten IS NOT NULL
GROUP BY provinsi, kabupaten
ORDER BY provinsi, jumlah DESC;
