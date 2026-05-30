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

// Custom SVG Icons
const Icons = {
  Languages: () => (
    <svg viewBox="0 0 48 48" fill="none" className="w-10 h-10">
      <circle cx="24" cy="24" r="20" stroke="currentColor" strokeWidth="2" />
      <path d="M14 20h20M14 28h20M24 14v20" stroke="currentColor" strokeWidth="2" strokeLinecap="round" />
      <circle cx="24" cy="24" r="4" fill="currentColor" opacity="0.3" />
    </svg>
  ),
  Rumpun: () => (
    <svg viewBox="0 0 48 48" fill="none" className="w-10 h-10">
      <path d="M24 6v36M24 6c-8 8-16 14-16 22M24 6c8 8 16 14 16 22M24 14c-5 5-10 9-10 14M24 14c5 5 10 9 10 14" stroke="currentColor" strokeWidth="2" strokeLinecap="round" />
    </svg>
  ),
  Map: () => (
    <svg viewBox="0 0 48 48" fill="none" className="w-10 h-10">
      <path d="M6 10l12-4 12 4 12-4v28l-12 4-12-4-12 4V10z" stroke="currentColor" strokeWidth="2" />
      <path d="M18 6v28M30 10v28" stroke="currentColor" strokeWidth="2" />
      <circle cx="24" cy="22" r="3" fill="currentColor" opacity="0.3" />
    </svg>
  ),
  Vitality: () => (
    <svg viewBox="0 0 48 48" fill="none" className="w-10 h-10">
      <rect x="8" y="28" width="6" height="14" rx="1" fill="currentColor" opacity="0.3" />
      <rect x="17" y="20" width="6" height="22" rx="1" fill="currentColor" opacity="0.5" />
      <rect x="26" y="14" width="6" height="28" rx="1" fill="currentColor" opacity="0.7" />
      <rect x="35" y="6" width="6" height="36" rx="1" fill="currentColor" />
    </svg>
  ),
  Arrow: () => (
    <svg viewBox="0 0 24 24" fill="none" className="w-5 h-5 inline-block ml-1">
      <path d="M5 12h14M12 5l7 7-7 7" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  ),
  Explore: () => (
    <svg viewBox="0 0 48 48" fill="none" className="w-8 h-8">
      <circle cx="24" cy="24" r="18" stroke="currentColor" strokeWidth="2" />
      <path d="M24 12l4 12-12-4 12-4-4 12" fill="currentColor" opacity="0.2" />
      <circle cx="24" cy="24" r="3" fill="currentColor" />
    </svg>
  ),
};

