import { describe, it, expect, vi, beforeEach } from 'vitest'
import { NextRequest } from 'next/server'
import { GET } from '@/app/api/bahasa/route'
import { supabase } from '@/lib/supabase'
import { apiLimiter } from '@/lib/rate-limit'

vi.mock('@/lib/supabase', () => ({
  supabase: {
    from: vi.fn().mockReturnValue({
      select: vi.fn().mockReturnThis(),
      order: vi.fn().mockReturnThis(),
      eq: vi.fn().mockReturnThis(),
      or: vi.fn().mockReturnThis(),
      range: vi.fn().mockResolvedValue({ data: [], count: 0, error: null }),
    }),
  },
}))

vi.mock('@/lib/rate-limit', () => ({
  apiLimiter: vi.fn().mockReturnValue({
    allowed: true,
    remaining: 59,
    resetAt: Date.now() + 60000,
    limit: 60,
  }),
  rateLimitHeaders: vi.fn().mockReturnValue({
    'X-RateLimit-Limit': '60',
    'X-RateLimit-Remaining': '59',
    'X-RateLimit-Reset': '1704067200',
  }),
}))

function createRequest(params: string = ''): NextRequest {
  const url = `http://localhost:3000/api/bahasa${params ? '?' + params : ''}`
  return new NextRequest(url)
}

const mockBahasaData = [
  {
    id: '1',
    nama_bahasa: 'Jawa',
    nama_lokal: 'Basa Jawa',
    kode_iso_639: 'jav',
    jumlah_penutur: 80000000,
    status_vitalitas: 'aman',
    egids_level: '1',
    rumpun_bahasa: { nama_rumpun: 'Austronesia' },
  },
  {
    id: '2',
    nama_bahasa: 'Sunda',
    nama_lokal: 'Basa Sunda',
    kode_iso_639: 'sun',
    jumlah_penutur: 40000000,
    status_vitalitas: 'aman',
    egids_level: '2',
    rumpun_bahasa: { nama_rumpun: 'Austronesia' },
  },
]

describe('GET /api/bahasa', () => {
  beforeEach(() => {
    vi.clearAllMocks()
    const mockFrom = vi.mocked(supabase.from)
    const mockQuery = {
      select: vi.fn().mockReturnThis(),
      order: vi.fn().mockReturnThis(),
      eq: vi.fn().mockReturnThis(),
      or: vi.fn().mockReturnThis(),
      range: vi.fn().mockReturnThis(),
      then: vi.fn((resolve) => resolve({
        data: mockBahasaData,
        count: 2,
        error: null,
      })),
    }
    mockFrom.mockReturnValue(mockQuery as never)
  })

  describe('rate limiting', () => {
    it('return 429 kalau rate limit exceeded', async () => {
      vi.mocked(apiLimiter).mockReturnValueOnce({
        allowed: false,
        remaining: 0,
        resetAt: Date.now() + 60000,
        limit: 60,
      })

      const res = await GET(createRequest())
      expect(res.status).toBe(429)
      const body = await res.json()
      expect(body.error).toBe('Too many requests')
    })

    it('allow request kalau belum limit', async () => {
      const res = await GET(createRequest())
      expect(res.status).toBe(200)
    })
  })

  describe('pagination', () => {
    it('default limit=50, offset=0', async () => {
      const res = await GET(createRequest())
      const body = await res.json()
      expect(body.limit).toBe(50)
      expect(body.offset).toBe(0)
    })

    it('custom limit dan offset', async () => {
      const res = await GET(createRequest('limit=10&offset=20'))
      const body = await res.json()
      expect(body.limit).toBe(10)
      expect(body.offset).toBe(20)
    })
  })

  describe('data format', () => {
    it('map snake_case ke camelCase', async () => {
      const res = await GET(createRequest())
      const body = await res.json()

      expect(body.data[0]).toEqual({
        id: '1',
        namaBahasa: 'Jawa',
        namaLokal: 'Basa Jawa',
        kodeIso639: 'jav',
        jumlahPenutur: 80000000,
        statusVitalitas: 'aman',
        egidsLevel: '1',
        rumpunNama: 'Austronesia',
      })
    })

    it('return total count', async () => {
      const res = await GET(createRequest())
      const body = await res.json()
      expect(body.total).toBe(2)
    })
  })

  describe('filters', () => {
    it('apply vitalitas filter', async () => {
      const mockFrom = vi.mocked(supabase.from)
      const eqMock = vi.fn().mockReturnThis()
      const rangeMock = vi.fn().mockResolvedValue({
        data: [mockBahasaData[0]],
        count: 1,
        error: null,
      })

      mockFrom.mockReturnValue({
        select: vi.fn().mockReturnThis(),
        order: vi.fn().mockReturnThis(),
        eq: eqMock,
        or: vi.fn().mockReturnThis(),
        range: rangeMock,
      } as never)

      await GET(createRequest('vitalitas=aman'))
      expect(eqMock).toHaveBeenCalledWith('status_vitalitas', 'aman')
    })

    it('apply search filter', async () => {
      const mockFrom = vi.mocked(supabase.from)
      const orMock = vi.fn().mockReturnThis()
      const rangeMock = vi.fn().mockResolvedValue({
        data: mockBahasaData,
        count: 2,
        error: null,
      })

      mockFrom.mockReturnValue({
        select: vi.fn().mockReturnThis(),
        order: vi.fn().mockReturnThis(),
        eq: vi.fn().mockReturnThis(),
        or: orMock,
        range: rangeMock,
      } as never)

      await GET(createRequest('search=jawa'))
      expect(orMock).toHaveBeenCalled()
    })
  })

  describe('error handling', () => {
    it('return 500 kalau supabase error', async () => {
      const mockFrom = vi.mocked(supabase.from)
      const mockQuery = {
        select: vi.fn().mockReturnThis(),
        order: vi.fn().mockReturnThis(),
        eq: vi.fn().mockReturnThis(),
        or: vi.fn().mockReturnThis(),
        range: vi.fn().mockReturnThis(),
        then: vi.fn((resolve) => resolve({
          data: null,
          count: null,
          error: { message: 'Database connection failed' },
        })),
      }
      mockFrom.mockReturnValue(mockQuery as never)

      const res = await GET(createRequest())
      expect(res.status).toBe(500)
      const body = await res.json()
      expect(body.error).toBe('Database connection failed')
    })
  })
})
