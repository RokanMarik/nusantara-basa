import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL || "https://hkeheukewxsvaarxaket.supabase.co",
  process.env.SUPABASE_SERVICE_ROLE_KEY || "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20"
);

export async function GET(request: NextRequest) {
  const format = request.nextUrl.searchParams.get("format") || "json";
  const vitalitas = request.nextUrl.searchParams.get("vitalitas");
  const provinsi = request.nextUrl.searchParams.get("provinsi");
  const wilayah = request.nextUrl.searchParams.get("wilayah");
  const minPenutur = request.nextUrl.searchParams.get("min_penutur");

  let query = supabase
    .from("bahasa")
    .select("nama_bahasa, nama_lokal, kode_iso_639, jumlah_penutur, status_vitalitas, wilayah, provinsi, kabupaten, egids_level, jumlah_penutur_tahun, sumber_referensi, rumpun_bahasa(nama_rumpun)");

  // Apply filters
  if (vitalitas) {
    query = query.eq("status_vitalitas", vitalitas);
  }
  if (provinsi) {
    query = query.eq("provinsi", provinsi);
  }
  if (wilayah) {
    query = query.eq("wilayah", wilayah);
  }
  if (minPenutur) {
    query = query.gte("jumlah_penutur", parseInt(minPenutur));
  }

  const { data } = await query;

  const rows = (data || []).map((b: any) => ({
    nama: b.nama_bahasa,
    nama_lokal: b.nama_lokal,
    iso: b.kode_iso_639,
    penutur: b.jumlah_penutur,
    vitalitas: b.status_vitalitas,
    wilayah: b.wilayah,
    provinsi: b.provinsi,
    kabupaten: b.kabupaten,
    egids: b.egids_level,
    tahun_penutur: b.jumlah_penutur_tahun,
    sumber: b.sumber_referensi,
    rumpun: b.rumpun_bahasa?.nama_rumpun,
  }));

  if (format === "csv") {
    const header = "Nama,Nama Lokal,ISO 639-3,Penutur,Vitalitas,Wilayah,Provinsi,Kabupaten,EGIDS,Tahun Penutur,Sumber,Rumpun\n";
    const csv = header + rows.map(r =>
      `"${r.nama}","${r.nama_lokal || ''}","${r.iso || ''}",${r.penutur || ''},"${r.vitalitas || ''}","${r.wilayah || ''}","${r.provinsi || ''}","${r.kabupaten || ''}","${r.egids || ''}",${r.tahun_penutur || ''},"${r.sumber || ''}","${r.rumpun || ''}"`
    ).join("\n");

    return new NextResponse(csv, {
      headers: { "Content-Type": "text/csv", "Content-Disposition": 'attachment; filename="nusantara-basa.csv"' },
    });
  }

  return NextResponse.json(rows, {
    headers: { "Content-Disposition": 'attachment; filename="nusantara-basa.json"' },
  });
}
