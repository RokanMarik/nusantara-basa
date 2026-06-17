import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";
export const dynamic = "force-dynamic";


export async function GET(request: Request) {
  const searchParams = new URL(request.url).searchParams;
  const bahasaId = searchParams.get("bahasa_id");
  const jenisPeristiwa = searchParams.get("jenis_peristiwa");
  const eraHistoris = searchParams.get("era_historis");
  const limit = parseInt(searchParams.get("limit") ?? "100");
  const offset = parseInt(searchParams.get("offset") ?? "0");

  let query = supabase
    .from("peristiwa_sejarah")
    .select(`
      *,
      bahasa(nama_bahasa, kode_iso_639)
    `)
    .order("tahun_mulai", { ascending: false })
    .range(offset, offset + limit - 1);

  if (bahasaId) query = query.eq("bahasa_id", bahasaId);
  if (jenisPeristiwa) query = query.eq("jenis_peristiwa", jenisPeristiwa);
  if (eraHistoris) query = query.eq("era_historis", eraHistoris);

  const { data, error } = await query;

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  type PeristiwaOutput = {
    id: string;
    tahunMulai: number | null;
    tahunSelesai: number | null;
    jenisPeristiwa: string;
    eraHistoris: string | null;
    dampakPadaBahasa: string | null;
    wilayahTerdampak: string | null;
    sumberSejarah: string | null;
    bahasaNama: string | null;
    bahasaKode: string | null;
  };

  const formatted = (data ?? []).map((e: unknown) => ({
    id: (e as { id: string }).id,
    tahunMulai: (e as { tahun_mulai: number | null }).tahun_mulai,
    tahunSelesai: (e as { tahun_selesai: number | null }).tahun_selesai,
    jenisPeristiwa: (e as { jenis_peristiwa: string }).jenis_peristiwa,
    eraHistoris: (e as { era_historis: string | null }).era_historis,
    dampakPadaBahasa: (e as { dampak_pada_bahasa: string | null }).dampak_pada_bahasa,
    wilayahTerdampak: (e as { wilayah_terdampak: string | null }).wilayah_terdampak,
    sumberSejarah: (e as { sumber_sejarah: string | null }).sumber_sejarah,
    bahasaNama: ((e as { bahasa: { nama_bahasa: string | null } }).bahasa as { nama_bahasa: string | null })?.nama_bahasa ?? null,
    bahasaKode: ((e as { bahasa: { kode_iso_639: string | null } }).bahasa as { kode_iso_639: string | null })?.kode_iso_639 ?? null,
  })) as PeristiwaOutput[];

  return NextResponse.json(formatted);
}
