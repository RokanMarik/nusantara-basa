import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL || "https://hkeheukewxsvaarxaket.supabase.co",
  process.env.SUPABASE_SERVICE_ROLE_KEY || "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20"
);

export async function GET(request: NextRequest) {
  const format = request.nextUrl.searchParams.get("format") || "json";
  const { data } = await supabase
    .from("bahasa")
    .select("nama_bahasa, nama_lokal, kode_iso_639, jumlah_penutur, status_vitalitas, rumpun_bahasa(nama_rumpun), lokasi(provinsi)");

  const rows = (data || []).map((b: any) => ({
    nama: b.nama_bahasa,
    nama_lokal: b.nama_lokal,
    iso: b.kode_iso_639,
    penutur: b.jumlah_penutur,
    vitalitas: b.status_vitalitas,
    rumpun: b.rumpun_bahasa?.nama_rumpun,
    provinsi: b.lokasi?.[0]?.provinsi,
  }));

  if (format === "csv") {
    const header = "Nama,Nama Lokal,ISO 639-3,Penutur,Vitalitas,Rumpun,Provinsi\n";
    const csv = header + rows.map(r =>
      `"${r.nama}","${r.nama_lokal || ''}","${r.iso || ''}",${r.penutur || ''},"${r.vitalitas || ''}","${r.rumpun || ''}","${r.provinsi || ''}"`
    ).join("\n");

    return new NextResponse(csv, {
      headers: { "Content-Type": "text/csv", "Content-Disposition": 'attachment; filename="nusantara-basa.csv"' },
    });
  }

  return NextResponse.json(rows, {
    headers: { "Content-Disposition": 'attachment; filename="nusantara-basa.json"' },
  });
}
