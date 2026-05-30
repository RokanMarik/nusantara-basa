import Link from "next/link";
import { Logo } from "@/components/shared/Logo";

async function getStats() {
  const baseUrl = process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : "http://localhost:3000";
  const res = await fetch(`${baseUrl}/api/stats`, { cache: "no-store" });
  if (!res.ok) return null;
  return res.json();
}

async function getLanguages() {
  const baseUrl = process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : "http://localhost:3000";
  const res = await fetch(`${baseUrl}/api/bahasa?limit=8`, { cache: "no-store" });
  if (!res.ok) return [];
  const data = await res.json();
  return data.data || [];
}

// Tenun-inspired accent colors
const ACCENTS = [
  { name: "Austronesia", color: "#b45309", bg: "#fef3c7" },
  { name: "Papua", color: "#991b1b", bg: "#fee2e2" },
  { name: "Trans-New Guinea", color: "#166534", bg: "#dcfce7" },
];

export default async function HomePage() {
  const stats = await getStats();
  const languages = await getLanguages();

  return (
    <div className="min-h-screen bg-[#faf8f5]">
      {/* ===== HERO ===== */}
      <section className="relative overflow-hidden">
        {/* Background gradient + batik-inspired pattern */}
        <div className="absolute inset-0 bg-gradient-to-br from-amber-50 via-orange-50 to-red-50" />
        <div className="absolute inset-0 opacity-[0.03]" style={{
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23000000' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
        }} />

        <div className="relative max-w-5xl mx-auto px-4 pt-28 pb-32 text-center">
          <div className="flex justify-center mb-6">
            <div className="bg-white/80 backdrop-blur-sm rounded-2xl px-5 py-3 shadow-sm border border-amber-200/50">
              <Logo size="md" />
            </div>
          </div>

          <h1 className="text-5xl md:text-7xl font-black text-[#1a1209] mb-6 tracking-tight leading-[1.1]">
            Bahasa Daerah<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-700 via-red-700 to-amber-800">
              Warisan Nusantara
            </span>
          </h1>

          <p className="text-lg md:text-xl text-[#5c4a35] mb-12 max-w-xl mx-auto leading-relaxed">
            Jelajahi ratusan bahasa dari Aceh sampai Papua melalui peta interaktif.
          </p>

          <div className="flex flex-col sm:flex-row gap-3 justify-center">
            <Link href="/explore/map" className="inline-flex items-center justify-center gap-2 px-8 py-3.5 bg-[#1a1209] text-amber-50 rounded-full font-semibold text-lg hover:bg-[#2d1f0e] transition-colors shadow-lg shadow-amber-900/20">
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" /></svg>
              Buka Peta
            </Link>
            <Link href="#bahasa" className="inline-flex items-center justify-center gap-2 px-8 py-3.5 bg-white/80 backdrop-blur-sm text-[#1a1209] rounded-full font-semibold text-lg hover:bg-white transition-colors border border-amber-200">
              Lihat Bahasa
            </Link>
          </div>
        </div>

        {/* Wave divider */}
        <div className="absolute bottom-0 left-0 right-0">
          <svg viewBox="0 0 1440 80" fill="none" xmlns="http://www.w3.org/2000/svg" className="w-full h-16 md:h-20">
            <path d="M0 40L48 36C96 32 192 24 288 28C384 32 480 48 576 52C672 56 768 48 864 40C960 32 1056 24 1152 28C1248 32 1344 48 1392 56L1440 64V80H1392C1344 80 1248 80 1152 80C1056 80 960 80 864 80C768 80 672 80 576 80C480 80 384 80 288 80C192 80 96 80 48 80H0V40Z" fill="#faf8f5"/>
          </svg>
        </div>
      </section>

      {/* ===== STATS ===== */}
      <section className="py-12 px-4 -mt-2">
        <div className="max-w-3xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-4">
          {stats && [
            { label: "Bahasa", value: stats.totalBahasa || 20, accent: ACCENTS[0] },
            { label: "Rumpun", value: stats.totalRumpun, accent: ACCENTS[1] },
            { label: "Wilayah", value: stats.totalLokasi, accent: ACCENTS[2] },
            { label: "Status", value: Object.keys(stats.vitalitasBreakdown).length, accent: ACCENTS[0] },
          ].map((s, i) => (
            <div key={i} className="bg-white rounded-2xl p-5 text-center border border-amber-100 shadow-sm hover:shadow-md transition-shadow">
              <div className="text-3xl font-black" style={{ color: s.accent.color }}>{s.value}</div>
              <div className="text-sm text-[#5c4a35] mt-1">{s.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* ===== RUMPUN LEGEND ===== */}
      <section className="py-6 px-4">
        <div className="max-w-3xl mx-auto bg-white rounded-2xl p-5 border border-amber-100 shadow-sm">
          <div className="flex flex-wrap justify-center gap-5">
            {ACCENTS.map((a) => (
              <div key={a.name} className="flex items-center gap-2">
                <div className="w-4 h-4 rounded-full border-2 border-white shadow-sm" style={{ backgroundColor: a.color }} />
                <span className="text-sm font-medium text-[#1a1209]">{a.name}</span>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ===== BAHASA GRID ===== */}
      <section id="bahasa" className="py-12 px-4">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-10">
            <h2 className="text-3xl font-black text-[#1a1209]">Bahasa Daerah</h2>
            <p className="text-[#5c4a35] mt-2">Beberapa dari koleksi kami</p>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            {languages.map((lang: any) => {
              const accent = ACCENTS.find(a => a.name === lang.rumpunNama) || ACCENTS[0];
              const penutur = lang.jumlahPenutur
                ? lang.jumlahPenutur >= 1000000 ? `${(lang.jumlahPenutur / 1000000).toFixed(1)}M` : `${(lang.jumlahPenutur / 1000).toFixed(0)}K`
                : '—';
              return (
                <Link key={lang.id} href={`/explore/bahasa/${lang.id}`}
                  className="group bg-white rounded-2xl p-4 border border-amber-100 hover:border-amber-300 hover:shadow-md transition-all">
                  <div className="flex items-center gap-3 mb-2">
                    <div className="w-10 h-10 rounded-xl flex items-center justify-center text-white font-bold text-sm" style={{ backgroundColor: accent.color }}>
                      {lang.namaBahasa.charAt(0)}
                    </div>
                    <div className="min-w-0">
                      <h3 className="font-bold text-[#1a1209] text-sm truncate">{lang.namaBahasa}</h3>
                      {lang.namaLokal && <p className="text-xs text-[#8b7355] truncate italic">{lang.namaLokal}</p>}
                    </div>
                  </div>
                  <div className="text-xs text-[#8b7355] mt-2">
                    <span className="font-semibold" style={{ color: accent.color }}>{penutur}</span> penutur · {lang.rumpunNama}
                  </div>
                </Link>
              );
            })}
          </div>

          <div className="text-center mt-8">
            <Link href="/explore/map" className="inline-flex items-center gap-1 text-amber-800 hover:text-amber-900 font-semibold transition-colors">
              Lihat semua di peta interaktif
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" /></svg>
            </Link>
          </div>
        </div>
      </section>

      {/* ===== CTA ===== */}
      <section className="py-20 px-4">
        {/* Wave top */}
        <div className="absolute top-0 left-0 right-0 rotate-180">
          <svg viewBox="0 0 1440 80" fill="none" xmlns="http://www.w3.org/2000/svg" className="w-full h-16 md:h-20">
            <path d="M0 40L48 36C96 32 192 24 288 28C384 32 480 48 576 52C672 56 768 48 864 40C960 32 1056 24 1152 28C1248 32 1344 48 1392 56L1440 64V80H1392C1344 80 1248 80 1152 80C1056 80 960 80 864 80C768 80 672 80 576 80C480 80 384 80 288 80C192 80 96 80 48 80H0V40Z" fill="#faf8f5"/>
          </svg>
        </div>

        <div className="max-w-2xl mx-auto text-center relative">
          {/* Decorative geometric pattern */}
          <div className="absolute -top-8 left-1/2 -translate-x-1/2 w-24 h-24 opacity-10">
            <svg viewBox="0 0 100 100" fill="none"><path d="M50 0L100 50L50 100L0 50Z" fill="#b45309"/></svg>
          </div>

          <h2 className="text-3xl md:text-4xl font-black text-[#1a1209] mb-4">
            Mulai Jelajahi
          </h2>
          <p className="text-[#5c4a35] mb-8 max-w-md mx-auto">
            Buka peta interaktif dan temukan bahasa daerah di seluruh Nusantara.
          </p>
          <Link href="/explore/map" className="inline-flex items-center gap-2 px-10 py-4 bg-gradient-to-r from-amber-700 to-red-800 text-white rounded-full font-bold text-lg hover:from-amber-800 hover:to-red-900 transition-all shadow-xl shadow-amber-900/25">
            Buka Peta Interaktif
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" /></svg>
          </Link>
        </div>
      </section>

      {/* ===== FOOTER ===== */}
      <footer className="py-8 px-4 border-t border-amber-100 bg-white">
        <div className="max-w-4xl mx-auto text-center">
          <div className="flex justify-center mb-3">
            <Logo size="sm" />
          </div>
          <p className="text-sm text-[#8b7355]">© 2026 Nusantara Basa — Peta Interaktif Bahasa Indonesia</p>
        </div>
      </footer>
    </div>
  );
}
