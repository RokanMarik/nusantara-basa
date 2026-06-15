import { describe, it, expect } from 'vitest'
import { render, screen } from '@testing-library/react'
import { Badge, badgeVariants } from '@/components/ui/badge'

describe('Badge', () => {
  it('render dengan default variant', () => {
    render(<Badge>Aman</Badge>)
    expect(screen.getByText('Aman')).toBeInTheDocument()
  })

  it('render children text', () => {
    render(<Badge>Kritis</Badge>)
    expect(screen.getByText('Kritis')).toBeInTheDocument()
  })

  it('apply default variant classes', () => {
    render(<Badge>Default</Badge>)
    const badge = screen.getByText('Default')
    expect(badge.className).toContain('bg-primary')
  })

  it('apply secondary variant', () => {
    render(<Badge variant="secondary">Secondary</Badge>)
    const badge = screen.getByText('Secondary')
    expect(badge.className).toContain('secondary')
  })

  it('apply destructive variant', () => {
    render(<Badge variant="destructive">Danger</Badge>)
    const badge = screen.getByText('Danger')
    expect(badge.className).toContain('destructive')
  })

  it('apply outline variant', () => {
    render(<Badge variant="outline">Outline</Badge>)
    const badge = screen.getByText('Outline')
    expect(badge.className).toContain('text-foreground')
  })

  it('merge custom className', () => {
    render(<Badge className="text-red-500">Custom</Badge>)
    const badge = screen.getByText('Custom')
    expect(badge.className).toContain('text-red-500')
  })

  it('base classes selalu ada', () => {
    render(<Badge>Base</Badge>)
    const badge = screen.getByText('Base')
    expect(badge.className).toContain('inline-flex')
    expect(badge.className).toContain('rounded-full')
    expect(badge.className).toContain('text-xs')
  })
})

describe('badgeVariants', () => {
  it('return string class dengan default variant', () => {
    const cls = badgeVariants()
    expect(cls).toContain('inline-flex')
    expect(cls).toContain('bg-primary')
  })

  it('return string class dengan specific variant', () => {
    const cls = badgeVariants({ variant: 'destructive' })
    expect(cls).toContain('destructive')
  })
})
