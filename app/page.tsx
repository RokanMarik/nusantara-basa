import Link from "next/link";
import { Logo } from "@/components/shared/Logo";
import { RUMPUN_COLORS } from "@/lib/types";

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
    <div className="min-h-screen">
      {/* Hero */}
      <section className="relative bg-gradient-to-b from-earth-100 via-earth-200 to-earth-100 py-24 px-4 overflow-hidden">
        <div className="max-w-5xl mx-auto text-center relative z-10">
          <div className="flex justify-center mb-8">
            <Logo size="lg" />
          </div>
          <h1 className="text-4xl md:text-6xl font-bold text-earth-700 mb-6 leading-tight">
            Jelajahi Keragaman<br/>Bahasa Nusantara
          </h1>
          <p className="text-lg md:text-xl text-earth-600 mb-10 max-w-2xl mx-auto leading-relaxed">
            Dari Aceh sampai Papua, Indonesia memiliki ratusan bahasa daerah yang membentuk identitas bangsa. Temukan, pelajari, dan lestarikan warisan linguistik ini.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/explore/map" className="btn-primary text-lg px-8 py-3.5 inline-flex items-center justify-center gap-2 rounded-xl shadow-lg hover:shadow-xl transition-all">
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" /></svg>
              Mulai Jelajahi
            </Link>
            <Link href="#bahasa" className="btn-secondary text-lg px-8 py-3.5 inline-flex items-center justify-center gap-2 rounded-xl">
              Lihat Daftar Bahasa
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" /></svg>
            </Link>
          </div>
        </div>
        {/* Decorative dots */}
        <div className="absolute inset-0 overflow-hidden pointer-events-none">
          <div className="absolute top-20 left-10 w-3 h-3 rounded-full bg-rumpun-austronesia/30" />
          <div className="absolute top-40 right-20 w-4 h-4 rounded-full bg-rumpun-papua/30" />
          <div className="absolute bottom-32 left-1/4 w-2 h-2 rounded-full bg-rumpun-transNewGuinea/30" />
          <div className="absolute top-1/3 right-1/3 w-3 h-3 rounded-full bg-rumpun-lainnya/20" />
          <div className="absolute bottom-20 right-10 w-5 h-5 rounded-full bg-rumpun-austronesia/20" />
        </div>
      </section>

      {/* Stats */}
      {stats && (
        <section className="py-12 px-4 -mt-8 relative z-20">
          <div className="max-w-4xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-4">
            <div className="glass-panel p-5 text-center hover:shadow-md transition-shadow">
              <div className="text-3xl font-bold text-rumpun-austronesia">{stats.totalBahasa || 20}</div>
              <div className="text-sm text-earth-600 mt-1">Bahasa Daerah</div>
            </div>
            <div className="glass-panel p-5 text-center hover:shadow-md transition-shadow">
              <div className="text-3xl font-bold text-rumpun-papua">{stats.totalRumpun}</div>
              <div className="text-sm text-earth-600 mt-1">Rumpun Bahasa</div>
            </div>
            <div className="glass-panel p-5 text-center hover:shadow-md transition-shadow">
              <div className="text-3xl font-bold text-rumpun-transNewGuinea">{stats.totalLokasi}</div>
              <div className="text-sm text-earth-600 mt-1">Wilayah Sebaran</div>
            </div>
            <div className="glass-panel p-5 text-center hover:shadow-md transition-shadow">
              <div className="text-3xl font-bold text-rumpun-lainnya">{Object.keys(stats.vitalitasBreakdown).length}</div>
              <div className="text-sm text-earth-600 mt-1">Status Vitalitas</div>
            </div>
          </div>
        </section>
      )}

      {/* Rumpun Colors Legend */}
      <section className="py-8 px-4">
        <div className="max-w-3xl mx-auto glass-panel p-6">
          <h2 className="text-center font-semibold text-earth-700 mb-4">Rumpun Bahasa</h2>
          <div className="flex flex-wrap justify-center gap-4">
            {Object.entries(RUMPUN_COLORS).filter(([name]) => name !== 'Lainnya').map(([name, color]) => (
              <div key={name} className="flex items-center gap-2">
                <div className="w-4 h-4 rounded-full" style={{ backgroundColor: color }} />
                <span className="text-sm text-earth-700">{name}</span>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Featured Languages */}
      <section id="bahasa" className="py-12 px-4">
        <div className="max-w-5xl mx-auto">
          <h2 className="text-2xl font-bold text-earth-700 text-center mb-2">Bahasa Daerah</h2>
          <p className="text-earth-600 text-center mb-8">Beberapa bahasa dari koleksi kami</p>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            {languages.map((lang: any) => {
              const rumpunColor = RUMPUN_COLORS[lang.rumpunNama] || RUMPUN_COLORS['Lainnya'];
              const penutur = lang.jumlahPenutur
                ? lang.jumlahPenutur >= 1000000 ? `${(lang.jumlahPenutur / 1000000).toFixed(1)}M` : `${(lang.jumlahPenutur / 1000).toFixed(0)}K`
                : '—';
              return (
                <Link key={lang.id} href={`/explore/bahasa/${lang.id}`} className="glass-panel p-4 hover:shadow-md hover:border-earth-400 transition-all group">
                  <div className="flex items-center gap-3 mb-2">
                    <div className="w-8 h-8 rounded-lg flex items-center justify-center text-white text-sm font-bold" style={{ backgroundColor: rumpunColor }}>
                      {lang.namaBahasa.charAt(0)}
                    </div>
                    <div className="min-w-0">
                      <h3 className="font-semibold text-earth-700 text-sm truncate group-hover:text-earth-800">{lang.namaBahasa}</h3>
                      {lang.namaLokal && <p className="text-xs text-earth-600 truncate italic">{lang.namaLokal}</p>}
                    </div>
                  </div>
                  <div className="text-xs text-earth-600">
                    {penutur} penutur · {lang.rumpunNama}
                  </div>
                </Link>
              );
            })}
          </div>
          <div className="text-center mt-6">
            <Link href="/explore/map" className="text-rumpun-austronesia hover:underline font-medium">
              Lihat semua di peta interaktif →
            </Link>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 px-4 bg-gradient-to-t from-earth-200 to-earth-100">
        <div className="max-w-2xl mx-auto text-center">
          <h2 className="text-2xl font-bold text-earth-700 mb-4">Siap Menjelajahi?</h2>
          <p className="text-earth-600 mb-6">
            Buka peta interaktif dan temukan bahasa daerah di seluruh Indonesia.
            Klik marker untuk melihat detail, ringkasan AI, dan informasi linguistik.
          </p>
          <Link href="/explore/map" className="btn-primary inline-flex items-center gap-2 rounded-xl px-8 py-3.5">
            Buka Peta Interaktif
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" /></svg>
          </Link>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-8 px-4 border-t border-earth-300">
        <div className="max-w-4xl mx-auto text-center text-sm text-earth-600">
          <p>© 2026 Nusantara Basa — Peta Interaktif Bahasa Indonesia</p>
          <p className="mt-1">Data dari berbagai sumber linguistik dan dokumentasi bahasa daerah.</p>
        </div>
      </footer>
    </div>
  );
}
