import { describe, it, expect, vi, beforeEach } from 'vitest'
import { NextRequest } from 'next/server'
import { GET } from '@/app/api/family-tree/route'

const { mockFrom } = vi.hoisted(() => {
  return { mockFrom: vi.fn() }
})

vi.mock('@supabase/supabase-js', () => ({
  createClient: vi.fn().mockReturnValue({
    from: mockFrom,
  }),
}))

function createRequest(): NextRequest {
  return new NextRequest('http://localhost:3000/api/family-tree')
}

const mockFamilies = [
  {
    id: 'root-1',
    nama_rumpun: 'Austronesia',
    parent_id: null,
    level_taksonomi: 1,
  },
  {
    id: 'child-1',
    nama_rumpun: 'Melayu-Polinesia',
    parent_id: 'root-1',
    level_taksonomi: 2,
  },
]

const mockLanguages = [
  {
    id: '1',
    nama_bahasa: 'Jawa',
    kode_iso_639: 'jav',
    jumlah_penutur: 80000000,
    status_vitalitas: 'aman',
    egids_level: '1',
    provinsi: 'Jawa Tengah',
    wilayah: 'Jawa',
    rumpun_bahasa_id: 'child-1',
  },
  {
    id: '2',
    nama_bahasa: 'Sunda',
    kode_iso_639: 'sun',
    jumlah_penutur: 40000000,
    status_vitalitas: 'aman',
    egids_level: '2',
    provinsi: 'Jawa Barat',
    wilayah: 'Jawa',
    rumpun_bahasa_id: 'child-1',
  },
]

// families query: select → order → order (double order chaining)
function mockDoubleOrder(data: unknown, error: unknown) {
  const order2 = vi.fn().mockResolvedValue({ data, error })
  const order1 = vi.fn().mockReturnValue({ order: order2 })
  return { select: vi.fn().mockReturnValue({ order: order1 }) }
}

// languages query: select → order (single order)
function mockSingleOrder(data: unknown, error: unknown) {
  const order = vi.fn().mockResolvedValue({ data, error })
  return { select: vi.fn().mockReturnValue({ order }) }
}

describe('GET /api/family-tree', () => {
  beforeEach(() => {
    vi.clearAllMocks()
    // Re-setup default mock setelah clearAllMocks
    mockFrom
      .mockReturnValueOnce(mockDoubleOrder(mockFamilies, null))
      .mockReturnValueOnce(mockSingleOrder(mockLanguages, null))
  })

  describe('success', () => {
    it('return tree structure dengan parent-child relationships', async () => {
      const res = await GET(createRequest())
      expect(res.status).toBe(200)
      const body = await res.json()
      
      expect(body.success).toBe(true)
      expect(body.data).toBeDefined()
      expect(body.allFamilies).toBeDefined()
      expect(body.stats).toBeDefined()
      expect(body.stats.totalFamilies).toBe(2)
      expect(body.stats.totalLanguages).toBe(2)
    })

    it('build hierarchical tree dari flat data', async () => {
      const res = await GET(createRequest())
      const body = await res.json()
      
      const rootFamily = body.allFamilies.find((f: { id: string }) => f.id === 'root-1')
      expect(rootFamily).toBeDefined()
    })

    it('calculate languageCount per node', async () => {
      const res = await GET(createRequest())
      const body = await res.json()
      
      const childFamily = body.allFamilies.find((f: { id: string }) => f.id === 'child-1')
      expect(childFamily.languageCount).toBe(2)
    })
  })

  describe('error handling', () => {
    it('return 500 kalau families query error', async () => {
      // Override default mock: families query error
      mockFrom.mockReset()
      mockFrom.mockReturnValueOnce(
        mockDoubleOrder(null, { message: 'Families query failed' })
      )

      const res = await GET(createRequest())
      expect(res.status).toBe(500)
      const body = await res.json()
      expect(body.error).toBe('Families query failed')
    })

    it('return 500 kalau languages query error', async () => {
      mockFrom.mockReset()
      mockFrom
        .mockReturnValueOnce(mockDoubleOrder(mockFamilies, null))
        .mockReturnValueOnce(mockSingleOrder(null, { message: 'Languages query failed' }))

      const res = await GET(createRequest())
      expect(res.status).toBe(500)
      const body = await res.json()
      expect(body.error).toBe('Languages query failed')
    })
  })

  describe('empty data', () => {
    it('handle empty families dan languages', async () => {
      mockFrom.mockReset()
      mockFrom
        .mockReturnValueOnce(mockDoubleOrder([], null))
        .mockReturnValueOnce(mockSingleOrder([], null))

      const res = await GET(createRequest())
      expect(res.status).toBe(200)
      const body = await res.json()
      
      expect(body.allFamilies).toEqual([])
      expect(body.stats.totalFamilies).toBe(0)
      expect(body.stats.totalLanguages).toBe(0)
    })
  })
})
