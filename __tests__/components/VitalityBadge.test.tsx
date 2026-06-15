import { describe, it, expect } from 'vitest'
import { render, screen } from '@testing-library/react'
import { VitalityBadge } from '@/components/ui/VitalityBadge'
import { VITALITAS_COLORS } from '@/lib/types'

describe('VitalityBadge', () => {
  it('return null kalau status null', () => {
    const { container } = render(<VitalityBadge status={null} />)
    expect(container.innerHTML).toBe('')
  })

  it('render status text dengan huruf kapital', () => {
    render(<VitalityBadge status="aman" />)
    expect(screen.getByText('Aman')).toBeInTheDocument()
  })

  it('render dengan correct color untuk aman', () => {
    render(<VitalityBadge status="aman" />)
    const badge = screen.getByRole('status')
    expect(badge).toHaveStyle({ backgroundColor: VITALITAS_COLORS.aman })
  })

  it('render dengan correct color untuk kritis', () => {
    render(<VitalityBadge status="kritis" />)
    const badge = screen.getByRole('status')
    expect(badge).toHaveStyle({ backgroundColor: VITALITAS_COLORS.kritis })
  })

  it('render dengan correct color untuk rentan', () => {
    render(<VitalityBadge status="rentan" />)
    const badge = screen.getByRole('status')
    expect(badge).toHaveStyle({ backgroundColor: VITALITAS_COLORS.rentan })
  })

  it('fallback ke gray untuk status unknown', () => {
    render(<VitalityBadge status="tidak-diketahui" />)
    const badge = screen.getByRole('status')
    expect(badge).toHaveStyle({ backgroundColor: '#9ca3af' })
  })

  it('size sm (default) pakai small text classes', () => {
    render(<VitalityBadge status="aman" />)
    const badge = screen.getByRole('status')
    expect(badge.className).toContain('text-[10px]')
    expect(badge.className).toContain('px-2')
  })

  it('size md pakai larger text classes', () => {
    render(<VitalityBadge status="aman" size="md" />)
    const badge = screen.getByRole('status')
    expect(badge.className).toContain('text-xs')
    expect(badge.className).toContain('px-3')
  })

  it('punya aria-label', () => {
    render(<VitalityBadge status="aman" />)
    const badge = screen.getByRole('status')
    expect(badge).toHaveAttribute('aria-label', 'Vitality status: aman')
  })

  it('capitalize status "sangat terancam"', () => {
    render(<VitalityBadge status="sangat terancam" />)
    expect(screen.getByText('Sangat terancam')).toBeInTheDocument()
  })
})
