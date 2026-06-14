import { createClient } from '@supabase/supabase-js'
import { NextRequest, NextResponse } from 'next/server'

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
)

export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams
  const provinsi = searchParams.get('provinsi')
  const wilayah = searchParams.get('wilayah')

  try {
    // Helper to apply filters
    const applyFilters = (query: any) => {
      if (provinsi) query = query.eq('provinsi', provinsi)
      if (wilayah) query = query.eq('wilayah', wilayah)
      return query
    }

    // Fetch vitalitas distribution
    let vitalitasQuery = supabase.from('bahasa').select('status_vitalitas').not('status_vitalitas', 'is', null)
    vitalitasQuery = applyFilters(vitalitasQuery)
    const { data: vitalitasData, error: vitalitasError } = await vitalitasQuery
    if (vitalitasError) throw vitalitasError

    const vitalitasCounts = vitalitasData.reduce((acc: Record<string, number>, row) => {
      const status = row.status_vitalitas || 'Tidak Diketahui'
      acc[status] = (acc[status] || 0) + 1
      return acc
    }, {})

    // Fetch wilayah distribution
    let wilayahQuery = supabase.from('bahasa').select('wilayah').not('wilayah', 'is', null)
    wilayahQuery = applyFilters(wilayahQuery)
    const { data: wilayahData, error: wilayahError } = await wilayahQuery
    if (wilayahError) throw wilayahError

    const wilayahCounts = wilayahData.reduce((acc: Record<string, number>, row) => {
      const w = row.wilayah || 'Tidak Diketahui'
      acc[w] = (acc[w] || 0) + 1
      return acc
    }, {})

    // Fetch provinsi distribution
    let provinsiQuery = supabase.from('bahasa').select('provinsi').not('provinsi', 'is', null)
    provinsiQuery = applyFilters(provinsiQuery)
    const { data: provinsiData, error: provinsiError } = await provinsiQuery
    if (provinsiError) throw provinsiError

    const provinsiCounts = provinsiData.reduce((acc: Record<string, number>, row) => {
      const p = row.provinsi || 'Tidak Diketahui'
      acc[p] = (acc[p] || 0) + 1
      return acc
    }, {})

    // Fetch top 10 languages by speakers
    let topQuery = supabase
      .from('bahasa')
      .select('nama_bahasa, jumlah_penutur, status_vitalitas')
      .not('jumlah_penutur', 'is', null)
      .order('jumlah_penutur', { ascending: false })
      .limit(10)
    topQuery = applyFilters(topQuery)
    const { data: topLanguages, error: topError } = await topQuery
    if (topError) throw topError

    // Fetch EGIDS distribution
    let egidsQuery = supabase.from('bahasa').select('egids_level').not('egids_level', 'is', null)
    egidsQuery = applyFilters(egidsQuery)
    const { data: egidsData, error: egidsError } = await egidsQuery
    if (egidsError) throw egidsError

    const egidsCounts = egidsData.reduce((acc: Record<string, number>, row) => {
      const level = row.egids_level || 'Tidak Diketahui'
      acc[level] = (acc[level] || 0) + 1
      return acc
    }, {})

    // Fetch total counts
    let totalQuery = supabase.from('bahasa').select('*', { count: 'exact', head: true })
    totalQuery = applyFilters(totalQuery)
    const { count: totalBahasa, error: totalError } = await totalQuery
    if (totalError) throw totalError

    let speakersQuery = supabase.from('bahasa').select('*', { count: 'exact', head: true }).not('jumlah_penutur', 'is', null)
    speakersQuery = applyFilters(speakersQuery)
    const { count: withSpeakers, error: speakersError } = await speakersQuery
    if (speakersError) throw speakersError

    return NextResponse.json({
      success: true,
      data: {
        total: {
          bahasa: totalBahasa || 0,
          withSpeakers: withSpeakers || 0,
        },
        vitalitas: Object.entries(vitalitasCounts).map(([name, value]) => ({
          name,
          value,
        })),
        wilayah: Object.entries(wilayahCounts)
          .map(([name, value]) => ({ name, value }))
          .sort((a, b) => b.value - a.value),
        provinsi: Object.entries(provinsiCounts)
          .map(([name, value]) => ({ name, value }))
          .sort((a, b) => b.value - a.value)
          .slice(0, 15),
        topLanguages: topLanguages.map((lang: any) => ({
          name: lang.nama_bahasa,
          speakers: lang.jumlah_penutur,
          status: lang.status_vitalitas || 'Tidak Diketahui',
        })),
        egids: Object.entries(egidsCounts)
          .map(([name, value]) => ({ name, value }))
          .sort((a, b) => {
            const aLevel = parseInt(a.name.split(' ')[0]) || 99
            const bLevel = parseInt(b.name.split(' ')[0]) || 99
            return aLevel - bLevel
          }),
      },
    })
  } catch (error: any) {
    console.error('Error fetching stats:', error)
    return NextResponse.json(
      { success: false, error: error.message },
      { status: 500 }
    )
  }
}
