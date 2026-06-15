'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table'
import { Alert, AlertDescription } from '@/components/ui/alert'
import { Info } from 'lucide-react'

interface ColumnInfo {
  column_name: string
  data_type: string
  is_nullable: string
  sample_value: any
  description?: string
}

interface DataDictionary {
  table: string
  description: string
  totalRecords: number
  columns: ColumnInfo[]
  statistics: {
    totalRecords: number
    withSpeakers: number
    withISO: number
    withProvince: number
    withFamily: number
    avgSpeakers: number
  }
  categoricalValues: {
    provinces: number
    families: number
  }
}

// Column descriptions
const columnDescriptions: Record<string, string> = {
  id: 'UUID unik untuk setiap bahasa',
  nama: 'Nama bahasa dalam Bahasa Indonesia',
  nama_lokal: 'Nama bahasa dalam bahasa lokal/asli',
  kode_iso_639: 'Kode ISO 639-3 standar internasional (3 huruf)',
  jumlah_penutur: 'Estimasi jumlah penutur aktif',
  tahun_jumlah_penutur: 'Tahun pendataan jumlah penutur',
  status_vitalitas: 'Status kelangsungan hidup bahasa (Aman, Rentan, Terancam, Kritis, Punah)',
  egids_level: 'Level EGIDS (Expanded Graded Intergenerational Disruption Scale) dari 0-10',
  provinsi: 'Provinsi di mana bahasa digunakan',
  kabupaten: 'Kabupaten/kota di mana bahasa digunakan',
  kecamatan: 'Kecamatan di mana bahasa digunakan',
  desa: 'Desa/kelurahan di mana bahasa digunakan',
  rumpun_bahasa_id: 'ID referensi ke tabel rumpun_bahasa',
  latitude: 'Koordinat latitude lokasi utama penggunaan bahasa',
  longitude: 'Koordinat longitude lokasi utama penggunaan bahasa',
  catatan: 'Catatan tambahan tentang bahasa',
  sumber_data: 'Sumber data/referensi untuk informasi bahasa',
  created_at: 'Waktu record dibuat',
  updated_at: 'Waktu record terakhir diupdate'
}

