import { describe, it, expect, vi, beforeEach } from 'vitest'
import { NextRequest } from 'next/server'
import { createClient } from '@supabase/supabase-js'
import { GET } from '@/app/api/data-dictionary/route'

vi.mock('@supabase/supabase-js', () => ({
  createClient: vi.fn().mockReturnValue({
    from: vi.fn().mockReturnValue({
      select: vi.fn().mockReturnThis(),
      limit: vi.fn().mockReturnThis(),
      not: vi.fn().mockReturnThis(),
    }),
  }),
}))

function createRequest(): NextRequest {
  return new NextRequest('http://localhost:3000/api/data-dictionary')
}

const mockSampleBahasa = [
  {
    id: '1',
    nama_bahasa: 'Jawa',
    nama_lokal: 'Basa Jawa',
    kode_iso_639: 'jav',
    jumlah_penutur: 80000000,
    status_vitalitas: 'aman',
    provinsi: 'Jawa Tengah',
    rumpun_bahasa_id: 'rumpun-1',
  },
]

describe('GET /api/data-dictionary', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('success', () => {
    it('return table schema dan statistics', async () => {
      const mockClient = createClient('', '')
      
      vi.mocked(mockClient.from)
        .mockReturnValueOnce({
          select: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue({
            data: mockSampleBahasa,
            error: null,
          }),
        } as never)
        .mockReturnValueOnce({
          select: vi.fn().mockResolvedValue({
            data: mockSampleBahasa,
            error: null,
          }),
        } as never)
        .mockReturnValueOnce({
          select: vi.fn().mockReturnThis(),
          not: vi.fn().mockResolvedValue({
            data: [{ provinsi: 'Jawa Tengah' }],
            error: null,
          }),
        } as never)
        .mockReturnValueOnce({
          select: vi.fn().mockResolvedValue({
            data: [{ id: 'rumpun-1', nama: 'Austronesia' }],
            error: null,
          }),
        } as never)

      const res = await GET(createRequest())
      expect(res.status).toBe(200)
      const body = await res.json()
      
      expect(body.success).toBe(true)
      expect(body.data.table).toBe('bahasa')
      expect(body.data.columns).toBeDefined()
      expect(body.data.statistics).toBeDefined()
      expect(body.data.statistics.totalRecords).toBe(1)
    })
  })

  describe('schema inference', () => {
    it('infer data_type dari sample row', async () => {
      const mockClient = createClient('', '')
      
      vi.mocked(mockClient.from)
        .mockReturnValueOnce({
          select: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue({
            data: mockSampleBahasa,
            error: null,
          }),
        } as never)
        .mockReturnValueOnce({
          select: vi.fn().mockResolvedValue({ data: mockSampleBahasa, error: null }),
        } as never)
        .mockReturnValueOnce({
          select: vi.fn().mockReturnThis(),
          not: vi.fn().mockResolvedValue({ data: [], error: null }),
        } as never)
        .mockReturnValueOnce({
          select: vi.fn().mockResolvedValue({ data: [], error: null }),
        } as never)

      const res = await GET(createRequest())
      const body = await res.json()
      
      const namaColumn = body.data.columns.find((c: { column_name: string }) => c.column_name === 'nama_bahasa')
      expect(namaColumn.data_type).toBe('string')
    })
  })

  describe('statistics', () => {
    it('hitung withSpeakers, withISO, withProvince, withFamily', async () => {
      const mockClient = createClient('', '')
      
      vi.mocked(mockClient.from)
        .mockReturnValueOnce({
          select: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue({
            data: mockSampleBahasa,
            error: null,
          }),
        } as never)
        .mockReturnValueOnce({
          select: vi.fn().mockResolvedValue({ data: mockSampleBahasa, error: null }),
        } as never)
        .mockReturnValueOnce({
          select: vi.fn().mockReturnThis(),
          not: vi.fn().mockResolvedValue({ data: [], error: null }),
        } as never)
        .mockReturnValueOnce({
          select: vi.fn().mockResolvedValue({ data: [], error: null }),
        } as never)

      const res = await GET(createRequest())
      const body = await res.json()
      
      expect(body.data.statistics.withSpeakers).toBe(1)
      expect(body.data.statistics.withISO).toBe(1)
      expect(body.data.statistics.withProvince).toBe(1)
      expect(body.data.statistics.withFamily).toBe(1)
    })
  })

  describe('error handling', () => {
    it('return 500 dengan error message', async () => {
      const mockClient = createClient('', '')
      
      vi.mocked(mockClient.from).mockReturnValueOnce({
        select: vi.fn().mockReturnThis(),
        limit: vi.fn().mockResolvedValue({
          data: null,
          error: { message: 'Connection failed' },
        }),
      } as never)

      const res = await GET(createRequest())
      expect(res.status).toBe(500)
      const body = await res.json()
      expect(body.success).toBe(false)
      expect(body.error).toBe('Connection failed')
    })
  })
})
