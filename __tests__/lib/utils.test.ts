import { describe, it, expect } from 'vitest'
import { cn } from '@/lib/utils'

describe('cn', () => {
  it('menggabungkan class names', () => {
    expect(cn('foo', 'bar')).toBe('foo bar')
  })

  it('menghandle conditional classes', () => {
    expect(cn('base', false && 'hidden', 'visible')).toBe('base visible')
  })

  it('menghandle undefined dan null', () => {
    expect(cn('base', undefined, null, 'end')).toBe('base end')
  })

  it('merge tailwind classes (yang terakhir menang)', () => {
    expect(cn('px-2 py-1', 'px-4')).toBe('py-1 px-4')
  })

  it('menghandle array input', () => {
    expect(cn(['foo', 'bar'])).toBe('foo bar')
  })

  it('menghandle object input (truthy values)', () => {
    expect(cn({ foo: true, bar: false, baz: true })).toBe('foo baz')
  })

  it('menghandle empty input', () => {
    expect(cn()).toBe('')
  })

  it('menghandle semua tipe input sekaligus', () => {
    const result = cn('base', ['array'], { obj: true, no: false }, undefined, 'last')
    expect(result).toBe('base array obj last')
  })
})
