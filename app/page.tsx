import Link from "next/link";
import dynamic from "next/dynamic";

const LanguageMap = dynamic(
  () => import("@/components/map/LanguageMap").then((m) => ({ default: m.LanguageMap })),
  { ssr: false, loading: () => <div className="absolute inset-0 bg-earth-200" /> }
);

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

export default async function HomePage() {
  const stats = await getStats();
  const languages = await getLanguages();

  return (
    <div className="min-h-screen bg-[#faf8f5]">
      {/* ===== NAV ===== */}
      <nav className="fixed top-4 left-1/2 -translate-x-1/2 z-50 bg-white/90 backdrop-blur-md border border-earth-300/50 rounded-full px-6 py-2.5 shadow-sm">
        <div className="flex items-center gap-6">
          <Link href="/" className="font-black text-[#1a1209] text-sm tracking-tight">
            Nusantara<span className="text-amber-700">Basa</span>
          </Link>
          <Link href="/explore/map" className="text-sm text-earth-600 hover:text-earth-700 transition-colors">Peta</Link>
          <Link href="#bahasa" className="text-sm text-earth-600 hover:text-earth-700 transition-colors">Bahasa</Link>
          <Link href="/explore/map" className="px-4 py-1.5 bg-[#1a1209] text-earth-100 rounded-full text-sm font-bold hover:bg-[#2d1f0e] transition-colors">
            Jelajahi
          </Link>
        </div>
      </nav>

      {/* ===== HERO WITH MAP BACKGROUND ===== */}
      <section className="relative h-[70vh] overflow-hidden">
        {/* Map background */}
        <div className="absolute inset-0">
          <LanguageMap markers={[]} center={[-2.5, 118.0]} zoom={5} />
        </div>

        {/* Gradient overlay */}
        <div className="absolute inset-0 bg-gradient-to-b from-earth-100/80 via-earth-100/60 to-[#faf8f5]" />

        {/* Hero content */}
        <div className="relative h-full flex flex-col items-center justify-center px-4 text-center">
          <h1 className="text-5xl md:text-7xl font-black tracking-[-0.03em] leading-[1.05] mb-6 text-[#1a1209]">
            Bahasa Daerah<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-700 via-red-700 to-amber-800">
              Warisan Nusantara
            </span>
          </h1>

          <p className="text-base md:text-lg text-earth-600 max-w-xl mx-auto mb-10 leading-relaxed">
            Peta interaktif yang mendokumentasikan keragaman bahasa daerah Indonesia.
            Dari yang aman hingga terancam punah.
          </p>

          <div className="flex flex-col sm:flex-row gap-3">
            <Link href="/explore/map" className="inline-flex items-center justify-center gap-2 px-8 py-3 bg-[#1a1209] text-earth-100 rounded-full font-bold hover:bg-[#2d1f0e] transition-colors shadow-lg">
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" /></svg>
              Mulai Jelajahi
            </Link>
            <Link href="#bahasa" className="inline-flex items-center justify-center gap-2 px-8 py-3 bg-white border border-earth-300 text-earth-700 rounded-full font-bold hover:border-earth-400 transition-all">
              Lihat Bahasa
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" /></svg>
            </Link>
          </div>
        </div>
      </section>

      {/* ===== STATS ===== */}
      <section className="py-16 px-4">
        <div className="max-w-4xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-3">
          {[
            { label: "Bahasa", value: (stats?.totalBahasa || 20).toString(), tag: "bahasa daerah" },
            { label: "Rumpun", value: (stats?.totalRumpun || 3).toString(), tag: "keluarga bahasa" },
            { label: "Wilayah", value: (stats?.totalLokasi || 20).toString(), tag: "sebaran" },
            { label: "Vitalitas", value: Object.keys(stats?.vitalitasBreakdown || {}).length.toString(), tag: "status" },
          ].map((s, i) => (
            <div key={i} className="bg-white border border-earth-300/50 rounded-2xl p-5 hover:shadow-md hover:border-earth-400 transition-all">
              <span className="text-[10px] font-semibold uppercase tracking-widest text-amber-700">{s.tag}</span>
              <div className="text-3xl font-black text-[#1a1209] mt-1">{s.value}</div>
              <div className="text-xs text-earth-600 mt-0.5">{s.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* ===== BAHASA GRID ===== */}
      <section id="bahasa" className="py-20 px-4 border-t border-earth-300/50">
        <div className="max-w-5xl mx-auto">
          <div className="flex items-end justify-between mb-10">
            <div>
              <span className="text-[10px] font-semibold uppercase tracking-widest text-amber-700 mb-1 block">koleksi</span>
              <h2 className="text-2xl md:text-3xl font-black text-[#1a1209]">Bahasa Daerah</h2>
            </div>
            <Link href="/explore/map" className="text-sm text-earth-600 hover:text-earth-700 transition-colors flex items-center gap-1">
              semua →
            </Link>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            {languages.map((lang: any) => {
              const color = lang.rumpunNama === "Papua" ? "#8b3a3a" : lang.rumpunNama === "Trans-New Guinea" ? "#5a7247" : "#c4703f";
              const penutur = lang.jumlahPenutur ? lang.jumlahPenutur >= 1000000 ? `${(lang.jumlahPenutur / 1000000).toFixed(1)}M` : `${(lang.jumlahPenutur / 1000).toFixed(0)}K` : '—';
              return (
                <Link key={lang.id} href={`/explore/bahasa/${lang.id}`}
                  className="group bg-white border border-earth-300/50 rounded-2xl p-4 hover:shadow-md hover:border-earth-400 transition-all">
                  <div className="flex items-center gap-3 mb-3">
                    <div className="w-9 h-9 rounded-xl flex items-center justify-center text-white font-bold text-sm" style={{ backgroundColor: color }}>
                      {lang.namaBahasa.charAt(0)}
                    </div>
                    <div className="min-w-0">
                      <h3 className="font-bold text-[#1a1209] text-sm truncate">{lang.namaBahasa}</h3>
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
      <section className="py-24 px-4 border-t border-earth-300/50 bg-gradient-to-t from-earth-200/50 to-[#faf8f5]">
        <div className="max-w-2xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-black text-[#1a1209] mb-4">
            Mulai <span className="text-amber-700">Eksplorasi</span>
          </h2>
          <p className="text-earth-600 mb-8 max-w-sm mx-auto">
            Buka peta interaktif dan temukan bahasa daerah di seluruh Nusantara.
          </p>
          <Link href="/explore/map" className="inline-flex items-center gap-2 px-10 py-4 bg-[#1a1209] text-earth-100 rounded-full font-bold hover:bg-[#2d1f0e] transition-colors shadow-xl">
            Buka Peta Interaktif
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M13 7l5 5m0 0l-5 5m5-5H6" /></svg>
          </Link>
        </div>
      </section>

      {/* ===== FOOTER ===== */}
      <footer className="py-8 px-4 border-t border-earth-300/50 bg-white">
        <div className="max-w-5xl mx-auto flex items-center justify-between">
          <span className="font-black text-[#1a1209] text-sm">
            Nusantara<span className="text-amber-700">Basa</span>
          </span>
          <span className="text-xs text-earth-600">© 2026 Peta Interaktif Bahasa Indonesia</span>
        </div>
      </footer>
    </div>
  );
}
