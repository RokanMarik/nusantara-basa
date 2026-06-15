# Design: Fix Client-Side Error on Bahasa Detail Page

## Date
2024-01-15

## Problem Statement
Page `/explore/bahasa/[slug]` menampilkan error "Application error: a client-side exception has occurred" saat user membuka detail bahasa. Error terjadi karena:

1. **Missing error handling** - API bisa return error object `{ error: "message" }` tapi client code tetap `setBahasa(data)` tanpa check `response.ok`
2. **Unsafe property access** - Render `bahasa.koordinatPusat.coordinates[1]` tanpa defensive check, crash saat `coordinates` undefined
3. **No error UI** - Tidak ada component untuk menampilkan pesan error ke user

## Root Cause Analysis

### Issue 1: Missing Response Validation
```typescript
// BEFORE - Line 52-54
const response = await fetch(`/api/bahasa/${params.slug}`)
if (response.ok) {
  const data = await response.json()
  setBahasa(data)  // ← Bisa set error object sebagai bahasa
}
```

API route `/api/bahasa/[id]` bisa return:
- Success: `{ id, namaBahasa, ... }` (200)
- Error: `{ error: "Bahasa not found" }` (404/500)

Client tidak check `response.ok`, jadi error object di-set sebagai `bahasa` state.

### Issue 2: Unsafe Nested Property Access
```typescript
// BEFORE - Line 268
{bahasa.koordinatPusat.coordinates[1].toFixed(4)}
```

Jika `bahasa.koordinatPusat` ada tapi `coordinates` undefined/null, ini crash dengan "Cannot read property '1' of undefined".

### Issue 3: No Error State
Component hanya punya `loading` dan `bahasa` state. Tidak ada `error` state untuk handle failure cases.

## Solution Design

### 1. Add Error State Management
```typescript
const [error, setError] = useState<string | null>(null)
```

### 2. Validate API Response
```typescript
const response = await fetch(`/api/bahasa/${params.slug}`)
const data = await response.json()

if (!response.ok) {
  setError(data.error || 'Gagal memuat data bahasa')
  return
}

setBahasa(data)
```

### 3. Add Error UI Component
```typescript
if (error) {
  return (
    <div className="min-h-screen ...">
      <div className="text-center">
        <h1>Terjadi Kesalahan</h1>
        <p>{error}</p>
        <Link href="/explore">Kembali ke Explore</Link>
      </div>
    </div>
  )
}
```

### 4. Defensive Property Access
```typescript
{bahasa.koordinatPusat && bahasa.koordinatPusat.coordinates && (
  <dd>
    {bahasa.koordinatPusat.coordinates[1]?.toFixed(4) || '0'}, 
    {bahasa.koordinatPusat.coordinates[0]?.toFixed(4) || '0'}
  </dd>
)}
```

### 5. Conditional Rendering untuk Lokasi
```typescript
{bahasa.lokasi?.some(l => l.provinsi) && (
  <div>
    <dt>Provinsi</dt>
    <dd>{bahasa.lokasi.map(l => l.provinsi).filter(Boolean).join(', ')}</dd>
  </div>
)}
```

## Files to Modify
- `app/explore/bahasa/[slug]/page.tsx` - Add error handling dan defensive checks

## Success Criteria
- ✅ Page tidak crash saat API error
- ✅ Error message ditampilkan ke user
- ✅ Koordinat tidak crash saat undefined
- ✅ Provinsi section hanya muncul kalau ada data
- ✅ User bisa navigate kembali ke explore page

## Constraints
- Minimal changes - hanya fix error handling
- Preserve existing UI/UX
- Tidak ubah API route logic
- Maintain TypeScript type safety

## Out of Scope
- Refactor API route
- Add loading skeleton
- Improve error message formatting
- Add retry mechanism
