import { createClient } from '@supabase/supabase-js'
import type { NextApiRequest, NextApiResponse } from 'next'

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
)

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  if (req.method !== 'GET') {
    return res.status(405).json({ error: 'Method not allowed' })
  }

  try {
    // Get sample data from bahasa table
    const { data: sampleBahasa, error: bahasaError } = await supabase
      .from('bahasa')
      .select('*')
      .limit(1)

    if (bahasaError) throw bahasaError

    // Get column info from information_schema
    const { data: columns, error: columnsError } = await supabase
      .rpc('get_table_columns', { table_name: 'bahasa' })

    // If RPC doesn't exist, infer from sample data
    let tableSchema: any[] = []
    
    if (columnsError || !columns) {
      // Infer schema from sample data
      if (sampleBahasa && sampleBahasa.length > 0) {
        const sample = sampleBahasa[0]
        tableSchema = Object.keys(sample).map(key => ({
          column_name: key,
          data_type: typeof sample[key],
          is_nullable: sample[key] === null ? 'YES' : 'NO',
          sample_value: sample[key]
        }))
      }
    } else {
      tableSchema = columns
    }

    // Get statistics for numeric fields
    const { data: stats } = await supabase
      .from('bahasa')
      .select('jumlah_penutur, kode_iso_639, provinsi, rumpun_bahasa_id')

    const statsData = {
      totalRecords: stats?.length || 0,
      withSpeakers: stats?.filter(s => s.jumlah_penutur !== null).length || 0,
      withISO: stats?.filter(s => s.kode_iso_639 !== null).length || 0,
      withProvince: stats?.filter(s => s.provinsi !== null).length || 0,
      withFamily: stats?.filter(s => s.rumpun_bahasa_id !== null).length || 0,
      avgSpeakers: stats?.reduce((sum, s) => sum + (s.jumlah_penutur || 0), 0) / (stats?.length || 1)
    }

    // Get unique values for categorical fields
    const { data: provinces } = await supabase
      .from('bahasa')
      .select('provinsi')
      .not('provinsi', 'is', null)

    const uniqueProvinces = [...new Set(provinces?.map(p => p.provinsi) || [])]

    const { data: families } = await supabase
      .from('rumpun_bahasa')
      .select('id, nama')

    return res.status(200).json({
      success: true,
      data: {
        table: 'bahasa',
        description: 'Tabel utama yang menyimpan informasi tentang bahasa daerah di Indonesia',
        totalRecords: statsData.totalRecords,
        columns: tableSchema,
        statistics: statsData,
        categoricalValues: {
          provinces: uniqueProvinces.length,
          families: families?.length || 0
        }
      }
    })

  } catch (error: any) {
    console.error('Error fetching data dictionary:', error)
    return res.status(500).json({
      success: false,
      error: error.message
    })
  }
}
