'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'

interface BahasaLokasi {
  provinsi: string
  kabupaten: string | null
  tipe_wilayah: string | null
}

interface BahasaRumpun {
  nama_rumpun: string
  sub_rumpun: string | null
}

interface Bahasa {
  id: string
  namaBahasa: string
  namaLokal: string | null
  kodeIso639: string | null
  jumlahPenutur: number
  egidsLevel: string
  statusVitalitas: string
  catatan: string | null
  koordinatPusat: {
    type: string
    coordinates: [number, number]
  } | null
  rumpun: BahasaRumpun | null
  lokasi: BahasaLokasi[]
  autoSummary: string | null
}

interface RelatedBahasa {
  id: string
  namaBahasa: string
  jumlahPenutur: number
  rumpunNama: string | null
}


export default function BahasaDetailPage({ params }: { params: { slug: string } }) {
  const [bahasa, setBahasa] = useState<Bahasa | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [relatedLanguages, setRelatedLanguages] = useState<RelatedBahasa[]>([])


  useEffect(() => {
    async function fetchBahasa() {
      try {
        const response = await fetch(`/api/bahasa/${params.slug}`)
        const data = await response.json()
        
        if (!response.ok) {
          setError(data.error || 'Gagal memuat data bahasa')
          return
        }
        
        setBahasa(data)

        const rumpunName = data.rumpun?.nama_rumpun
        if (rumpunName) {
          try {
            const relatedResponse = await fetch(
              `/api/bahasa?rumpun=${encodeURIComponent(rumpunName)}&limit=4`
            )
            if (relatedResponse.ok) {
              const relatedData = await relatedResponse.json()
              const related = (relatedData.data || [])
                .filter((b: RelatedBahasa) => b.id !== data.id)
                .slice(0, 3)
              setRelatedLanguages(related)
            }
          } catch (err) {
            console.error('Failed to fetch related languages:', err)
          }
        }
      } catch (error) {
        console.error('Failed to fetch bahasa:', error)
        setError('Terjadi kesalahan saat memuat data')
      } finally {
        setLoading(false)
      }
    }

    fetchBahasa()
  }, [params.slug])


  if (loading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-amber-50 via-orange-50 to-red-50 flex items-center justify-center">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-amber-700 mb-4"></div>
          <p className="text-earth-700">Memuat data bahasa...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-amber-50 via-orange-50 to-red-50 flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-4xl font-bold text-earth-900 mb-4">Terjadi Kesalahan</h1>
          <p className="text-earth-700 mb-8">{error}</p>
          <Link
            href="/explore"
            className="inline-flex items-center gap-2 px-6 py-3 bg-amber-700 text-white rounded-lg hover:bg-amber-800 transition-colors"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            Kembali ke Explore
          </Link>
        </div>
      </div>
    )
  }

  if (!bahasa) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-amber-50 via-orange-50 to-red-50 flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-4xl font-bold text-earth-900 mb-4">Bahasa Tidak Ditemukan</h1>
          <p className="text-earth-700 mb-8">Bahasa dengan slug &ldquo;{params.slug}&rdquo; tidak ditemukan dalam database.</p>
          <Link
            href="/explore"
            className="inline-flex items-center gap-2 px-6 py-3 bg-amber-700 text-white rounded-lg hover:bg-amber-800 transition-colors"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            Kembali ke Explore
          </Link>
        </div>
      </div>
    )
  }

  const getVitalitasColor = (status: string): string => {
    switch (status.toLowerCase()) {
      case 'aman':
        return 'bg-green-100 text-green-800 border-green-300'
      case 'rentan':
        return 'bg-yellow-100 text-yellow-800 border-yellow-300'
      case 'terancam':
        return 'bg-orange-100 text-orange-800 border-orange-300'
      case 'sangat terancam':
        return 'bg-red-100 text-red-800 border-red-300'
      case 'punah':
        return 'bg-gray-100 text-gray-800 border-gray-300'
      default:
        return 'bg-gray-100 text-gray-800 border-gray-300'
    }
  }

  const formatNumber = (num: number): string => {
    return new Intl.NumberFormat('id-ID').format(num);
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-amber-50 via-orange-50 to-red-50">
      {/* Header */}
      <div className="bg-white/80 backdrop-blur-sm border-b border-earth-200 sticky top-0 z-10">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link
              href="/explore"
              className="inline-flex items-center gap-2 text-earth-700 hover:text-earth-900 transition-colors"
            >
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m-7 7h18" />
              </svg>
              Kembali
            </Link>
            <Link href="/" className="text-2xl font-bold text-earth-900">
              Nusantara Basa
            </Link>
            <Link
              href="/compare"
              className="inline-flex items-center gap-2 px-4 py-2 bg-amber-700 text-white rounded-lg hover:bg-amber-800 transition-colors"
            >
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
              </svg>
              Bandingkan
            </Link>
          </div>
        </div>
      </div>

      <main className="container mx-auto px-4 py-8">
        {/* Language Name */}
        <div className="mb-8">
          <h1 className="text-5xl font-bold text-earth-900 mb-2">{bahasa.namaBahasa}</h1>
          {bahasa.namaLokal && (
            <p className="text-2xl text-earth-700 italic">{bahasa.namaLokal}</p>
          )}
        </div>

        {/* Quick Stats */}
        <div className="grid md:grid-cols-4 gap-4 mb-8">
          <div className="bg-white rounded-xl p-6 shadow-sm border border-earth-200">
            <div className="flex items-center gap-3 mb-2">
              <svg className="w-6 h-6 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
              </svg>
              <span className="text-sm text-earth-600">Jumlah Penutur</span>
            </div>
            <p className="text-3xl font-bold text-earth-900">
              {bahasa.jumlahPenutur > 0 ? formatNumber(bahasa.jumlahPenutur) : 'Tidak diketahui'}
            </p>
          </div>

          <div className="bg-white rounded-xl p-6 shadow-sm border border-earth-200">
            <div className="flex items-center gap-3 mb-2">
              <svg className="w-6 h-6 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
              </svg>
              <span className="text-sm text-earth-600">Status Vitalitas</span>
            </div>
            <span className={`inline-block px-4 py-2 rounded-lg border-2 text-lg font-semibold ${getVitalitasColor(bahasa.statusVitalitas)}`}>
              {bahasa.statusVitalitas}
            </span>
          </div>

          <div className="bg-white rounded-xl p-6 shadow-sm border border-earth-200">
            <div className="flex items-center gap-3 mb-2">
              <svg className="w-6 h-6 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.343M11 7.343l1.657-1.657a2 2 0 012.828 0l2.829 2.829a2 2 0 010 2.828l-8.486 8.485M7 17h.01" />
              </svg>
              <span className="text-sm text-earth-600">EGIDS Level</span>
            </div>
            <p className="text-3xl font-bold text-earth-900">{bahasa.egidsLevel}</p>
          </div>

          <div className="bg-white rounded-xl p-6 shadow-sm border border-earth-200">
            <div className="flex items-center gap-3 mb-2">
              <svg className="w-6 h-6 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z" />
              </svg>
              <span className="text-sm text-earth-600">Kode ISO 639-3</span>
            </div>
            <p className="text-3xl font-bold text-earth-900 font-mono">
              {bahasa.kodeIso639 || '-'}
            </p>
          </div>
        </div>

        {/* Detailed Information */}
        <div className="grid md:grid-cols-2 gap-6 mb-8">
          {/* Geographic Information */}
          <div className="bg-white rounded-xl p-6 shadow-sm border border-earth-200">
            <h2 className="text-2xl font-bold text-earth-900 mb-4 flex items-center gap-2">
              <svg className="w-6 h-6 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              Informasi Geografis
            </h2>
            <dl className="space-y-3">
              {bahasa.lokasi && bahasa.lokasi.length > 0 && (
                <>
                  {bahasa.lokasi.some(l => l.provinsi) && (
                    <div>
                      <dt className="text-sm text-earth-600">Provinsi</dt>
                      <dd className="text-lg text-earth-900">
                        {bahasa.lokasi.map(l => l.provinsi).filter(Boolean).join(', ')}
                      </dd>
                    </div>
                  )}
                  {bahasa.lokasi.some(l => l.kabupaten) && (
                    <div>
                      <dt className="text-sm text-earth-600">Kabupaten</dt>
                      <dd className="text-lg text-earth-900">
                        {bahasa.lokasi.map(l => l.kabupaten).filter(Boolean).join(', ')}
                      </dd>
                    </div>
                  )}
                </>
              )}
              {!bahasa.lokasi?.length && (
                <div>
                  <dt className="text-sm text-earth-600">Provinsi</dt>
                  <dd className="text-lg text-earth-900">-</dd>
                </div>
              )}
              {bahasa.koordinatPusat && bahasa.koordinatPusat.coordinates && (
                <div>
                  <dt className="text-sm text-earth-600">Koordinat</dt>
                  <dd className="text-lg text-earth-900 font-mono">
                    {bahasa.koordinatPusat.coordinates[1]?.toFixed(4) || '0'}, {bahasa.koordinatPusat.coordinates[0]?.toFixed(4) || '0'}
                  </dd>
                </div>
              )}
            </dl>
          </div>

          {/* Linguistic Information */}
          {/* Linguistic Information */}
          <div className="bg-white rounded-xl p-6 shadow-sm border border-earth-200">
            <h2 className="text-2xl font-bold text-earth-900 mb-4 flex items-center gap-2">
              <svg className="w-6 h-6 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
              </svg>
              Informasi Linguistik
            </h2>
            <dl className="space-y-3">
              {bahasa.rumpun && (
                <div>
                  <dt className="text-sm text-earth-600">Rumpun Bahasa</dt>
                  <dd className="text-lg text-earth-900">{bahasa.rumpun.nama_rumpun}{bahasa.rumpun.sub_rumpun ? ` (${bahasa.rumpun.sub_rumpun})` : ''}</dd>
                </div>
              )}
              <div>
                <dt className="text-sm text-earth-600">Status Vitalitas</dt>
                <dd className="text-lg text-earth-900">{bahasa.statusVitalitas}</dd>
              </div>
              <div>
                <dt className="text-sm text-earth-600">EGIDS Level</dt>
                <dd className="text-lg text-earth-900">{bahasa.egidsLevel}</dd>
              </div>
            </dl>
          </div>
        </div>

        {/* Description */}
        {bahasa.catatan && (
          <div className="bg-white rounded-xl p-6 shadow-sm border border-earth-200 mb-8">
            <h2 className="text-2xl font-bold text-earth-900 mb-4 flex items-center gap-2">
              <svg className="w-6 h-6 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              Catatan
            </h2>
            <p className="text-earth-800 leading-relaxed whitespace-pre-wrap">{bahasa.catatan}</p>
          </div>
        )}

        {/* Auto Summary */}
        {bahasa.autoSummary && (
          <div className="bg-gradient-to-br from-amber-100 to-orange-100 rounded-xl p-6 shadow-sm border border-amber-300 mb-8">
            <h2 className="text-2xl font-bold text-earth-900 mb-4 flex items-center gap-2">
              <svg className="w-6 h-6 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
              </svg>
              Ringkasan Otomatis
            </h2>
            <p className="text-earth-800 leading-relaxed whitespace-pre-wrap">{bahasa.autoSummary}</p>
          </div>
        )}

        {/* Auto Summary (replaces old references section) */}

        {/* Related Languages */}
        {relatedLanguages.length > 0 && (
          <div className="bg-white rounded-xl p-6 shadow-sm border border-earth-200 mt-8">
            <h2 className="text-2xl font-bold text-earth-900 mb-4 flex items-center gap-2">
              <svg className="w-6 h-6 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
              </svg>
              Bahasa Serumpun
            </h2>
            <div className="space-y-3">
              {relatedLanguages.map((related) => (
                <Link
                  key={related.id}
                  href={`/explore/bahasa/${related.id}`}
                  className="block p-4 rounded-lg border border-earth-200 hover:border-amber-400 hover:bg-amber-50 transition-colors"
                >
                  <div className="flex justify-between items-start">
                    <div>
                      <h3 className="font-semibold text-earth-900">{related.namaBahasa}</h3>
                      <p className="text-sm text-earth-600">{related.rumpunNama || '-'}</p>
                    </div>
                    <div className="text-right">
                      <p className="text-sm text-earth-600">
                        {related.jumlahPenutur > 0 ? `${formatNumber(related.jumlahPenutur)} penutur` : 'Tidak diketahui'}
                      </p>
                    </div>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        )}
      </main>
    </div>
  )
}
