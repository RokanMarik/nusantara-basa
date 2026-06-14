import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";

type PengaruhKosakata = { kata: string; arti: string; periode: number };

interface PengaruhRow {
  id: string;
  bahasa_asal: string;
  periode_pengaruh: string | null;
  jenis_pengaruh: string | null;
  contoh_kosakata: string | unknown[] | null;
  estimasi_serapan: number | null;
  jalur_masuk: string | null;
  bahasa: { nama_bahasa: string | null; kode_iso_639: string | null } | null;
}

export async function GET(request: Request) {
  const searchParams = new URL(request.url).searchParams;
  const bahasaId = searchParams.get("bahasa_id");
  const bahasaAsal = searchParams.get("bahasa_asal");
  const limit = parseInt(searchParams.get("limit") ?? "100");
  const offset = parseInt(searchParams.get("offset") ?? "0");

  let query = supabase
    .from("pengaruh_bahasa_lain")
    .select(`
      *,
      bahasa(nama_bahasa, kode_iso_639)
    `)
    .order("estimasi_serapan", { ascending: false })
    .range(offset, offset + limit - 1);

  if (bahasaId) query = query.eq("bahasa_id", bahasaId);
  if (bahasaAsal) query = query.eq("bahasa_asal", bahasaAsal);

  const { data, error } = await query;

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  const formatted = (data as PengaruhRow[] | null)?.map((p) => ({
    id: p.id,
    bahasaAsal: p.bahasa_asal,
    periodePengaruh: p.periode_pengaruh,
    jenisPengaruh: p.jenis_pengaruh,
    contohKosakata: typeof p.contoh_kosakata === "string"
      ? JSON.parse(p.contoh_kosakata) as PengaruhKosakata[]
      : p.contoh_kosakata ?? [],
    estimasiSerapan: p.estimasi_serapan,
    jalurMasuk: p.jalur_masuk,
    bahasaNama: p.bahasa?.nama_bahasa ?? null,
    bahasaKode: p.bahasa?.kode_iso_639 ?? null,
  })) ?? [];

  return NextResponse.json(formatted);
}
