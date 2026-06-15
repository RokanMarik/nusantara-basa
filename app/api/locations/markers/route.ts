import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";
import { getCache, setCache, TTL } from "@/lib/cache";

export async function GET() {
  const cached = getCache("markers");
  if (cached) return NextResponse.json(cached);

  const { data: bahasa, error } = await supabase
    .from("bahasa")
    .select("id, nama_bahasa, nama_lokal, kode_iso_639, jumlah_penutur, status_vitalitas, koordinat_pusat, rumpun_bahasa(nama_rumpun)");

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  interface BahasaRow {
    id: string;
    nama_bahasa: string;
    nama_lokal?: string | null;
    kode_iso_639?: string | null;
    jumlah_penutur?: number | null;
    status_vitalitas?: string | null;
    koordinat_pusat?: {
      type?: string;
      coordinates?: [number, number];
      lat?: number;
      lng?: number;
    } | null;
    rumpun_bahasa?: { nama_rumpun?: string } | null;
  }

  const rows = (bahasa as unknown as BahasaRow[]) || [];
  const markers = rows
    .filter((b) => {
      if (!b.koordinat_pusat) return false;
      // Handle both GeoJSON format and simple lat/lng format
      return b.koordinat_pusat.coordinates || (b.koordinat_pusat.lat !== undefined && b.koordinat_pusat.lng !== undefined);
    })
    .map((b) => {
      let lat: number, lng: number;
      if (b.koordinat_pusat!.coordinates) {
        // GeoJSON format: [lng, lat]
        lng = b.koordinat_pusat!.coordinates[0];
        lat = b.koordinat_pusat!.coordinates[1];
      } else {
        // Simple format: {lat, lng}
        lat = b.koordinat_pusat!.lat!;
        lng = b.koordinat_pusat!.lng!;
      }
      return {
        id: b.id,
        namaBahasa: b.nama_bahasa,
        namaLokal: b.nama_lokal ?? null,
        kodeIso639: b.kode_iso_639 ?? null,
        jumlahPenutur: b.jumlah_penutur ?? null,
        statusVitalitas: b.status_vitalitas ?? null,
        rumpunNama: b.rumpun_bahasa?.nama_rumpun ?? null,
        lat,
        lng,
      };
    });

  setCache("markers", markers, TTL.MARKERS);
  return NextResponse.json(markers);
}