export default async function HomePage() {
  const stats = await getStats();
  const languages = await getLanguages();

  return (
    <div className="min-h-screen bg-[#0a0a0a] text-white">
      {/* ===== NAV ===== */}
      <nav className="fixed top-0 left-0 right-0 z-50 bg-[#0a0a0a]/80 backdrop-blur-xl border-b border-white/5">
        <div className="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2">
            <div className="bg-white/5 rounded-xl px-3 py-1.5 border border-white/10">
              <Logo size="sm" />
            </div>
          </Link>
          <div className="flex items-center gap-4">
            <Link href="/explore/map" className="text-sm text-white/60 hover:text-white transition-colors">Peta</Link>
            <Link href="#bahasa" className="text-sm text-white/60 hover:text-white transition-colors">Bahasa</Link>
            <Link href="/explore/map" className="px-5 py-2 bg-white text-[#0a0a0a] rounded-full text-sm font-semibold hover:bg-white/90 transition-colors">
              Jelajahi
            </Link>
          </div>
        </div>
      </nav>

      {/* ===== HERO ===== */}
      <section className="relative pt-32 pb-20 px-4 overflow-hidden">
        {/* Gradient blobs */}
        <div className="absolute top-20 left-1/4 w-96 h-96 bg-amber-600/10 rounded-full blur-3xl" />
        <div className="absolute top-40 right-1/4 w-80 h-80 bg-orange-600/10 rounded-full blur-3xl" />

        <div className="max-w-4xl mx-auto text-center relative">
          <div className="inline-flex items-center gap-2 px-4 py-2 bg-white/5 border border-white/10 rounded-full text-sm text-white/60 mb-8">
            <span className="w-2 h-2 bg-green-400 rounded-full animate-pulse" />
            {stats?.totalBahasa || 20} bahasa terdokumentasi
          </div>

          <h1 className="text-5xl md:text-8xl font-black tracking-tight leading-[0.95] mb-8">
            Bahasa Daerah<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 via-orange-400 to-red-400">
              Warisan Nusantara
            </span>
          </h1>

          <p className="text-lg md:text-xl text-white/50 max-w-2xl mx-auto mb-12 leading-relaxed">
            Peta interaktif yang mendokumentasikan keragaman bahasa daerah Indonesia.
            Dari yang aman hingga terancam punah — setiap bahasa menyimpan cerita.
          </p>

          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/explore/map" className="inline-flex items-center justify-center gap-2 px-10 py-4 bg-white text-[#0a0a0a] rounded-full font-bold text-lg hover:bg-white/90 transition-all shadow-2xl shadow-white/10">
              <Icons.Explore />
              Mulai Jelajahi
            </Link>
            <Link href="#bahasa" className="inline-flex items-center justify-center gap-2 px-10 py-4 bg-white/5 border border-white/10 text-white rounded-full font-bold text-lg hover:bg-white/10 transition-all">
              Lihat Bahasa
            </Link>
          </div>
        </div>
      </section>

      {/* ===== STATS ===== */}
      <section className="py-16 px-4 border-t border-white/5">
        <div className="max-w-5xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-4">
          {[
            { label: "Bahasa Daerah", value: (stats?.totalBahasa || 20).toString(), Icon: Icons.Languages },
            { label: "Rumpun Bahasa", value: (stats?.totalRumpun || 3).toString(), Icon: Icons.Rumpun },
            { label: "Wilayah Sebaran", value: (stats?.totalLokasi || 20).toString(), Icon: Icons.Map },
            { label: "Status Vitalitas", value: Object.keys(stats?.vitalitasBreakdown || {}).length.toString(), Icon: Icons.Vitality },
          ].map((s, i) => (
            <div key={i} className="group bg-white/[0.03] border border-white/5 rounded-2xl p-6 hover:bg-white/[0.06] hover:border-white/10 transition-all">
              <div className="text-amber-400 mb-3 group-hover:scale-110 transition-transform"><s.Icon /></div>
              <div className="text-3xl font-black text-white">{s.value}</div>
              <div className="text-sm text-white/40 mt-1">{s.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* ===== BAHASA GRID ===== */}
      <section id="bahasa" className="py-20 px-4 border-t border-white/5">
        <div className="max-w-5xl mx-auto">
          <div className="flex items-end justify-between mb-10">
            <div>
              <span className="text-xs font-bold uppercase tracking-widest text-amber-400 mb-2 block">Koleksi</span>
              <h2 className="text-3xl md:text-4xl font-black text-white">Bahasa Daerah</h2>
            </div>
            <Link href="/explore/map" className="text-sm text-white/40 hover:text-white transition-colors flex items-center gap-1">
              Lihat semua <Icons.Arrow />
            </Link>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            {languages.map((lang: any) => {
              const color = lang.rumpunNama === "Papua" ? "#dc2626" : lang.rumpunNama === "Trans-New Guinea" ? "#16a34a" : "#d97706";
              const penutur = lang.jumlahPenutur ? lang.jumlahPenutur >= 1000000 ? `${(lang.jumlahPenutur / 1000000).toFixed(1)}M` : `${(lang.jumlahPenutur / 1000).toFixed(0)}K` : '—';
              return (
                <Link key={lang.id} href={`/explore/bahasa/${lang.id}`}
                  className="group bg-white/[0.03] border border-white/5 rounded-2xl p-4 hover:bg-white/[0.06] hover:border-white/10 transition-all">
                  <div className="flex items-center gap-3 mb-3">
                    <div className="w-10 h-10 rounded-xl flex items-center justify-center text-white font-bold text-sm" style={{ backgroundColor: color }}>
                      {lang.namaBahasa.charAt(0)}
                    </div>
                    <div className="min-w-0">
                      <h3 className="font-bold text-white text-sm truncate">{lang.namaBahasa}</h3>
                      {lang.namaLokal && <p className="text-xs text-white/30 truncate">{lang.namaLokal}</p>}
                    </div>
                  </div>
                  <div className="flex items-center justify-between text-xs">
                    <span className="text-white/40">{penutur} penutur</span>
                    <span className="px-2 py-0.5 rounded-full text-[10px] font-medium" style={{ backgroundColor: color + "20", color }}>{lang.rumpunNama}</span>
                  </div>
                </Link>
              );
            })}
          </div>
        </div>
      </section>

      {/* ===== CTA ===== */}
      <section className="py-24 px-4 border-t border-white/5">
        <div className="max-w-3xl mx-auto text-center">
          <h2 className="text-3xl md:text-5xl font-black text-white mb-6">
            Siap Menjelajahi<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 to-orange-400">Nusantara?</span>
          </h2>
          <p className="text-white/40 mb-10 max-w-md mx-auto">
            Buka peta interaktif dan temukan bahasa daerah di seluruh Indonesia.
          </p>
          <Link href="/explore/map" className="inline-flex items-center gap-2 px-12 py-5 bg-gradient-to-r from-amber-500 to-orange-500 text-white rounded-full font-bold text-lg hover:from-amber-600 hover:to-orange-600 transition-all shadow-2xl shadow-amber-500/20">
            Buka Peta Interaktif
            <Icons.Arrow />
          </Link>
        </div>
      </section>

      {/* ===== FOOTER ===== */}
      <footer className="py-12 px-4 border-t border-white/5">
        <div className="max-w-5xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="bg-white/5 rounded-xl px-4 py-2 border border-white/10">
            <Logo size="sm" />
          </div>
          <p className="text-sm text-white/30">© 2026 Nusantara Basa</p>
        </div>
      </footer>
    </div>
  );
}
