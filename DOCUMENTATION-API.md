# 📡 Nusantara Basa API Documentation

## Overview

API endpoints untuk mengakses data bahasa Indonesia lengkap dengan historis, pengaruh budaya, dan statistik penutur.

**Base URL:** `http://localhost:3000/api` (development) atau `https://your-domain.vercel.app/api` (production)

---

## Core Endpoints

### 1. Get All Languages

**Endpoint:** `/api/bahasa`

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `limit` | number | No | Max results (default: 50) |
| `offset` | number | No | Pagination offset (default: 0) |
| `rumpun` | string | No | Filter by linguistic family |
| `vitalitas` | string | No | Filter by vitality status |
| `search` | string | No | Search by name |

**Example:**
```bash
curl "http://localhost:3000/api/bahasa?limit=20&search=Jawa"
```

**Response:**
```json
{
  "data": [
    {
      "id": "uuid-here",
      "namaBahasa": "Jawa",
      "namaLokal": "Basa Jawa",
      "kodeIso639": "jav",
      "jumlahPenutur": 80000000,
      "statusVitalitas": "aman",
      "rumpunNama": "Austronesia"
    }
  ],
  "total": 71,
  "limit": 20,
  "offset": 0
}
```

---

### 2. Get Language Detail with Full Data

**Endpoint:** `/api/bahasa/[id]`

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | Yes | Language UUID |

**Example:**
```bash
curl "http://localhost:3000/api/bahasa/abc-123-def-456"
```

**Response:**
```json
{
  "id": "abc-123-def-456",
  "namaBahasa": "Jawa",
  "namaLokal": "Basa Jawa",
  "kodeIso639": "jav",
  "autoSummary": "Bahasa Jawa adalah...",
  "jumlahPenutur": 80000000,
  "statusVitalitas": "aman",
  "koordinatPusat": {"lat": -7.5, "lng": 110.0},
  
  // Linguistic features
  "fiturLinguistik": {
    "sistemTulisan": "Latin, Hanacaraka",
    "tipeMorfologi": "aglutinatif",
    "urutanKata": "SVO",
    "jumlahVokal": 6,
    "jumlahKonsonan": 20
  },
  
  // Locations
  "lokasi": [
    {
      "provinsi": "Jawa Tengah",
      "kabupaten": "Surakarta",
      "tipeWilayah": "pulau"
    }
  ],
  
  // Historical influences
  "pengaruhBahasaLain": [
    {
      "bahasaAsal": "Sansekerta",
      "periodePengaruh": "800-1500 M",
      "jenisPengaruh": "kosakata",
      "contohKosakata": [
        {"kata": "raja", "arti": "king", "periode": 800}
      ],
      "estimasiSerapan": 25,
      "jalurMasuk": "Agama Hindu-Buddha"
    }
  ],
  
  // Historical events
  "peristiwaSejarah": [
    {
      "tahunMulai": 800,
      "tahunSelesai": 1500,
      "jenisPeristiwa": "Perkembangan kerajaan Hindu-Buddha",
      "eraHistoris": "Hindu-Buddha",
      "dampakPadaBahasa": "Masuknya kosakata Sansekerta",
      "wilayahTerdampak": "Jawa Tengah, Jawa Timur"
    }
  ],
  
  // Historical speakers
  "penuturHistoris": [
    {
      "tahunSensus": 1930,
      "jumlahPenutur": 25000000,
      "metodePencacahan": "Sensus Belanda",
      "sumberData": "Volkstelling 1930"
    }
  ],
  
  // Name changes over time
  "riwayatNama": [
    {
      "namaLama": "Basa Jawi",
      "periodeDigunakan": "800-1945",
      "digunakanOleh": "Masyarakat Jawa",
      "aksaraAsli": "Hanacaraka, Kawi"
    }
  ],
  
  // Media & references
  "mediaDokumen": [],
  "sumberReferensi": [],
  "kosakata": []
}
```

---

## Historical Module Endpoints

### 3. Get Historical Events

**Endpoint:** `/api/peristiwa-sejarah`

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `bahasa_id` | string | No | Filter by language |
| `jenis_peristiwa` | string | No | Filter by event type |
| `era_historis` | string | No | Filter by historical era |
| `limit` | number | No | Max results (default: 100) |
| `offset` | number | No | Pagination offset (default: 0) |

