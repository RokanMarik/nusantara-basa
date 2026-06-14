# 🌏 Nusantara Basa

> Platform digital untuk dokumentasi dan eksplorasi 700+ bahasa daerah di Indonesia

[![Next.js](https://img.shields.io/badge/Next.js-14-black)](https://nextjs.org/)
[![Supabase](https://img.shields.io/badge/Supabase-Database-3ECF8E)](https://supabase.com/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-blue)](https://www.typescriptlang.org/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

## 📋 Tentang Project

Nusantara Basa adalah platform web interaktif yang mendokumentasikan kekayaan bahasa daerah Indonesia. Platform ini mencakup:

- 🗺️ **Peta Interaktif** - Visualisasi distribusi geografis 700+ bahasa
- 📚 **Database Komprehensif** - Informasi linguistik, sejarah, dan budaya
- 🔍 **Pencarian Cerdas** - Filter berdasarkan rumpun bahasa, provinsi, vitalitas
- 📜 **Modul Sejarah** - Peristiwa sejarah dan evolusi bahasa
- 🎨 **UI Modern** - Desain responsif dengan animasi smooth

## ✨ Fitur Utama

### 🗺️ Peta Bahasa Interaktif
- Marker berwarna berdasarkan rumpun bahasa (Austronesia, Papua, Trans-New Guinea)
- Popup detail dengan ISO code, koordinat, dan jumlah penutur
- Filter by vitalitas dan rumpun bahasa
- Smart search dengan autocomplete

### 📖 Halaman Detail Bahasa
- **Tab Tentang** - Informasi umum, jumlah penutur, status vitalitas
- **Tab Linguistik** - Sistem tulisan, fonologi, morfologi
- **Tab Kosakata** - Swadesh list dan contoh kata
- **Tab Sejarah** - Peristiwa sejarah, pengaruh bahasa, nama historis

### 🎨 Komponen Reusable
- `LanguageMap` - Peta Leaflet dengan marker dinamis
- `HistorySection` - Timeline peristiwa sejarah
- `VitalityBadge` - Badge status bahasa (aman, rentan, terancam)
- `BottomPanel` - Panel filter dan pencarian

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ 
- npm atau yarn
- Supabase account (optional untuk development lokal)

### Installation

```bash
# Clone repository
git clone https://github.com/rokanakbarmarik/nusantara-basa.git
cd nusantara-basa

# Install dependencies
npm install

# Setup environment variables
cp .env.example .env.local
# Edit .env.local dengan credentials Anda

# Run development server
npm run dev
```

Buka [http://localhost:3000](http://localhost:3000) di browser.

## 📦 Scripts

```bash
# Development
npm run dev          # Start dev server (port 3000)

# Production
npm run build        # Build untuk production
npm start           # Start production server

# Database
npm run db:generate # Generate Prisma client
npm run db:push     # Push schema ke database
npm run db:seed     # Seed initial data

# Data Enrichment
node scripts/enrich-data-comprehensive.js  # Enrich 71 bahasa existing
node scripts/phase1-fast-insert.js          # Bulk insert 464+ bahasa
node scripts/seed-historical.js             # Insert data sejarah
```

## 🗄️ Database Schema

Project ini menggunakan **13 tabel** di Supabase:

### Core Tables
- `bahasa` - Informasi utama bahasa (700+ records)
- `rumpun_bahasa` - Klasifikasi rumpun bahasa
- `lokasi` - Distribusi geografis
- `kosakata` - Database kosakata (Swadesh list)

### Enrichment Tables
- `fitur_linguistik` - Sistem tulisan, fonologi, morfologi
- `status_preservasi` - Status vitalitas UNESCO
- `sumber_referensi` - Referensi akademik

### Historical Module
- `peristiwa_sejarah` - Timeline peristiwa penting
- `pengaruh_bahasa_lain` - Pinjaman dan pengaruh linguistik
- `penutur_historis` - Data penutur dari masa ke masa
- `riwayat_nama` - Perubahan nama bahasa
- `media_dokumen` - Dokumen dan manuskrip

Lihat [prisma/schema.prisma](prisma/schema.prisma) untuk detail schema.

## 🔧 Environment Variables

```bash
# Supabase (Required)
NEXT_PUBLIC_SUPABASE_URL=https://xxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbG...
SUPABASE_SERVICE_ROLE_KEY=eyJhbG...

# Optional - AI Gateway untuk Smart Search
NINEROUTER_URL=http://localhost:20128
NINEROUTER_KEY=your_key_here
```

## 📊 Data Status

| Kategori | Jumlah | Status |
|----------|--------|--------|
| Bahasa | 700+ | ✅ Complete |
| Fitur Linguistik | 71+ | ✅ Enriched |
| Lokasi | 71+ | ✅ Mapped |
| Kosakata | 1000+ | ✅ Swadesh lists |
| Peristiwa Sejarah | 20+ | ✅ Sample data |
| Auto Summary | 71+ | ✅ Generated |

## 🏗️ Tech Stack

- **Framework:** Next.js 14 (App Router)
- **Language:** TypeScript 5
- **Database:** Supabase (PostgreSQL)
- **Styling:** Tailwind CSS
- **Maps:** Leaflet + react-leaflet
- **ORM:** Prisma
- **Icons:** SVG inline

## 📁 Project Structure

```
nusantara-basa/
├── app/
│   ├── api/              # API routes
│   ├── explore/          # Halaman eksplorasi
│   │   ├── bahasa/[id]/  # Detail bahasa
│   │   └── map/          # Peta interaktif
│   └── page.tsx          # Landing page
├── components/
│   ├── map/              # Komponen peta
│   ├── history-section/  # Modul sejarah
│   ├── layout/           # Header, BottomPanel
│   └── ui/               # Komponen reusable
├── lib/
│   ├── supabase.ts       # Client Supabase
│   ├── cache.ts          # In-memory cache
│   └── types.ts          # TypeScript types
├── prisma/
│   ├── schema.prisma     # Database schema
│   └── migrations/       # SQL migrations
├── scripts/              # Data enrichment scripts
└── public/               # Static assets
```

## 🚢 Deployment

### Vercel (Recommended)

1. Push ke GitHub
2. Import project di [Vercel](https://vercel.com)
3. Set environment variables
4. Deploy!

Build command sudah dikonfigurasi: `prisma generate && next build`

### Manual Deployment

```bash
npm run build
npm start
```

## 🧪 Testing

```bash
# Run linting
npm run lint

# Type check
npx tsc --noEmit

# Test build
npm run build && npm start
```

## 📝 API Endpoints

| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/api/bahasa` | GET | List semua bahasa |
| `/api/bahasa/[id]` | GET | Detail bahasa |
| `/api/locations/markers` | GET | Marker untuk peta |
| `/api/rumpun` | GET | List rumpun bahasa |
| `/api/peristiwa-sejarah` | GET | Peristiwa sejarah |
| `/api/pengaruh-bahasa` | GET | Pengaruh bahasa lain |
| `/api/penutur-historis` | GET | Data penutur historis |

## 🤝 Contributing

Kontribusi sangat diterima! Silakan:

1. Fork repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 👨‍💻 Author

**Rokan Akbar Marik**
- GitHub: [@rokanakbarmarik](https://github.com/rokanakbarmarik)

## 🙏 Acknowledgments

- [Ethnologue](https://www.ethnologue.com/) - Data bahasa dunia
- [Glottolog](https://glottolog.org/) - Referensi linguistik
- [UNESCO Atlas](https://unesco.org/en/languages) - Status vitalitas bahasa
- [Supabase](https://supabase.com/) - Database infrastructure
- [Vercel](https://vercel.com/) - Hosting platform

## 📞 Support

Jika ada pertanyaan atau issue:
- 📧 Email: [your-email@example.com]
- 🐛 Issues: [GitHub Issues](https://github.com/rokanakbarmarik/nusantara-basa/issues)

---

**Status Project:** 🟢 Active Development

**Last Updated:** 2025

Made with ❤️ for Indonesian languages preservation
