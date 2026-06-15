"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import dynamic from "next/dynamic";

const SpeakerTrendChart = dynamic(
  () => import("@/components/bahasa/SpeakerTrendChart").then((m) => ({ default: m.SpeakerTrendChart })),
  { ssr: false }
);

interface Bahasa {
  id: string;
  namaBahasa: string;
  namaLokal?: string | null;
  jumlahPenutur?: number | null;
  statusVitalitas?: string | null;
  kodeIso639?: string | null;
  egidsLevel?: string | null;
  rumpun?: { nama_rumpun: string } | null;
  autoSummary?: string | null;
}

const EGIDS_DESCRIPTIONS: Record<string, string> = {
  "0": "International - Used between nations",
  "1": "National - Used in education, work, media, government",
  "2": "Regional - Used in larger region work and mass media",
  "3": "Trade - Used in wider work beyond local community",
  "4": "Educational - Vigorous, literacy in school system",
  "5": "Developing - Vigorous, standard form used by some",
  "6a": "Vigorous - Used by all generations, unbroken transmission",
  "6b": "Threatened - Used by all generations, losing ground",
  "7": "Shifting - Child-bearing generation not transmitting to children",
  "8a": "Moribund - Only spoken by grandparents and older",
  "8b": "Nearly Extinct - Only spoken by a few oldest members",
  "9": "Dormant - No fluent speakers, symbolic use remains",
  "10": "Extinct - No speakers, no ethnic identity",
};