**Example:**
```bash
curl "http://localhost:3000/api/peristiwa-sejarah?bahasa_id=xyz-789&limit=10"
```

**Response:**
```json
[
  {
    "id": "event-uuid-1",
    "tahunMulai": 1600,
    "tahunSelesai": 1945,
    "jenisPeristiwa": "Kolonisasi Belanda",
    "eraHistoris": "Kolonial",
    "dampakPadaBahasa": "Masuknya kosakata Belanda",
    "wilayahTerdampak": "Seluruh Jawa",
    "sumberSejarah": "Dokumen kolonial",
    "bahasaNama": "Jawa",
    "bahasaKode": "jav"
  }
]
```

**Common `jenis_peristiwa` Values:**
- Kolonisasi
- Islamisasi
- Perkembangan kerajaan Hindu-Buddha
- Perdagangan internasional
- Sumpah Pemuda

**Common `era_historis` Values:**
- Hindu-Buddha
- Islam
- Kolonial
- Modern

---

### 4. Get Language Influences

**Endpoint:** `/api/pengaruh-bahasa`

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `bahasa_id` | string | No | Filter by target language |
| `bahasa_asal` | string | No | Filter by source language |
| `limit` | number | No | Max results (default: 100) |
| `offset` | number | No | Pagination offset (default: 0) |

**Example:**
```bash
curl "http://localhost:3000/api/pengaruh-bahasa?limit=20"
```

**Response:**
```json
[
  {
    "id": "influence-uuid-1",
    "bahasaAsal": "Sansekerta",
    "periodePengaruh": "800-1500 M",
    "jenisPengaruh": "kosakata",
    "contohKosakata": [
      {"kata": "raja", "arti": "king", "periode": 800},
      {"kata": "negara", "arti": "country", "periode": 900}
    ],
    "estimasiSerapan": 25,
    "jalurMasuk": "Agama Hindu-Buddha",
    "bahasaNama": "Jawa",
    "bahasaKode": "jav"
  }
]
```

**Common `jenis_pengaruh` Values:**
- kosakata
- aksara
- tata bahasa
- fonologi

**Common `jalur_masuk` Values:**
- Agama Hindu-Buddha
- Agama Islam
- Penetration kolonial
- Perdagangan

---

### 5. Get Historical Speaker Data

**Endpoint:** `/api/penutur-historis`

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `bahasa_id` | string | No | Filter by language |
| `tahun_sensus` | number | No | Filter by census year |
| `limit` | number | No | Max results (default: 100) |
| `offset` | number | No | Pagination offset (default: 0) |

**Example:**
```bash
curl "http://localhost:3000/api/penutur-historis?bahasa_id=xyz-789"
```

**Response:**
```json
[
  {
    "id": "speaker-uuid-1",
    "tahunSensus": 1930,
    "jumlahPenutur": 25000000,
    "metodePencacahan": "Sensus Belanda",
    "sumberData": "Volkstelling 1930"
  },
  {
    "id": "speaker-uuid-2",
    "tahunSensus": 2020,
    "jumlahPenutur": 80000000,
    "metodePencacahan": "Sensus nasional",
    "sumberData": "BPS 2020"
  }
]
```

---

## Existing Endpoints

### 6. Get Statistics Dashboard

**Endpoint:** `/api/stats`

**Example:**
```bash
curl "http://localhost:3000/api/stats"
```

**Response:**
```json
{
  "totalBahasa": 71,
  "totalRumpun": 5,
  "totalLokasi": 35,
  "vitalitasBreakdown": {
    "aman": 45,
    "rentan": 15,
    "terancam": 8,
    "kritis": 2,
    "punah": 1
  }
}
```

---

### 7. Search Languages

**Endpoint:** `/api/search`

**Method:** POST

**Request Body:**
```json
{
  "query": "Jawa"
}
```

**Response:**
```json
{
  "results": [
    {
      "id": "abc-123",
      "namaBahasa": "Jawa",
      "matchScore": 0.95
    }
  ]
}
```

---

### 8. Export Data

**Endpoint:** `/api/export`

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `format` | string | Yes | `csv`, `json`, `xml` |
| `tables` | string | Yes | Comma-separated table names |

