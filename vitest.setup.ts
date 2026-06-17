import '@testing-library/jest-dom/vitest'
import { afterEach, beforeEach } from 'vitest'

// Set dummy env vars so the lazy Supabase client doesn't throw during tests.
// The actual createClient call is mocked per-test via vi.mock('@supabase/supabase-js').
process.env.NEXT_PUBLIC_SUPABASE_URL = 'https://test-project.supabase.co'
process.env.SUPABASE_SERVICE_ROLE_KEY = 'test-service-role-key'

// Reset semua mock antar test
afterEach(() => {
  vi.restoreAllMocks()
})
