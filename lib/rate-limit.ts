// In-memory rate limiter for API endpoints
// For production serverless, consider Upstash Redis or Vercel KV

interface RateLimitEntry {
  count: number;
  resetAt: number;
}

const rateLimitStore = new Map<string, RateLimitEntry>();

export interface RateLimitConfig {
  windowMs: number;      // Time window in milliseconds
  maxRequests: number;   // Max requests per window
  keyGenerator?: (req: Request) => string;
}

export interface RateLimitResult {
  allowed: boolean;
  remaining: number;
  resetAt: number;
  limit: number;
}


// Lazy cleanup of expired entries
let lastCleanup = Date.now();
const CLEANUP_INTERVAL = 60000; // 1 minute

function cleanupExpiredEntries() {
  const now = Date.now();
  if (now - lastCleanup < CLEANUP_INTERVAL) return;
  
  lastCleanup = now;
  for (const [key, entry] of rateLimitStore.entries()) {
    if (now > entry.resetAt) {
      rateLimitStore.delete(key);
    }
  }
}

export function createRateLimiter(config: RateLimitConfig) {
  const { windowMs, maxRequests, keyGenerator } = config;

  return function rateLimit(req: Request): RateLimitResult {
    // Lazy cleanup of expired entries
    cleanupExpiredEntries();

    const key = keyGenerator 
      ? keyGenerator(req) 
      : req.headers.get('x-forwarded-for') || req.headers.get('x-real-ip') || 'anonymous';

    const now = Date.now();
    const entry = rateLimitStore.get(key);

    // Reset if window expired
    if (!entry || now > entry.resetAt) {
      const resetAt = now + windowMs;
      rateLimitStore.set(key, { count: 1, resetAt });
      return {
        allowed: true,
        remaining: maxRequests - 1,
        resetAt,
        limit: maxRequests,
      };
    }

    // Increment counter
    entry.count++;

    // Check if over limit
    if (entry.count > maxRequests) {
      return {
        allowed: false,
        remaining: 0,
        resetAt: entry.resetAt,
        limit: maxRequests,
      };
    }

    return {
      allowed: true,
      remaining: maxRequests - entry.count,
      resetAt: entry.resetAt,
      limit: maxRequests,
    };
  };
}

// Helper to create rate limit response headers
export function rateLimitHeaders(result: RateLimitResult): Record<string, string> {
  return {
    'X-RateLimit-Limit': String(result.limit),
    'X-RateLimit-Remaining': String(result.remaining),
    'X-RateLimit-Reset': String(Math.ceil(result.resetAt / 1000)),
  };
}

// Pre-configured rate limiters
export const apiLimiter = createRateLimiter({
  windowMs: 60 * 1000,  // 1 minute
  maxRequests: 60,       // 60 requests per minute
});

export const exportLimiter = createRateLimiter({
  windowMs: 60 * 1000,  // 1 minute
  maxRequests: 10,       // 10 exports per minute
});

export const searchLimiter = createRateLimiter({
  windowMs: 60 * 1000,  // 1 minute
  maxRequests: 30,       // 30 searches per minute
});
