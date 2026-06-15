import { createClient } from '@supabase/supabase-js'
import type { NextApiRequest, NextApiResponse } from 'next'

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
)

interface LanguageFamily {
  id: string
  name: string
  parent_id: string | null
  level: number
  children?: LanguageFamily[]
  languages?: Language[]
  languageCount?: number
}

interface Language {
  id: string
  name: string
  isoCode: string | null
  speakerCount: number | null
  vitalityStatus: string
  egidsLevel: string
  provinsi: string
  wilayah: string
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  if (req.method !== 'GET') {
    return res.status(405).json({ error: 'Method not allowed' })
  }

  try {
    // Fetch all language families with hierarchy
    const { data: families, error: familiesError } = await supabase
      .from('rumpun_bahasa')
      .select(`
        id,
        nama,
        induk_id,
        level,
        deskripsi
      `)
      .order('level', { ascending: true })
      .order('nama', { ascending: true })

    if (familiesError) throw familiesError

    // Fetch all languages with their family assignments
    const { data: languages, error: languagesError } = await supabase
      .from('bahasa')
      .select(`
        id,
        nama_bahasa,
        kode_iso_639,
        jumlah_penutur,
        status_vitalitas,
        egids_level,
        provinsi,
        wilayah,
        rumpun_bahasa_id
      `)
      .order('nama_bahasa', { ascending: true })

    if (languagesError) throw languagesError

    // Build family tree structure
    const familyMap = new Map<string, LanguageFamily>()
    
    // First pass: create all family nodes
    families.forEach(family => {
      familyMap.set(family.id, {
        id: family.id,
        name: family.nama,
        parent_id: family.induk_id,
        level: family.level,
        children: [],
        languages: [],
        languageCount: 0
      })
    })

    // Second pass: build parent-child relationships
    families.forEach(family => {
      const node = familyMap.get(family.id)
      if (node && family.induk_id) {
        const parent = familyMap.get(family.induk_id)
        if (parent && parent.children) {
          parent.children.push(node)
        }
      }
    })

    // Third pass: assign languages to families
    languages.forEach(lang => {
      if (lang.rumpun_bahasa_id) {
        const family = familyMap.get(lang.rumpun_bahasa_id)
        if (family && family.languages) {
          family.languages.push({
            id: lang.id,
            name: lang.nama_bahasa,
            isoCode: lang.kode_iso_639,
            speakerCount: lang.jumlah_penutur,
            vitalityStatus: lang.status_vitalitas,
            egidsLevel: lang.egids_level,
            provinsi: lang.provinsi,
            wilayah: lang.wilayah
          })
        }
      }
    })

    // Calculate language counts (including descendants)
    function calculateCounts(node: LanguageFamily): number {
      let count = node.languages?.length || 0
      
      if (node.children && node.children.length > 0) {
        node.children.forEach(child => {
          count += calculateCounts(child)
        })
      }
      
      node.languageCount = count
      return count
    }

    // Calculate counts for all families
    familyMap.forEach(family => {
      if (!family.parent_id) {
        // Root families
        calculateCounts(family)
      }
    })

    // Get root families (no parent)
    const rootFamilies = Array.from(familyMap.values())
      .filter(f => !f.parent_id)
      .sort((a, b) => (b.languageCount || 0) - (a.languageCount || 0))

    // Add summary statistics
    const stats = {
      totalFamilies: families.length,
      totalLanguages: languages.length,
      rootFamilies: rootFamilies.length,
      languagesWithFamily: languages.filter(l => l.rumpun_bahasa_id).length,
      languagesWithoutFamily: languages.filter(l => !l.rumpun_bahasa_id).length
    }

    return res.status(200).json({
      success: true,
      data: rootFamilies,
      stats,
      allFamilies: Array.from(familyMap.values())
    })

  } catch (error: any) {
    console.error('Error fetching language family tree:', error)
    return res.status(500).json({
      success: false,
      error: error.message
    })
  }
}
