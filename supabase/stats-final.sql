SELECT 
  'Total Bahasa' as tabel, COUNT(*) as jumlah FROM bahasa
UNION ALL SELECT 'Total Kosakata', COUNT(*) FROM kosakata
UNION ALL SELECT 'Bahasa dengan Summary', COUNT(*) FROM bahasa WHERE auto_summary IS NOT NULL AND auto_summary != ''
UNION ALL SELECT 'Bahasa dengan Fitur Linguistik', COUNT(DISTINCT b.id) FROM bahasa b JOIN fitur_linguistik f ON b.id = f.bahasa_id
UNION ALL SELECT 'Bahasa dengan Kosakata', COUNT(DISTINCT b.id) FROM bahasa b JOIN kosakata k ON b.id = k.bahasa_id
UNION ALL SELECT 'Bahasa dengan Peristiwa Sejarah', COUNT(DISTINCT b.id) FROM bahasa b JOIN peristiwa_sejarah p ON b.id = p.bahasa_id
UNION ALL SELECT 'Bahasa dengan Pengaruh Bahasa', COUNT(DISTINCT b.id) FROM bahasa b JOIN pengaruh_bahasa_lain pl ON b.id = pl.bahasa_id
UNION ALL SELECT 'Bahasa dengan Penutur Historis', COUNT(DISTINCT b.id) FROM bahasa b JOIN penutur_historis ph ON b.id = ph.bahasa_id
UNION ALL SELECT 'Total Peristiwa Sejarah', COUNT(*) FROM peristiwa_sejarah
UNION ALL SELECT 'Total Pengaruh Bahasa', COUNT(*) FROM pengaruh_bahasa_lain
UNION ALL SELECT 'Total Penutur Historis', COUNT(*) FROM penutur_historis
UNION ALL SELECT 'Total Riwayat Nama', COUNT(*) FROM riwayat_nama
ORDER BY tabel;
