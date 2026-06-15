import '@testing-library/jest-dom/vitest'
import { afterEach, beforeEach } from 'vitest'

// Reset semua mock antar test
afterEach(() => {
  vi.restoreAllMocks()
})
