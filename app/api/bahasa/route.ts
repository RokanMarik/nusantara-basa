import { NextRequest, NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";
import { apiLimiter, rateLimitHeaders } from "@/lib/rate-limit";
export const dynamic = "force-dynamic";


export async function GET(request: NextRequest) {
  const rateLimit = apiLimiter(request);
  if (!rateLimit.allowed) {
    return NextResponse.json(
      { error: "Too many requests" },
      { 
        status: 429,
        headers: rateLimitHeaders(rateLimit)
      }
    );
  }

  const searchParams = request.nextUrl.searchParams;
  const limit = parseInt(searchParams.get("limit") ?? "50");
  const offset = parseInt(searchParams.get("offset") ?? "0");
  const rumpun = searchParams.get("rumpun");
  const vitalitas = searchParams.get("vitalitas");
  const egids = searchParams.get("egids");
  const search = searchParams.get("search");

  const query = supabase
    .from("bahasa")
    .select("id, nama_bahasa, nama_lokal, kode_iso_639, jumlah_penutur, status_vitalitas, egids_level, rumpun_bahasa(nama_rumpun)", { count: "exact" })
    .order("nama_bahasa", { ascending: true });

  if (vitalitas) query.eq("status_vitalitas", vitalitas);
  if (egids) query.eq("egids_level", egids);
  if (search) {
    const sanitized = search.replace(/[%_\\]/g, '\\$&');
    query.or(`nama_bahasa.ilike.%${sanitized}%,nama_lokal.ilike.%${sanitized}%,kode_iso_639.ilike.%${sanitized}%`);
  }

  query.range(offset, offset + limit - 1);

  let { data, count, error } = await query;
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  // Post-filter by rumpun if specified
  if (rumpun && data) {
    data = data.filter((b: any) => b.rumpun_bahasa?.nama_rumpun === rumpun);
    count = data.length;
  }

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
