import { describe, it, expect, vi, beforeEach } from 'vitest'
import { NextRequest } from 'next/server'
import { createClient } from '@supabase/supabase-js'
import { GET } from '@/app/api/export/route'
import { exportLimiter } from '@/lib/rate-limit'

vi.mock('@supabase/supabase-js', () => ({
  createClient: vi.fn().mockReturnValue({
    from: vi.fn().mockReturnValue({
      select: vi.fn().mockReturnThis(),
      eq: vi.fn().mockReturnThis(),
      gte: vi.fn().mockReturnThis(),
      lte: vi.fn().mockReturnThis(),
      ilike: vi.fn().mockReturnThis(),
      or: vi.fn().mockResolvedValue({
        data: [],
        count: 0,
        error: null,
      }),
    }),
  }),
}))

vi.mock('@/lib/rate-limit', () => ({
  exportLimiter: vi.fn().mockReturnValue({
    allowed: true,
    remaining: 9,
    resetAt: Date.now() + 60000,
    limit: 10,
  }),
  rateLimitHeaders: vi.fn().mockReturnValue({
    'X-RateLimit-Limit': '10',
    'X-RateLimit-Remaining': '9',
    'X-RateLimit-Reset': '1704067200',
  }),
}))

function createRequest(params: string = ''): NextRequest {
  const url = `http://localhost:3000/api/export${params ? '?' + params : ''}`
  return new NextRequest(url)
}

const mockExportData = [
  {
    id: '1',
    nama_bahasa: 'Jawa',
    nama_lokal: 'Basa Jawa',
    kode_iso_639: 'jav',
    jumlah_penutur: 80000000,
    status_vitalitas: 'aman',
    wilayah: 'Jawa',
    provinsi: 'Jawa Tengah',
    kabupaten: 'Semarang',
    egids_level: '1',
    rumpun_bahasa: { nama_rumpun: 'Austronesia' },
  },
]

describe('GET /api/export', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('rate limiting', () => {
    it('return 429 kalau export limit exceeded', async () => {
      vi.mocked(exportLimiter).mockReturnValueOnce({
        allowed: false,
        remaining: 0,
        resetAt: Date.now() + 60000,
        limit: 10,
      })

      const res = await GET(createRequest())
      expect(res.status).toBe(429)
      const body = await res.json()
      expect(body.error).toBe('Too many requests')
    })
  })

  describe('JSON format (default)', () => {
    it('return JSON dengan Content-Disposition header', async () => {
      const mockClient = createClient('', '')
      vi.mocked(mockClient.from).mockReturnValue({
        select: vi.fn().mockResolvedValue({
          data: mockExportData,
          count: 1,
          error: null,
        }),
        eq: vi.fn().mockReturnThis(),
        gte: vi.fn().mockReturnThis(),
        lte: vi.fn().mockReturnThis(),
        ilike: vi.fn().mockReturnThis(),
        or: vi.fn().mockReturnThis(),
      } as never)

      const res = await GET(createRequest())
      expect(res.status).toBe(200)
      expect(res.headers.get('Content-Disposition')).toContain('attachment')
      expect(res.headers.get('Content-Disposition')).toContain('.json')
    })
  })

  describe('CSV format', () => {
    it('return 404 kalau data kosong', async () => {
      const mockClient = createClient('', '')
      vi.mocked(mockClient.from).mockReturnValue({
        select: vi.fn().mockResolvedValue({
          data: [],
          count: 0,
          error: null,
        }),
        eq: vi.fn().mockReturnThis(),
        gte: vi.fn().mockReturnThis(),
        lte: vi.fn().mockReturnThis(),
        ilike: vi.fn().mockReturnThis(),
        or: vi.fn().mockReturnThis(),
      } as never)

      const res = await GET(createRequest('format=csv'))
      expect(res.status).toBe(404)
    })
  })

  describe('filters', () => {
    it('apply vitalitas filter', async () => {
      const mockClient = createClient('', '')
      const eqMock = vi.fn().mockReturnThis()
      vi.mocked(mockClient.from).mockReturnValue({
        select: vi.fn().mockReturnThis(),
        eq: eqMock,
        gte: vi.fn().mockReturnThis(),
        lte: vi.fn().mockReturnThis(),
        ilike: vi.fn().mockReturnThis(),
        or: vi.fn().mockResolvedValue({
          data: mockExportData,
          count: 1,
          error: null,
        }),
      } as never)

      await GET(createRequest('vitalitas=aman'))
      expect(eqMock).toHaveBeenCalledWith('status_vitalitas', 'aman')
    })

    it('apply min_penutur filter', async () => {
      const mockClient = createClient('', '')
      const gteMock = vi.fn().mockReturnThis()
      vi.mocked(mockClient.from).mockReturnValue({
        select: vi.fn().mockReturnThis(),
        eq: vi.fn().mockReturnThis(),
        gte: gteMock,
        lte: vi.fn().mockReturnThis(),
        ilike: vi.fn().mockReturnThis(),
        or: vi.fn().mockResolvedValue({
          data: mockExportData,
          count: 1,
          error: null,
        }),
      } as never)

      await GET(createRequest('min_penutur=1000000'))
      expect(gteMock).toHaveBeenCalledWith('jumlah_penutur', 1000000)
    })
  })

  describe('error handling', () => {
    it('return 500 kalau supabase error', async () => {
      const mockClient = createClient('', '')
      vi.mocked(mockClient.from).mockReturnValue({
        select: vi.fn().mockResolvedValue({
          data: null,
          count: null,
          error: { message: 'Query failed' },
        }),
        eq: vi.fn().mockReturnThis(),
        gte: vi.fn().mockReturnThis(),
        lte: vi.fn().mockReturnThis(),
        ilike: vi.fn().mockReturnThis(),
        or: vi.fn().mockReturnThis(),
      } as never)

      const res = await GET(createRequest())
      expect(res.status).toBe(500)
      const body = await res.json()
      expect(body.error).toBe('Query failed')
    })
  })
})
