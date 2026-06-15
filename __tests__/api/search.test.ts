import { describe, it, expect, vi, beforeEach } from 'vitest'
import { NextRequest } from 'next/server'
import { POST } from '@/app/api/search/route'
import { supabase } from '@/lib/supabase'
import { getCache, setCache } from '@/lib/cache'

vi.mock('@/lib/supabase', () => ({
  supabase: {
    from: vi.fn().mockReturnValue({
      select: vi.fn().mockReturnThis(),
      eq: vi.fn().mockReturnThis(),
      or: vi.fn().mockReturnThis(),
      in: vi.fn().mockReturnThis(),
      order: vi.fn().mockReturnThis(),
      limit: vi.fn(),
    }),
  },
}))

vi.mock('@/lib/cache', () => ({
  getCache: vi.fn(),
  setCache: vi.fn(),
  TTL: {
    MARKERS: 5 * 60 * 1000,
  },
}))

interface SearchResult {
  id: string
  namaBahasa: string
  namaLokal: string | null
  kodeIso639: string | null
  jumlahPenutur: number | null
  statusVitalitas: string | null
  rumpunNama: string | null
  lat: number | null
  lng: number | null
}

interface SearchResponse {
  results: SearchResult[]
  usedAI: boolean
  filters?: unknown
  query: string
}

interface MockBahasa {
  id: string
  nama_bahasa: string
  nama_lokal: string | null
  kode_iso_639: string | null
  jumlah_penutur: number | null
  status_vitalitas: string | null
  koordinat_pusat: {
    coordinates: [number, number]
  } | null
  rumpun_bahasa: {
    nama_rumpun: string
  } | null
}

const mockBahasa: MockBahasa = {
  id: '1',
  nama_bahasa: 'Bahasa Test',
  nama_lokal: 'Local Test',
  kode_iso_639: 'tst',
  jumlah_penutur: 5000,
  status_vitalitas: 'aman',
  koordinat_pusat: { coordinates: [107.6, -6.9] },
  rumpun_bahasa: { nama_rumpun: 'Austronesia' },
}

function createRequest(body: unknown): NextRequest {
  return new NextRequest('http://localhost:3000/api/search', {
    method: 'POST',
    body: JSON.stringify(body),
  })
}

