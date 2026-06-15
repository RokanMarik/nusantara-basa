import { describe, it, expect } from 'vitest'
import { render, screen } from '@testing-library/react'
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
  CardFooter,
} from '@/components/ui/card'

describe('Card', () => {
  it('render dengan base classes', () => {
    render(<Card data-testid="card">Content</Card>)
    const card = screen.getByTestId('card')
    expect(card.className).toContain('rounded-lg')
    expect(card.className).toContain('border')
    expect(card.className).toContain('shadow-sm')
  })

  it('merge custom className', () => {
    render(<Card data-testid="card" className="my-card">Content</Card>)
    const card = screen.getByTestId('card')
    expect(card.className).toContain('my-card')
  })

  it('render children', () => {
    render(<Card data-testid="card">Hello World</Card>)
    expect(screen.getByText('Hello World')).toBeInTheDocument()
  })
})

describe('CardHeader', () => {
  it('render dengan base classes', () => {
    render(<CardHeader data-testid="header">Header</CardHeader>)
    const header = screen.getByTestId('header')
    expect(header.className).toContain('flex')
    expect(header.className).toContain('p-6')
  })

  it('merge custom className', () => {
    render(<CardHeader data-testid="header" className="custom">Header</CardHeader>)
    const header = screen.getByTestId('header')
    expect(header.className).toContain('custom')
  })
})

describe('CardTitle', () => {
  it('render sebagai h3', () => {
    render(<CardTitle>Title</CardTitle>)
    const title = screen.getByRole('heading', { level: 3 })
    expect(title).toBeInTheDocument()
    expect(title).toHaveTextContent('Title')
  })

  it('punya font classes', () => {
    render(<CardTitle data-testid="title">Title</CardTitle>)
    const title = screen.getByTestId('title')
    expect(title.className).toContain('font-semibold')
    expect(title.className).toContain('text-2xl')
  })
})

describe('CardDescription', () => {
  it('render sebagai paragraph', () => {
    render(<CardDescription>Desc</CardDescription>)
    expect(screen.getByText('Desc')).toBeInTheDocument()
  })

  it('punya muted text class', () => {
    render(<CardDescription data-testid="desc">Desc</CardDescription>)
    const desc = screen.getByTestId('desc')
    expect(desc.className).toContain('text-muted-foreground')
  })
})

describe('CardContent', () => {
  it('render dengan padding class', () => {
    render(<CardContent data-testid="content">Content</CardContent>)
    const content = screen.getByTestId('content')
    expect(content.className).toContain('p-6')
  })
})

describe('CardFooter', () => {
  it('render dengan flex dan padding classes', () => {
    render(<CardFooter data-testid="footer">Footer</CardFooter>)
    const footer = screen.getByTestId('footer')
    expect(footer.className).toContain('flex')
    expect(footer.className).toContain('p-6')
  })
})