export default function DataDictionaryPage() {
  const [dictionary, setDictionary] = useState<DataDictionary | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    fetchDictionary()
  }, [])

  async function fetchDictionary() {
    try {
      setLoading(true)
      const response = await fetch('/api/data-dictionary')
      const data = await response.json()
      
      if (data.success) {
        setDictionary(data.data)
      } else {
        setError(data.error || 'Failed to fetch data dictionary')
      }
    } catch (err: any) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  if (loading) {
    return (
      <div className="container mx-auto py-8">
        <div className="flex items-center justify-center min-h-[400px]">
          <div className="text-center">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4" />
            <p className="text-gray-600 dark:text-gray-400">
              Memuat data dictionary...
            </p>
          </div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="container mx-auto py-8">
        <Alert variant="destructive">
          <AlertDescription>{error}</AlertDescription>
        </Alert>
      </div>
    )
  }

  if (!dictionary) {
    return (
      <div className="container mx-auto py-8">
        <Alert>
          <AlertDescription>Tidak ada data yang tersedia</AlertDescription>
        </Alert>
      </div>
    )
  }

  return (
    <div className="container mx-auto py-8 space-y-6">
      <div>
        <h1 className="text-4xl font-bold mb-2">Data Dictionary</h1>
        <p className="text-gray-600 dark:text-gray-400">
          Dokumentasi lengkap struktur database dan metadata bahasa daerah Indonesia
        </p>
      </div>

      {/* Overview Card */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Info className="h-5 w-5" />
            Tabel: {dictionary.table}
          </CardTitle>
          <CardDescription>{dictionary.description}</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div>
              <div className="text-sm text-gray-500">Total Records</div>
              <div className="text-2xl font-bold">{dictionary.totalRecords.toLocaleString()}</div>
            </div>
            <div>
              <div className="text-sm text-gray-500">Dengan Penutur</div>
              <div className="text-2xl font-bold">{dictionary.statistics.withSpeakers.toLocaleString()}</div>
              <div className="text-xs text-gray-400">
                {((dictionary.statistics.withSpeakers / dictionary.totalRecords) * 100).toFixed(1)}%
              </div>
            </div>
            <div>
              <div className="text-sm text-gray-500">Dengan ISO Code</div>
              <div className="text-2xl font-bold">{dictionary.statistics.withISO.toLocaleString()}</div>
              <div className="text-xs text-gray-400">
                {((dictionary.statistics.withISO / dictionary.totalRecords) * 100).toFixed(1)}%
              </div>
            </div>
            <div>
              <div className="text-sm text-gray-500">Rata-rata Penutur</div>
              <div className="text-2xl font-bold">
                {Math.round(dictionary.statistics.avgSpeakers).toLocaleString()}
              </div>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Statistics Card */}
      <Card>
        <CardHeader>
          <CardTitle>Statistik Data</CardTitle>
          <CardDescription>Distribusi dan kelengkapan data</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
            <div className="text-center p-4 border rounded-lg">
              <div className="text-3xl font-bold text-blue-600">{dictionary.statistics.totalRecords}</div>
              <div className="text-sm text-gray-600">Total Bahasa</div>
            </div>
            <div className="text-center p-4 border rounded-lg">
              <div className="text-3xl font-bold text-green-600">{dictionary.statistics.withSpeakers}</div>
              <div className="text-sm text-gray-600">Ada Data Penutur</div>
            </div>
            <div className="text-center p-4 border rounded-lg">
              <div className="text-3xl font-bold text-purple-600">{dictionary.statistics.withISO}</div>
              <div className="text-sm text-gray-600">Ada ISO Code</div>
            </div>
            <div className="text-center p-4 border rounded-lg">
              <div className="text-3xl font-bold text-orange-600">{dictionary.statistics.withProvince}</div>
              <div className="text-sm text-gray-600">Ada Provinsi</div>
            </div>
            <div className="text-center p-4 border rounded-lg">
              <div className="text-3xl font-bold text-red-600">{dictionary.statistics.withFamily}</div>
              <div className="text-sm text-gray-600">Ada Rumpun</div>
            </div>
          </div>

          <div className="mt-6 grid grid-cols-2 gap-4">
            <div>
              <h4 className="font-semibold mb-2">Categorical Values</h4>
              <div className="space-y-1 text-sm">
                <div className="flex justify-between">
                  <span className="text-gray-600">Unique Provinces:</span>
                  <Badge variant="outline">{dictionary.categoricalValues.provinces}</Badge>
                </div>
                <div className="flex justify-between">
                  <span className="text-gray-600">Language Families:</span>
                  <Badge variant="outline">{dictionary.categoricalValues.families}</Badge>
                </div>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Columns Table */}
      <Card>
        <CardHeader>
          <CardTitle>Struktur Kolom</CardTitle>
          <CardDescription>Detail setiap kolom dalam tabel {dictionary.table}</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead className="w-[200px]">Nama Kolom</TableHead>
                  <TableHead className="w-[120px]">Tipe Data</TableHead>
                  <TableHead className="w-[100px]">Nullable</TableHead>
                  <TableHead>Deskripsi</TableHead>
                  <TableHead className="w-[150px]">Contoh Nilai</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {dictionary.columns.map((column, idx) => (
                  <TableRow key={idx}>
                    <TableCell className="font-mono font-semibold">
                      {column.column_name}
                    </TableCell>
                    <TableCell>
                      <Badge variant="secondary" className="font-mono">
                        {column.data_type}
                      </Badge>
                    </TableCell>
                    <TableCell>
                      <Badge variant={column.is_nullable === 'YES' ? 'outline' : 'default'}>
                        {column.is_nullable}
                      </Badge>
                    </TableCell>
                    <TableCell className="text-gray-600 dark:text-gray-400">
                      {columnDescriptions[column.column_name] || '-'}
                    </TableCell>
                    <TableCell className="font-mono text-sm">
                      {column.sample_value !== null && column.sample_value !== undefined
                        ? typeof column.sample_value === 'object'
                          ? JSON.stringify(column.sample_value).substring(0, 50)
                          : String(column.sample_value).substring(0, 50)
                        : 'NULL'}
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </div>
        </CardContent>
      </Card>

      {/* Data Quality Notes */}
      <Card>
        <CardHeader>
          <CardTitle>Catatan Kualitas Data</CardTitle>
          <CardDescription>Informasi tentang kelengkapan dan kualitas data</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <Alert>
            <Info className="h-4 w-4" />
            <AlertDescription>
              <strong>Cakupan Data Penutur:</strong> Saat ini {((dictionary.statistics.withSpeakers / dictionary.totalRecords) * 100).toFixed(1)}% bahasa memiliki data jumlah penutur. 
              Target: 100% coverage untuk semua bahasa.
            </AlertDescription>
          </Alert>

          <Alert>
            <Info className="h-4 w-4" />
            <AlertDescription>
              <strong>Kode ISO 639-3:</strong> {((dictionary.statistics.withISO / dictionary.totalRecords) * 100).toFixed(1)}% bahasa memiliki kode ISO standar internasional. 
              Bahasa tanpa kode ISO biasanya adalah bahasa yang belum terdaftar di SIL International.
            </AlertDescription>
          </Alert>

          <Alert>
            <Info className="h-4 w-4" />
            <AlertDescription>
              <strong>Status Vitalitas:</strong> Berdasarkan klasifikasi UNESCO dan EGIDS (Expanded Graded Intergenerational Disruption Scale). 
              Level 0 (International) hingga 10 (Extinct).
            </AlertDescription>
          </Alert>

          <Alert>
            <Info className="h-4 w-4" />
            <AlertDescription>
              <strong>Data Geografis:</strong> Koordinat latitude/longitude menunjukkan lokasi utama penggunaan bahasa, 
              bukan cakupan wilayah penggunaan bahasa secara keseluruhan.
            </AlertDescription>
          </Alert>
        </CardContent>
      </Card>

      {/* Related Tables */}
      <Card>
        <CardHeader>
          <CardTitle>Tabel Terkait</CardTitle>
          <CardDescription>Tabel-tabel lain yang berelasi dengan tabel bahasa</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="grid md:grid-cols-2 gap-4">
            <div className="border rounded-lg p-4">
              <h4 className="font-semibold mb-2">rumpun_bahasa</h4>
              <p className="text-sm text-gray-600 dark:text-gray-400 mb-2">
                Tabel master untuk klasifikasi rumpun bahasa
              </p>
              <div className="text-xs space-y-1">
                <div><strong>Relasi:</strong> One-to-Many dengan bahasa</div>
                <div><strong>Foreign Key:</strong> bahasa.rumpun_bahasa_id → rumpun_bahasa.id</div>
              </div>
            </div>

            <div className="border rounded-lg p-4">
              <h4 className="font-semibold mb-2">penutur_historis</h4>
              <p className="text-sm text-gray-600 dark:text-gray-400 mb-2">
                Tabel historis jumlah penutur dari waktu ke waktu
              </p>
              <div className="text-xs space-y-1">
                <div><strong>Relasi:</strong> One-to-Many dengan bahasa</div>
                <div><strong>Foreign Key:</strong> penutur_historis.bahasa_id → bahasa.id</div>
              </div>
            </div>

            <div className="border rounded-lg p-4">
              <h4 className="font-semibold mb-2">validation_logs</h4>
              <p className="text-sm text-gray-600 dark:text-gray-400 mb-2">
                Log validasi data yang dijalankan secara berkala
              </p>
              <div className="text-xs space-y-1">
                <div><strong>Relasi:</strong> Independent table</div>
                <div><strong>Purpose:</strong> Tracking data quality over time</div>
              </div>
            </div>

            <div className="border rounded-lg p-4">
              <h4 className="font-semibold mb-2">sumber_data</h4>
              <p className="text-sm text-gray-600 dark:text-gray-400 mb-2">
                Referensi sumber data dan metadata
              </p>
              <div className="text-xs space-y-1">
                <div><strong>Relasi:</strong> Referenced by bahasa.sumber_data</div>
                <div><strong>Purpose:</strong> Data provenance tracking</div>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
