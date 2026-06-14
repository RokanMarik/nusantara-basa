-- Enrich unmatched vitality languages from Statistik Kebahasaan 2023
-- These 57 languages already have vitality status from the source

-- Rentan (indeks 0.61-0.80)
UPDATE bahasa SET status_vitalitas = 'Rentan', 
  catatan = COALESCE(catatan, '') || E'\nData dari Statistik Kebahasaan 2023: Indeks 0.61-0.80 (Rentan)'
WHERE nama_bahasa IN (
  'Walsa', 'Dajub', 'Tagalisa', 'Aframa', 'Gresi', 'Kuri', 'Meoswar', 'Senggi',
  'Somu', 'Modole', 'Marori', 'Seget', 'Hatam', 'Dra', 'Karas', 'Ngguntar',
  'Tehit', 'Arguni', 'Bku', 'Dubu', 'Irarutu', 'Kalabra', 'Mander', 'Namla',
  'Podena', 'Benggaulu', 'Mansim Borai', 'Mawes', 'Tandia', 'Lemolang',
  'Massenrengpulu', 'Ponosakan', 'Enggano', 'Saleman', 'Yalahatan', 'Nedebang',
  'Meher', 'Tenggalan', 'Bajau Tungkal Satu', 'Makleu', 'Samasuru', 'Berangas',
  'Saponi', 'Kaiely'
) AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- Aman (indeks 0.81-1.00)
UPDATE bahasa SET status_vitalitas = 'Aman',
  catatan = COALESCE(catatan, '') || E'\nData dari Statistik Kebahasaan 2023: Indeks 0.81-1.00 (Aman)'
WHERE nama_bahasa IN ('Sentani', 'Minahasa', 'Sangihe Talaud', 'Pedamaran')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- Mengalami Kemunduran (indeks 0.41-0.60)
UPDATE bahasa SET status_vitalitas = 'Mengalami Kemunduran',
  catatan = COALESCE(catatan, '') || E'\nData dari Statistik Kebahasaan 2023: Indeks 0.41-0.60 (Mengalami Kemunduran)'
WHERE nama_bahasa = 'Teon'
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- Check results
SELECT status_vitalitas, COUNT(*) as jumlah
FROM bahasa
WHERE catatan LIKE '%Statistik Kebahasaan 2023%'
GROUP BY status_vitalitas
ORDER BY jumlah DESC;
