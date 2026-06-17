import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";
export const dynamic = "force-dynamic";


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
      lokasi(provinsi, kabupaten, tipe_wilayah)
    `)
    .eq("id", params.id)
    .single();

  if (error) {
    console.error("Error fetching bahasa:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
  if (!bahasa) return NextResponse.json({ error: "Bahasa not found" }, { status: 404 });
  
  // Fetch related data separately to avoid join errors
  const { data: fiturLinguistik } = await supabase
    .from("fitur_linguistik")
    .select("sistem_tulisan, tipe_morfologi, urutan_kata, jumlah_vokal, jumlah_konsonan")
    .eq("bahasa_id", params.id)
    .maybeSingle();

  const { data: kosakata } = await supabase
    .from("kosakata")
    .select("kata, arti_indonesia, fonetik_ipa")
    .eq("bahasa_id", params.id)
    .limit(10);

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
    fiturLinguistik: fiturLinguistik,
    kosakata: (kosakata as KosakataRow[] | null)?.map((k) => ({
      kata: k.kata,
      artiIndonesia: k.arti_indonesia,
      fonetikIpa: k.fonetik_ipa,
    })) ?? [],

    // Empty arrays for now (can be fetched separately if needed)
    mediaDokumen: [],
    sumberReferensi: [],
    peristiwaSejarah: [],
    pengaruhBahasaLain: [],
    penuturHistoris: [],
    riwayatNama: [],
  };

  return NextResponse.json(formatted);
}
