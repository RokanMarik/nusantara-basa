/**
 * In-memory cache implementation
 * 
 * LIMITATIONS:
 * - Serverless: Cache is lost on cold starts (each function instance has isolated memory)
 * - Multi-instance: No cache sharing between serverless function instances
 * 
 * For production serverless deployment, consider:
 * - Vercel KV (Redis-compatible)
 * - Upstash Redis
 * - Cloudflare KV
 */

interface CacheEntry<T> {
  data: T;
  expiry: number;
}

const cache = new Map<string, CacheEntry<unknown>>();

export function getCache<T>(key: string): T | null {
  const entry = cache.get(key);
  if (!entry) return null;
  if (Date.now() > entry.expiry) {
    cache.delete(key);
    return null;
  }
  return entry.data as T;
}

export function setCache<T>(key: string, data: T, ttlMs: number): void {
  cache.set(key, { data, expiry: Date.now() + ttlMs });
}

export function clearCache(): void {
  cache.clear();
}

export const TTL = {
  MARKERS: 5 * 60 * 1000,
  STATS: 60 * 60 * 1000,
  RUMPUN: 60 * 60 * 1000,
  DETAIL: 60 * 60 * 1000,
} as const;
