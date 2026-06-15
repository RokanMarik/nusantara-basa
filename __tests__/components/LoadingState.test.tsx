import { describe, it, expect } from 'vitest'
import { render, screen } from '@testing-library/react'
import { LoadingState } from '@/components/shared/LoadingState'

describe('LoadingState', () => {
  it('render default message "Memuat..."', () => {
    render(<LoadingState />)
    expect(screen.getByText('Memuat...')).toBeInTheDocument()
  })

  it('render custom message', () => {
    render(<LoadingState message="Mengambil data bahasa..." />)
    expect(screen.getByText('Mengambil data bahasa...')).toBeInTheDocument()
  })

  it('render spinner element', () => {
    const { container } = render(<LoadingState />)
    const spinner = container.querySelector('.animate-spin')
    expect(spinner).not.toBeNull()
  })

  it('spinner punya correct border classes', () => {
    const { container } = render(<LoadingState />)
    const spinner = container.querySelector('.animate-spin')
    expect(spinner?.className).toContain('border-2')
    expect(spinner?.className).toContain('rounded-full')
  })
})
