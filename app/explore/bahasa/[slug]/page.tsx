import { notFound } from "next/navigation";
import Link from "next/link";
import { createClient } from "@supabase/supabase-js";
import { Header } from "@/components/layout/Header";
import { VitalityBadge } from "@/components/ui/VitalityBadge";

const supabase = createClient(
  "https://hkeheukewxsvaarxaket.supabase.co",
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20"
);

export default async function BahasaDetailPage({ params }: { params: { slug: string } }) {
  const { data: bahasa, error } = await supabase
    .from("bahasa")
    .select("*, rumpun_bahasa(nama_rumpun, sub_rumpun), lokasi(provinsi, kabupaten, tipe_wilayah), fitur_linguistik(sistem_tulisan, tipe_morfologi, urutan_kata, jumlah_vokal, jumlah_konsonan), kosakata(kata, arti_indonesia, fonetik_ipa)")
    .eq("id", params.slug)
    .single();

  if (error || !bahasa) notFound();

  const penuturFormatted = bahasa.jumlah_penutur ? bahasa.jumlah_penutur.toLocaleString("id-ID") : "Tidak diketahui";

  return (
    <div className="min-h-screen">
      <Header />
      <main className="max-w-4xl mx-auto px-4 py-8">
        <Link href="/explore/map" className="inline-flex items-center gap-1 text-sm text-earth-600 hover:text-earth-700 mb-6">← Kembali ke peta</Link>
        <div className="mb-8">
          <div className="flex items-start justify-between gap-4">
            <div>
              <h1 className="text-3xl font-bold text-earth-700">{bahasa.nama_bahasa}</h1>
              {bahasa.nama_lokal && <p className="text-lg text-earth-600 italic mt-1">{bahasa.nama_lokal}</p>}
            </div>
            <VitalityBadge status={bahasa.status_vitalitas} size="md" />
          </div>
        </div>
        <div className="grid md:grid-cols-2 gap-6 mb-8">
          <div className="glass-panel p-5">
            <h2 className="font-semibold text-earth-700 mb-3">Informasi Dasar</h2>
            <dl className="space-y-2 text-sm">
              <div className="flex justify-between"><dt className="text-earth-600">ISO 639-3</dt><dd className="font-mono text-earth-700">{bahasa.kode_iso_639 ?? "—"}</dd></div>
              <div className="flex justify-between"><dt className="text-earth-600">Rumpun</dt><dd className="text-earth-700">{bahasa.rumpun_bahasa?.nama_rumpun ?? "—"}</dd></div>
              <div className="flex justify-between"><dt className="text-earth-600">Jumlah Penutur</dt><dd className="font-semibold text-earth-700">{penuturFormatted}</dd></div>
            </dl>
          </div>
          <div className="glass-panel p-5">
            <h2 className="font-semibold text-earth-700 mb-3">Fitur Linguistik</h2>
            {bahasa.fitur_linguistik ? (
              <dl className="space-y-2 text-sm">
                <div className="flex justify-between"><dt className="text-earth-600">Sistem Tulisan</dt><dd className="text-earth-700">{bahasa.fitur_linguistik.sistem_tulisan ?? "—"}</dd></div>
                <div className="flex justify-between"><dt className="text-earth-600">Tipe Morfologi</dt><dd className="text-earth-700">{bahasa.fitur_linguistik.tipe_morfologi ?? "—"}</dd></div>
                <div className="flex justify-between"><dt className="text-earth-600">Urutan Kata</dt><dd className="font-mono text-earth-700">{bahasa.fitur_linguistik.urutan_kata ?? "—"}</dd></div>
              </dl>
            ) : (<p className="text-sm text-earth-600">Data fitur linguistik belum tersedia.</p>)}
          </div>
        </div>
        {bahasa.lokasi?.length > 0 && (
          <div className="glass-panel p-5 mb-8">
            <h2 className="font-semibold text-earth-700 mb-3">Lokasi Sebaran</h2>
            <div className="flex flex-wrap gap-2">
              {bahasa.lokasi.map((loc: any, i: number) => (<span key={i} className="px-3 py-1 bg-earth-200 text-earth-700 rounded-full text-sm">{loc.provinsi}{loc.kabupaten && `, ${loc.kabupaten}`}</span>))}
            </div>
          </div>
        )}
        {bahasa.auto_summary && (
          <div className="glass-panel p-5 mb-8">
            <h2 className="font-semibold text-earth-700 mb-3">Ringkasan</h2>
            <div className="text-sm text-earth-600">{bahasa.auto_summary.split("\n").map((p: string, i: number) => (<p key={i}>{p}</p>))}</div>
          </div>
        )}
        {bahasa.kosakata?.length > 0 && (
          <div className="glass-panel p-5">
            <h2 className="font-semibold text-earth-700 mb-3">Kosakata Sampel</h2>
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead><tr className="border-b border-earth-300"><th className="text-left py-2 text-earth-600 font-medium">Kata</th><th className="text-left py-2 text-earth-600 font-medium">Arti</th><th className="text-left py-2 text-earth-600 font-medium">Fonetik (IPA)</th></tr></thead>
                <tbody>{bahasa.kosakata.map((k: any, i: number) => (<tr key={i} className="border-b border-earth-200"><td className="py-2 font-medium text-earth-700">{k.kata}</td><td className="py-2 text-earth-600">{k.arti_indonesia}</td><td className="py-2 font-mono text-earth-600">{k.fonetik_ipa ?? "—"}</td></tr>))}</tbody>
              </table>
            </div>
          </div>
        )}
      </main>
    </div>
  );
}
