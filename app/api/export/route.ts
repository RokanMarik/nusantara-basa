import { NextRequest, NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";
import { exportLimiter, rateLimitHeaders } from "@/lib/rate-limit";

export async function GET(request: NextRequest) {
  // Rate limiting
  const rateLimit = exportLimiter(request);
  if (!rateLimit.allowed) {
    return NextResponse.json(
      { error: "Too many requests" },
      { 
        status: 429,
        headers: rateLimitHeaders(rateLimit)
      }
    );
  }

  const format = request.nextUrl.searchParams.get("format") || "json";
  const vitalitas = request.nextUrl.searchParams.get("vitalitas");
  const provinsi = request.nextUrl.searchParams.get("provinsi");
  const wilayah = request.nextUrl.searchParams.get("wilayah");
  const minPenutur = request.nextUrl.searchParams.get("min_penutur");
  const maxPenutur = request.nextUrl.searchParams.get("max_penutur");
  const egids = request.nextUrl.searchParams.get("egids");
  const rumpun = request.nextUrl.searchParams.get("rumpun");
  const search = request.nextUrl.searchParams.get("search");
  const fields = request.nextUrl.searchParams.get("fields");

  // Define all available fields
  const allFields = [
    "id", "nama_bahasa", "nama_lokal", "kode_iso_639", "jumlah_penutur",
    "status_vitalitas", "wilayah", "provinsi", "kabupaten", "egids_level",
    "jumlah_penutur_tahun", "sumber_referensi", "catatan", "koordinat_pusat"
  ];

  // Parse custom fields or use default set
  let selectedFields: string[];
  if (fields) {
    const requestedFields = fields.split(",").map(f => f.trim());
    selectedFields = requestedFields.filter(f => allFields.includes(f));
    if (selectedFields.length === 0) {
      selectedFields = allFields;
    }
  } else {
    selectedFields = [
      "nama_bahasa", "nama_lokal", "kode_iso_639", "jumlah_penutur",
      "status_vitalitas", "wilayah", "provinsi", "kabupaten", "egids_level",
      "jumlah_penutur_tahun", "sumber_referensi"
    ];
  }

  // Build select query with rumpun_bahasa and lokasi joins
  const needsJoins = rumpun || provinsi || wilayah;
  const selectFields = needsJoins
    ? selectedFields.join(",") + ",rumpun_bahasa(nama_rumpun),lokasi(provinsi,kabupaten)"
    : selectedFields.join(",");

  let query = supabase
    .from("bahasa")
    .select(selectFields, { count: "exact" });

  // Apply filters
  if (vitalitas) {
    query = query.eq("status_vitalitas", vitalitas);
  }
  if (minPenutur) {
    query = query.gte("jumlah_penutur", parseInt(minPenutur));
  }
  if (maxPenutur) {
    query = query.lte("jumlah_penutur", parseInt(maxPenutur));
  }
  if (egids) {
    const sanitized = egids.replace(/[%_\\]/g, '\\$&');
    query = query.ilike("egids_level", `%${sanitized}%`);
  }
  if (search) {
    const sanitized = search.replace(/[%_\\]/g, '\\$&');
    query = query.or(`nama_bahasa.ilike.%${sanitized}%,nama_lokal.ilike.%${sanitized}%,kode_iso_639.ilike.%${sanitized}%`);
  }

  const { data, count, error } = await query;

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  // Apply post-query filters
  let filteredData = data || [];
  if (rumpun) {
    filteredData = filteredData.filter((b: any) => b.rumpun_bahasa?.nama_rumpun === rumpun);
  }
  if (provinsi) {
    filteredData = filteredData.filter((b: any) => b.lokasi?.some((l: any) => l.provinsi === provinsi));
  }
  if (wilayah) {
    filteredData = filteredData.filter((b: any) => b.lokasi?.some((l: any) => l.kabupaten === wilayah));
  }


  const rows = filteredData.map((b: any) => {
    const row: any = {};
    selectedFields.forEach(field => {
      const key = field === "nama_bahasa" ? "nama" :
                  field === "jumlah_penutur" ? "penutur" :
                  field === "status_vitalitas" ? "vitalitas" :
                  field === "kode_iso_639" ? "iso" :
                  field === "egids_level" ? "egids" :
                  field === "jumlah_penutur_tahun" ? "tahun_penutur" :
                  field === "sumber_referensi" ? "sumber" :
                  field.replace(/_([a-z])/g, (_, letter) => letter.toUpperCase());
      row[key] = b[field];
    });
    if (b.rumpun_bahasa) {
      row.rumpun = b.rumpun_bahasa.nama_rumpun;
    }
    return row;
  });

  if (format === "csv") {
    if (rows.length === 0) {
      return new NextResponse("No data found", { status: 404 });
    }

    const headers = Object.keys(rows[0]);
    const headerRow = headers.join(",") + "\n";
    const csv = headerRow + rows.map(r =>
      headers.map(h => {
        const val = r[h];
        if (val === null || val === undefined) return '""';
        if (typeof val === "number") return val.toString();
        return `"${String(val).replace(/"/g, '""')}"`;
      }).join(",")
    ).join("\n");

    return new NextResponse(csv, {
      headers: { 
        "Content-Type": "text/csv", 
        "Content-Disposition": `attachment; filename="nusantara-basa-${count}.csv"` 
      },
    });
  }

  return NextResponse.json({
    data: rows,
    total: filteredData.length,
    count: count || 0,
    filters: {
      vitalitas,
      provinsi,
      wilayah,
      minPenutur: minPenutur ? parseInt(minPenutur) : null,
      maxPenutur: maxPenutur ? parseInt(maxPenutur) : null,
      egids,
      rumpun,
      search,
    },
    fields: selectedFields,
  }, {
    headers: { "Content-Disposition": `attachment; filename="nusantara-basa-${count}.json"` },
  });
}
