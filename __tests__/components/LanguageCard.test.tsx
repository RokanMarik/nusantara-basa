import { describe, it, expect, vi } from 'vitest'
import { render, screen } from '@testing-library/react'
import { LanguageCard } from '@/components/ui/LanguageCard'

vi.mock('next/link', () => ({
  default: ({ children, href, ...props }: { children: React.ReactNode; href: string; [key: string]: unknown }) => (
    <a href={href} {...props}>{children}</a>
  ),
}))

describe('LanguageCard', () => {
  const defaultProps = {
    id: '1',
    namaBahasa: 'Jawa',
    namaLokal: 'Basa Jawa',
    jumlahPenutur: 80000000,
    statusVitalitas: 'aman',
    rumpunNama: 'Austronesia',
  }

  it('render nama bahasa', () => {
    render(<LanguageCard {...defaultProps} />)
    expect(screen.getByText('Jawa')).toBeInTheDocument()
  })

  it('render nama lokal kalau ada', () => {
    render(<LanguageCard {...defaultProps} />)
    expect(screen.getByText('Basa Jawa')).toBeInTheDocument()
  })

  it('tidak render nama lokal kalau null', () => {
    render(<LanguageCard {...defaultProps} namaLokal={null} />)
    expect(screen.queryByText('Basa Jawa')).not.toBeInTheDocument()
  })

  it('format penutur >= 1 juta jadi X.XM', () => {
    render(<LanguageCard {...defaultProps} jumlahPenutur={80000000} />)
    expect(screen.getByText('80.0M penutur')).toBeInTheDocument()
  })

  it('format penutur >= 1000 tapi < 1 juta jadi XK', () => {
    render(<LanguageCard {...defaultProps} jumlahPenutur={500000} />)
    expect(screen.getByText('500K penutur')).toBeInTheDocument()
  })

  it('format penutur null jadi dash', () => {
    render(<LanguageCard {...defaultProps} jumlahPenutur={null} />)
    expect(screen.getByText('— penutur')).toBeInTheDocument()
  })

  it('render rumpun nama kalau ada', () => {
    render(<LanguageCard {...defaultProps} />)
    expect(screen.getByText('Austronesia')).toBeInTheDocument()
  })

  it('tidak render rumpun nama kalau null', () => {
    render(<LanguageCard {...defaultProps} rumpunNama={null} />)
    expect(screen.queryByText('Austronesia')).not.toBeInTheDocument()
  })

  it('link href ke halaman detail bahasa', () => {
    render(<LanguageCard {...defaultProps} />)
    const link = screen.getByRole('link')
    expect(link).toHaveAttribute('href', '/explore/bahasa/1')
  })

  it('render VitalityBadge', () => {
    render(<LanguageCard {...defaultProps} />)
    expect(screen.getByRole('status')).toBeInTheDocument()
  })
})
