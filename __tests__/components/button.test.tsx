import { describe, it, expect } from 'vitest'
import { render, screen } from '@testing-library/react'
import { Button } from '@/components/ui/button'

describe('Button', () => {
  it('render default button dengan base classes', () => {
    render(<Button>Click me</Button>)
    const btn = screen.getByRole('button', { name: 'Click me' })
    expect(btn).toBeInTheDocument()
    expect(btn.className).toContain('inline-flex')
    expect(btn.className).toContain('rounded-md')
  })

  it('render children text', () => {
    render(<Button>Submit</Button>)
    expect(screen.getByText('Submit')).toBeInTheDocument()
  })

  it('apply variant classes - destructive', () => {
    render(<Button variant="destructive">Delete</Button>)
    const btn = screen.getByRole('button', { name: 'Delete' })
    expect(btn.className).toContain('destructive')
  })

  it('apply variant classes - ghost', () => {
    render(<Button variant="ghost">Hover</Button>)
    const btn = screen.getByRole('button', { name: 'Hover' })
    expect(btn.className).toContain('hover:bg-accent')
  })

  it('apply variant classes - outline', () => {
    render(<Button variant="outline">Border</Button>)
    const btn = screen.getByRole('button', { name: 'Border' })
    expect(btn.className).toContain('border')
  })

  it('apply variant classes - link', () => {
    render(<Button variant="link">Link</Button>)
    const btn = screen.getByRole('button', { name: 'Link' })
    expect(btn.className).toContain('underline')
  })

  it('apply size sm', () => {
    render(<Button size="sm">Small</Button>)
    const btn = screen.getByRole('button', { name: 'Small' })
    expect(btn.className).toContain('h-9')
  })

  it('apply size lg', () => {
    render(<Button size="lg">Large</Button>)
    const btn = screen.getByRole('button', { name: 'Large' })
    expect(btn.className).toContain('h-11')
  })

  it('apply size icon', () => {
    render(<Button size="icon">X</Button>)
    const btn = screen.getByRole('button', { name: 'X' })
    expect(btn.className).toContain('w-10')
  })

  it('disabled state → disabled attribute', () => {
    render(<Button disabled>Disabled</Button>)
    const btn = screen.getByRole('button', { name: 'Disabled' })
    expect(btn).toBeDisabled()
  })

  it('disabled state → opacity class', () => {
    render(<Button disabled>Disabled</Button>)
    const btn = screen.getByRole('button', { name: 'Disabled' })
    expect(btn.className).toContain('opacity-50')
  })

  it('forwardRef → ref terpasang', () => {
    const ref = { current: null as HTMLButtonElement | null }
    render(<Button ref={ref}>Ref</Button>)
    expect(ref.current).toBeInstanceOf(HTMLButtonElement)
  })

  it('merge custom className', () => {
    render(<Button className="my-custom">Custom</Button>)
    const btn = screen.getByRole('button', { name: 'Custom' })
    expect(btn.className).toContain('my-custom')
  })

  it('pass extra props ke button element', () => {
    render(<Button type="submit">Submit</Button>)
    const btn = screen.getByRole('button', { name: 'Submit' })
    expect(btn.getAttribute('type')).toBe('submit')
  })

  it('handle onClick', () => {
    let clicked = false
    render(<Button onClick={() => { clicked = true }}>Click</Button>)
    screen.getByRole('button', { name: 'Click' }).click()
    expect(clicked).toBe(true)
  })
})
