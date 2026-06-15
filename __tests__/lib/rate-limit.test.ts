import { describe, it, expect, beforeEach, vi } from 'vitest'
import {
  createRateLimiter,
  rateLimitHeaders,
  apiLimiter,
  exportLimiter,
  searchLimiter,
} from '@/lib/rate-limit'

function makeRequest(ip: string = '1.2.3.4'): Request {
  return new Request('http://localhost:3000/api/test', {
    headers: { 'x-forwarded-for': ip },
  })
}

describe('rate-limit', () => {
  beforeEach(() => {
    vi.useFakeTimers()
    vi.setSystemTime(new Date('2026-01-01T00:00:00Z'))
  })

  describe('createRateLimiter', () => {
    it('allow request pertama', () => {
      const limiter = createRateLimiter({ windowMs: 60000, maxRequests: 5 })
      const result = limiter(makeRequest('10.0.0.1'))
      expect(result.allowed).toBe(true)
      expect(result.remaining).toBe(4)
      expect(result.limit).toBe(5)
    })

    it('decrement remaining setiap request', () => {
      const limiter = createRateLimiter({ windowMs: 60000, maxRequests: 3 })
      const req = makeRequest('10.0.0.2')

      // First request: count=1, remaining = maxRequests - 1 = 2
      const r1 = limiter(req)
      expect(r1.remaining).toBe(2)
      expect(r1.allowed).toBe(true)

      // Second request: count=2, remaining = maxRequests - 2 = 1
      const r2 = limiter(req)
      expect(r2.remaining).toBe(1)
      expect(r2.allowed).toBe(true)

      // Third request: count=3, remaining = maxRequests - 3 = 0, still allowed
      const r3 = limiter(req)
      expect(r3.remaining).toBe(0)
      expect(r3.allowed).toBe(true)

      // Fourth request: count=4, over limit
      const r4 = limiter(req)
      expect(r4.remaining).toBe(0)
      expect(r4.allowed).toBe(false)
    })

    it('block request setelah limit tercapai', () => {
      const limiter = createRateLimiter({ windowMs: 60000, maxRequests: 2 })
      const req = makeRequest('10.0.0.3')

      limiter(req)
      limiter(req)
      const blocked = limiter(req)

      expect(blocked.allowed).toBe(false)
      expect(blocked.remaining).toBe(0)
    })

    it('reset setelah window expired', () => {
      const limiter = createRateLimiter({ windowMs: 1000, maxRequests: 1 })
      const req = makeRequest('10.0.0.4')

      limiter(req)
      const blocked = limiter(req)
      expect(blocked.allowed).toBe(false)

      vi.advanceTimersByTime(1001)

      const afterReset = limiter(req)
      expect(afterReset.allowed).toBe(true)
      expect(afterReset.remaining).toBe(0)
    })

    it('track IP berbeda secara terpisah', () => {
      const limiter = createRateLimiter({ windowMs: 60000, maxRequests: 1 })

      const r1 = limiter(makeRequest('11.1.1.1'))
      expect(r1.allowed).toBe(true)

      const r2 = limiter(makeRequest('11.2.2.2'))
      expect(r2.allowed).toBe(true)

      const r3 = limiter(makeRequest('11.1.1.1'))
      expect(r3.allowed).toBe(false)
    })

    it('pakai custom keyGenerator kalau dikasih', () => {
      const limiter = createRateLimiter({
        windowMs: 60000,
        maxRequests: 1,
        keyGenerator: (req) => req.headers.get('x-api-key') || 'anon',
      })

      const req1 = new Request('http://localhost/api', {
        headers: { 'x-api-key': 'key-a' },
      })
      const req2 = new Request('http://localhost/api', {
        headers: { 'x-api-key': 'key-b' },
      })

      expect(limiter(req1).allowed).toBe(true)
      expect(limiter(req2).allowed).toBe(true)
      expect(limiter(req1).allowed).toBe(false)
    })

    it('fallback ke anonymous kalau tidak ada IP header', () => {
      const limiter = createRateLimiter({ windowMs: 60000, maxRequests: 1 })
      const req = new Request('http://localhost/api')

      expect(limiter(req).allowed).toBe(true)
      expect(limiter(req).allowed).toBe(false)
    })
  })

  describe('rateLimitHeaders', () => {
    it('generate header yang benar', () => {
      const headers = rateLimitHeaders({
        allowed: true,
        remaining: 5,
        resetAt: 1704067200000,
        limit: 10,
      })

      expect(headers['X-RateLimit-Limit']).toBe('10')
      expect(headers['X-RateLimit-Remaining']).toBe('5')
      expect(headers['X-RateLimit-Reset']).toBe('1704067200')
    })
  })

  describe('pre-configured limiters', () => {
    it('apiLimiter: 60 req/min', () => {
      const req = makeRequest('20.0.0.1')
      const result = apiLimiter(req)
      expect(result.limit).toBe(60)
      expect(result.allowed).toBe(true)
    })

    it('exportLimiter: 10 req/min', () => {
      const req = makeRequest('20.0.0.2')
      const result = exportLimiter(req)
      expect(result.limit).toBe(10)
      expect(result.allowed).toBe(true)
    })

    it('searchLimiter: 30 req/min', () => {
      const req = makeRequest('20.0.0.3')
      const result = searchLimiter(req)
      expect(result.limit).toBe(30)
      expect(result.allowed).toBe(true)
    })
  })
})
