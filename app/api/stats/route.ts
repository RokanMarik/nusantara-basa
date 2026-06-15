import { createClient } from '@supabase/supabase-js'
import { NextRequest, NextResponse } from 'next/server'
import { getCache, setCache, TTL } from '@/lib/cache'
import { apiLimiter, rateLimitHeaders } from '@/lib/rate-limit'

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
)


export async function GET(request: NextRequest) {
  // Rate limiting
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

  const searchParams = request.nextUrl.searchParams
  const provinsi = searchParams.get('provinsi')
  const wilayah = searchParams.get('wilayah')

  // Generate cache key
  const cacheKey = `stats:${provinsi || 'all'}:${wilayah || 'all'}`
  
  // Check cache first
  const cached = getCache<any>(cacheKey)
  if (cached) {
    return NextResponse.json(cached, {
      headers: { 'X-Cache': 'HIT' }
    })
  }

  try {
    // Helper to apply filters
    const applyFilters = (query: any) => {
      if (provinsi) query = query.eq('provinsi', provinsi)
      if (wilayah) query = query.eq('wilayah', wilayah)
      return query
    }

    // Execute all queries in parallel
    const [
      vitalitasResult,
      wilayahResult,
      provinsiResult,
      topLanguagesResult,
      egidsResult,
      totalResult,
      speakersResult
    ] = await Promise.all([
      // Fetch vitalitas distribution
      applyFilters(supabase.from('bahasa').select('status_vitalitas').not('status_vitalitas', 'is', null)),
      
      // Fetch wilayah distribution
      applyFilters(supabase.from('bahasa').select('wilayah').not('wilayah', 'is', null)),
      
      // Fetch provinsi distribution
      applyFilters(supabase.from('bahasa').select('provinsi').not('provinsi', 'is', null)),
      
      // Fetch top 10 languages by speakers
      applyFilters(supabase
        .from('bahasa')
        .select('nama_bahasa, jumlah_penutur, status_vitalitas')
        .not('jumlah_penutur', 'is', null)
        .order('jumlah_penutur', { ascending: false })
        .limit(10)),
      
      // Fetch EGIDS distribution
      applyFilters(supabase.from('bahasa').select('egids_level').not('egids_level', 'is', null)),
      
      // Fetch total counts
      applyFilters(supabase.from('bahasa').select('*', { count: 'exact', head: true })),
      
      // Fetch speakers count
      applyFilters(supabase.from('bahasa').select('*', { count: 'exact', head: true }).not('jumlah_penutur', 'is', null))
    ])

    // Check for errors
    if (vitalitasResult.error) throw vitalitasResult.error
    if (wilayahResult.error) throw wilayahResult.error
    if (provinsiResult.error) throw provinsiResult.error
    if (topLanguagesResult.error) throw topLanguagesResult.error
    if (egidsResult.error) throw egidsResult.error
    if (totalResult.error) throw totalResult.error
    if (speakersResult.error) throw speakersResult.error

    // Process vitalitas counts
    const vitalitasCounts: Record<string, number> = vitalitasResult.data.reduce((acc: Record<string, number>, row: any) => {
      const status = row.status_vitalitas || 'Tidak Diketahui'
      acc[status] = (acc[status] || 0) + 1
      return acc
    }, {} as Record<string, number>)

    // Process wilayah counts
    const wilayahCounts: Record<string, number> = wilayahResult.data.reduce((acc: Record<string, number>, row: any) => {
      const w = row.wilayah || 'Tidak Diketahui'
      acc[w] = (acc[w] || 0) + 1
      return acc
    }, {} as Record<string, number>)

    // Process provinsi counts
    const provinsiCounts: Record<string, number> = provinsiResult.data.reduce((acc: Record<string, number>, row: any) => {
      const p = row.provinsi || 'Tidak Diketahui'
      acc[p] = (acc[p] || 0) + 1
      return acc
    }, {} as Record<string, number>)

    // Process EGIDS counts
    const egidsCounts: Record<string, number> = egidsResult.data.reduce((acc: Record<string, number>, row: any) => {
      const level = row.egids_level || 'Tidak Diketahui'
      acc[level] = (acc[level] || 0) + 1
      return acc
    }, {} as Record<string, number>)

    const responseData = {
      success: true,
      data: {
        total: {
          bahasa: totalResult.count || 0,
          withSpeakers: speakersResult.count || 0,
        },
        vitalitas: Object.entries(vitalitasCounts).map(([name, value]) => ({
          name,
          value,
        })),
        wilayah: Object.entries(wilayahCounts)
          .map(([name, value]) => ({ name, value }))
          .sort((a: { name: string; value: number }, b: { name: string; value: number }) => b.value - a.value),
        provinsi: Object.entries(provinsiCounts)
          .map(([name, value]) => ({ name, value }))
          .sort((a: { name: string; value: number }, b: { name: string; value: number }) => b.value - a.value)
          .slice(0, 15),
        topLanguages: topLanguagesResult.data.map((lang: any) => ({
          name: lang.nama_bahasa,
          speakers: lang.jumlah_penutur,
          status: lang.status_vitalitas || 'Tidak Diketahui',
        })),
        egids: Object.entries(egidsCounts)
          .map(([name, value]) => ({ name, value }))
          .sort((a: { name: string; value: number }, b: { name: string; value: number }) => {
            const aLevel = parseInt(a.name.split(' ')[0]) || 99
            const bLevel = parseInt(b.name.split(' ')[0]) || 99
            return aLevel - bLevel
          }),
      },
    }

    // Cache for 1 hour
    setCache(cacheKey, responseData, TTL.STATS)

    return NextResponse.json(responseData, {
      headers: { 'X-Cache': 'MISS' }
    })
  } catch (error: any) {
    console.error('Error fetching stats:', error)
    return NextResponse.json(
      { success: false, error: error.message },
      { status: 500 }
    )
  }
}
