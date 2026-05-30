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

// Keyboard key component
function Key({ letter }: { letter: string }) {
  return (
    <div className="inline-flex items-center justify-center w-10 h-12 md:w-14 md:h-16 bg-[#12121a] border border-[#2a2a40] rounded-lg text-[#4b9cf5] font-mono text-lg md:text-2xl font-bold shadow-[0_2px_0_#1a1a2e] hover:border-[#4b9cf5] hover:bg-[#1a1a2e] transition-all cursor-default select-none">
      {letter}
    </div>
  );
}

function Word({ word }: { word: string }) {
  return (
    <div className="flex gap-1.5 md:gap-2 justify-center flex-wrap">
      {word.split("").map((l, i) => (
        <Key key={i} letter={l.toUpperCase()} />
      ))}
    </div>
  );
}

export default async function HomePage() {
  const stats = await getStats();
  const languages = await getLanguages();

  return (
    <div className="min-h-screen bg-[#0a0a0f] text-[#e8e8e0]">
      {/* ===== NAV ===== */}
      <nav className="fixed top-4 left-1/2 -translate-x-1/2 z-50 bg-[#0a0a0f]/80 backdrop-blur-xl border border-[#2a2a40] rounded-full px-6 py-2.5">
        <div className="flex items-center gap-6">
          <Link href="/" className="flex items-center gap-2">
            <div className="bg-[#12121a] border border-[#2a2a40] rounded-lg px-2 py-1">
              <Logo size="sm" />
            </div>
          </Link>
          <Link href="/explore/map" className="text-sm text-[#666680] hover:text-[#e8e8e0] transition-colors">Peta</Link>
          <Link href="#bahasa" className="text-sm text-[#666680] hover:text-[#e8e8e0] transition-colors">Bahasa</Link>
          <Link href="/explore/map" className="px-4 py-1.5 bg-[#4b9cf5] text-[#0a0a0f] rounded-full text-sm font-bold hover:bg-[#3a8ae5] transition-colors">
            Jelajahi
          </Link>
        </div>
      </nav>

      {/* ===== HERO ===== */}
      <section className="relative pt-32 pb-20 px-4">
        {/* Subtle gradient */}
        <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[800px] h-[400px] bg-[#4b9cf5]/5 rounded-full blur-3xl" />

        <div className="max-w-4xl mx-auto text-center relative">
          {/* Keyboard word */}
          <div className="mb-8">
            <Word word="NUSANTARA" />
          </div>

          <h1 className="text-5xl md:text-7xl font-black tracking-[-0.03em] leading-[1.05] mb-6 text-[#e8e8e0]">
            Bahasa Daerah<br/>
            <span className="text-[#4b9cf5]">Warisan Indonesia</span>
          </h1>

          <p className="text-base md:text-lg text-[#666680] max-w-xl mx-auto mb-10 leading-relaxed">
            Peta interaktif yang mendokumentasikan keragaman bahasa daerah Indonesia.
            Dari yang aman hingga terancam punah.
          </p>

          <div className="flex flex-col sm:flex-row gap-3 justify-center">
            <Link href="/explore/map" className="inline-flex items-center justify-center gap-2 px-8 py-3 bg-[#4b9cf5] text-[#0a0a0f] rounded-full font-bold hover:bg-[#3a8ae5] transition-colors">
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" /></svg>
              Mulai Jelajahi
            </Link>
            <Link href="#bahasa" className="inline-flex items-center justify-center gap-2 px-8 py-3 bg-[#12121a] border border-[#2a2a40] text-[#666680] rounded-full font-bold hover:border-[#4b9cf5] hover:text-[#e8e8e0] transition-all">
              Lihat Bahasa
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" /></svg>
            </Link>
          </div>
        </div>
      </section>

      {/* ===== STATS ===== */}
      <section className="py-16 px-4 border-t border-[#2a2a40]">
        <div className="max-w-4xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-3">
          {[
            { label: "Bahasa", value: (stats?.totalBahasa || 20).toString(), tag: "bahasa daerah" },
            { label: "Rumpun", value: (stats?.totalRumpun || 3).toString(), tag: "keluarga bahasa" },
            { label: "Wilayah", value: (stats?.totalLokasi || 20).toString(), tag: "sebaran" },
            { label: "Vitalitas", value: Object.keys(stats?.vitalitasBreakdown || {}).length.toString(), tag: "status" },
          ].map((s, i) => (
            <div key={i} className="group bg-[#12121a] border border-[#2a2a40] rounded-xl p-5 hover:border-[#4b9cf5] transition-colors">
              <span className="text-[10px] font-mono uppercase tracking-widest text-[#4b9cf5]/60">{s.tag}</span>
              <div className="text-3xl font-black text-[#e8e8e0] mt-1 tracking-[-0.02em]">{s.value}</div>
              <div className="text-xs text-[#666680] mt-0.5">{s.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* ===== BAHASA GRID ===== */}
      <section id="bahasa" className="py-20 px-4 border-t border-[#2a2a40]">
        <div className="max-w-5xl mx-auto">
          <div className="flex items-end justify-between mb-10">
            <div>
              <span className="text-[10px] font-mono uppercase tracking-widest text-[#4b9cf5]/60 mb-1 block">koleksi</span>
              <h2 className="text-2xl md:text-3xl font-black text-[#e8e8e0] tracking-[-0.02em]">Bahasa Daerah</h2>
            </div>
            <Link href="/explore/map" className="text-xs font-mono text-[#666680] hover:text-[#4b9cf5] transition-colors flex items-center gap-1">
              semua →
            </Link>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            {languages.map((lang: any) => {
              const color = lang.rumpunNama === "Papua" ? "#e74c3c" : lang.rumpunNama === "Trans-New Guinea" ? "#2ecc71" : "#4b9cf5";
              const penutur = lang.jumlahPenutur ? lang.jumlahPenutur >= 1000000 ? `${(lang.jumlahPenutur / 1000000).toFixed(1)}M` : `${(lang.jumlahPenutur / 1000).toFixed(0)}K` : '—';
              return (
                <Link key={lang.id} href={`/explore/bahasa/${lang.id}`}
                  className="group bg-[#12121a] border border-[#2a2a40] rounded-xl p-4 hover:border-[#4b9cf5] transition-colors">
                  <div className="flex items-center gap-3 mb-3">
                    <div className="w-8 h-8 rounded-lg flex items-center justify-center text-[#0a0a0f] font-bold text-xs" style={{ backgroundColor: color }}>
                      {lang.namaBahasa.charAt(0)}
                    </div>
                    <div className="min-w-0">
                      <h3 className="font-bold text-[#e8e8e0] text-sm truncate">{lang.namaBahasa}</h3>
                      {lang.namaLokal && <p className="text-[10px] text-[#666680] truncate font-mono">{lang.namaLokal}</p>}
                    </div>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-[10px] font-mono text-[#666680]">{penutur}</span>
                    <span className="text-[10px] font-mono px-2 py-0.5 rounded-md" style={{ backgroundColor: color + "15", color }}>{lang.rumpunNama}</span>
                  </div>
                </Link>
              );
            })}
          </div>
        </div>
      </section>

      {/* ===== CTA ===== */}
      <section className="py-24 px-4 border-t border-[#2a2a40]">
        <div className="max-w-2xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-black text-[#e8e8e0] tracking-[-0.02em] mb-4">
            Mulai <span className="text-[#4b9cf5]">Eksplorasi</span>
          </h2>
          <p className="text-[#666680] mb-8 max-w-sm mx-auto text-sm">
            Buka peta interaktif dan temukan bahasa daerah di seluruh Nusantara.
          </p>
          <Link href="/explore/map" className="inline-flex items-center gap-2 px-10 py-4 bg-[#4b9cf5] text-[#0a0a0f] rounded-full font-bold hover:bg-[#3a8ae5] transition-colors">
            Buka Peta Interaktif
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M13 7l5 5m0 0l-5 5m5-5H6" /></svg>
          </Link>
        </div>
      </section>

      {/* ===== FOOTER ===== */}
      <footer className="py-8 px-4 border-t border-[#2a2a40]">
        <div className="max-w-5xl mx-auto flex items-center justify-between">
          <div className="bg-[#12121a] border border-[#2a2a40] rounded-lg px-3 py-1.5">
            <Logo size="sm" />
          </div>
          <span className="text-[10px] font-mono text-[#666680]">© 2026 NUSANTARA BASA</span>
        </div>
      </footer>
    </div>
  );
}
