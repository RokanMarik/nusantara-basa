import { supabase } from '@/lib/supabase'
import { NextRequest, NextResponse } from 'next/server'

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

export async function GET(request: NextRequest) {
  try {
    const { data: families, error: familiesError } = await supabase
      .from('rumpun_bahasa')
      .select(`
        id,
        nama_rumpun,
        parent_id,
        level_taksonomi
      `)
      .order('level_taksonomi', { ascending: true })
      .order('nama_rumpun', { ascending: true })

    if (familiesError) throw familiesError

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

    const familyMap = new Map<string, LanguageFamily>()
    
    families.forEach(family => {
      familyMap.set(family.id, {
        id: family.id,
        name: family.nama_rumpun,
        parent_id: family.parent_id,
        level: family.level_taksonomi,
        children: [],
        languages: [],
        languageCount: 0
      })
    })

    families.forEach(family => {
      const node = familyMap.get(family.id)
      if (node && family.parent_id) {
        const parent = familyMap.get(family.parent_id)
        if (parent && parent.children) {
          parent.children.push(node)
        }
      }
    })

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

    familyMap.forEach(family => {
      if (!family.parent_id) {
        calculateCounts(family)
      }
    })

    const rootFamilies = Array.from(familyMap.values())
      .filter(f => !f.parent_id)
      .sort((a, b) => (b.languageCount || 0) - (a.languageCount || 0))

    const stats = {
      totalFamilies: families.length,
      totalLanguages: languages.length,
      rootFamilies: rootFamilies.length,
      languagesWithFamily: languages.filter(l => l.rumpun_bahasa_id).length,
      languagesWithoutFamily: languages.filter(l => !l.rumpun_bahasa_id).length
    }

    return NextResponse.json({
      success: true,
      data: rootFamilies,
      stats,
      allFamilies: Array.from(familyMap.values())
    })
  } catch (error: any) {
    console.error('Error fetching language family tree:', error)
    return NextResponse.json(
      { success: false, error: error.message },
      { status: 500 }
    )
  }
}
