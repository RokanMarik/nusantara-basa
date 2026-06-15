import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

function calculateDistance(
  lat1: number,
  lon1: number,
  lat2: number,
  lon2: number
): number {
  const R = 6371
  const dLat = ((lat2 - lat1) * Math.PI) / 180
  const dLon = ((lon2 - lon1) * Math.PI) / 180
  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos((lat1 * Math.PI) / 180) *
      Math.cos((lat2 * Math.PI) / 180) *
      Math.sin(dLon / 2) *
      Math.sin(dLon / 2)
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
  return Math.round(R * c)
}

function generateInsights(
  languages: any[],
  proximityMatrix: Record<string, Record<string, number>>
): string[] {
  const insights: string[] = []

  const speakers = languages
    .map((lang: any) => ({
      nama: lang.nama_bahasa,
      count: lang.jumlah_penutur || 0,
    }))
    .sort((a, b) => b.count - a.count)

  if (speakers.length >= 2) {
    const largest = speakers[0]
    const smallest = speakers[speakers.length - 1]
    if (largest.count > 0 && smallest.count > 0) {
      const ratio = Math.round(largest.count / smallest.count)
      insights.push(
        `${largest.nama} has ${ratio}x more speakers than ${smallest.nama}`
      )
    }
  }

  const vitalityStatuses = languages.map((lang: any) => lang.status_vitalitas).filter(Boolean)
  const uniqueStatuses = [...new Set(vitalityStatuses)]
  if (uniqueStatuses.length === 1) {
    insights.push(`All languages have the same vitality status: ${uniqueStatuses[0]}`)
  }

  const langIds = Object.keys(proximityMatrix)
  if (langIds.length >= 2) {
    let closestPair: [string, string, number] = ['', '', Infinity]

    for (let i = 0; i < langIds.length; i++) {
      for (let j = i + 1; j < langIds.length; j++) {
        const distance = proximityMatrix[langIds[i]]?.[langIds[j]]
        if (distance !== undefined && distance < closestPair[2]) {
          closestPair = [langIds[i], langIds[j], distance]
        }
      }
    }

    if (closestPair[2] < Infinity) {
      const lang1 = languages.find(l => l.id === closestPair[0])
      const lang2 = languages.find(l => l.id === closestPair[1])
      if (lang1 && lang2) {
        insights.push(
          `Closest pair: ${lang1.nama_bahasa} and ${lang2.nama_bahasa} (${closestPair[2]} km apart)`
        )
      }
    }
  }

  const families = languages
    .map((lang: any) => lang.rumpun_bahasa?.nama_rumpun)
    .filter(Boolean)
  const uniqueFamilies = [...new Set(families)]
  if (uniqueFamilies.length === 1) {
    insights.push(`All languages belong to the same family: ${uniqueFamilies[0]}`)
  } else if (uniqueFamilies.length === languages.length) {
    insights.push('All languages belong to different language families')
  }

  return insights
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { languageIds } = body

    if (!languageIds || !Array.isArray(languageIds)) {
      return NextResponse.json(
        { error: 'languageIds must be an array' },
        { status: 400 }
      )
    }

    if (languageIds.length < 2) {
      return NextResponse.json(
        { error: 'At least 2 languages required for comparison' },
        { status: 400 }
      )
    }

    if (languageIds.length > 5) {
      return NextResponse.json(
        { error: 'Maximum 5 languages allowed for comparison' },
        { status: 400 }
      )
    }

    // Fetch each language individually using .eq() for efficiency
    const SELECT_FIELDS = 'id, nama_bahasa, nama_lokal, kode_iso_639, jumlah_penutur, egids_level, status_vitalitas, wilayah, provinsi, kabupaten, catatan, sumber_referensi, koordinat_pusat, rumpun_bahasa(nama_rumpun, parent_id)'

    const languagePromises = languageIds.map((id: string) =>
      supabase
        .from('bahasa')
        .select(SELECT_FIELDS)
        .eq('id', id)
        .single()
    )

    const results = await Promise.all(languagePromises)
    const languages = results
      .filter((r: any) => r.data && !r.error)
      .map((r: any) => r.data)

    if (languages.length !== languageIds.length) {
      return NextResponse.json(
        { error: 'One or more languages not found' },
        { status: 404 }
      )
    }

    const languagesWithCoords = languages.filter(
      (lang: any) => lang.koordinat_pusat
    )

    const proximityMatrix: Record<string, Record<string, number>> = {}

    if (languagesWithCoords.length >= 2) {
      for (let i = 0; i < languagesWithCoords.length; i++) {
        for (let j = i + 1; j < languagesWithCoords.length; j++) {
          const lang1 = languagesWithCoords[i]
          const lang2 = languagesWithCoords[j]

          const coord1 = lang1.koordinat_pusat
          const coord2 = lang2.koordinat_pusat

          if (coord1 && coord2 && coord1.coordinates && coord2.coordinates) {
            const distance = calculateDistance(
              coord1.coordinates[1],
              coord1.coordinates[0],
              coord2.coordinates[1],
              coord2.coordinates[0]
            )

            proximityMatrix[lang1.id] = proximityMatrix[lang1.id] || {}
            proximityMatrix[lang2.id] = proximityMatrix[lang2.id] || {}

            proximityMatrix[lang1.id][lang2.id] = distance
            proximityMatrix[lang2.id][lang1.id] = distance
          }
        }
      }
    }

    const metrics = {
      speakers: languages.map((lang: any) => ({
        id: lang.id,
        nama: lang.nama_bahasa,
        count: lang.jumlah_penutur || 0,
      })),
      vitality: languages.map((lang: any) => ({
        id: lang.id,
        nama: lang.nama_bahasa,
        status: lang.status_vitalitas || 'N/A',
        egids: lang.egids_level || 'N/A',
      })),
      geography: languages.map((lang: any) => ({
        id: lang.id,
        nama: lang.nama_bahasa,
        wilayah: lang.wilayah || 'N/A',
        provinsi: lang.provinsi || 'N/A',
        kabupaten: lang.kabupaten || 'N/A',
        coordinates: lang.koordinat_pusat,
      })),
      proximity: proximityMatrix,
      languageFamily: languages.map((lang: any) => ({
        id: lang.id,
        nama: lang.nama_bahasa,
        family: lang.rumpun_bahasa?.nama_rumpun || 'Unknown',
        parentFamily: lang.rumpun_bahasa?.parent_id || 'Unknown',
      })),
    }

    const insights = generateInsights(languages, proximityMatrix)

    const totalSpeakers = languages.reduce(
      (sum: number, lang: any) => sum + (lang.jumlah_penutur || 0),
      0
    )

    return NextResponse.json({
      languages: languages.map((lang: any) => ({
        id: lang.id,
        namaBahasa: lang.nama_bahasa,
        namaLokal: lang.nama_lokal,
        kodeIso639: lang.kode_iso_639,
        jumlahPenutur: lang.jumlah_penutur || 0,
        egidsLevel: lang.egids_level || 'N/A',
        statusVitalitas: lang.status_vitalitas || 'N/A',
        wilayah: lang.wilayah || '',
        provinsi: lang.provinsi || '',
        kabupaten: lang.kabupaten || null,
        catatan: lang.catatan || null,
        sumberReferensi: lang.sumber_referensi || null,
        koordinatPusat: lang.koordinat_pusat,
        rumpunBahasa: lang.rumpun_bahasa,
      })),
      metrics,
      insights,
      metadata: {
        totalLanguages: languages.length,
        languagesWithSpeakers: languages.filter(
          (lang: any) => (lang.jumlah_penutur || 0) > 0
        ).length,
        languagesWithCoordinates: languagesWithCoords.length,
        averageSpeakers: Math.round(totalSpeakers / languages.length),
      },
    })
  } catch (error) {
    console.error('Comparison API error:', error)
    return NextResponse.json(
      { error: 'Internal server error' },
      { status: 500 }
    )
  }
}
