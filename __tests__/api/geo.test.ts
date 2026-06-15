import { describe, it, expect, vi, beforeEach } from 'vitest'
import { createClient } from '@supabase/supabase-js'
import { getCache, setCache, TTL } from '@/lib/cache'
import { apiLimiter } from '@/lib/rate-limit'

vi.mock('@supabase/supabase-js', () => ({
  createClient: vi.fn().mockReturnValue({
    from: vi.fn().mockReturnValue({
      select: vi.fn().mockReturnThis(),
      not: vi.fn().mockReturnThis(),
      eq: vi.fn().mockReturnThis(),
      gte: vi.fn().mockReturnThis(),
    }),
  }),
}))

vi.mock('@/lib/cache', () => ({
  getCache: vi.fn().mockReturnValue(null),
  setCache: vi.fn(),
  TTL: { MARKERS: 5 * 60 * 1000 },
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

import { GET } from '@/app/api/geo/route'

const mockGeoData = [
  {
    id: '1',
    nama_bahasa: 'Jawa',
    koordinat_pusat: { coordinates: [110.0, -7.0] },
    provinsi: 'Jawa Tengah',
    kabupaten: 'Semarang',
    status_vitalitas: 'aman',
    jumlah_penutur: 80000000,
    rumpun_bahasa: { nama_rumpun: 'Austronesia' },
  },
  {
    id: '2',
    nama_bahasa: 'Sunda',
    koordinat_pusat: { coordinates: [107.6, -6.9] },
    provinsi: 'Jawa Barat',
    kabupaten: 'Bandung',
    status_vitalitas: 'aman',
    jumlah_penutur: 40000000,
    rumpun_bahasa: { nama_rumpun: 'Austronesia' },
  },
]

function createRequest(params: string = ''): Request {
  return new Request(`http://localhost:3000/api/geo${params ? '?' + params : ''}`)
}

describe('GET /api/geo', () => {
  beforeEach(() => {
    vi.clearAllMocks()
    vi.mocked(getCache).mockReturnValue(null)
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
  })

  describe('caching', () => {
    it('return cached data kalau ada', async () => {
      const cached = [{ id: '1', nama_bahasa: 'Jawa', latitude: -7, longitude: 110 }]
      vi.mocked(getCache).mockReturnValueOnce(cached)

      const res = await GET(createRequest())
      const body = await res.json()
      expect(body).toEqual(cached)
      expect(res.headers.get('X-Cache')).toBe('HIT')
    })

    it('cache result setelah query berhasil', async () => {
      const mockClient = createClient('', '')
      vi.mocked(mockClient.from).mockReturnValue({
        select: vi.fn().mockReturnThis(),
        not: vi.fn().mockResolvedValue({ data: mockGeoData, error: null }),
        eq: vi.fn().mockReturnThis(),
        gte: vi.fn().mockReturnThis(),
      } as never)

      await GET(createRequest())
      expect(setCache).toHaveBeenCalled()
    })
  })

  describe('filters', () => {
    it('apply provinsi filter', async () => {
      const mockClient = createClient('', '')
      const eqMock = vi.fn().mockReturnThis()
      vi.mocked(mockClient.from).mockReturnValue({
        select: vi.fn().mockReturnThis(),
        not: vi.fn().mockReturnThis(),
        eq: eqMock,
        gte: vi.fn().mockResolvedValue({ data: [], error: null }),
      } as never)

      await GET(createRequest('provinsi=Jawa+Barat'))
      expect(eqMock).toHaveBeenCalledWith('provinsi', 'Jawa Barat')
    })
  })

  describe('error handling', () => {
    it('return 500 kalau supabase error', async () => {
      const mockClient = createClient('', '')
      vi.mocked(mockClient.from).mockReturnValue({
        select: vi.fn().mockReturnThis(),
        not: vi.fn().mockResolvedValue({
          data: null,
          error: { message: 'Connection timeout' },
        }),
        eq: vi.fn().mockReturnThis(),
        gte: vi.fn().mockReturnThis(),
      } as never)

      const res = await GET(createRequest())
      expect(res.status).toBe(500)
      const body = await res.json()
      expect(body.error).toContain('Connection timeout')
    })
  })
})
