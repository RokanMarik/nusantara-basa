# Developer Guide - Nusantara Basa

Panduan lengkap untuk developer yang ingin berkontribusi pada proyek Nusantara Basa.

## Daftar Isi

- [Setup Lingkungan Development](#setup-lingkungan-development)
- [Struktur Proyek](#struktur-proyek)
- [Tech Stack](#tech-stack)
- [Workflow Kontribusi](#workflow-kontribusi)
- [Coding Standards](#coding-standards)
- [Database](#database)
- [API Development](#api-development)
- [Testing](#testing)
- [Deployment](#deployment)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)

## Setup Lingkungan Development

### Prerequisites

Pastikan Anda memiliki:
- Node.js 18+ (LTS recommended)
- npm atau yarn
- Git
- Supabase CLI
- Code editor (VS Code recommended)

### Instalasi

1. **Clone repository**
   ```bash
   git clone https://github.com/your-org/nusantara-basa.git
   cd nusantara-basa
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Setup environment variables**
   
   Copy `.env.example` ke `.env.local`:
   ```bash
   cp .env.example .env.local
   ```
   
   Edit `.env.local` dengan credentials Anda:
   ```env
   NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
   SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
   ```

4. **Setup Supabase CLI**
   ```bash
   # Install Supabase CLI
   npm install -g supabase
   
   # Login ke Supabase
   supabase login
   
   # Link ke project Anda
   supabase link --project-ref your-project-ref
   ```

5. **Jalankan development server**
   ```bash
   npm run dev
   ```
   
   Aplikasi akan berjalan di `http://localhost:3000`

## Struktur Proyek

```
nusantara-basa/
├── app/                          # Next.js App Router
│   ├── api/                      # API routes
│   │   ├── bahasa/               # Language endpoints
│   │   ├── comparison/           # Comparison tool
│   │   ├── data-dictionary/      # Data dictionary
│   │   ├── export/               # Export functionality
│   │   ├── family-tree/          # Family tree visualization
│   │   ├── geo/                  # Geographic data
│   │   ├── stats/                # Statistics
│   │   └── validate/             # Validation endpoints
│   ├── api-docs/                 # API documentation page
│   ├── compare/                  # Comparison page
│   ├── data-dictionary/          # Data dictionary page
│   ├── dashboard/                # Dashboard page
│   ├── explore/                  # Language explorer
│   ├── family-tree/              # Family tree page
│   ├── map/                      # Map visualization
│   └── validate/                 # Validation page
├── components/                   # React components
│   ├── ui/                       # shadcn/ui components
│   │   ├── badge.tsx
│   │   ├── button.tsx
│   │   ├── card.tsx
│   │   ├── input.tsx
│   │   └── label.tsx
│   └── ...                       # Custom components
├── lib/                          # Utility functions
│   ├── rate-limit.ts             # Rate limiting
│   ├── supabase.ts               # Supabase client
│   └── utils.ts                  # Helper functions
├── scripts/                      # Utility scripts
│   ├── validate-data.js          # Data validation
│   ├── validate-iso-glottolog.js # ISO validation
│   └── analyze-glottolog.js      # Glottolog analysis
├── public/                       # Static assets
├── styles/                       # Global styles
├── types/                        # TypeScript types
└── prisma/                       # Prisma schema (legacy)
```

## Tech Stack

- **Framework**: Next.js 14 (App Router)
- **Language**: TypeScript
- **Database**: Supabase (PostgreSQL)
- **Styling**: Tailwind CSS
- **UI Components**: shadcn/ui
- **Maps**: Leaflet + react-leaflet
- **Charts**: Recharts
- **Icons**: Lucide React
- **Deployment**: Vercel

## Workflow Kontribusi

### 1. Buat Branch Baru

```bash
# Pastikan di branch main dan up-to-date
git checkout main
git pull origin main

# Buat branch baru
git checkout -b feature/nama-fitur-anda
```

### 2. Development

- Ikuti [Coding Standards](#coding-standards) di bawah
- Test perubahan Anda secara lokal
- Pastikan tidak ada TypeScript errors: `npm run type-check`

### 3. Commit Changes

Gunakan conventional commits:

```bash
git add .
git commit -m "feat: add new language comparison feature"
```

**Commit message format:**
- `feat:` - Fitur baru
- `fix:` - Bug fix
- `docs:` - Dokumentasi
- `style:` - Formatting, styling
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance

### 4. Push dan Pull Request

```bash
git push origin feature/nama-fitur-anda
```

Kemudian buat Pull Request di GitHub dengan:
- Deskripsi yang jelas tentang perubahan
- Screenshot jika ada perubahan UI
- Reference ke issue terkait (jika ada)

## Coding Standards

### TypeScript

1. **Selalu gunakan TypeScript strict mode**
   - Jangan gunakan `any` kecuali sangat diperlukan
   - Define types di folder `types/`

2. **Type-only imports**
   ```typescript
   // ✅ Benar
   import type { Language } from '@/types'
   
   // ❌ Salah
   import { Language } from '@/types'
   ```

3. **Gunakan `Record<K, V>` bukan `Map`**
   ```typescript
   // ✅ Benar
   const languageMap: Record<string, Language> = {}
   
   // ❌ Salah
   const languageMap = new Map<string, Language>()
   ```

### Next.js App Router

1. **Server Components by default**
   - Hanya gunakan `'use client'` jika diperlukan
   - Server components tidak bisa menggunakan hooks

2. **API Routes**
   - Gunakan `NextRequest` dan `NextResponse`
   - Implementasi rate limiting untuk public endpoints
   - Validasi input dengan Zod atau manual

3. **File naming**
   - Pages: `page.tsx`
   - Layouts: `layout.tsx`
   - Loading: `loading.tsx`
   - Error: `error.tsx`

### Styling

1. **Gunakan Tailwind CSS**
   ```tsx
   // ✅ Benar
   <div className="bg-blue-500 text-white p-4 rounded-lg">
   
   // ❌ Hindari inline styles
   <div style={{ backgroundColor: 'blue' }}>
   ```

2. **shadcn/ui components**
   - Import dari `@/components/ui/`
   - Customize via className prop

### Database Queries

1. **Selalu handle errors**
   ```typescript
   const { data, error } = await supabase
     .from('bahasa')
     .select('*')
   
   if (error) {
     return NextResponse.json(
       { error: error.message },
       { status: 500 }
     )
   }
   ```

2. **Gunakan pagination untuk data besar**
   ```typescript
   const { data } = await supabase
     .from('bahasa')
     .select('*')
     .range(offset, offset + limit - 1)
   ```

3. **Jangan expose service role key**
   - Gunakan `anon key` untuk client-side
   - Gunakan `service role key` hanya di server-side

## Database

### Schema Overview

**Tabel utama:**
- `bahasa` - Data bahasa daerah
- `rumpun_bahasa` - Klasifikasi rumpun bahasa
- `penutur_historis` - Data historis penutur
- `validation_logs` - Log validasi data

### Menambah Migration

```bash
# Buat migration baru
supabase migration new add_new_column

# Edit file di supabase/migrations/
# Format: YYYYMMDDHHMMSS_add_new_column.sql

# Apply ke local
supabase db reset

# Apply ke production
supabase db push
```

### Query Optimization

1. **Gunakan indexes**
   ```sql
   CREATE INDEX idx_bahasa_provinsi ON bahasa(provinsi);
   CREATE INDEX idx_bahasa_iso ON bahasa(kode_iso_639);
   ```

2. **Avoid N+1 queries**
   ```typescript
   // ✅ Benar - Join
   const { data } = await supabase
     .from('bahasa')
     .select('*, rumpun_bahasa(nama)')
   
   // ❌ Salah - N+1
   const languages = await supabase.from('bahasa').select('*')
   for (const lang of languages) {
     const family = await supabase
       .from('rumpun_bahasa')
       .select('nama')
       .eq('id', lang.rumpun_bahasa_id)
   }
   ```

## API Development

### Rate Limiting

Semua public API endpoints menggunakan rate limiting:

```typescript
import { apiLimiter, rateLimitHeaders } from '@/lib/rate-limit'

export async function GET(request: NextRequest) {
  const rateLimit = apiLimiter(request)
  
  if (!rateLimit.allowed) {
    return NextResponse.json(
      { error: 'Too many requests' },
      { status: 429, headers: rateLimitHeaders(rateLimit) }
    )
  }
  
  // Your logic here
}
```

### Response Format

**Success response:**
```json
{
  "success": true,
  "data": { ... },
  "metadata": { ... }
}
```

**Error response:**
```json
{
  "success": false,
  "error": "Error message"
}
```

### CORS

CORS sudah di-handle oleh Next.js. Tidak perlu konfigurasi tambahan.

## Testing

### Manual Testing

1. **Test di browser**
   - Buka `http://localhost:3000`
   - Test semua fitur yang diubah
   - Check responsive design (mobile/tablet/desktop)

2. **Test API endpoints**
   ```bash
   # Gunakan curl atau Postman
   curl http://localhost:3000/api/bahasa?limit=10
   ```

### Automated Testing (Future)

```bash
# Run tests (coming soon)
npm run test

# Run tests with coverage
npm run test:coverage
```

## Deployment

### Vercel Deployment

Project ini di-deploy otomatis ke Vercel:

1. **Push ke main** → Deploy ke production
2. **Push ke branch lain** → Deploy ke preview URL

### Environment Variables di Vercel

Pastikan semua environment variables sudah di-set di Vercel Dashboard:
- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`

### Build Locally

```bash
# Build production
npm run build

# Start production server
npm start
```

## Troubleshooting

### Supabase Connection Error

```
Error: failed to connect to Supabase
```

**Solusi:**
- Check `.env.local` credentials
- Pastikan Supabase project aktif
- Test connection: `supabase db pull`

### Port Already in Use

```
Error: Port 3000 is already in use
```

**Solusi:**
```bash
# Kill process di port 3000
npx kill-port 3000

# Atau gunakan port lain
npm run dev -- -p 3001
```

### TypeScript Errors

```bash
# Check TypeScript errors
npm run type-check

# Auto-fix beberapa errors
npm run lint -- --fix
```

### Module Not Found

```bash
# Clear Next.js cache
rm -rf .next
npm install
npm run dev
```

## FAQ

### Q: Bagaimana cara menambah bahasa baru?

**A:** Tambah langsung ke database Supabase via SQL atau Supabase Dashboard:

```sql
INSERT INTO bahasa (nama, kode_iso_639, jumlah_penutur, ...)
VALUES ('Bahasa Baru', 'bbb', 1000, ...);
```

### Q: Bagaimana cara update data yang salah?

**A:** Update via Supabase Dashboard atau SQL:

```sql
UPDATE bahasa
SET jumlah_penutur = 5000
WHERE id = 'uuid-bahasa';
```

### Q: Apakah ada API untuk bulk import?

**A:** Belum ada. Untuk bulk import, gunakan script di folder `scripts/` atau buat migration SQL.

### Q: Bagaimana cara menambah fitur baru?

**A:**
1. Buat issue di GitHub untuk diskusi
2. Fork dan buat branch baru
3. Implementasi fitur
4. Buat Pull Request

### Q: Siapa yang bisa saya hubungi untuk bantuan?

**A:** Buka GitHub Discussion atau hubungi maintainer via issue.

## Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [Supabase Documentation](https://supabase.com/docs)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [shadcn/ui Documentation](https://ui.shadcn.com/)
- [TypeScript Documentation](https://www.typescriptlang.org/docs)

## Contributing

Terima kasih telah berkontribusi! Setiap kontribusi, sekecil apapun, sangat dihargai.

**Maintainer:** Nusantara Basa Team
**License:** MIT
