import { describe, it, expect } from 'vitest'
import { VITALITAS_COLORS, RUMPUN_COLORS } from '@/lib/types'
import type { BahasaMarker, BahasaDetail, RumpunCount, GlobalStats } from '@/lib/types'

describe('types', () => {
  describe('VITALITAS_COLORS', () => {
    it('punya semua status vitalitas', () => {
      expect(VITALITAS_COLORS).toHaveProperty('aman')
      expect(VITALITAS_COLORS).toHaveProperty('rentan')
      expect(VITALITAS_COLORS).toHaveProperty('terancam')
      expect(VITALITAS_COLORS).toHaveProperty('kritis')
      expect(VITALITAS_COLORS).toHaveProperty('punah')
    })

    it('return valid hex colors', () => {
      Object.values(VITALITAS_COLORS).forEach(color => {
        expect(color).toMatch(/^#[0-9a-f]{6}$/i)
      })
    })

    it('aman = hijau, kritis/punah = merah', () => {
      expect(VITALITAS_COLORS.aman).toBe('#22c55e')
      expect(VITALITAS_COLORS.kritis).toBe('#ef4444')
      expect(VITALITAS_COLORS.punah).toBe('#ef4444')
    })
  })

  describe('RUMPUN_COLORS', () => {
    it('punya warna untuk rumpun utama', () => {
      expect(RUMPUN_COLORS).toHaveProperty('Austronesia')
      expect(RUMPUN_COLORS).toHaveProperty('Papua')
      expect(RUMPUN_COLORS).toHaveProperty('Trans-New Guinea')
    })

    it('return valid hex colors', () => {
      Object.values(RUMPUN_COLORS).forEach(color => {
        expect(color).toMatch(/^#[0-9a-f]{6}$/i)
      })
    })
  })

  describe('type shapes', () => {
    it('BahasaMarker structure valid', () => {
      const marker: BahasaMarker = {
        id: '1',
        namaBahasa: 'Jawa',
        namaLokal: null,
        kodeIso639: 'jav',
        jumlahPenutur: 80000000,
        statusVitalitas: 'aman',
        rumpunNama: 'Austronesia',
        lat: -7.0,
        lng: 110.0,
      }
      expect(marker.namaBahasa).toBe('Jawa')
      expect(marker.lat).toBeTypeOf('number')
    })

    it('BahasaDetail structure valid dengan nested objects', () => {
      const detail: BahasaDetail = {
        id: '1',
        namaBahasa: 'Sunda',
        namaLokal: null,
        kodeIso639: 'sun',
        rumpunNama: 'Austronesia',
        subRumpun: 'Melayu-Polinesia',
        jumlahPenutur: 40000000,
        statusVitalitas: 'aman',
        autoSummary: null,
        fiturLinguistik: {
          sistemTulisan: 'Latin',
          tipeMorfologi: 'aglutinatif',
          urutanKata: 'SVO',
          jumlahVokal: 6,
          jumlahKonsonan: 18,
        },
        lokasi: [{ provinsi: 'Jawa Barat', kabupaten: 'Bandung', tipeWilayah: 'dataran' }],
        kosakata: [{ kata: 'samping', artiIndonesia: 'samping', fonetikIpa: null }],
      }
      expect(detail.fiturLinguistik?.urutanKata).toBe('SVO')
      expect(detail.lokasi).toHaveLength(1)
    })

    it('RumpunCount structure valid', () => {
      const rumpun: RumpunCount = {
        id: '1',
        namaRumpun: 'Austronesia',
        subRumpun: null,
        bahasaCount: 500,
      }
      expect(rumpun.bahasaCount).toBeGreaterThan(0)
    })

    it('GlobalStats structure valid', () => {
      const stats: GlobalStats = {
        totalBahasa: 700,
        totalRumpun: 10,
        totalLokasi: 34,
        vitalitasBreakdown: { aman: 400, rentan: 200, terancam: 80, kritis: 20 },
      }
      expect(stats.totalBahasa).toBe(700)
      expect(Object.keys(stats.vitalitasBreakdown).length).toBeGreaterThan(0)
    })
  })
})
