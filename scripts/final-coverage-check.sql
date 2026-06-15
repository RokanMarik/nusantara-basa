-- Final coverage check setelah enrichment sprint
SELECT 
  COUNT(*) as total_bahasa,
  
  -- Vitalitas & EGIDS
  COUNT(status_vitalitas) as dengan_vitalitas,
  COUNT(egids_level) as dengan_egids,
  ROUND(COUNT(status_vitalitas) * 100.0 / COUNT(*), 1) as pct_vitalitas,
  ROUND(COUNT(egids_level) * 100.0 / COUNT(*), 1) as pct_egids,
  
  -- Geografis
  COUNT(wilayah) as dengan_wilayah,
  COUNT(provinsi) as dengan_provinsi,
  COUNT(koordinat_pusat) as dengan_koordinat,
  ROUND(COUNT(wilayah) * 100.0 / COUNT(*), 1) as pct_wilayah,
  ROUND(COUNT(provinsi) * 100.0 / COUNT(*), 1) as pct_provinsi,
  ROUND(COUNT(koordinat_pusat) * 100.0 / COUNT(*), 1) as pct_koordinat,
  
  -- Penutur & ISO
  COUNT(jumlah_penutur) as dengan_penutur,
  COUNT(kode_iso_639) as dengan_iso,
  ROUND(COUNT(jumlah_penutur) * 100.0 / COUNT(*), 1) as pct_penutur,
  ROUND(COUNT(kode_iso_639) * 100.0 / COUNT(*), 1) as pct_iso
  
FROM bahasa;
