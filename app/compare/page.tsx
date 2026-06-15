'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Badge } from '@/components/ui/badge'
import { Loader2 } from 'lucide-react'

interface Language {
  id: string
  namaBahasa: string
  namaLokal: string | null
  kodeIso639: string | null
  jumlahPenutur: number
  egidsLevel: string
  statusVitalitas: string
  wilayah: string
  provinsi: string
  kabupaten: string | null
  catatan: string | null
  sumberReferensi: string | null
  koordinatPusat: {
    type: string
    coordinates: [number, number]
  } | null
  rumpunBahasa: {
    nama_rumpun: string
    parent_id: string | null
  } | null
}

interface ComparisonResult {
  languages: Language[]
  metrics: {
    speakers: Array<{ id: string; nama: string; count: number }>
    vitality: Array<{ id: string; nama: string; status: string; egids: string }>
    geography: Array<{ id: string; nama: string; wilayah: string; provinsi: string; kabupaten: string; coordinates: unknown }>
    proximity: Record<string, Record<string, number>>
    languageFamily: Array<{ id: string; nama: string; family: string; parentFamily: string }>
  }
  insights: string[]
  metadata: {
    totalLanguages: number
    languagesWithSpeakers: number
    languagesWithCoordinates: number
    averageSpeakers: number
  }
}

const POPULAR_LANGUAGES = [
  { id: 'jawa', name: 'Jawa' },
  { id: 'sunda', name: 'Sunda' },
  { id: 'madura', name: 'Madura' },
  { id: 'minangkabau', name: 'Minangkabau' },
  { id: 'bugis', name: 'Bugis' },
]


