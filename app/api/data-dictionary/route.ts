import { supabase } from '@/lib/supabase'
import { NextRequest, NextResponse } from 'next/server'
export const dynamic = "force-dynamic";



export async function GET(request: NextRequest) {
  try {
    const { data: sampleBahasa, error: bahasaError } = await supabase
      .from('bahasa')
      .select('*')
      .limit(1)

    if (bahasaError) throw bahasaError

    let tableSchema: any[] = []

    if (sampleBahasa && sampleBahasa.length > 0) {
      const sample = sampleBahasa[0]
      tableSchema = Object.keys(sample).map(key => ({
        column_name: key,
        data_type: typeof sample[key],
        is_nullable: sample[key] === null ? 'YES' : 'NO',
        sample_value: sample[key]
      }))
    }

    const { data: stats } = await supabase
      .from('bahasa')
      .select('jumlah_penutur, kode_iso_639, provinsi, rumpun_bahasa_id')

    const totalRecords = stats?.length ?? 0
    const withSpeakers = stats?.filter(s => s.jumlah_penutur !== null).length ?? 0
    const withISO = stats?.filter(s => s.kode_iso_639 !== null).length ?? 0
    const withProvince = stats?.filter(s => s.provinsi !== null).length ?? 0
    const withFamily = stats?.filter(s => s.rumpun_bahasa_id !== null).length ?? 0
    const avgSpeakers = totalRecords > 0
      ? (stats?.reduce((sum: number, s: any) => sum + (s.jumlah_penutur ?? 0), 0) ?? 0) / totalRecords
      : 0

    const { data: provinces } = await supabase
      .from('bahasa')
      .select('provinsi')
      .not('provinsi', 'is', null)

    const uniqueProvinces = [...new Set(provinces?.map((p: any) => p.provinsi) ?? [])]

    const { data: families } = await supabase
      .from('rumpun_bahasa')
      .select('id, nama')

    return NextResponse.json({
      success: true,
      data: {
        table: 'bahasa',
        description: 'Tabel utama yang menyimpan informasi tentang bahasa daerah di Indonesia',
        totalRecords,
        columns: tableSchema,
        statistics: {
          totalRecords,
          withSpeakers,
          withISO,
          withProvince,
          withFamily,
          avgSpeakers
        },
        categoricalValues: {
          provinces: uniqueProvinces.length,
          families: families?.length ?? 0
        }
      }
    })
  } catch (error: any) {
    console.error('Error fetching data dictionary:', error)
    return NextResponse.json(
      { success: false, error: error.message },
      { status: 500 }
    )
  }
}
