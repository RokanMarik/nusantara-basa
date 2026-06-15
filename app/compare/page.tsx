'use client'

import { useState } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Badge } from '@/components/ui/badge'
import { Loader2 } from 'lucide-react'
import Link from 'next/link'

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
  koordinatPusat: any
  rumpunBahasa: {
    nama_rumpun: string
    induk_rumpun: string
  } | null
}

interface ComparisonResult {
  languages: Language[]
  metrics: {
    speakers: Array<{ id: string; nama: string; count: number }>
    vitality: Array<{ id: string; nama: string; status: string; egids: string }>
    geography: Array<{
      id: string
      nama: string
      wilayah: string
      provinsi: string
      kabupaten: string | null
      coordinates: any
    }>
    proximity: Record<string, Record<string, number>>
    languageFamily: Array<{
      id: string
      nama: string
      family: string
      parentFamily: string
    }>
  }
  insights: string[]
  metadata: {
    totalLanguages: number
    languagesWithSpeakers: number
    languagesWithCoordinates: number
    averageSpeakers: number
  }
}

export default function ComparePage() {
  const [languageIds, setLanguageIds] = useState<string[]>([])
  const [searchQuery, setSearchQuery] = useState('')
  const [searchResults, setSearchResults] = useState<Language[]>([])
  const [comparison, setComparison] = useState<ComparisonResult | null>(null)
  const [loading, setLoading] = useState(false)
  const [searching, setSearching] = useState(false)

  const searchLanguages = async () => {
    if (!searchQuery.trim()) return

    setSearching(true)
    try {
      const response = await fetch(
        `/api/bahasa?search=${encodeURIComponent(searchQuery)}&limit=50`
      )
      const data = await response.json()
      setSearchResults(data.data || [])
    } catch (error) {
      console.error('Search error:', error)
    } finally {
      setSearching(false)
    }
  }

  const addLanguage = (language: Language) => {
    if (languageIds.length >= 4) {
      alert('Maximum 4 languages allowed')
      return
    }
    if (languageIds.includes(language.id)) {
      alert('Language already added')
      return
    }
    setLanguageIds([...languageIds, language.id])
  }

  const removeLanguage = (id: string) => {
    setLanguageIds(languageIds.filter((lid) => lid !== id))
  }

  const compareLanguages = async () => {
    if (languageIds.length < 2) {
      alert('Please select at least 2 languages')
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
        throw new Error(error.error || 'Comparison failed')
      }

      const data = await response.json()
      setComparison(data)
    } catch (error: any) {
      console.error('Comparison error:', error)
      alert(error.message || 'Failed to compare languages')
    } finally {
      setLoading(false)
    }
  }

  const exportCSV = () => {
    if (!comparison) return

    const headers = [
      'Metric',
      ...comparison.languages.map((l) => l.namaBahasa),
    ]
    const rows = [
      ['ISO 639-3', ...comparison.languages.map((l) => l.kodeIso639 || 'N/A')],
      [
        'Speakers',
        ...comparison.languages.map((l) => l.jumlahPenutur.toLocaleString()),
      ],
      ['EGIDS Level', ...comparison.languages.map((l) => l.egidsLevel)],
      [
        'Vitality Status',
        ...comparison.languages.map((l) => l.statusVitalitas),
      ],
      ['Language Family', ...comparison.languages.map((l) => l.rumpunBahasa?.nama_rumpun || 'N/A')],
      ['Region', ...comparison.languages.map((l) => l.wilayah)],
      ['Province', ...comparison.languages.map((l) => l.provinsi)],
      ['Regency', ...comparison.languages.map((l) => l.kabupaten || 'N/A')],
    ]

    const csv = [headers, ...rows].map((row) => row.join(',')).join('\n')
    const blob = new Blob([csv], { type: 'text/csv' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = 'language-comparison.csv'
    a.click()
    URL.revokeObjectURL(url)
  }

  return (
    <div className="container mx-auto py-8 space-y-8">
      <div>
        <h1 className="text-3xl font-bold">Language Comparison Tool</h1>
        <p className="text-muted-foreground mt-2">
          Compare 2-4 languages side-by-side with detailed metrics and insights
        </p>
      </div>

      {/* Search and Select Languages */}
      <Card>
        <CardHeader>
          <CardTitle>Select Languages to Compare</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex gap-2">
            <div className="flex-1">
              <Label htmlFor="search">Search Languages</Label>
              <Input
                id="search"
                placeholder="Enter language name..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyPress={(e) => e.key === 'Enter' && searchLanguages()}
              />
            </div>
            <Button onClick={searchLanguages} disabled={searching} className="mt-8">
              {searching ? <Loader2 className="h-4 w-4 animate-spin" /> : 'Search'}
            </Button>
          </div>

          {searchResults.length > 0 && (
            <div className="border rounded-lg p-4 max-h-64 overflow-y-auto">
              <h3 className="font-semibold mb-2">Search Results</h3>
              <div className="space-y-2">
                {searchResults.map((lang) => (
                  <div
                    key={lang.id}
                    className="flex items-center justify-between p-2 hover:bg-accent rounded"
                  >
                    <div>
                      <div className="font-medium">{lang.namaBahasa}</div>
                      <div className="text-sm text-muted-foreground">
                        {lang.provinsi} • {lang.jumlahPenutur.toLocaleString()} speakers
                      </div>
                    </div>
                    <Button
                      size="sm"
                      onClick={() => addLanguage(lang)}
                      disabled={languageIds.includes(lang.id)}
                    >
                      Add
                    </Button>
                  </div>
                ))}
              </div>
            </div>
          )}

          {languageIds.length > 0 && (
            <div className="border rounded-lg p-4">
              <h3 className="font-semibold mb-2">
                Selected Languages ({languageIds.length}/4)
              </h3>
              <div className="flex flex-wrap gap-2">
                {languageIds.map((id) => {
                  const lang = searchResults.find((l) => l.id === id)
                  return (
                    <Badge key={id} variant="secondary" className="text-sm">
                      {lang?.namaBahasa || id}
                      <button
                        onClick={() => removeLanguage(id)}
                        className="ml-2 hover:text-destructive"
                      >
                        ×
                      </button>
                    </Badge>
                  )
                })}
              </div>
              <Button
                onClick={compareLanguages}
                disabled={loading || languageIds.length < 2}
                className="mt-4"
              >
                {loading ? (
                  <>
                    <Loader2 className="h-4 w-4 animate-spin mr-2" />
                    Comparing...
                  </>
                ) : (
                  'Compare Languages'
                )}
              </Button>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Comparison Results */}
      {comparison && (
        <>
          {/* Insights */}
          {comparison.insights.length > 0 && (
            <Card>
              <CardHeader>
                <CardTitle>Key Insights</CardTitle>
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

          {/* Side-by-Side Comparison */}
          <Card>
            <CardHeader>
              <div className="flex items-center justify-between">
                <CardTitle>Detailed Comparison</CardTitle>
                <Button onClick={exportCSV} variant="outline" size="sm">
                  Export CSV
                </Button>
              </div>
            </CardHeader>
            <CardContent>
              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b">
                      <th className="text-left p-2">Metric</th>
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
                      <td className="p-2 font-medium">Speakers</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.jumlahPenutur.toLocaleString()}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">EGIDS Level</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.egidsLevel}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Vitality Status</td>
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
                      <td className="p-2 font-medium">Language Family</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.rumpunBahasa?.nama_rumpun || 'N/A'}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Region</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.wilayah}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Province</td>
                      {comparison.languages.map((lang) => (
                        <td key={lang.id} className="p-2">
                          {lang.provinsi}
                        </td>
                      ))}
                    </tr>
                    <tr className="border-b">
                      <td className="p-2 font-medium">Regency</td>
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
                <CardTitle>Geographic Proximity</CardTitle>
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

          {/* Metadata */}
          <Card>
            <CardHeader>
              <CardTitle>Summary Statistics</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div>
                  <div className="text-sm text-muted-foreground">
                    Total Languages
                  </div>
                  <div className="text-2xl font-bold">
                    {comparison.metadata.totalLanguages}
                  </div>
                </div>
                <div>
                  <div className="text-sm text-muted-foreground">
                    With Speaker Data
                  </div>
                  <div className="text-2xl font-bold">
                    {comparison.metadata.languagesWithSpeakers}
                  </div>
                </div>
                <div>
                  <div className="text-sm text-muted-foreground">
                    With Coordinates
                  </div>
                  <div className="text-2xl font-bold">
                    {comparison.metadata.languagesWithCoordinates}
                  </div>
                </div>
                <div>
                  <div className="text-sm text-muted-foreground">
                    Average Speakers
                  </div>
                  <div className="text-2xl font-bold">
                    {comparison.metadata.averageSpeakers.toLocaleString()}
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