**Example:**
```bash
curl "http://localhost:3000/api/export?format=json&tables=bahasa,lokasi"
```

**Response:** JSON or CSV file download

---

## Error Handling

All endpoints return standard HTTP status codes:

| Status | Description | Example Response |
|--------|-------------|------------------|
| `200` | Success | Normal response |
| `400` | Bad Request | `{"error": "Invalid parameter value"}` |
| `404` | Not Found | `{"error": "Bahasa not found"}` |
| `500` | Server Error | `{"error": "Database connection failed"}` |

---

## Rate Limiting

No rate limiting in development mode. In production:
- **GET requests:** 100 requests per minute per IP
- **POST requests:** 20 requests per minute per IP

---

## Authentication

Public endpoints (read-only):
- No authentication required for basic queries
- Service role key only needed for write operations (not exposed in client)

---

## TypeScript Types

Available in `/lib/types.ts`:

```typescript
export interface BahasaDetail {
  id: string;
  namaBahasa: string;
  namaLokal: string | null;
  kodeIso639: string | null;
  autoSummary: string | null;
  jumlahPenutur: number | null;
  statusVitalitas: string | null;
  fiturLinguistik: { ... };
  lokasi: Array<{ provinsi: string; kabupaten: string }>;
  pengaruhBahasaLain: PengaruhArray[];
  peristiwaSejarah: PeristiwaArray[];
  penuturHistoris: PenuturArray[];
  riwayatNama: RiwayatArray[];
  // ... more fields
}
```

---

## Usage Examples

### React Component Example

```tsx
"use client";

import { useEffect, useState } from "react";

export default function LanguageDetail({ id }: { id: string }) {
  const [language, setLanguage] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchLanguage() {
      try {
        const res = await fetch(`/api/bahasa/${id}`);
        const data = await res.json();
        setLanguage(data);
      } catch (err) {
        console.error("Error fetching language:", err);
      } finally {
        setLoading(false);
      }
    }

    fetchLanguage();
  }, [id]);

  if (loading) return <div>Loading...</div>;

  return (
    <div className="container">
      <h1>{language?.namaBahasa}</h1>
      
      <section>
        <h2>Fakta Dasar</h2>
        <p>Penutur: {language?.jumlahPenutur?.toLocaleString()}</p>
        <p>Status: {language?.statusVitalitas}</p>
      </section>

      {language?.peristiwaSejarah.length > 0 && (
        <section>
          <h2>Sejarah</h2>
          <ul>
            {language.peristiwaSejarah.map((event) => (
              <li key={event.tahunMulai}>
                {event.tahunMulai}-{event.tahunSelesai}: {event.jenisPeristiwa}
              </li>
            ))}
          </ul>
        </section>
      )}

      {language?.pengaruhBahasaLain.length > 0 && (
        <section>
          <h2>Pengaruh Bahasa Lain</h2>
          {language.pengaruhBahasaLain.map((pengaruh) => (
            <div key={pengaruh.bahasaAsal}>
              <h3>{pengaruh.bahasaAsal}</h3>
              <p>Kosakata terinspirasi: {pengaruh.contohKosakata.map(k => k.kata).join(", ")}</p>
            </div>
          ))}
        </section>
      )}
    </div>
  );
}
```

---

## Development Notes

### Database Schema Changes

All endpoints automatically support new tables:
- `peristiwa_sejarah` - Historical events
- `pengaruh_bahasa_lain` - Language influences
- `penutur_historis` - Historical speakers
- `riwayat_nama` - Name history
- `media_dokumen` - Media documentation
- `sumber_referensi` - Reference sources

### Migration Files

Run migrations in order:
1. `prisma/migrations/001_add_complete_tables.sql` - Add new tables
2. `prisma/migrations/002_enrich_data.sql` - Enrich existing data

### Environment Variables

Required in `.env`:
```bash
NEXT_PUBLIC_SUPABASE_URL=https://hkeheukewxsvaarxaket.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
```

---

## Next Steps

After API setup is complete:
1. Build admin UI for data entry
2. Create map visualization component
3. Deploy to Vercel
4. Configure custom domain

---

**Documentation Version:** 2.0  
**Last Updated:** 2024-01-14  
**Author:** Rokan Akbar Marik  
**Repository:** github.com/RokanMarik/nusantara-basa