export default function ComparePage() {
  const [languageIds, setLanguageIds] = useState<string[]>([])
  const [searchQuery, setSearchQuery] = useState('')
  const [searchResults, setSearchResults] = useState<Language[]>([])
  const [comparison, setComparison] = useState<ComparisonResult | null>(null)
  const [loading, setLoading] = useState(false)
  const [searching, setSearching] = useState(false)

  // Debounced search
  useEffect(() => {
    if (!searchQuery.trim()) {
      setSearchResults([])
      return
    }

    const timer = setTimeout(async () => {
      setSearching(true)
      try {
        const response = await fetch(
          `/api/bahasa?search=${encodeURIComponent(searchQuery)}&limit=50`
        )
        const data = await response.json()
        setSearchResults(data.data || [])
      } catch (error) {
        console.error('Search error:', error)
        setSearchResults([])
      } finally {
        setSearching(false)
      }
    }, 300)

    return () => clearTimeout(timer)
  }, [searchQuery])

  const addLanguage = (language: Language) => {
    if (languageIds.length >= 5) {
      alert('Maksimal 5 bahasa yang dapat dibandingkan')
      return
    }
    if (languageIds.includes(language.id)) {
      alert('Bahasa sudah ditambahkan')
      return
    }
    setLanguageIds([...languageIds, language.id])
    setSearchQuery('')
    setSearchResults([])
  }

  const removeLanguage = (id: string) => {
    setLanguageIds(languageIds.filter((lid) => lid !== id))
  }

  const compareLanguages = async () => {
    if (languageIds.length < 2) {
      alert('Pilih minimal 2 bahasa untuk dibandingkan')
      return
    }

    setLoading(true)
    try {
      const response = await fetch('/api/comparison', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ languageIds }),
      })

      if (!response.ok) {
        const error = await response.json()
        throw new Error(error.error || 'Perbandingan gagal')
      }

      const data = await response.json()
      setComparison(data)
    } catch (error: unknown) {
      const errorMessage = error instanceof Error ? error.message : 'Gagal membandingkan bahasa'
      console.error('Comparison error:', error)
      alert(errorMessage)
    } finally {
      setLoading(false)
    }
  }

  const exportCSV = () => {
    if (!comparison) return

    const headers = [
      'Metrik',
      ...comparison.languages.map((l) => l.namaBahasa),
    ]
    const rows = [
      ['ISO 639-3', ...comparison.languages.map((l) => l.kodeIso639 || 'N/A')],
      [
        'Jumlah Penutur',
        ...comparison.languages.map((l) => l.jumlahPenutur.toLocaleString('id-ID')),
      ],
      ['Tingkat EGIDS', ...comparison.languages.map((l) => l.egidsLevel)],
      [
        'Status Vitalitas',
        ...comparison.languages.map((l) => l.statusVitalitas),
      ],
      ['Rumpun Bahasa', ...comparison.languages.map((l) => l.rumpunBahasa?.nama_rumpun || 'N/A')],
      ['Wilayah', ...comparison.languages.map((l) => l.wilayah)],
      ['Provinsi', ...comparison.languages.map((l) => l.provinsi)],
      ['Kabupaten', ...comparison.languages.map((l) => l.kabupaten || 'N/A')],
    ]

    const csv = [headers, ...rows].map((row) => row.join(',')).join('\n')
    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = 'perbandingan-bahasa.csv'
    a.click()
    URL.revokeObjectURL(url)
  }

  const getSelectedLanguages = () => {
    return searchResults.filter((l) => languageIds.includes(l.id))
  }

  const maxSpeakers = comparison 
    ? Math.max(...comparison.languages.map((l) => l.jumlahPenutur || 0))
    : 0

  return (
    <div className="container mx-auto py-8 space-y-8">
      <div>
        <h1 className="text-3xl font-bold">Alat Perbandingan Bahasa</h1>
        <p className="text-muted-foreground mt-2">
          Bandingkan 2-5 bahasa secara berdampingan dengan metrik dan wawasan mendalam
        </p>
      </div>

      {/* Selection Card */}
      <Card>
        <CardHeader>
          <CardTitle>Pilih Bahasa untuk Dibandingkan</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          {/* Empty State Tutorial */}
          {languageIds.length === 0 && (
            <div className="bg-muted/50 rounded-lg p-6 space-y-4">
              <h3 className="font-semibold text-lg">Cara Menggunakan</h3>
              <ol className="space-y-3 text-sm">
                <li className="flex gap-3">
                  <span className="flex-shrink-0 w-6 h-6 rounded-full bg-primary text-primary-foreground flex items-center justify-center text-xs font-bold">1</span>
                  <span>Cari bahasa menggunakan kotak pencarian di bawah</span>
                </li>
                <li className="flex gap-3">
                  <span className="flex-shrink-0 w-6 h-6 rounded-full bg-primary text-primary-foreground flex items-center justify-center text-xs font-bold">2</span>
                  <span>Tambahkan 2-5 bahasa yang ingin dibandingkan</span>
                </li>
                <li className="flex gap-3">
                  <span className="flex-shrink-0 w-6 h-6 rounded-full bg-primary text-primary-foreground flex items-center justify-center text-xs font-bold">3</span>
                  <span>Klik tombol &quot;Bandingkan Bahasa&quot; untuk melihat analisis</span>
                </li>
              </ol>
              
              <div className="pt-4 border-t">
                <p className="text-sm font-medium mb-2">Bahasa Populer:</p>
                <div className="flex flex-wrap gap-2">
                  {POPULAR_LANGUAGES.map((lang) => (
                    <Badge key={lang.id} variant="outline" className="cursor-default">
                      {lang.name}
                    </Badge>
                  ))}
                </div>
              </div>
            </div>
          )}

          {/* Search Input */}
          <div>
            <label htmlFor="search" className="text-sm font-medium mb-2 block">
              Cari Bahasa
            </label>
            <Input
              id="search"
              placeholder="Ketik nama bahasa..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
          </div>

          {/* Search Results */}
          {searching && (
            <div className="flex items-center gap-2 text-sm text-muted-foreground">
              <Loader2 className="h-4 w-4 animate-spin" />
              Mencari...
            </div>
          )}

          {searchResults.length > 0 && !searching && (
            <div className="border rounded-lg p-4 max-h-64 overflow-y-auto">
              <h3 className="font-semibold mb-2 text-sm">Hasil Pencarian ({searchResults.length})</h3>
              <div className="space-y-2">
                {searchResults.map((lang) => {
                  const isSelected = languageIds.includes(lang.id)
                  return (
                    <div
                      key={lang.id}
                      className="flex items-center justify-between p-2 hover:bg-accent rounded transition-colors"
                    >
                      <div className="flex-1">
                        <div className="font-medium">{lang.namaBahasa}</div>
                        <div className="text-sm text-muted-foreground">
                          {lang.provinsi} • {lang.jumlahPenutur.toLocaleString('id-ID')} penutur
                        </div>
                      </div>
                      <Button
                        size="sm"
                        onClick={() => addLanguage(lang)}
                        disabled={isSelected}
                        variant={isSelected ? 'secondary' : 'default'}
                      >
                        {isSelected ? 'Terpilih' : 'Tambah'}
                      </Button>
                    </div>
                  )
                })}
              </div>
            </div>
          )}

          {/* Selected Languages */}
          {languageIds.length > 0 && (
            <div className="border rounded-lg p-4 bg-muted/30">
              <h3 className="font-semibold mb-2 text-sm">
                Bahasa Terpilih ({languageIds.length}/5)
              </h3>
              <div className="flex flex-wrap gap-2 mb-4">
                {getSelectedLanguages().map((lang) => (
                  <Badge
                    key={lang.id}
                    variant="secondary"
                    className="text-sm py-1 px-3 flex items-center gap-1.5"
                  >
                    {lang.namaBahasa}
                    <button
                      onClick={() => removeLanguage(lang.id)}
                      className="hover:text-destructive font-bold ml-1"
                      aria-label={`Hapus ${lang.namaBahasa}`}
                    >
                      ×
                    </button>
                  </Badge>
                ))}
              </div>
              <Button
                onClick={compareLanguages}
                disabled={loading || languageIds.length < 2}
                className="w-full sm:w-auto"
              >
                {loading ? (
                  <>
                    <Loader2 className="h-4 w-4 animate-spin mr-2" />
                    Membandingkan...
                  </>
                ) : (
                  'Bandingkan Bahasa'
                )}
              </Button>
              {languageIds.length < 2 && (
                <p className="text-sm text-muted-foreground mt-2">
                  Tambahkan minimal 2 bahasa untuk membandingkan
                </p>
              )}
            </div>
          )}
        </CardContent>
      </Card>

      {/* Comparison Results */}
      {comparison && (
        <>
          {/* Speakers Bar Chart */}
          <Card>
            <CardHeader>
              <CardTitle>Perbandingan Jumlah Penutur</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              {comparison.languages.map((lang) => {
                const percentage = maxSpeakers > 0 ? (lang.jumlahPenutur / maxSpeakers) * 100 : 0
                return (
                  <div key={lang.id} className="space-y-1">
                    <div className="flex justify-between text-sm">
                      <span className="font-medium">{lang.namaBahasa}</span>
                      <span className="text-muted-foreground">
                        {lang.jumlahPenutur.toLocaleString('id-ID')} penutur
                      </span>
                    </div>
                    <div className="w-full bg-muted rounded-full h-8 overflow-hidden">
                      <div
                        className="bg-primary h-full rounded-full transition-all duration-500 flex items-center justify-end pr-3"
                        style={{ width: `${Math.max(percentage, 2)}%` }}
                      >
                        {percentage > 15 && (
                          <span className="text-primary-foreground text-xs font-bold">
                            {percentage.toFixed(0)}%
                          </span>
                        )}
                      </div>
                    </div>
                  </div>
                )
              })}
            </CardContent>
          </Card>

          {/* Insights */}
          {comparison.insights.length > 0 && (
            <Card>
              <CardHeader>
                <CardTitle>Wawasan Utama</CardTitle>
              </CardHeader>
              <CardContent>
                <ul className="list-disc list-inside space-y-2">
                  {comparison.insights.map((insight, idx) => (
                    <li key={idx}>{insight}</li>
                  ))}
                </ul>
              </CardContent>
            </Card>
          )}

          {/* Detailed Comparison Table */}
          <Card>
            <CardHeader>
              <div className="flex items-center justify-between">
                <CardTitle>Perbandingan Detail</CardTitle>
                <Button onClick={exportCSV} variant="outline" size="sm">
                  Ekspor CSV
                </Button>
              </div>
            </CardHeader>
            <CardContent>
              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b">
                      <th className="text-left p-2">Metrik</th>
                      {comparison.languages.map((lang) => (
                        <th key={lang.id} className="text-left p-2">
                          {lang.namaBahasa}
                        </th>
                      ))}
                    </tr>
                  </thead>
                  <tbody>
                    <tr className="border-b">
                      <td className="p-2 font-medium">ISO 639-3</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.kodeIso639 || 'N/A'}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Jumlah Penutur</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.jumlahPenutur.toLocaleString('id-ID')}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Tingkat EGIDS</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.egidsLevel}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Status Vitalitas</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          <Badge
                            variant={
                              lang.statusVitalitas === 'Aman'
                                ? 'default'
                                : lang.statusVitalitas === 'Rentan'
                                ? 'secondary'
                                : 'destructive'
                            }
                          >
                            {lang.statusVitalitas}
                          </Badge>
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Rumpun Bahasa</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.rumpunBahasa?.nama_rumpun || 'N/A'}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Wilayah</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.wilayah}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Provinsi</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.provinsi}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Kabupaten</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.kabupaten || 'N/A'}
                        </td>
                      ))}
                    </tr>
                  </tbody>
                </table>
              </div>
            </CardContent>
          </Card>

          {/* Geographic Proximity */}
          {Object.keys(comparison.metrics.proximity).length > 0 && (
            <Card>
              <CardHeader>
                <CardTitle>Kedekatan Geografis</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-2">
                  {comparison.languages.map((lang1, i) =>
                    comparison.languages.slice(i + 1).map((lang2) => {
                      const distance =
                        comparison.metrics.proximity[lang1.id]?.[lang2.id]
                      if (distance) {
                        return (
                          <div
                            key={`${lang1.id}-${lang2.id}`}
                            className="flex items-center justify-between p-2 border rounded"
                          >
                            <span>
                              {lang1.namaBahasa} ↔ {lang2.namaBahasa}
                            </span>
                            <Badge variant="outline">{distance} km</Badge>
                          </div>
                        )
                      }
                      return null
                    })
                  )}
                </div>
              </CardContent>
            </Card>
          )}

          {/* Summary Statistics */}
          <Card>
            <CardHeader>
              <CardTitle>Statistik Ringkasan</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div>
                  <div className="text-sm text-muted-foreground">
                    Total Bahasa
                  </div>
                  <div className="text-2xl font-bold">
                    {comparison.metadata.totalLanguages}
                  </div>
                </div>
                <div>
                  <div className="text-sm text-muted-foreground">
                    Dengan Data Penutur
                  </div>
                  <div className="text-2xl font-bold">
                    {comparison.metadata.languagesWithSpeakers}
                  </div>
                </div>
                <div>
                  <div className="text-sm text-muted-foreground">
                    Dengan Koordinat
                  </div>
                  <div className="text-2xl font-bold">
                    {comparison.metadata.languagesWithCoordinates}
                  </div>
                </div>
                <div>
                  <div className="text-sm text-muted-foreground">
                    Rata-rata Penutur
                  </div>
                  <div className="text-2xl font-bold">
                    {comparison.metadata.averageSpeakers.toLocaleString('id-ID')}
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>
        </>
      )}
    </div>
  )
}
