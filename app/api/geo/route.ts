import { createClient } from "@supabase/supabase-js";
import { getCache, setCache, TTL } from "@/lib/cache";
import { apiLimiter, rateLimitHeaders } from "@/lib/rate-limit";

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL || "https://hkeheukewxsvaarxaket.supabase.co",
  process.env.SUPABASE_SERVICE_ROLE_KEY || "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20"
);

export interface LanguageGeoData {
  id: string;
  nama_bahasa: string;
  latitude: number | null;
  longitude: number | null;
  provinsi: string | null;
  kabupaten: string | null;
  status_vitalitas: string | null;
  jumlah_penutur: number | null;
  rumpun_bahasa: string | null;
}

export async function GET(req: Request) {
  // Rate limiting
  const rateLimit = apiLimiter(req);
  if (!rateLimit.allowed) {
    return new Response(JSON.stringify({ error: "Too many requests" }), {
      status: 429,
      headers: { 
        "Content-Type": "application/json",
        ...rateLimitHeaders(rateLimit)
      },
    });
  }

  try {
    const { searchParams } = new URL(req.url);
    const provinsi = searchParams.get("provinsi");
    const vitalitas = searchParams.get("vitalitas");
    const minSpeakers = searchParams.get("min_speakers");

    // Generate cache key based on query parameters
    const cacheKey = `geo:${provinsi || 'all'}:${vitalitas || 'all'}:${minSpeakers || '0'}`;
    
    // Check cache first
    const cached = getCache<LanguageGeoData[]>(cacheKey);
    if (cached) {
      return new Response(JSON.stringify(cached), {
        headers: { 
          "Content-Type": "application/json",
          "X-Cache": "HIT"
        },
      });
    }

    let query = supabase
      .from("bahasa")
      .select(`
        id,
        nama_bahasa,
        koordinat_pusat,
        provinsi,
        kabupaten,
        status_vitalitas,
        jumlah_penutur,
        rumpun_bahasa (nama_rumpun)
      `)
      .not("koordinat_pusat", "is", null);

    // Apply filters
    if (provinsi) {
      query = query.eq("provinsi", provinsi);
    }

    if (vitalitas) {
      query = query.eq("status_vitalitas", vitalitas);
    }

    if (minSpeakers) {
      const minNum = parseInt(minSpeakers);
      if (!isNaN(minNum)) {
        query = query.gte("jumlah_penutur", minNum);
      }
    }

    const { data, error } = await query;

    if (error) {
      throw error;
    }

    // Transform data to match interface - extract lat/lng from JSONB
    const languages: LanguageGeoData[] = (data || []).map((b: any) => {
      // koordinat_pusat is JSONB: {"type":"Point","coordinates":[lng,lat]}
      const coords = b.koordinat_pusat;
      const lat = coords?.coordinates?.[1] ?? null;
      const lng = coords?.coordinates?.[0] ?? null;
      
      return {
        id: b.id,
        nama_bahasa: b.nama_bahasa,
        latitude: lat,
        longitude: lng,
        provinsi: b.provinsi,
        kabupaten: b.kabupaten,
        status_vitalitas: b.status_vitalitas,
        jumlah_penutur: b.jumlah_penutur,
        rumpun_bahasa: b.rumpun_bahasa?.nama_rumpun || null,
      };
    });

    // Cache the result for 5 minutes
    setCache(cacheKey, languages, TTL.MARKERS);

    return new Response(JSON.stringify(languages), {
      headers: { 
        "Content-Type": "application/json",
        "X-Cache": "MISS"
      },
    });
  } catch (error: any) {
    console.error("Geo data API error:", error);
    return new Response(
      JSON.stringify({ error: error.message || "Failed to fetch geo data" }),
      { status: 500, headers: { "Content-Type": "application/json" } }
    );
  }
}
