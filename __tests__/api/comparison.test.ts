import { describe, it, expect, vi, beforeEach } from 'vitest'
import { NextRequest } from 'next/server'
import { POST } from '@/app/api/comparison/route'
import { supabase } from '@/lib/supabase'

vi.mock('@/lib/supabase', () => ({
  supabase: {
    from: vi.fn().mockReturnValue({
      select: vi.fn().mockReturnThis(),
      eq: vi.fn().mockReturnThis(),
      single: vi.fn(),
    }),
  },
}))

interface MockBahasa {
  id: string
  nama_bahasa: string
  nama_lokal: string | null
  kode_iso_639: string | null
  jumlah_penutur: number | null
  egids_level: string | null
  status_vitalitas: string | null
  wilayah: string | null
  provinsi: string | null
  kabupaten: string | null
  catatan: string | null
  sumber_referensi: string | null
  koordinat_pusat: {
    coordinates: [number, number] // [longitude, latitude]
  } | null
  rumpun_bahasa: {
    nama_rumpun: string
    parent_id: string | null
  } | null
}

const mockBahasa1: MockBahasa = {
  id: '1',
  nama_bahasa: 'Bahasa A',
  nama_lokal: 'Local A',
  kode_iso_639: 'bsa',
  jumlah_penutur: 10000,
  egids_level: '6a',
  status_vitalitas: 'aman',
  wilayah: 'Pesisir',
  provinsi: 'Jawa Barat',
  kabupaten: 'Bandung',
  catatan: null,
  sumber_referensi: null,
  koordinat_pusat: { coordinates: [107.6, -6.9] },
  rumpun_bahasa: { nama_rumpun: 'Austronesia', parent_id: null },
}

const mockBahasa2: MockBahasa = {
  id: '2',
  nama_bahasa: 'Bahasa B',
  nama_lokal: 'Local B',
  kode_iso_639: 'bsb',
  jumlah_penutur: 5000,
  egids_level: '6b',
  status_vitalitas: 'rentan',
  wilayah: 'Pegunungan',
  provinsi: 'Jawa Tengah',
  kabupaten: 'Semarang',
  catatan: null,
  sumber_referensi: null,
  koordinat_pusat: { coordinates: [110.4, -7.0] },
  rumpun_bahasa: { nama_rumpun: 'Austronesia', parent_id: null },
}

const mockBahasa3: MockBahasa = {
  id: '3',
  nama_bahasa: 'Bahasa C',
  nama_lokal: 'Local C',
  kode_iso_639: 'bsc',
  jumlah_penutur: 2000,
  egids_level: '7',
  status_vitalitas: 'terancam',
  wilayah: 'Kepulauan',
  provinsi: 'Papua',
  kabupaten: 'Jayapura',
  catatan: null,
  sumber_referensi: null,
  koordinat_pusat: { coordinates: [140.7, -2.5] },
  rumpun_bahasa: { nama_rumpun: 'Papua', parent_id: null },
}

function createRequest(body: unknown): NextRequest {
  return new NextRequest('http://localhost:3000/api/comparison', {
    method: 'POST',
    body: JSON.stringify(body),
  })
}

