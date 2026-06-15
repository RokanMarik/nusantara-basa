import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";

type PengaruhKosakata = { kata: string; arti: string; periode: number };

interface KosakataRow {
  kata: string;
  arti_indonesia: string;
  fonetik_ipa: string | null;
}

interface PengaruhRow {
  bahasa_asal: string;
  periode_pengaruh: string | null;
  jenis_pengaruh: string | null;
  contoh_kosakata: string | unknown[] | null;
  estimasi_serapan: number | null;
  jalur_masuk: string | null;
}

export async function GET(
  _request: Request,
  { params }: { params: { id: string } }
) {
  const { data: bahasa, error } = await supabase
    .from("bahasa")
    .select(`
      *,
      rumpun_bahasa(nama_rumpun, sub_rumpun),
      lokasi(provinsi, kabupaten, tipe_wilayah),
      fitur_linguistik(sistem_tulisan, tipe_morfologi, urutan_kata, jumlah_vokal, jumlah_konsonan),
      kosakata(kata, arti_indonesia, fonetik_ipa),
      media_dokumen(tipe_media, url_file, deskripsi, tanggal_unggah, format, ukuran),
      sumber_referensi(nama_lembaga, jenis_sumber, tahun_terbit, url_doi, kredibilitas),
      peristiwa_sejarah(tahun_mulai, tahun_selesai, jenis_peristiwa, era_historis, dampak_pada_bahasa, wilayah_terdampak, sumber_sejarah),
      pengaruh_bahasa_lain(bahasa_asal, periode_pengaruh, jenis_pengaruh, contoh_kosakata, estimasi_serapan, jalur_masuk),
      penutur_historis(tahun_sensus, jumlah_penutur, metode_pencacahan, sumber_data),
      riwayat_nama(nama_lama, periode_digunakan, digunakan_oleh, aksara_asli, alasan_perubahan)
    `)
    .eq("id", params.id)
    .single();

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  if (!bahasa) return NextResponse.json({ error: "Bahasa not found" }, { status: 404 });
  const formatted = {
    id: bahasa.id,
    namaBahasa: bahasa.nama_bahasa,
    namaLokal: bahasa.nama_lokal,
    kodeIso639: bahasa.kode_iso_639,
    rumpunId: bahasa.rumpun_id,
    autoSummary: bahasa.auto_summary,
    jumlahPenutur: bahasa.jumlah_penutur,
    statusVitalitas: bahasa.status_vitalitas,
    egidsLevel: bahasa.egids_level,
    koordinatPusat: bahasa.koordinat_pusat,
    geojsonWilayah: bahasa.geojson_wilayah,
    catatan: bahasa.catatan,
    dibuatPada: bahasa.dibuat_pada,
    diperbaruiPada: bahasa.diperbarui_pada,

    // Core relations
    rumpun: bahasa.rumpun_bahasa,
    lokasi: bahasa.lokasi || [],
    fiturLinguistik: bahasa.fitur_linguistik,
    kosakata: (bahasa.kosakata as KosakataRow[] | null)?.map((k) => ({
      kata: k.kata,
      artiIndonesia: k.arti_indonesia,
      fonetikIpa: k.fonetik_ipa,
    })) ?? [],

    // Historical module
    mediaDokumen: bahasa.media_dokumen ?? [],
    sumberReferensi: bahasa.sumber_referensi ?? [],
    peristiwaSejarah: bahasa.peristiwa_sejarah ?? [],
    pengaruhBahasaLain: (bahasa.pengaruh_bahasa_lain as PengaruhRow[] | null)?.map((p) => ({
      bahasaAsal: p.bahasa_asal,
      periodePengaruh: p.periode_pengaruh,
      jenisPengaruh: p.jenis_pengaruh,
      contohKosakata: typeof p.contoh_kosakata === "string"
        ? JSON.parse(p.contoh_kosakata) as PengaruhKosakata[]
        : p.contoh_kosakata ?? [],
      estimasiSerapan: p.estimasi_serapan,
      jalurMasuk: p.jalur_masuk,
    })) ?? [],
    penuturHistoris: bahasa.penutur_historis ?? [],
    riwayatNama: bahasa.riwayat_nama ?? [],
  };

  return NextResponse.json(formatted);
}
