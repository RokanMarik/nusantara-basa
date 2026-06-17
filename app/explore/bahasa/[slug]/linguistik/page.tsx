import { notFound } from "next/navigation";
import Link from "next/link";
import { supabase } from "@/lib/supabase";


// SVG Icons
const ArrowLeft = () => (
  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m0 0H21" /></svg>
);

const SoundIcon = () => (
  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15.536 8.464a5 5 0 010 7.072m2.828-9.9a9 9 0 010 12.728M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.983 3.583 12 4.017 12 5v14c0 .983-1.017 1.417-1.707.707L5.586 15z" /></svg>
);

const StructureIcon = () => (
  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z" /></svg>
);

const WritingIcon = () => (
  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" /></svg>
);

const RUMPUN_COLORS: Record<string, string> = {
  Austronesia: "#c4703f", Papua: "#8b3a3a", "Trans-New Guinea": "#5a7247",
};

export default async function LinguistikPage({ params }: { params: { slug: string } }) {
  const { data: bahasa, error } = await supabase
    .from("bahasa")
    .select("*, rumpun_bahasa(nama_rumpun), fitur_linguistik(*), lokasi(provinsi, kabupaten)")
    .eq("id", params.slug)
    .single();

  if (error || !bahasa) notFound();

  const rumpunColor = RUMPUN_COLORS[bahasa.rumpun_bahasa?.nama_rumpun || ''] || '#6b5b8a';
  const f = bahasa.fitur_linguistik;

  const tabs = [
    { label: "Tentang", href: `/explore/bahasa/${bahasa.id}` },
    { label: "Linguistik", href: `/explore/bahasa/${bahasa.id}/linguistik`, active: true },
    { label: "Kosakata", href: `/explore/bahasa/${bahasa.id}/kosakata` },
  ];

  return (
    <div className="min-h-screen bg-[#faf8f5]">
      <header className="bg-white/90 backdrop-blur-md border-b border-earth-300/50 px-4 py-3">
        <div className="max-w-4xl mx-auto flex items-center justify-between">
          <Link href="/" className="font-black text-[#1a1209] text-sm tracking-tight hover:text-amber-700 transition-colors duration-200 cursor-pointer">
            Nusantara<span className="text-amber-700">Basa</span>
          </Link>
          <Link href="/explore/map" className="inline-flex items-center gap-1 text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer">
            <ArrowLeft /> Kembali ke peta
          </Link>
        </div>
      </header>

      <main className="max-w-4xl mx-auto px-4 py-6 md:py-8">
        {/* Language header */}
        <div className="flex items-center gap-3 mb-6">
          <div className="w-12 h-12 rounded-2xl flex items-center justify-center text-white text-xl font-bold flex-shrink-0" style={{ backgroundColor: rumpunColor }}>
            {bahasa.nama_bahasa.charAt(0)}
          </div>
          <div>
            <h1 className="text-2xl md:text-3xl font-black text-[#1a1209] tracking-tight">{bahasa.nama_bahasa}</h1>
            {bahasa.nama_lokal && <p className="text-earth-600 italic">{bahasa.nama_lokal}</p>}
          </div>
        </div>

        {/* Tabs */}
        <nav className="flex gap-1 mb-8 bg-earth-100/50 rounded-xl p-1" aria-label="Language detail tabs">
          {tabs.map((tab, i) => (
            <Link key={i} href={tab.href}
              className={`flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold transition-all duration-200 cursor-pointer ${
                tab.active ? 'bg-white text-[#1a1209] shadow-sm' : 'text-earth-600 hover:text-earth-700'
              }`}
              aria-current={tab.active ? 'page' : undefined}
            >
              {tab.label}
            </Link>
          ))}
        </nav>

        {/* Linguistik content */}
        <div className="grid md:grid-cols-2 gap-4 md:gap-6">
          {/* Fonologi */}
          <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm">
            <h2 className="font-bold text-[#1a1209] mb-4 flex items-center gap-2">
              <SoundIcon /> Fonologi
            </h2>
            <dl className="space-y-3 text-sm">
              <div className="flex justify-between">
                <dt className="text-earth-600">Jumlah Vokal</dt>
                <dd className="font-semibold text-[#1a1209]">{f?.jumlah_vokal ?? "—"}</dd>
              </div>
              <div className="flex justify-between">
                <dt className="text-earth-600">Jumlah Konsonan</dt>
                <dd className="font-semibold text-[#1a1209]">{f?.jumlah_konsonan ?? "—"}</dd>
              </div>
              <div className="flex justify-between">
                <dt className="text-earth-600">Bahasa Nada</dt>
                <dd className="text-[#1a1209]">{f?.memiliki_nada ? "Ya" : "Tidak"}</dd>
              </div>
              <div className="flex justify-between">
                <dt className="text-earth-600">Register</dt>
                <dd className="text-[#1a1209]">{f?.memiliki_register ? "Ya" : "Tidak"}</dd>
              </div>
            </dl>
          </div>

          {/* Morfologi */}
          <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm">
            <h2 className="font-bold text-[#1a1209] mb-4 flex items-center gap-2">
              <StructureIcon /> Morfologi & Sintaksis
            </h2>
            <dl className="space-y-3 text-sm">
              <div className="flex justify-between">
                <dt className="text-earth-600">Tipe Morfologi</dt>
                <dd className="font-semibold text-[#1a1209] capitalize">{f?.tipe_morfologi ?? "—"}</dd>
              </div>
              <div className="flex justify-between">
                <dt className="text-earth-600">Urutan Kata</dt>
                <dd className="font-mono font-bold text-[#1a1209]">{f?.urutan_kata ?? "—"}</dd>
              </div>
            </dl>
          </div>

          {/* Sistem Tulisan */}
          <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm md:col-span-2">
            <h2 className="font-bold text-[#1a1209] mb-4 flex items-center gap-2">
              <WritingIcon /> Sistem Tulisan
            </h2>
            <p className="text-[#1a1209] text-sm">{f?.sistem_tulisan ?? "Data sistem tulisan belum tersedia."}</p>
            {f?.catatan_fonologi && (
              <div className="mt-4 pt-4 border-t border-earth-300">
                <h3 className="text-sm font-semibold text-earth-600 mb-2">Catatan Fonologi</h3>
                <p className="text-sm text-earth-600 leading-relaxed">{f.catatan_fonologi}</p>
              </div>
            )}
          </div>
        </div>

        {/* Info box */}
        {!f && (
          <div className="mt-6 bg-amber-50 border border-amber-200 rounded-2xl p-5">
            <p className="text-sm text-amber-700">
              Data linguistik untuk bahasa ini belum tersedia. Informasi akan ditambahkan seiring pendokumentasian.
            </p>
          </div>
        )}
      </main>
    </div>
  );
}