describe('POST /api/search', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('validation', () => {
    it('reject missing query', async () => {
      const req = createRequest({})
      const res = await POST(req)
      const data: SearchResponse = await res.json()

      expect(res.status).toBe(400)
      expect(data.results).toBeUndefined()
    })

    it('reject non-string query', async () => {
      const req = createRequest({ query: 123 })
      const res = await POST(req)

      expect(res.status).toBe(400)
    })

    it('reject empty string query', async () => {
      const req = createRequest({ query: '' })
      const res = await POST(req)

      expect(res.status).toBe(400)
    })
  })

  describe('cache', () => {
    it('return cached result if available', async () => {
      const cachedResponse: SearchResponse = {
        results: [
          {
            id: '1',
            namaBahasa: 'Cached',
            namaLokal: null,
            kodeIso639: null,
            jumlahPenutur: null,
            statusVitalitas: null,
            rumpunNama: null,
            lat: null,
            lng: null,
          },
        ],
        usedAI: false,
        query: 'test',
      }

      vi.mocked(getCache).mockReturnValueOnce(cachedResponse)

      const req = createRequest({ query: 'test' })
      const res = await POST(req)
      const data: SearchResponse = await res.json()

      expect(res.status).toBe(200)
      expect(data).toEqual(cachedResponse)
      expect(getCache).toHaveBeenCalledWith('search:test')
    })

    it('cache result after successful search', async () => {
      vi.mocked(getCache).mockReturnValueOnce(null)
      
      global.fetch = vi.fn().mockRejectedValueOnce(new Error('9Router fail'))
      
      const mockLimit = vi.mocked(supabase.from('').limit)
      mockLimit
        .mockResolvedValueOnce({ data: [], error: null })
        .mockResolvedValueOnce({ data: [mockBahasa], error: null })

      const req = createRequest({ query: 'test' })
      const res = await POST(req)

      expect(res.status).toBe(200)
      expect(setCache).toHaveBeenCalled()
    })
  })

  describe('AI fallback', () => {
    it('use keywordFallback when 9Router fails', async () => {
      vi.mocked(getCache).mockReturnValueOnce(null)
      
      global.fetch = vi.fn().mockRejectedValueOnce(new Error('9Router error'))
      
      const mockLimit = vi.mocked(supabase.from('').limit)
      mockLimit
        .mockResolvedValueOnce({ data: [], error: null })
        .mockResolvedValueOnce({ data: [mockBahasa], error: null })

      const req = createRequest({ query: 'bahasa test' })
      const res = await POST(req)
      const data: SearchResponse = await res.json()

      expect(res.status).toBe(200)
      expect(data.usedAI).toBe(false)
    })

    it('remove stop words in keywordFallback', async () => {
      vi.mocked(getCache).mockReturnValueOnce(null)
      
      global.fetch = vi.fn().mockRejectedValueOnce(new Error('fail'))
      
      const mockOr = vi.mocked(supabase.from('').or)
      const mockLimit = vi.mocked(supabase.from('').limit)
      
      mockLimit
        .mockResolvedValueOnce({ data: [], error: null })
        .mockResolvedValueOnce({ data: [mockBahasa], error: null })

      const req = createRequest({ query: 'bahasa di yang test' })
      const res = await POST(req)
      const data: SearchResponse = await res.json()

      expect(res.status).toBe(200)
      expect(data.usedAI).toBe(false)
      expect(mockOr).toHaveBeenCalledWith(
        expect.stringContaining('test')
      )
    })

    it('return empty array when only stop words', async () => {
      vi.mocked(getCache).mockReturnValueOnce(null)
      
      global.fetch = vi.fn().mockRejectedValueOnce(new Error('fail'))

      const req = createRequest({ query: 'bahasa di yang dengan' })
      const res = await POST(req)
      const data: SearchResponse = await res.json()

      expect(res.status).toBe(200)
      expect(data.results).toEqual([])
      expect(data.usedAI).toBe(false)
    })
  })

  describe('success with AI', () => {
    it('use 9Router filters when available', async () => {
      vi.mocked(getCache).mockReturnValueOnce(null)
      
      const aiResponse = {
        choices: [
          {
            message: {
              content: JSON.stringify({
                vitalitas: ['aman'],
                provinsi: ['Jawa Barat'],
              }),
            },
          },
        ],
      }

      global.fetch = vi.fn().mockResolvedValueOnce({
        ok: true,
        json: async () => aiResponse,
      })

      const mockLimit = vi.mocked(supabase.from('').limit)
      mockLimit.mockResolvedValueOnce({ data: [mockBahasa], error: null })

      const req = createRequest({ query: 'bahasa aman di Jawa Barat' })
      const res = await POST(req)
      const data: SearchResponse = await res.json()

      expect(res.status).toBe(200)
      expect(data.usedAI).toBe(true)
      expect(data.filters).toBeDefined()
    })

    it('filter out results without coordinates', async () => {
      vi.mocked(getCache).mockReturnValueOnce(null)
      
      const bahasaNoCoords: MockBahasa = {
        ...mockBahasa,
        koordinat_pusat: null,
      }

      global.fetch = vi.fn().mockRejectedValueOnce(new Error('fail'))
      
      const mockLimit = vi.mocked(supabase.from('').limit)
      mockLimit
        .mockResolvedValueOnce({ data: [], error: null })
        .mockResolvedValueOnce({ data: [bahasaNoCoords], error: null })

      const req = createRequest({ query: 'test' })
      const res = await POST(req)
      const data: SearchResponse = await res.json()

      expect(res.status).toBe(200)
      expect(data.results).toHaveLength(0)
    })

    it('return empty results when keyword fallback finds no matches', async () => {
      vi.mocked(getCache).mockReturnValueOnce(null)
      
      global.fetch = vi.fn().mockRejectedValueOnce(new Error('fail'))
      
      const mockLimit = vi.mocked(supabase.from('').limit)
      mockLimit
        .mockResolvedValueOnce({ data: [], error: null })
        .mockResolvedValueOnce({ data: [], error: null })

      const req = createRequest({ query: 'xyznonexistent' })
      const res = await POST(req)
      const data: SearchResponse = await res.json()

      expect(res.status).toBe(200)
      expect(data.usedAI).toBe(false)
      expect(data.results).toHaveLength(0)
    })
  })

  describe('caching', () => {
    it('return cached results without querying supabase', async () => {
      const cachedResponse = {
        results: [{ id: '1', namaBahasa: 'Cached' }],
        usedAI: false,
        query: 'cached',
      }
      vi.mocked(getCache).mockReturnValueOnce(cachedResponse)

      const req = createRequest({ query: 'cached' })
      const res = await POST(req)
      const data = await res.json()

      expect(data).toEqual(cachedResponse)
    })
  })
})
