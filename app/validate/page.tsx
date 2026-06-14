'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'

interface ValidationExample {
  id: string
  nama_bahasa: string
  issue: string
}

interface ValidationCheck {
  id: string
  name: string
  description: string
  status: "pass" | "warning" | "fail"
  severity: "low" | "medium" | "high" | "critical"
  count?: number
  details?: string
  examples?: ValidationExample[]
}

interface ValidationResult {
  timestamp: string
  total_checks: number
  pass_count: number
  warning_count: number
  fail_count: number
  score: number
  checks: ValidationCheck[]
}

export default function ValidationPage() {
  const [result, setResult] = useState<ValidationResult | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchValidation() {
      try {
        const response = await fetch('/api/validate')
        const data = await response.json()
        setResult(data)
      } catch (err: any) {
        setError(err.message || 'Gagal memuat data validasi')
      } finally {
        setLoading(false)
      }
    }

    fetchValidation()
  }, [])

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'pass': return 'bg-green-100 text-green-800 border-green-200'
      case 'warning': return 'bg-yellow-100 text-yellow-800 border-yellow-200'
      case 'fail': return 'bg-red-100 text-red-800 border-red-200'
      default: return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'pass': return '✓'
      case 'warning': return '⚠'
      case 'fail': return '✗'
      default: return '?'
    }
  }

  const getSeverityColor = (severity: string) => {
    switch (severity) {
      case 'critical': return 'bg-red-600 text-white'
      case 'high': return 'bg-orange-600 text-white'
      case 'medium': return 'bg-yellow-600 text-white'
      case 'low': return 'bg-blue-600 text-white'
      default: return 'bg-gray-600 text-white'
    }
  }

  const getScoreColor = (score: number) => {
    if (score >= 80) return 'text-green-600'
    if (score >= 60) return 'text-yellow-600'
    return 'text-red-600'
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
          <p className="mt-4 text-gray-600">Menjalankan validasi data...</p>
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

  if (!result) return null

  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-7xl mx-auto">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h1 className="text-4xl font-bold text-gray-900 mb-2">
              Validasi Data Bahasa
            </h1>
            <p className="text-gray-600">
              Pemeriksaan kualitas dan konsistensi data
            </p>
          </div>
          <Link
            href="/dashboard"
            className="px-4 py-2 bg-gray-600 text-white rounded hover:bg-gray-700 text-sm"
          >
            ← Kembali ke Dashboard
          </Link>
        </div>

        {/* Overall Score Card */}
        <div className="bg-white rounded-lg shadow-lg p-6 mb-8">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
            <div className="text-center">
              <div className={`text-5xl font-bold ${getScoreColor(result.score)}`}>
                {result.score}%
              </div>
              <p className="text-sm text-gray-600 mt-2">Skor Kualitas</p>
            </div>
            <div className="text-center">
              <div className="text-3xl font-bold text-green-600">
                {result.pass_count}
              </div>
              <p className="text-sm text-gray-600 mt-2">Lulus</p>
            </div>
            <div className="text-center">
              <div className="text-3xl font-bold text-yellow-600">
                {result.warning_count}
              </div>
              <p className="text-sm text-gray-600 mt-2">Peringatan</p>
            </div>
            <div className="text-center">
              <div className="text-3xl font-bold text-red-600">
                {result.fail_count}
              </div>
              <p className="text-sm text-gray-600 mt-2">Gagal</p>
            </div>
          </div>
          <div className="mt-4 pt-4 border-t border-gray-200">
            <p className="text-xs text-gray-500 text-center">
              Terakhir dijalankan: {new Date(result.timestamp).toLocaleString('id-ID')}
            </p>
          </div>
        </div>

        {/* Validation Checks */}
        <div className="space-y-4">
          {result.checks.map((check) => (
            <div key={check.id} className="bg-white rounded-lg shadow p-6">
              <div className="flex items-start justify-between mb-3">
                <div className="flex-1">
                  <div className="flex items-center gap-3 mb-2">
                    <span className={`text-2xl ${check.status === 'pass' ? 'text-green-600' : check.status === 'warning' ? 'text-yellow-600' : 'text-red-600'}`}>
                      {getStatusIcon(check.status)}
                    </span>
                    <h3 className="text-lg font-semibold text-gray-900">
                      {check.name}
                    </h3>
                    <span className={`px-2 py-1 rounded text-xs font-medium ${getSeverityColor(check.severity)}`}>
                      {check.severity}
                    </span>
                  </div>
                  <p className="text-sm text-gray-600 mb-2">
                    {check.description}
                  </p>
                  {check.details && (
                    <p className="text-sm font-medium text-gray-700">
                      {check.details}
                    </p>
                  )}
                </div>
                <div className="flex flex-col items-end">
                  <span className={`px-3 py-1 rounded-full text-sm font-medium border ${getStatusColor(check.status)}`}>
                    {check.status === 'pass' ? 'LULUS' : check.status === 'warning' ? 'PERINGATAN' : 'GAGAL'}
                  </span>
                  {check.count !== undefined && check.count > 0 && (
                    <span className="mt-2 text-2xl font-bold text-gray-900">
                      {check.count}
                    </span>
                  )}
                </div>
              </div>

              {/* Examples */}
              {check.examples && check.examples.length > 0 && (
                <div className="mt-4 pt-4 border-t border-gray-200">
                  <h4 className="text-sm font-semibold text-gray-700 mb-2">
                    Contoh ({check.examples.length} dari {check.count}):
                  </h4>
                  <div className="space-y-1">
                    {check.examples.map((example, idx) => (
                      <div key={idx} className="flex items-center gap-2 text-sm bg-gray-50 p-2 rounded">
                        <Link
                          href={`/explore/bahasa/${example.id}`}
                          className="text-blue-600 hover:underline font-medium"
                        >
                          {example.nama_bahasa}
                        </Link>
                        <span className="text-gray-600">-</span>
                        <span className="text-gray-700">{example.issue}</span>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>
          ))}
        </div>

        {/* Recommendations */}
        <div className="mt-8 bg-blue-50 border border-blue-200 rounded-lg p-6">
          <h2 className="text-xl font-semibold text-blue-900 mb-3">
            Rekomendasi Tindakan
          </h2>
          <ul className="space-y-2 text-sm text-blue-800">
            {result.fail_count > 0 && (
              <li className="flex items-start gap-2">
                <span className="text-red-600 mt-0.5">●</span>
                <span><strong>Segera perbaiki {result.fail_count} masalah kritis</strong> yang dapat mempengaruhi integritas data</span>
              </li>
            )}
            {result.warning_count > 0 && (
              <li className="flex items-start gap-2">
                <span className="text-yellow-600 mt-0.5">●</span>
                <span><strong>Tangani {result.warning_count} peringatan</strong> untuk meningkatkan kualitas data</span>
              </li>
            )}
            {result.score < 80 && (
              <li className="flex items-start gap-2">
                <span className="text-blue-600 mt-0.5">●</span>
                <span><strong>Tingkatkan kelengkapan data</strong> terutama kode ISO, koordinat, dan status vitalitas</span>
              </li>
            )}
            <li className="flex items-start gap-2">
              <span className="text-blue-600 mt-0.5">●</span>
              <span><strong>Jalankan validasi secara berkala</strong> untuk memantau kualitas data</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  )
}
