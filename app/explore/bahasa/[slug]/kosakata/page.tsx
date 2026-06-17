import { notFound } from "next/navigation";
import Link from "next/link";
import { supabase } from "@/lib/supabase";


const ArrowLeft = () => (
  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m0 0H21" /></svg>
);

const BookIcon = () => (
  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" /></svg>
);

const RUMPUN_COLORS: Record<string, string> = {
  Austronesia: "#c4703f", Papua: "#8b3a3a", "Trans-New Guinea": "#5a7247",
};

export default async function KosakataPage({ params }: { params: { slug: string } }) {
  const { data: bahasa, error } = await supabase
    .from("bahasa")
    .select("*, rumpun_bahasa(nama_rumpun), kosakata(*)")
    .eq("id", params.slug)
    .single();

  if (error || !bahasa) notFound();

  const rumpunColor = RUMPUN_COLORS[bahasa.rumpun_bahasa?.nama_rumpun || ''] || '#6b5b8a';
  const kosakata = bahasa.kosakata || [];
  const swadesh = kosakata.filter((k: any) => k.dalam_swadesh);
  const lainnya = kosakata.filter((k: any) => !k.dalam_swadesh);

  const tabs = [
    { label: "Tentang", href: `/explore/bahasa/${bahasa.id}` },
    { label: "Linguistik", href: `/explore/bahasa/${bahasa.id}/linguistik` },
    { label: "Kosakata", href: `/explore/bahasa/${bahasa.id}/kosakata`, active: true },
  ];

  const VocabTable = ({ data, title }: { data: any[]; title: string }) => (
    <div className="bg-white rounded-2xl border border-earth-300/50 shadow-sm overflow-hidden">
      <div className="px-5 py-3 border-b border-earth-300 bg-earth-50/50">
        <h3 className="font-bold text-[#1a1209]">{title} ({data.length} kata)</h3>
      </div>
      <div className="overflow-x-auto">
        <table className="w-full" role="table" aria-label={title}>
          <thead>
            <tr className="border-b border-earth-300">
              <th className="text-left py-2 px-4 text-xs font-semibold uppercase tracking-wider text-earth-600" scope="col">#</th>
              <th className="text-left py-2 px-4 text-xs font-semibold uppercase tracking-wider text-earth-600" scope="col">Kata</th>
              <th className="text-left py-2 px-4 text-xs font-semibold uppercase tracking-wider text-earth-600" scope="col">Arti</th>
              <th className="text-left py-2 px-4 text-xs font-semibold uppercase tracking-wider text-earth-600 hidden sm:table-cell" scope="col">Fonetik</th>
            </tr>
          </thead>
          <tbody>
            {data.map((k: any, i: number) => (
              <tr key={i} className="border-b border-earth-200 hover:bg-earth-50/50 transition-colors duration-200">
                <td className="py-2 px-4 text-xs text-earth-600 font-mono">{k.nomor_swadesh || i + 1}</td>
                <td className="py-2 px-4 font-semibold text-[#1a1209]">{k.kata}</td>
                <td className="py-2 px-4 text-earth-600">{k.arti_indonesia}</td>
                <td className="py-2 px-4 font-mono text-earth-600 text-sm hidden sm:table-cell">{k.fonetik_ipa ?? "—"}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );

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
        <div className="flex items-center gap-3 mb-6">
          <div className="w-12 h-12 rounded-2xl flex items-center justify-center text-white text-xl font-bold flex-shrink-0" style={{ backgroundColor: rumpunColor }}>
            {bahasa.nama_bahasa.charAt(0)}
          </div>
          <div>
            <h1 className="text-2xl md:text-3xl font-black text-[#1a1209] tracking-tight">{bahasa.nama_bahasa}</h1>
            {bahasa.nama_lokal && <p className="text-earth-600 italic">{bahasa.nama_lokal}</p>}
          </div>
        </div>

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

        <div className="flex items-center gap-2 mb-6">
          <BookIcon />
          <h2 className="text-xl font-bold text-[#1a1209]">Kosakata</h2>
          <span className="text-sm text-earth-600">({kosakata.length} kata)</span>
        </div>

        {kosakata.length === 0 ? (
          <div className="bg-amber-50 border border-amber-200 rounded-2xl p-5">
            <p className="text-sm text-amber-700">
              Data kosakata untuk bahasa ini belum tersedia. Daftar kata akan ditambahkan seiring pendokumentasian.
            </p>
          </div>
        ) : (
          <div className="space-y-6">
            {swadesh.length > 0 && <VocabTable data={swadesh} title="Swadesh List" />}
            {lainnya.length > 0 && <VocabTable data={lainnya} title="Kosakata Lainnya" />}
          </div>
        )}
      </main>
    </div>
  );
}
