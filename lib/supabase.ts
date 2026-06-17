import { createClient, SupabaseClient } from '@supabase/supabase-js';

// Lazy singleton — avoids crashing during `next build` when env vars are absent.
let _supabase: SupabaseClient | null = null;

function getSupabase(): SupabaseClient {
  if (!_supabase) {
    const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
    if (!url || !key) {
      throw new Error(
        'Missing Supabase credentials. Set NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables.'
      );
    }
    _supabase = createClient(url, key);
  }
  return _supabase;
}

/**
 * Backward-compatible proxy — `supabase.from(...)` still works as before.
 * The real client is only created on first access, not at module load time.
 */
const supabase = new Proxy({} as SupabaseClient, {
  get(_target, prop, receiver) {
    return Reflect.get(getSupabase(), prop, receiver);
  },
});

export { supabase, getSupabase };
