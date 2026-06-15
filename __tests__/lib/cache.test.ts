import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest'
import { getCache, setCache, clearCache, TTL } from '@/lib/cache'

describe('cache', () => {
  beforeEach(() => {
    clearCache()
  })

  describe('getCache / setCache', () => {
    it('return null kalau key tidak ada', () => {
      expect(getCache('nonexistent')).toBeNull()
    })

    it('simpan dan ambil data', () => {
      const data = { nama: 'Jawa', penutur: 80000000 }
      setCache('test-key', data, 60000)
      expect(getCache('test-key')).toEqual(data)
    })

    it('return null kalau cache expired', () => {
      vi.useFakeTimers()
      setCache('expiring', 'data', 1000)

      // Sebelum expired
      expect(getCache('expiring')).toBe('data')

      // Setelah expired
      vi.advanceTimersByTime(1001)
      expect(getCache('expiring')).toBeNull()

      vi.useRealTimers()
    })

    it('overwrite cache dengan key yang sama', () => {
      setCache('key', 'old', 60000)
      setCache('key', 'new', 60000)
      expect(getCache('key')).toBe('new')
    })

    it('handle complex objects', () => {
      const complex = {
        languages: [{ id: '1', name: 'Jawa' }, { id: '2', name: 'Sunda' }],
        meta: { total: 2, timestamp: Date.now() },
      }
      setCache('complex', complex, 60000)
      expect(getCache('complex')).toEqual(complex)
    })
  })

  describe('clearCache', () => {
    it('hapus semua cache entries', () => {
      setCache('a', 1, 60000)
      setCache('b', 2, 60000)
      clearCache()
      expect(getCache('a')).toBeNull()
      expect(getCache('b')).toBeNull()
    })
  })

  describe('TTL constants', () => {
    it('punya nilai yang benar', () => {
      expect(TTL.MARKERS).toBe(5 * 60 * 1000)       // 5 menit
      expect(TTL.STATS).toBe(60 * 60 * 1000)         // 1 jam
      expect(TTL.RUMPUN).toBe(60 * 60 * 1000)        // 1 jam
      expect(TTL.DETAIL).toBe(60 * 60 * 1000)        // 1 jam
    })
  })
})
