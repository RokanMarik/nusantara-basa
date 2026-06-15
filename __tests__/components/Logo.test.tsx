import { describe, it, expect } from 'vitest'
import { render, screen } from '@testing-library/react'
import { Logo } from '@/components/shared/Logo'

describe('Logo', () => {
  it('render text "Nusantara" dan "Basa"', () => {
    render(<Logo />)
    expect(screen.getByText('Nusantara')).toBeInTheDocument()
    expect(screen.getByText('Basa')).toBeInTheDocument()
  })

  it('render SVG logo', () => {
    const { container } = render(<Logo />)
    const svg = container.querySelector('svg')
    expect(svg).not.toBeNull()
  })

  it('size sm → icon 28px', () => {
    const { container } = render(<Logo size="sm" />)
    const svg = container.querySelector('svg')
    expect(svg?.getAttribute('width')).toBe('28')
    expect(svg?.getAttribute('height')).toBe('28')
  })

  it('size md (default) → icon 32px', () => {
    const { container } = render(<Logo />)
    const svg = container.querySelector('svg')
    expect(svg?.getAttribute('width')).toBe('32')
    expect(svg?.getAttribute('height')).toBe('32')
  })

  it('size lg → icon 48px', () => {
    const { container } = render(<Logo size="lg" />)
    const svg = container.querySelector('svg')
    expect(svg?.getAttribute('width')).toBe('48')
    expect(svg?.getAttribute('height')).toBe('48')
  })

  it('size sm → text class text-lg', () => {
    const { container } = render(<Logo size="sm" />)
    const nusantara = container.querySelector('.text-lg')
    expect(nusantara).not.toBeNull()
  })

  it('size md → text class text-xl', () => {
    const { container } = render(<Logo size="md" />)
    const nusantara = container.querySelector('.text-xl')
    expect(nusantara).not.toBeNull()
  })

  it('size lg → text class text-3xl', () => {
    const { container } = render(<Logo size="lg" />)
    const nusantara = container.querySelector('.text-3xl')
    expect(nusantara).not.toBeNull()
  })
})
