import { NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
);

export interface ProvinceStats {
  provinsi: string;
  total_bahasa: number;
  aman: number;
  rentan: number;
  terancam: number;
  punah: number;
  total_penutur: number;
  avg_vitality_score: number;
}

export async function GET() {
  try {
    // Query aggregation by province
    const { data, error } = await supabase
      .from("bahasa")
      .select(`
        provinsi,
        status_vitalitas,
        jumlah_penutur
      `)
      .not("provinsi", "is", null);

    if (error) throw error;

    // Aggregate by province using Record (static string keys)
    const provinceMap: Record<string, ProvinceStats> = {};

    (data || []).forEach((row: any) => {
      const prov = row.provinsi;
      if (!prov) return;

      if (!provinceMap[prov]) {
        provinceMap[prov] = {
          provinsi: prov,
          total_bahasa: 0,
          aman: 0,
          rentan: 0,
          terancam: 0,
          punah: 0,
          total_penutur: 0,
          avg_vitality_score: 0,
        };
      }

      const stats = provinceMap[prov];
      stats.total_bahasa++;

      // Count by vitality status
      const status = (row.status_vitalitas || "").toLowerCase();
      if (status === "aman") stats.aman++;
      else if (status === "rentan") stats.rentan++;
      else if (status === "terancam" || status === "sangat terancam") stats.terancam++;
      else if (status === "punah") stats.punah++;

      // Sum speakers
      if (row.jumlah_penutur) {
        stats.total_penutur += row.jumlah_penutur;
      }
    });

    // Calculate vitality score (0-100, higher = healthier)
    const result = Object.values(provinceMap).map((stats) => {
      const total = stats.total_bahasa;
      if (total === 0) {
        stats.avg_vitality_score = 0;
      } else {
        // Weighted score: Aman=100, Rentan=70, Terancam=40, Punah=0
        const score =
          (stats.aman * 100 +
            stats.rentan * 70 +
            stats.terancam * 40 +
            stats.punah * 0) /
          total;
        stats.avg_vitality_score = Math.round(score);
      }
      return stats;
    });

    // Sort by total_bahasa descending
    result.sort((a, b) => b.total_bahasa - a.total_bahasa);

    return NextResponse.json(result);
  } catch (error: any) {
    console.error("Province stats error:", error);
    return NextResponse.json(
      { error: error.message || "Failed to fetch province stats" },
      { status: 500 }
    );
  }
}