describe('POST /api/comparison', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('validation', () => {
    it('reject non-array languageIds', async () => {
      const req = createRequest({ languageIds: 'not-array' })
      const res = await POST(req)
      const data = await res.json()

      expect(res.status).toBe(400)
      expect(data.error).toBe('languageIds must be an array')
    })

    it('reject missing languageIds', async () => {
      const req = createRequest({})
      const res = await POST(req)
      const data = await res.json()

      expect(res.status).toBe(400)
      expect(data.error).toBe('languageIds must be an array')
    })

    it('reject less than 2 languages', async () => {
      const req = createRequest({ languageIds: ['1'] })
      const res = await POST(req)
      const data = await res.json()

      expect(res.status).toBe(400)
      expect(data.error).toBe('At least 2 languages required for comparison')
    })

    it('reject more than 5 languages', async () => {
      const req = createRequest({ languageIds: ['1', '2', '3', '4', '5', '6'] })
      const res = await POST(req)
      const data = await res.json()

      expect(res.status).toBe(400)
      expect(data.error).toBe('Maximum 5 languages allowed for comparison')
    })

    it('return 404 when language not found', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle
        .mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: null, error: { message: 'Not found' } })

      const req = createRequest({ languageIds: ['1', '999'] })
      const res = await POST(req)
      const data = await res.json()

      expect(res.status).toBe(404)
      expect(data.error).toBe('One or more languages not found')
    })
  })

  describe('success response', () => {
    it('return comparison data for 2 languages', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle
        .mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: mockBahasa2, error: null })

      const req = createRequest({ languageIds: ['1', '2'] })
      const res = await POST(req)
      const data = await res.json()

      expect(res.status).toBe(200)
      expect(data).toHaveProperty('languages')
      expect(data).toHaveProperty('metrics')
      expect(data).toHaveProperty('insights')
      expect(data).toHaveProperty('metadata')

      expect(data.languages).toHaveLength(2)
      expect(data.languages[0]).toHaveProperty('namaBahasa', 'Bahasa A')
      expect(data.languages[1]).toHaveProperty('namaBahasa', 'Bahasa B')
    })

    it('calculate distance between languages with coordinates', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle
        .mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: mockBahasa2, error: null })

      const req = createRequest({ languageIds: ['1', '2'] })
      const res = await POST(req)
      const data = await res.json()

      expect(data.metrics.proximity).toBeDefined()
      expect(data.metrics.proximity['1']).toBeDefined()
      expect(data.metrics.proximity['1']['2']).toBeGreaterThan(0)
    })

    it('generate insights for speaker ratio', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle
        .mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: mockBahasa2, error: null })

      const req = createRequest({ languageIds: ['1', '2'] })
      const res = await POST(req)
      const data = await res.json()

      const speakerInsight = data.insights.find((i: string) =>
        i.includes('more speakers')
      )
      expect(speakerInsight).toBeDefined()
      expect(speakerInsight).toContain('Bahasa A')
      expect(speakerInsight).toContain('2x')
    })

    it('generate insights for closest pair', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle
        .mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: mockBahasa2, error: null })

      const req = createRequest({ languageIds: ['1', '2'] })
      const res = await POST(req)
      const data = await res.json()

      const proximityInsight = data.insights.find((i: string) =>
        i.includes('Closest pair')
      )
      expect(proximityInsight).toBeDefined()
      expect(proximityInsight).toContain('km apart')
    })

    it('generate insight when all languages have same family', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle
        .mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: mockBahasa2, error: null })

      const req = createRequest({ languageIds: ['1', '2'] })
      const res = await POST(req)
      const data = await res.json()

      const familyInsight = data.insights.find((i: string) =>
        i.includes('same family')
      )
      expect(familyInsight).toBe(
        'All languages belong to the same family: Austronesia'
      )
    })

    it('generate insight when languages have different families', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle
        .mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: mockBahasa3, error: null })

      const req = createRequest({ languageIds: ['1', '3'] })
      const res = await POST(req)
      const data = await res.json()

      const familyInsight = data.insights.find((i: string) =>
        i.includes('different language families')
      )
      expect(familyInsight).toBe(
        'All languages belong to different language families'
      )
    })

    it('calculate correct metadata', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle
        .mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: mockBahasa2, error: null })

      const req = createRequest({ languageIds: ['1', '2'] })
      const res = await POST(req)
      const data = await res.json()

      expect(data.metadata.totalLanguages).toBe(2)
      expect(data.metadata.languagesWithSpeakers).toBe(2)
      expect(data.metadata.languagesWithCoordinates).toBe(2)
      expect(data.metadata.averageSpeakers).toBe(7500)
    })

    it('map snake_case to camelCase correctly', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle.mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: mockBahasa2, error: null })

      const req = createRequest({ languageIds: ['1', '2'] })
      const res = await POST(req)
      const data = await res.json()

      const lang = data.languages[0]
      expect(lang).toHaveProperty('namaBahasa')
      expect(lang).toHaveProperty('namaLokal')
      expect(lang).toHaveProperty('kodeIso639')
      expect(lang).toHaveProperty('jumlahPenutur')
      expect(lang).toHaveProperty('egidsLevel')
      expect(lang).toHaveProperty('statusVitalitas')
      expect(lang).toHaveProperty('koordinatPusat')
      expect(lang).toHaveProperty('rumpunBahasa')
    })

    it('handle languages without coordinates', async () => {
      const bahasaNoCoords: MockBahasa = {
        ...mockBahasa2,
        koordinat_pusat: null,
      }

      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle
        .mockResolvedValueOnce({ data: mockBahasa1, error: null })
        .mockResolvedValueOnce({ data: bahasaNoCoords, error: null })

      const req = createRequest({ languageIds: ['1', '2'] })
      const res = await POST(req)
      const data = await res.json()

      expect(res.status).toBe(200)
      expect(data.metadata.languagesWithCoordinates).toBe(1)
      expect(Object.keys(data.metrics.proximity)).toHaveLength(0)
    })
  })

  describe('error handling', () => {
    it('return 500 on unexpected error', async () => {
      const mockSingle = vi.mocked(supabase.from('').single)
      mockSingle.mockRejectedValueOnce(new Error('Database error'))

      const req = createRequest({ languageIds: ['1', '2'] })
      const res = await POST(req)
      const data = await res.json()

      expect(res.status).toBe(500)
      expect(data.error).toBe('Internal server error')
    })
  })
})
