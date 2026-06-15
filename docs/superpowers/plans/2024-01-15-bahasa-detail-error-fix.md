# Implementation Plan: Fix Bahasa Detail Page Error

## Overview
- **What**: Fix client-side error di page `/explore/bahasa/[slug]` dengan proper error handling dan defensive checks
- **Why**: User mengalami "Application error" saat buka detail bahasa karena missing error handling dan unsafe property access
- **Files to modify**: `app/explore/bahasa/[slug]/page.tsx`

## Task 1: Add Error State
**Files**: `app/explore/bahasa/[slug]/page.tsx`
**Steps**:
1. Add `error` state setelah `loading` state (line 45):
```typescript
const [error, setError] = useState<string | null>(null)
```
2. Verify: TypeScript tidak error, state initialized dengan `null`

## Task 2: Fix Fetch Error Handling
**Files**: `app/explore/bahasa/[slug]/page.tsx`
**Steps**:
1. Update `fetchBahasa` function (lines 50-85) untuk validate response:
```typescript
const response = await fetch(`/api/bahasa/${params.slug}`)
const data = await response.json()

if (!response.ok) {
  setError(data.error || 'Gagal memuat data bahasa')
  return
}

setBahasa(data)
```
2. Add error handling di catch block:
```typescript
catch (error) {
  console.error('Failed to fetch bahasa:', error)
  setError('Terjadi kesalahan saat memuat data')
}
```
3. Verify: Error state di-set saat API return error

## Task 3: Add Error UI Component
**Files**: `app/explore/bahasa/[slug]/page.tsx`
**Steps**:
1. Insert error component setelah loading check (setelah line 96):
```typescript
if (error) {
  return (
    <div className="min-h-screen bg-gradient-to-br from-amber-50 via-orange-50 to-red-50 flex items-center justify-center">
      <div className="text-center">
        <h1 className="text-4xl font-bold text-earth-900 mb-4">Terjadi Kesalahan</h1>
        <p className="text-earth-700 mb-8">{error}</p>
        <Link
          href="/explore"
          className="inline-flex items-center gap-2 px-6 py-3 bg-amber-700 text-white rounded-lg hover:bg-amber-800 transition-colors"
        >
          <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m-7 7h18" />
          </svg>
          Kembali ke Explore
        </Link>
      </div>
    </div>
  )
}
```
2. Verify: Error message muncul saat ada error, user bisa navigate back

## Task 4: Add Defensive Checks for Koordinat
**Files**: `app/explore/bahasa/[slug]/page.tsx`
**Steps**:
1. Update koordinat rendering (line 264-271) dengan defensive checks:
```typescript
{bahasa.koordinatPusat && (
  <div>
    <dt className="text-sm text-earth-600">Koordinat</dt>
    {bahasa.koordinatPusat.coordinates && (
      <dd className="text-lg text-earth-900 font-mono">
        {bahasa.koordinatPusat.coordinates[1]?.toFixed(4) || '0'}, {bahasa.koordinatPusat.coordinates[0]?.toFixed(4) || '0'}
      </dd>
    )}
  </div>
)}
```
2. Verify: Tidak crash saat `coordinates` undefined

## Task 5: Conditional Rendering untuk Provinsi
**Files**: `app/explore/bahasa/[slug]/page.tsx`
**Steps**:
1. Update provinsi section (line 240-246) dengan conditional check:
```typescript
{bahasa.lokasi.some(l => l.provinsi) && (
  <div>
    <dt className="text-sm text-earth-600">Provinsi</dt>
    <dd className="text-lg text-earth-900">
      {bahasa.lokasi.map(l => l.provinsi).filter(Boolean).join(', ')}
    </dd>
  </div>
)}
```
2. Verify: Provinsi section hanya muncul kalau ada data provinsi

## Task 6: Build Verification
**Steps**:
1. Run `npm run build`
2. Verify: Build sukses tanpa TypeScript errors
3. Expected: Page compile successfully

## Task 7: Commit Changes
**Steps**:
1. `git add app/explore/bahasa/[slug]/page.tsx`
2. `git commit -m "fix: add error handling to bahasa detail page"`
3. Verify: Commit created

## Total Estimated Time
- 7 tasks × 2-3 minutes = 15-20 minutes

## Dependencies
- Task 1 → Task 2 (error state harus ada dulu)
- Task 2 → Task 3 (error UI butuh error state)
- Task 3-5: Independent, bisa parallel
- Task 6: Setelah semua code changes
- Task 7: Setelah build verification

## Rollback Plan
Jika ada issue:
```bash
git revert HEAD
```
