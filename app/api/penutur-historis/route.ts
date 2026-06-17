import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";
export const dynamic = "force-dynamic";


interface PenuturRow {
  id: string;
  tahun_sensus: number;
  jumlah_penutur: number;
  metode_pencacahan: string | null;
  sumber_data: string | null;
  bahasa: { nama_bahasa: string | null; kode_iso_639: string | null } | null;
}

export async function GET(request: Request) {
  const searchParams = new URL(request.url).searchParams;
  const bahasaId = searchParams.get("bahasa_id");
  const tahunSensus = searchParams.get("tahun_sensus");
  const limit = parseInt(searchParams.get("limit") ?? "100");
  const offset = parseInt(searchParams.get("offset") ?? "0");

  let query = supabase
    .from("penutur_historis")
    .select(`
      *,
      bahasa(nama_bahasa, kode_iso_639)
    `)
    .order("tahun_sensus", { ascending: true })
    .range(offset, offset + limit - 1);

  if (bahasaId) query = query.eq("bahasa_id", bahasaId);
  if (tahunSensus) query = query.eq("tahun_sensus", parseInt(tahunSensus));

  const { data, error } = await query;

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  const formatted = (data as PenuturRow[] | null)?.map((p) => ({
    id: p.id,
    tahunSensus: p.tahun_sensus,
    jumlahPenutur: p.jumlah_penutur,
    metodePencacahan: p.metode_pencacahan,
    sumberData: p.sumber_data,
    bahasaNama: p.bahasa?.nama_bahasa ?? null,
    bahasaKode: p.bahasa?.kode_iso_639 ?? null,
  })) ?? [];

  return NextResponse.json(formatted);
}
