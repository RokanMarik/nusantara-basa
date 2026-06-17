# AGENTS.md — AI Agent Instructions for Nusantara Basa

> This file tells AI coding agents (Claude, Copilot, Cursor, etc.) how to work efficiently in this repo.

## Quick Orientation

**Project:** Nusantara Basa — Indonesian regional language documentation platform (700+ languages)
**Stack:** Next.js 14 (App Router) · TypeScript 5 · Supabase (PostgreSQL) · Prisma · Tailwind CSS · Leaflet · Vitest

## Available Scripts

| Command | Description | Status |
|---|---|---|
| `npm run dev` | Start dev server (port 3000) | ✅ Working |
| `npm run build` | Production build (`prisma generate && next build`) | ✅ Working |
| `npm start` | Start production server | ✅ Working |
| `npm run lint` | ESLint check | ✅ Working |
| `npm run test` | Run Vitest tests (20 test files) | ✅ Working |
| `npm run test -- --run` | Run tests once (no watch) | ✅ Working |
| `npm run test:coverage` | Vitest with coverage report | ✅ Working |
| `npm run type-check` | TypeScript type checking (`tsc --noEmit`) | ✅ Working |
| `npm run db:generate` | Generate Prisma client | ✅ Working |
| `npm run db:push` | Push Prisma schema to DB | ✅ Working |
| `npm run db:seed` | Seed initial data | ✅ Working |

## Build Pipeline

```
npm run build → prisma generate → next build
```

- **If build fails with module resolution errors:** Clear `.next` cache (`rm -rf .next`) and retry.
- **If build fails with "supabaseUrl is required":** This is normal without env vars — the build succeeds because Supabase client uses lazy initialization. Set env vars if you need runtime functionality.
- **Requires `node_modules`** — run `npm install` first if missing.

## Environment Setup

```bash
cp .env.example .env.local
# Edit .env.local with your Supabase credentials
```

**Required env vars:**
- `NEXT_PUBLIC_SUPABASE_URL` — Supabase project URL
- `SUPABASE_SERVICE_ROLE_KEY` — Supabase service role key

**Optional:**
- `NEXT_PUBLIC_SUPABASE_ANON_KEY` — Supabase anon key (for client-side)
- `NINEROUTER_URL` / `NINEROUTER_KEY` — AI Gateway for Smart Search

## Testing

```bash
npm run test              # Run all tests (watch mode)
npm run test -- --run     # Run once, no watch
npm run test:coverage     # With coverage report
```

- **Framework:** Vitest with jsdom
- **Test files:** `__tests__/` directory (8 API, 8 component, 4 lib tests)
- **Setup:** `vitest.setup.ts` (auto-restores mocks)
- **Note:** Tests are excluded from `tsc` compilation (see `tsconfig.json` excludes)

## Architecture Notes

### App Router Pages
- `app/page.tsx` — Landing page
- `app/explore/` — Language explorer
- `app/explore/bahasa/[id]/` — Language detail page
- `app/explore/map/` — Interactive map
- `app/compare/` — Language comparison
- `app/dashboard/` — Statistics dashboard
- `app/family-tree/` — Language family tree
- `app/data-dictionary/` — Data dictionary
- `app/api-docs/` — API documentation
- `app/validate/` — Data validation

### API Routes (`app/api/`)
- All routes use `NextRequest`/`NextResponse`
- Rate limiting via `@/lib/rate-limit`
- Supabase client via `@/lib/supabase` (lazy singleton)
- Response format: `{ success: boolean, data?: any, error?: string }`

### Key Libraries
- `lib/supabase.ts` — Supabase client (lazy proxy, safe during build)
- `lib/cache.ts` — In-memory caching with TTL
- `lib/rate-limit.ts` — API rate limiting
- `lib/utils.ts` — `cn()` helper for Tailwind classes

### UI Components
- `components/ui/` — shadcn/ui components (badge, button, card, input, label, table, alert)
- `components/map/` — Leaflet map components
- `components/history-section/` — Historical timeline
- `components/layout/` — Header, BottomPanel

## Data Pipeline (scripts/)

⚠️ **The `scripts/` directory contains ~115 one-off scripts** (SQL, JS, PS1, Python) for data enrichment. There is no automated pipeline.

### Script Categories
1. **Data insertion:** `phase1-fast-insert.js`, `phase2-*.js`, `phase3-*.js`
2. **Enrichment (SQL batches):** `enrich-speakers-batch-{1..10}.sql`, `enrich-vitalitas-batch-*.sql`
3. **Validation:** `check-coverage.sql`, `data-quality-audit.sql`, `validate-data.sql`
4. **ISO mapping:** `generate-iso-mapping.js` (latest), `generate-iso-sql.js` (older)

### Execution Order (if re-running pipeline)
1. `scripts/phase1-fast-insert.js` — Bulk insert base language data
2. `scripts/enrich-data-comprehensive.js` — Enrich existing records
3. `scripts/enrich-speakers-batch-{1..10}.sql` — Speaker count data (sequential, respect rate limits)
4. `scripts/enrich-vitalitas-batch-{1..3}.sql` — Vitality status data
5. `scripts/enrich-coordinates-*.sql` — Geographic coordinates

## ⚠️ Known Issues & Warnings

1. **Do NOT run `npm run build` without clearing `.next` first** if the build was previously broken.
2. **Scripts in `scripts/` are NOT idempotent** — running them twice may create duplicate data.
3. **`data/` directory is .gitignored** — generated mapping files won't appear in git.
4. **Tests are excluded from TypeScript compilation** — use `npm run test` to run tests, not `tsc`.

## Validation (Pre-Commit Checklist)

Run this before committing to catch issues early:

```bash
npm run lint && npm run type-check && npm run test -- --run && npm run build
```

Or use the Makefile shortcut:

```bash
make validate
```

## Documentation Index

| File | Description |
|---|---|
| `README.md` | Project overview and quick start |
| `DEVELOPER-GUIDE.md` | Coding standards, workflow, API patterns |
| `DOCUMENTATION-API.md` | Full API reference |
| `USER-MANUAL.md` | End-user documentation |
| `DEPLOYMENT-GUIDE.md` | Deployment instructions |
| `CRON-SETUP.md` | Cron job configuration |
| `docs/archive/` | Archived progress reports and stale docs |
