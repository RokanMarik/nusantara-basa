import { NextRequest, NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";

export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const limit = parseInt(searchParams.get("limit") ?? "50");
  const offset = parseInt(searchParams.get("offset") ?? "0");
  const rumpun = searchParams.get("rumpun");
  const vitalitas = searchParams.get("vitalitas");
  const egids = searchParams.get("egids");
  const search = searchParams.get("search");

  let query = supabase
    .from("bahasa")
    .select("id, nama_bahasa, nama_lokal, kode_iso_639, jumlah_penutur, status_vitalitas, egids_level, rumpun_bahasa(nama_rumpun)", { count: "exact" })
    .order("nama_bahasa", { ascending: true })
    .range(offset, offset + limit - 1);

  if (rumpun) query = query.eq("rumpun_bahasa.nama_rumpun", rumpun);
  if (vitalitas) query = query.eq("status_vitalitas", vitalitas);
  if (egids) query = query.eq("egids_level", egids);
  if (search) query = query.or(`nama_bahasa.ilike.%${search}%,nama_lokal.ilike.%${search}%,kode_iso_639.ilike.%${search}%`);

  const { data, count, error } = await query;
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  const formatted = (data || []).map((b: any) => ({
    id: b.id,
    namaBahasa: b.nama_bahasa,
    namaLokal: b.nama_lokal,
    kodeIso639: b.kode_iso_639,
    jumlahPenutur: b.jumlah_penutur,
    statusVitalitas: b.status_vitalitas,
    egidsLevel: b.egids_level,
    rumpunNama: b.rumpun_bahasa?.nama_rumpun ?? null,
  }));

  return NextResponse.json({ data: formatted, total: count ?? 0, limit, offset });
}
