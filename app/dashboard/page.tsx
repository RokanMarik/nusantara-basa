'use client'

import { useEffect, useState } from 'react'
import {
  PieChart,
  Pie,
  Cell,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from 'recharts'
import dynamic from 'next/dynamic'
import type { LanguageGeoData } from '@/app/api/geo/route'

const MapComponent = dynamic(() => import('@/components/map/MapComponent'), {
  ssr: false,
  loading: () => <div className="h-96 bg-gray-100 animate-pulse rounded-lg flex items-center justify-center">Memuat peta...</div>
})

interface StatsData {
  total: {
    bahasa: number
    withSpeakers: number
  }
  vitalitas: Array<{ name: string; value: number }>
  wilayah: Array<{ name: string; value: number }>
  provinsi: Array<{ name: string; value: number }>
  topLanguages: Array<{
    name: string
    speakers: number
    status: string
  }>
  egids: Array<{ name: string; value: number }>
}

const COLORS = {
  Aman: '#10b981',
  Rentan: '#f59e0b',
  'Terancam Punah': '#ef4444',
  Punah: '#6b7280',
  'Tidak Diketahui': '#9ca3af',
}

const CHART_COLORS = [
  '#3b82f6',
  '#10b981',
  '#f59e0b',
  '#ef4444',
  '#8b5cf6',
  '#ec4899',
  '#14b8a6',
  '#f97316',
  '#6366f1',
  '#84cc16',
]

export default function DashboardPage() {
  const [data, setData] = useState<StatsData | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [filterProvinsi, setFilterProvinsi] = useState<string>('')
  const [filterWilayah, setFilterWilayah] = useState<string>('')
  const [allProvinsi, setAllProvinsi] = useState<string[]>([])
  const [allWilayah, setAllWilayah] = useState<string[]>([])
  const [geoData, setGeoData] = useState<LanguageGeoData[]>([])
  const [geoLoading, setGeoLoading] = useState(true)

  useEffect(() => {
    async function fetchStats() {
      try {
        const response = await fetch('/api/stats')
        const result = await response.json()
        
        if (result.success) {
          setData(result.data)
          setAllProvinsi(result.data.provinsi.map((p: any) => p.name))
          setAllWilayah(result.data.wilayah.map((w: any) => w.name))
        } else {
          setError(result.error || 'Gagal memuat data')
        }
      } catch (err: any) {
        setError(err.message || 'Terjadi kesalahan')
      } finally {
        setLoading(false)
      }
    }

    fetchStats()
  }, [])

  useEffect(() => {
    async function fetchGeoData() {
      try {
        const params = new URLSearchParams()
        if (filterProvinsi) params.append('provinsi', filterProvinsi)
        const response = await fetch(`/api/geo?${params.toString()}`)
        const data = await response.json()
        setGeoData(data)
      } catch (err: any) {
        console.error('Error fetching geo data:', err)
      } finally {
        setGeoLoading(false)
      }
    }

    fetchGeoData()
  }, [filterProvinsi])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="mt-4 text-gray-600">Memuat data statistik...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <p className="text-red-600 text-lg">Error: {error}</p>
          <button
            onClick={() => window.location.reload()}
            className="mt-4 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
          >
            Coba Lagi
          </button>
        </div>
      </div>
    )
  }

  if (!data) return null

  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-7xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-2">
          Dashboard Statistik Bahasa
        </h1>
        <p className="text-gray-600 mb-4">
          Visualisasi data bahasa daerah di Indonesia
        </p>

        {/* Filter & Export Controls */}
        <div className="flex flex-wrap gap-4 mb-8 bg-white p-4 rounded-lg shadow">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Filter Provinsi</label>
            <select
              value={filterProvinsi}
              onChange={(e) => setFilterProvinsi(e.target.value)}
              className="border border-gray-300 rounded px-3 py-1.5 text-sm"
            >
              <option value="">Semua Provinsi</option>
              {allProvinsi.map(p => <option key={p} value={p}>{p}</option>)}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Filter Wilayah</label>
            <select
              value={filterWilayah}
              onChange={(e) => setFilterWilayah(e.target.value)}
              className="border border-gray-300 rounded px-3 py-1.5 text-sm"
            >
              <option value="">Semua Wilayah</option>
              {allWilayah.map(w => <option key={w} value={w}>{w}</option>)}
            </select>
          </div>
          <div className="flex items-end gap-2">
            <a
              href={`/api/export?format=csv${filterProvinsi ? `&provinsi=${encodeURIComponent(filterProvinsi)}` : ''}`}
              className="px-4 py-1.5 bg-blue-600 text-white rounded text-sm font-bold hover:bg-blue-700"
            >
              Export CSV
            </a>
            <a
              href={`/api/export?format=json${filterProvinsi ? `&provinsi=${encodeURIComponent(filterProvinsi)}` : ''}`}
              className="px-4 py-1.5 bg-green-600 text-white rounded text-sm font-bold hover:bg-green-700"
            >
              Export JSON
            </a>
          </div>
        </div>

        {/* Interactive Map Section */}
        <div className="bg-white rounded-lg shadow p-6 mb-8">
          <h2 className="text-xl font-semibold mb-4">
            Peta Sebaran Bahasa ({geoData.length} bahasa dengan koordinat)
          </h2>
          <div className="h-[500px] rounded-lg overflow-hidden border border-gray-200">
            {geoLoading ? (
              <div className="h-full flex items-center justify-center bg-gray-100">
                <div className="text-center">
                  <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto"></div>
                  <p className="mt-2 text-sm text-gray-600">Memuat peta...</p>
                </div>
              </div>
            ) : (
              <MapComponent
                languages={geoData}
                center={[-2.5, 118]}
                zoom={5}
                onLanguageClick={(lang) => {
                  console.log('Selected language:', lang)
                }}
              />
            )}
          </div>
          <p className="text-xs text-gray-500 mt-2">
            Klik marker untuk melihat detail bahasa. Zoom in/out untuk melihat area spesifik.
          </p>
        </div>

        {/* Summary Cards */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
          <div className="bg-white rounded-lg shadow p-6">
            <h3 className="text-sm font-medium text-gray-500 uppercase">
              Total Bahasa
            </h3>
            <p className="text-3xl font-bold text-gray-900 mt-2">
              {data.total.bahasa}
            </p>
          </div>
          <div className="bg-white rounded-lg shadow p-6">
            <h3 className="text-sm font-medium text-gray-500 uppercase">
              Dengan Data Penutur
            </h3>
            <p className="text-3xl font-bold text-gray-900 mt-2">
              {data.total.withSpeakers}
            </p>
          </div>
          <div className="bg-white rounded-lg shadow p-6">
            <h3 className="text-sm font-medium text-gray-500 uppercase">
              Bahasa Aman
            </h3>
            <p className="text-3xl font-bold text-green-600 mt-2">
              {data.vitalitas.find(v => v.name === 'Aman')?.value || 0}
            </p>
          </div>
        </div>

        {/* Charts Grid */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
          {/* Vitalitas Distribution */}
          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-semibold mb-4">
              Distribusi Status Vitalitas
            </h2>
            <ResponsiveContainer width="100%" height={300}>
              <PieChart>
                <Pie
                  data={data.vitalitas}
                  cx="50%"
                  cy="50%"
                  labelLine={false}
                  label={(entry) => `${entry.name}: ${entry.value}`}
                  outerRadius={80}
                  fill="#8884d8"
                  dataKey="value"
                >
                  {data.vitalitas.map((entry, index) => (
                    <Cell
                      key={`cell-${index}`}
                      fill={COLORS[entry.name as keyof typeof COLORS] || CHART_COLORS[index % CHART_COLORS.length]}
                    />
                  ))}
                </Pie>
                <Tooltip />
              </PieChart>
            </ResponsiveContainer>
          </div>

          {/* EGIDS Distribution */}
          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-semibold mb-4">
              Distribusi Level EGIDS
            </h2>
            <ResponsiveContainer width="100%" height={300}>
              <BarChart data={data.egids}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="name" angle={-45} textAnchor="end" height={100} />
                <YAxis />
                <Tooltip />
                <Bar dataKey="value" fill="#3b82f6" />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* Top Languages */}
        <div className="bg-white rounded-lg shadow p-6 mb-8">
          <h2 className="text-xl font-semibold mb-4">
            Top 10 Bahasa dengan Penutur Terbanyak
          </h2>
          <ResponsiveContainer width="100%" height={400}>
            <BarChart data={data.topLanguages} layout="vertical">
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis type="number" />
              <YAxis dataKey="name" type="category" width={150} />
              <Tooltip
                formatter={(value: any) => [
                  `${value.toLocaleString()} penutur`,
                  'Jumlah Penutur',
                ]}
              />
              <Bar dataKey="speakers" fill="#10b981" />
            </BarChart>
          </ResponsiveContainer>
        </div>

        {/* Wilayah Distribution */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-semibold mb-4">
              Distribusi Wilayah
            </h2>
            <ResponsiveContainer width="100%" height={400}>
              <BarChart data={data.wilayah}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="name" angle={-45} textAnchor="end" height={100} />
                <YAxis />
                <Tooltip />
                <Bar dataKey="value" fill="#8b5cf6" />
              </BarChart>
            </ResponsiveContainer>
          </div>

          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-semibold mb-4">
              Top 15 Provinsi
            </h2>
            <ResponsiveContainer width="100%" height={400}>
              <BarChart data={data.provinsi} layout="vertical">
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis type="number" />
                <YAxis dataKey="name" type="category" width={150} />
                <Tooltip />
                <Bar dataKey="value" fill="#ec4899" />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>
      </div>
    </div>
  )
}
