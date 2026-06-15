import { describe, it, expect, vi, beforeEach } from 'vitest'
import { render, screen, fireEvent } from '@testing-library/react'
import { SearchInput } from '@/components/ui/SearchInput'

describe('SearchInput', () => {
  let onChange: ReturnType<typeof vi.fn>
  let onSearch: ReturnType<typeof vi.fn>
  const defaultProps = () => ({
    value: '',
    onChange,
    onSearch,
    loading: false,
  })

  beforeEach(() => {
    onChange = vi.fn()
    onSearch = vi.fn()
  })

  it('render dengan placeholder default', () => {
    render(<SearchInput {...defaultProps()} />)
    expect(screen.getByPlaceholderText('Cari bahasa...')).toBeInTheDocument()
  })

  it('render dengan custom placeholder', () => {
    render(<SearchInput {...defaultProps()} placeholder="Cari provinsi..." />)
    expect(screen.getByPlaceholderText('Cari provinsi...')).toBeInTheDocument()
  })

  it('punya role search di form', () => {
    render(<SearchInput {...defaultProps()} />)
    expect(screen.getByRole('search')).toBeInTheDocument()
  })

  it('call onChange saat typing', () => {
    render(<SearchInput {...defaultProps()} />)
    const input = screen.getByRole('searchbox')
    fireEvent.change(input, { target: { value: 'jawa' } })
    expect(onChange).toHaveBeenCalledWith('jawa')
  })

  it('tampilkan submit button saat value ada', () => {
    render(<SearchInput {...defaultProps()} value="jawa" />)
    expect(screen.getByLabelText('Submit search')).toBeInTheDocument()
  })

  it('sembunyikan submit button saat value kosong', () => {
    render(<SearchInput {...defaultProps()} value="" />)
    expect(screen.queryByLabelText('Submit search')).not.toBeInTheDocument()
  })

  it('call onSearch saat Enter pressed dengan non-empty value', () => {
    render(<SearchInput {...defaultProps()} value="sunda" />)
    const input = screen.getByRole('searchbox')
    fireEvent.keyDown(input, { key: 'Enter' })
    expect(onSearch).toHaveBeenCalledWith('sunda')
  })

  it('tidak call onSearch saat Enter dengan empty value', () => {
    render(<SearchInput {...defaultProps()} value="" />)
    const input = screen.getByRole('searchbox')
    fireEvent.keyDown(input, { key: 'Enter' })
    expect(onSearch).not.toHaveBeenCalled()
  })

  it('submit button disabled saat loading', () => {
    render(<SearchInput {...defaultProps()} value="jawa" loading={true} />)
    const btn = screen.getByLabelText('Submit search')
    expect(btn).toBeDisabled()
  })

  it('tidak call onSearch saat Enter dengan whitespace-only', () => {
    render(<SearchInput {...defaultProps()} value="   " />)
    const input = screen.getByRole('searchbox')
    fireEvent.keyDown(input, { key: 'Enter' })
    expect(onSearch).not.toHaveBeenCalled()
  })

  it('call onSearch saat form submit', () => {
    render(<SearchInput {...defaultProps()} value="bali" />)
    const form = screen.getByRole('search')
    fireEvent.submit(form)
    expect(onSearch).toHaveBeenCalledWith('bali')
  })
})