export default function BahasaDetailPage({ params }: { params: { slug: string } }) {
  const [bahasa, setBahasa] = useState<Bahasa | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchBahasa() {
      try {
        const res = await fetch(`/api/bahasa/${params.slug}`);
        if (res.ok) {
          const data = await res.json();
          setBahasa(data);
        }
      } catch (err) {
        console.error("Error fetching bahasa:", err);
      } finally {
        setLoading(false);
      }
    }

    if (params.slug) {
      fetchBahasa();
    }
  }, [params.slug]);

  const getVitalitasColor = (status: string | null | undefined) => {
    const s = (status || "").toLowerCase();
    if (s === "aman") return "bg-green-100 text-green-800 border-green-200";
    if (s === "rentan") return "bg-yellow-100 text-yellow-800 border-yellow-200";
    if (s === "mengalami kemunduran" || s === "terancam") return "bg-orange-100 text-orange-800 border-orange-200";
    if (s === "sangat terancam") return "bg-red-100 text-red-800 border-red-200";
    if (s === "hampir punah") return "bg-red-200 text-red-900 border-red-300";
    if (s === "punah") return "bg-gray-200 text-gray-800 border-gray-300";
    return "bg-gray-100 text-gray-600 border-gray-200";
  };

  return (
    <main className="min-h-screen bg-[#faf8f5]">
      {/* NAV */}
      <nav className="fixed top-4 left-4 right-4 md:left-1/2 md:right-auto md:-translate-x-1/2 md:w-auto z-50 bg-white/90 backdrop-blur-md border border-earth-300/50 rounded-full px-4 md:px-6 py-2.5 shadow-sm">
        <div className="flex items-center gap-4">
          <Link href="/explore" aria-label="Kembali ke halaman utama">
            <svg className="w-4 h-4 text-earth-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m0 0H21" />
            </svg>
          </Link>
          <span className="text-sm font-semibold text-earth-900 truncate max-w-[200px]">
            Nusantara<span className="text-amber-700">Basa</span>
          </span>
        </div>
      </nav>

      <div className="pt-20 pb-16 px-4">
        {loading ? (
          <div className="animate-pulse space-y-8">
            <div className="h-12 bg-gray-200 rounded w-1/3"></div>
            <div className="space-y-4">
              <div className="h-6 bg-gray-200 rounded w-1/4"></div>
              <div className="h-4 bg-gray-200 rounded w-full"></div>
              <div className="h-4 bg-gray-200 rounded w-3/4"></div>
            </div>
          </div>
        ) : bahasa ? (
          <div className="max-w-4xl mx-auto">
            {/* Breadcrumb */}
            <nav className="mb-6 text-sm" aria-label="Breadcrumb">
              <ol className="flex items-center gap-2">
                <li>
                  <Link href="/explore" className="text-earth-600 hover:text-earth-800">
                    Explore
                  </Link>
                </li>
                <li className="text-earth-400">/</li>
                <li className="text-earth-900 font-medium">{bahasa.namaBahasa}</li>
              </ol>
            </nav>

            {/* Language Header */}
            <header className="mb-8">
              <div className="flex items-start gap-4">
                <div className="w-14 h-14 rounded-xl flex items-center justify-center text-white text-2xl font-bold bg-orange-500" aria-hidden="true">
                  {bahasa.namaBahasa.charAt(0)}
                </div>
                <div className="flex-1">
                  <h1 className="text-3xl md:text-4xl font-bold text-earth-900 mb-1">{bahasa.namaBahasa}</h1>
                  {bahasa.namaLokal && (
                    <p className="text-earth-700 italic text-lg">{bahasa.namaLokal}</p>
                  )}
                  <div className="flex flex-wrap gap-2 mt-2">
                    {bahasa.statusVitalitas && (
                      <span className={`inline-block px-3 py-1 rounded-full text-xs font-semibold border ${getVitalitasColor(bahasa.statusVitalitas)}`}>
                        {bahasa.statusVitalitas}
                      </span>
                    )}
                    {bahasa.kodeIso639 && (
                      <span className="inline-block px-3 py-1 rounded-full text-xs font-mono bg-gray-100 text-gray-700 border border-gray-200">
                        ISO: {bahasa.kodeIso639}
                      </span>
                    )}
                    {bahasa.egidsLevel && (
                      <span 
                        className="inline-block px-3 py-1 rounded-full text-xs bg-blue-50 text-blue-800 border border-blue-200"
                        title={EGIDS_DESCRIPTIONS[bahasa.egidsLevel.split(" - ")[0]] || "EGIDS Level"}
                      >
                        EGIDS: {bahasa.egidsLevel}
                      </span>
                      </span>
                    )}
                    {bahasa.rumpun && (
                      <span className="inline-block px-3 py-1 rounded-full text-xs bg-amber-50 text-amber-800 border border-amber-200">
                        {bahasa.rumpun.nama_rumpun}
                      </span>
                    )}
                  </div>
                </div>
              </div>
              {bahasa.autoSummary && (
                <div className="mt-6 bg-white rounded-2xl p-6 border border-earth-300/50 shadow-sm">
                  <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2 text-lg">
                    <svg className="w-5 h-5 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                    Ringkasan
                  </h2>
                  <div className="text-earth-600 leading-relaxed">
                    {bahasa.autoSummary.split("\n").map((line: string, i: number) => (
                      <p key={i} className={i > 0 ? "mt-3" : ""}>{line}</p>
                    ))}
                  </div>
                </div>
              )}
            </header>

            {/* Navigation Tabs */}
            <nav className="flex gap-1 mb-8 bg-earth-100/50 rounded-xl p-1" aria-label="Language detail tabs">
              <Link
                href={`/explore/bahasa/${bahasa.id}`}
                className="flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold bg-white text-earth-900 shadow-sm transition-all duration-200 cursor-pointer"
                aria-current="page"
              >
                Tentang
              </Link>
              <Link
                href={`/explore/bahasa/${bahasa.id}/linguistik`}
                className="flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold text-earth-600 hover:text-earth-700 transition-all duration-200 cursor-pointer"
              >
                Linguistik
              </Link>
              <Link
                href={`/explore/bahasa/${bahasa.id}/kosakata`}
                className="flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold text-earth-600 hover:text-earth-700 transition-all duration-200 cursor-pointer"
              >
                Kosakata
              </Link>
              <Link
                href={`/explore/bahasa/${bahasa.id}/sejarah`}
                className="flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold text-earth-600 hover:text-earth-700 transition-all duration-200 cursor-pointer"
              >
                Sejarah
              </Link>
            </nav>

            {/* Info Cards Grid */}
            <div className="grid md:grid-cols-2 gap-4 mb-8">
              {/* Basic Info Card */}
              <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm">
                <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2 text-base">
                  <svg className="w-5 h-5 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  Informasi Dasar
                </h2>
                <dl className="space-y-2 text-sm">
                  <div className="flex justify-between">
                    <dt className="text-earth-600">ISO 639-3</dt>
                    <dd className="font-mono text-[#1a1209] font-medium">{bahasa.kodeIso639 ?? "—"}</dd>
                  </div>
                  {bahasa.rumpun && (
                    <div className="flex justify-between">
                      <dt className="text-earth-600">Rumpun Bahasa</dt>
                      <dd className="text-[#1a1209] font-medium">{bahasa.rumpun.nama_rumpun}</dd>
                    </div>
                  )}
                  {bahasa.jumlahPenutur && (
                    <div className="flex justify-between">
                      <dt className="text-earth-600">Jumlah Penutur</dt>
                      <dd className="font-bold text-[#1a1209]">
                        {bahasa.jumlahPenutur.toLocaleString("id-ID")} orang
                      </dd>
                    </div>
                  )}
                  {bahasa.statusVitalitas && (
                    <div className="flex justify-between">
                      <dt className="text-earth-600">Status Vitalitas</dt>
                      <dd>
                        <span className={`inline-block px-2 py-0.5 rounded-full text-xs font-semibold border ${getVitalitasColor(bahasa.statusVitalitas)}`}>
                          {bahasa.statusVitalitas}
                        </span>
                      </dd>
                    </div>
                  )}
                </dl>
              </div>

              {/* Linguistic Features Card */}
              <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm">
                <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2 text-base">
                  <svg className="w-5 h-5 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129" />
                  </svg>
                  Fitur Linguistik
                </h2>
                <p className="text-sm text-earth-600">
                  Data fitur linguistik untuk bahasa ini belum tersedia. Silakan cek modul Linguistik untuk informasi lebih lengkap.
                </p>
              </div>
            </div>

            {/* Speaker Trend Chart */}
            <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm mb-8">
              <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2 text-base">
                <svg className="w-5 h-5 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                </svg>
                Tren Jumlah Penutur
              </h2>
              <SpeakerTrendChart bahasaId={bahasa.id} bahasaName={bahasa.namaBahasa} />
            </div>

            {/* Map Location */}
            <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm mb-8">
              <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2 text-base">
                <svg className="w-5 h-5 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                </svg>
                Lokasi Sebaran
              </h2>
              <p className="text-sm text-earth-600 mb-4">
                Peta sebaran geografis bahasa ini akan ditampilkan di sini setelah data lokasi tersedia.
              </p>
              <Link
                href="/explore/map"
                className="inline-flex items-center gap-2 text-amber-700 hover:text-amber-800 font-medium text-sm transition-colors"
              >
                Lihat peta semua bahasa
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                </svg>
              </Link>
            </div>

            {/* Vocabulary Sample */}
            <div className="bg-white rounded-2xl p-5 border border-earth-300/50 shadow-sm">
              <h2 className="font-bold text-[#1a1209] mb-3 flex items-center gap-2 text-base">
                <svg className="w-5 h-5 text-amber-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                </svg>
                Kosakata Sampel
              </h2>
              <div className="overflow-x-auto">
                <table className="w-full text-sm" role="table">
                  <thead>
                    <tr className="border-b border-earth-300">
                      <th className="text-left py-2 text-earth-600 font-medium">Kata</th>
                      <th className="text-left py-2 text-earth-600 font-medium">Arti</th>
                      <th className="text-left py-2 text-earth-600 font-medium">Fonetik (IPA)</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr className="border-b border-earth-200">
                      <td className="py-2.5 font-medium text-[#1a1209]" colSpan={3}>
                        Belum ada data kosakata untuk bahasa ini.
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        ) : (
          <div className="bg-yellow-50 border-l-4 border-yellow-500 p-4 max-w-3xl mx-auto">
            <p className="text-yellow-800">
              Tidak ditemukan bahasa dengan ID &quot;{params.slug}&quot;. Silakan periksa ulang atau kembali ke halaman sebelumnya.
            </p>
          </div>
        )}
      </div>
    </main>
  );
}
