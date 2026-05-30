import { notFound } from "next/navigation";
import Link from "next/link";
import { createClient } from "@supabase/supabase-js";

const supabase = createClient(
  "https://hkeheukewxsvaarxaket.supabase.co",
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20"
);

const RUMPUN_COLORS: Record<string, string> = {
  Austronesia: "#c4703f",
  Papua: "#8b3a3a",
  "Trans-New Guinea": "#5a7247",
};

const VITALITAS_COLORS: Record<string, string> = {
  aman: "#22c55e",
  rentan: "#eab308",
  terancam: "#f97316",
  "sangat terancam": "#f97316",
  kritis: "#ef4444",
  punah: "#ef4444",
};

export default async function BahasaDetailPage({ params }: { params: { slug: string } }) {
  const { data: bahasa, error } = await supabase
    .from("bahasa")
    .select("*, rumpun_bahasa(nama_rumpun, sub_rumpun), lokasi(provinsi, kabupaten, tipe_wilayah), fitur_linguistik(sistem_tulisan, tipe_morfologi, urutan_kata, jumlah_vokal, jumlah_konsonan), kosakata(kata, arti_indonesia, fonetik_ipa)")
    .eq("id", params.slug)
    .single();

  if (error || !bahasa) notFound();

  const penuturFormatted = bahasa.jumlah_penutur ? bahasa.jumlah_penutur.toLocaleString("id-ID") : "Tidak diketahui";
  const rumpunColor = RUMPUN_COLORS[bahasa.rumpun_bahasa?.nama_rumpun || ''] || '#6b5b8a';
  const vitalitasColor = VITALITAS_COLORS[bahasa.status_vitalitas || ''] || '#9ca3af';

  return (
    <div className="min-h-screen bg-[#faf8f5]">
      {/* Top bar */}
      <header className="bg-white/90 backdrop-blur-md border-b border-earth-300/50 px-4 py-3">
        <div className="max-w-4xl mx-auto flex items-center justify-between">
          <Link href="/" className="font-black text-[#1a1209] text-lg tracking-tight">
            Nusantara<span className="text-amber-700">Basa</span>
          </Link>
          <Link href="/explore/map" className="text-sm text-earth-600 hover:text-earth-700 transition-colors">
            ← Kembali ke peta
          </Link>
        </div>
      </header>

      <main className="max-w-4xl mx-auto px-4 py-8">
        {/* Header */}
        <div className="mb-8">
          <div className="flex items-start gap-4">
            <div className="w-14 h-14 rounded-2xl flex items-center justify-center text-white text-xl font-bold flex-shrink-0" style={{ backgroundColor: rumpunColor }}>
              {bahasa.nama_bahasa.charAt(0)}
            </div>
            <div className="flex-1">
              <h1 className="text-3xl font-black text-[#1a1209] tracking-tight">{bahasa.nama_bahasa}</h1>
              {bahasa.nama_lokal && <p className="text-lg text-earth-600 italic mt-0.5">{bahasa.nama_lokal}</p>}
            </div>
            {bahasa.status_vitalitas && (
              <span className="flex-shrink-0 inline-flex items-center gap-1.5 rounded-full text-xs px-3 py-1.5 font-medium text-white" style={{ backgroundColor: vitalitasColor }}>
                <span className="w-1.5 h-1.5 rounded-full bg-white/60" />
                {bahasa.status_vitalitas.charAt(0).toUpperCase() + bahasa.status_vitalitas.slice(1)}
              </span>
            )}
          </div>
        </div>

        {/* Info cards */}
        <div className="grid md:grid-cols-2 gap-4 mb-8">
          <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm">
            <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2">
              <svg className="w-4 h-4 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
              Informasi Dasar
            </h2>
            <dl className="space-y-2 text-sm">
              <div className="flex justify-between"><dt className="text-earth-600">ISO 639-3</dt><dd className="font-mono text-[#1a1209] font-medium">{bahasa.kode_iso_639 ?? "—"}</dd></div>
              <div className="flex justify-between"><dt className="text-earth-600">Rumpun</dt><dd className="text-[#1a1209] font-medium">{bahasa.rumpun_bahasa?.nama_rumpun ?? "—"}</dd></div>
              {bahasa.rumpun_bahasa?.sub_rumpun && <div className="flex justify-between"><dt className="text-earth-600">Sub-rumpun</dt><dd className="text-[#1a1209]">{bahasa.rumpun_bahasa.sub_rumpun}</dd></div>}
              <div className="flex justify-between"><dt className="text-earth-600">Jumlah Penutur</dt><dd className="font-bold text-[#1a1209]">{penuturFormatted}</dd></div>
            </dl>
          </div>
          <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm">
            <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2">
              <svg className="w-4 h-4 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129" /></svg>
              Fitur Linguistik
            </h2>
            {bahasa.fitur_linguistik ? (
              <dl className="space-y-2 text-sm">
                <div className="flex justify-between"><dt className="text-earth-600">Sistem Tulisan</dt><dd className="text-[#1a1209]">{bahasa.fitur_linguistik.sistem_tulisan ?? "—"}</dd></div>
                <div className="flex justify-between"><dt className="text-earth-600">Tipe Morfologi</dt><dd className="text-[#1a1209]">{bahasa.fitur_linguistik.tipe_morfologi ?? "—"}</dd></div>
                <div className="flex justify-between"><dt className="text-earth-600">Urutan Kata</dt><dd className="font-mono text-[#1a1209] font-medium">{bahasa.fitur_linguistik.urutan_kata ?? "—"}</dd></div>
              </dl>
            ) : (<p className="text-sm text-earth-600">Data fitur linguistik belum tersedia.</p>)}
          </div>
        </div>

        {/* Lokasi */}
        {bahasa.lokasi?.length > 0 && (
          <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm mb-8">
            <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2">
              <svg className="w-4 h-4 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" /><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" /></svg>
              Lokasi Sebaran
            </h2>
            <div className="flex flex-wrap gap-2">
              {bahasa.lokasi.map((loc: any, i: number) => (
                <span key={i} className="px-3 py-1.5 bg-earth-100 text-earth-700 rounded-full text-sm font-medium">{loc.provinsi}{loc.kabupaten && `, ${loc.kabupaten}`}</span>
              ))}
            </div>
          </div>
        )}

        {/* Summary */}
        {bahasa.auto_summary && (
          <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm mb-8">
            <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2">
              <svg className="w-4 h-4 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" /></svg>
              Ringkasan
            </h2>
            <div className="text-sm text-earth-600 leading-relaxed">{bahasa.auto_summary.split("\n").map((p: string, i: number) => (<p key={i} className={i > 0 ? "mt-3" : ""}>{p}</p>))}</div>
          </div>
        )}

        {/* Kosakata */}
        {bahasa.kosakata?.length > 0 && (
          <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm">
            <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2">
              <svg className="w-4 h-4 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" /></svg>
              Kosakata Sampel
            </h2>
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead><tr className="border-b border-earth-300"><th className="text-left py-2 text-earth-600 font-medium">Kata</th><th className="text-left py-2 text-earth-600 font-medium">Arti</th><th className="text-left py-2 text-earth-600 font-medium">Fonetik (IPA)</th></tr></thead>
                <tbody>{bahasa.kosakata.map((k: any, i: number) => (
                  <tr key={i} className="border-b border-earth-200"><td className="py-2.5 font-medium text-[#1a1209]">{k.kata}</td><td className="py-2.5 text-earth-600">{k.arti_indonesia}</td><td className="py-2.5 font-mono text-earth-600">{k.fonetik_ipa ?? "—"}</td></tr>
                ))}</tbody>
              </table>
            </div>
          </div>
        )}
      </main>
    </div>
  );
}
