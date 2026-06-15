import Link from "next/link";

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

// SVG Icons
const MapIcon = () => (
  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" />
  </svg>
);

const ChevronDown = () => (
  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
  </svg>
);

const ArrowRight = () => (
  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" />
  </svg>
);

export default async function HomePage() {
  const stats = await getStats();
  const languages = await getLanguages();

  return (
    <div className="min-h-screen bg-[#faf8f5]">
      {/* ===== NAV ===== */}
      <nav className="fixed top-4 left-4 right-4 md:left-1/2 md:right-auto md:-translate-x-1/2 md:w-auto z-50 bg-white/90 backdrop-blur-md border border-earth-300/50 rounded-full px-4 md:px-6 py-2.5 shadow-sm" role="navigation" aria-label="Main navigation">
        <div className="flex items-center justify-between md:justify-start md:gap-6">
          <Link href="/" className="font-black text-[#1a1209] text-sm tracking-tight hover:text-amber-700 transition-colors duration-200" aria-label="Nusantara Basa Home">
            Nusantara<span className="text-amber-700">Basa</span>
          </Link>
          <div className="hidden md:flex items-center gap-4">
            <Link href="/daftar-bahasa" className="text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer">Daftar</Link>
            <Link href="/explore/compare" className="text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer">Compare</Link>
            <Link href="/explore/map" className="text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer">Peta</Link>
            <Link href="/sumber-data" className="text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer">Sumber</Link>
            <a href="/api/export?format=csv" className="text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer" aria-label="Export data as CSV">Export</a>
            <Link href="/dashboard" className="text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer">Dashboard</Link>
            <Link href="/explore/map" className="px-4 py-1.5 bg-[#1a1209] text-earth-100 rounded-full text-sm font-bold hover:bg-[#2d1f0e] transition-all duration-200 cursor-pointer">Jelajahi</Link>
          </div>
        </div>
      </nav>

      {/* ===== HERO ===== */}
      <section className="relative pt-28 md:pt-32 pb-16 md:pb-20 px-4 overflow-hidden" aria-labelledby="hero-heading">
        <div className="absolute inset-0 opacity-[0.03]" style={{
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23000000' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
        }} />

        <div className="max-w-4xl mx-auto text-center relative">
          <h1 id="hero-heading" className="text-4xl sm:text-5xl md:text-7xl font-black tracking-[-0.03em] leading-[1.05] mb-4 md:mb-6 text-[#1a1209]">
            Bahasa Daerah<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-700 via-red-700 to-amber-800">
              Warisan Nusantara
            </span>
          </h1>

          <p className="text-base md:text-lg text-earth-600 max-w-xl mx-auto mb-8 md:mb-10 leading-relaxed">
            Peta interaktif yang mendokumentasikan keragaman bahasa daerah Indonesia.
            Dari yang aman hingga terancam punah.
          </p>

          <div className="flex flex-col sm:flex-row gap-3 justify-center">
            <Link href="/explore/map" className="inline-flex items-center justify-center gap-2 px-6 md:px-8 py-3 bg-[#1a1209] text-earth-100 rounded-full font-bold hover:bg-[#2d1f0e] transition-all duration-200 cursor-pointer shadow-lg hover:shadow-xl" aria-label="Open the interactive language map">
              <MapIcon />
              Mulai Jelajahi
            </Link>
            <Link href="#bahasa" className="inline-flex items-center justify-center gap-2 px-6 md:px-8 py-3 bg-white border border-earth-300 text-earth-700 rounded-full font-bold hover:border-earth-400 transition-all duration-200 cursor-pointer" aria-label="View the language collection">
              Lihat Bahasa
              <ChevronDown />
            </Link>
          </div>
        </div>
      </section>

      {/* ===== STATS ===== */}
      <section className="py-12 md:py-16 px-4" aria-labelledby="stats-heading">
        <h2 id="stats-heading" className="sr-only">Statistics</h2>
        <div className="max-w-4xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4">
          {[
            { label: "Bahasa", value: (stats?.data?.total?.bahasa || 998).toString(), tag: "bahasa daerah" },
            { label: "Rumpun", value: (stats?.data?.rumpunCount || 10).toString(), tag: "keluarga bahasa" },
            { label: "Wilayah", value: (stats?.data?.provinsi?.length || 34).toString(), tag: "provinsi" },
            { label: "Vitalitas", value: (stats?.data?.vitalitas?.length || 5).toString(), tag: "kategori status" },
          ].map((s, i) => (
            <div key={i} className="bg-white border border-earth-300/50 rounded-2xl p-4 md:p-5 hover:shadow-md hover:border-earth-400 transition-all duration-200 cursor-default" role="stat">
              <span className="text-[10px] font-semibold uppercase tracking-widest text-amber-700">{s.tag}</span>
              <div className="text-2xl md:text-3xl font-black text-[#1a1209] mt-1">{s.value}</div>
              <div className="text-xs text-earth-600 mt-0.5">{s.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* ===== BAHASA GRID ===== */}
      <section id="bahasa" className="py-16 md:py-20 px-4 border-t border-earth-300/50" aria-labelledby="bahasa-heading">
        <div className="max-w-5xl mx-auto">
          <div className="flex items-end justify-between mb-8 md:mb-10">
            <div>
              <span className="text-[10px] font-semibold uppercase tracking-widest text-amber-700 mb-1 block">koleksi</span>
              <h2 id="bahasa-heading" className="text-xl sm:text-2xl md:text-3xl font-black text-[#1a1209]">Bahasa Daerah</h2>
            </div>
            <Link href="/explore/map" className="text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer flex items-center gap-1" aria-label="View all languages on the map">
              semua <ArrowRight />
            </Link>
          </div>

          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-3">
            {languages.map((lang: any) => {
              const color = lang.rumpunNama === "Papua" ? "#8b3a3a" : lang.rumpunNama === "Trans-New Guinea" ? "#5a7247" : "#c4703f";
              const penutur = lang.jumlahPenutur ? lang.jumlahPenutur >= 1000000 ? `${(lang.jumlahPenutur / 1000000).toFixed(1)}M` : `${(lang.jumlahPenutur / 1000).toFixed(0)}K` : '—';
              return (
                <Link key={lang.id} href={`/explore/bahasa/${lang.id}`}
                  className="group bg-white border border-earth-300/50 rounded-2xl p-3 md:p-4 hover:shadow-md hover:border-earth-400 transition-all duration-200 cursor-pointer"
                  aria-label={`View details about ${lang.namaBahasa}`}
                >
                  <div className="flex items-center gap-2 md:gap-3 mb-2 md:mb-3">
                    <div className="w-8 h-8 md:w-9 md:h-9 rounded-xl flex items-center justify-center text-white font-bold text-xs flex-shrink-0" style={{ backgroundColor: color }} aria-hidden="true">
                      {lang.namaBahasa.charAt(0)}
                    </div>
                    <div className="min-w-0">
                      <h3 className="font-bold text-[#1a1209] text-sm truncate group-hover:text-earth-800 transition-colors duration-200">{lang.namaBahasa}</h3>
                      {lang.namaLokal && <p className="text-[10px] text-earth-600 truncate italic">{lang.namaLokal}</p>}
                    </div>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-xs text-earth-600">{penutur} penutur</span>
                    <span className="text-[10px] px-2 py-0.5 rounded-full font-medium" style={{ backgroundColor: color + "15", color }}>{lang.rumpunNama}</span>
                  </div>
                </Link>
              );
            })}
          </div>
        </div>
      </section>

      {/* ===== CTA ===== */}
      <section className="py-16 md:py-24 px-4 border-t border-earth-300/50 bg-gradient-to-t from-earth-200/50 to-[#faf8f5]" aria-labelledby="cta-heading">
        <div className="max-w-2xl mx-auto text-center">
          <h2 id="cta-heading" className="text-2xl sm:text-3xl md:text-4xl font-black text-[#1a1209] mb-4">
            Mulai <span className="text-amber-700">Eksplorasi</span>
          </h2>
          <p className="text-earth-600 mb-6 md:mb-8 max-w-sm mx-auto">
            Buka peta interaktif dan temukan bahasa daerah di seluruh Nusantara.
          </p>
          <Link href="/explore/map" className="inline-flex items-center gap-2 px-8 md:px-10 py-3 md:py-4 bg-[#1a1209] text-earth-100 rounded-full font-bold hover:bg-[#2d1f0e] transition-all duration-200 cursor-pointer shadow-xl hover:shadow-2xl" aria-label="Open the interactive map">
            Buka Peta Interaktif
            <ArrowRight />
          </Link>
        </div>
      </section>

      {/* ===== FOOTER ===== */}
      <footer className="py-6 md:py-8 px-4 border-t border-earth-300/50 bg-white" role="contentinfo">
        <div className="max-w-5xl mx-auto flex flex-col sm:flex-row items-center justify-between gap-3">
          <span className="font-black text-[#1a1209] text-sm">
            Nusantara<span className="text-amber-700">Basa</span>
          </span>
          <span className="text-xs text-earth-600">© 2026 Peta Interaktif Bahasa Indonesia</span>
        </div>
      </footer>
    </div>
  );
}
