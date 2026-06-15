import { describe, it, expect, vi, beforeEach } from 'vitest'
import { NextRequest } from 'next/server'
import { GET } from '@/app/api/stats/route'
import { getCache, setCache } from '@/lib/cache'
import { apiLimiter } from '@/lib/rate-limit'

const { mockFrom } = vi.hoisted(() => {
  return { mockFrom: vi.fn() }
})

vi.mock('@supabase/supabase-js', () => ({
  createClient: vi.fn().mockReturnValue({
    from: mockFrom,
  }),
}))

vi.mock('@/lib/cache', () => ({
  getCache: vi.fn().mockReturnValue(null),
  setCache: vi.fn(),
  TTL: { STATS: 60 * 60 * 1000 },
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
  const url = `http://localhost:3000/api/stats${params ? '?' + params : ''}`
  return new NextRequest(url)
}

/**
 * Bikin mock chain yang thenable.
 * Setiap method (select/not/eq/order/limit) return chain-nya sendiri.
 * Chain juga punya `then` supaya bisa di-await kapan saja di chain.
 */
function makeQueryResult(data: unknown = [], error: unknown = null, count: number = 0) {
  const result = { data, error, count }
  const chain: { [key: string]: unknown } = {
    select: vi.fn(),
    not: vi.fn(),
    eq: vi.fn(),
    order: vi.fn(),
    limit: vi.fn(),
    then: (resolve: (v: unknown) => unknown, reject: (e: unknown) => unknown) =>
      Promise.resolve(result).then(resolve, reject),
  }
  chain.select = vi.fn().mockReturnValue(chain)
  chain.not = vi.fn().mockReturnValue(chain)
  chain.eq = vi.fn().mockReturnValue(chain)
  chain.order = vi.fn().mockReturnValue(chain)
  chain.limit = vi.fn().mockReturnValue(chain)
  return chain
}

describe('GET /api/stats', () => {
  beforeEach(() => {
    vi.clearAllMocks()
    vi.mocked(getCache).mockReturnValue(null)

    // 7 parallel queries via Promise.all
    for (let i = 0; i < 7; i++) {
      mockFrom.mockReturnValueOnce(makeQueryResult([], null))
    }
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
      const cached = {
        totalBahasa: 700,
        totalRumpun: 10,
        vitalitasBreakdown: { aman: 400 },
      }
      vi.mocked(getCache).mockReturnValueOnce(cached)

      const res = await GET(createRequest())
      const body = await res.json()
      expect(body).toEqual(cached)
      expect(res.headers.get('X-Cache')).toBe('HIT')
    })

    it('call setCache setelah berhasil fetch data', async () => {
      const res = await GET(createRequest())
      expect(res.status).toBe(200)
      expect(setCache).toHaveBeenCalled()
    })
  })

  describe('filters', () => {
    it('generate cache key berdasarkan provinsi dan wilayah', async () => {
      await GET(createRequest('provinsi=Jawa+Barat&wilayah=Jawa'))
      expect(getCache).toHaveBeenCalledWith('stats:Jawa Barat:Jawa')
    })
  })
})
