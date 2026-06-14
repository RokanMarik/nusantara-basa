"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import HistorySection from "@/components/history-section";

interface Bahasa {
  id: string;
  nama_bahasa: string;
  auto_summary?: string | null;
}

export default function HistoryPage({ params }: { params: { slug: string } }) {
  const [bahasa, setBahasa] = useState<Bahasa | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchBahasa() {
      try {
        const res = await fetch(`/api/bahasa?search=${params.slug}`);
        if (res.ok) {
          const data = await res.json();
          if (data.data && data.data.length > 0) {
            setBahasa(data.data[0]);
          }
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

  return (
    <main className="min-h-screen bg-[#faf8f5]">
      {/* ===== NAV ===== */}
      <nav className="fixed top-4 left-4 right-4 md:left-1/2 md:right-auto md:-translate-x-1/2 md:w-auto z-50 bg-white/90 backdrop-blur-md border border-earth-300/50 rounded-full px-4 md:px-6 py-2.5 shadow-sm">
        <div className="flex items-center gap-4">
          <Link href="/explore" aria-label="Kembali ke halaman utama">
            <svg className="w-4 h-4 text-earth-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m0 0H21" />
            </svg>
          </Link>
          <span className="text-sm font-semibold text-earth-900 truncate max-w-[200px]">
            {loading ? "Loading..." : bahasa?.nama_bahasa || "Sejarah Bahasa"}
          </span>
        </div>
      </nav>

      {/* ===== PAGE CONTENT ===== */}
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
          <div>
            {/* Breadcrumb */}
            <nav className="mb-6 text-sm" aria-label="Breadcrumb">
              <ol className="flex items-center gap-2">
                <li>
                  <Link href="/explore" className="text-earth-600 hover:text-earth-800">
                    Explore
                  </Link>
                </li>
                <li className="text-earth-400">/</li>
                <li>
                  <Link href={`/explore/bahasa/${bahasa.id}`} className="text-earth-600 hover:text-earth-800">
                    {bahasa.nama_bahasa}
                  </Link>
                </li>
                <li className="text-earth-400">/</li>
                <li className="text-earth-900 font-medium">Sejarah</li>
              </ol>
            </nav>

            {/* Language Header */}
            <header className="mb-8">
              <h1 className="text-3xl md:text-4xl font-bold text-earth-900 mb-2">
                📜 Sejarah & Evolusi {bahasa.nama_bahasa}
              </h1>
              {bahasa.auto_summary && (
                <p className="text-earth-700 max-w-3xl">{bahasa.auto_summary}</p>
              )}
            </header>

            {/* Navigation Tabs */}
            <nav className="flex gap-1 mb-8 bg-earth-100/50 rounded-xl p-1" aria-label="Language tabs">
              <Link
                href={`/explore/bahasa/${bahasa.id}`}
                className="flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold text-earth-600 hover:text-earth-700 transition-all duration-200 cursor-pointer"
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
                className="flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold bg-white text-earth-900 shadow-sm transition-all duration-200 cursor-pointer"
                aria-current="page"
              >
                Sejarah
              </Link>
            </nav>

            {/* History Section Component */}
            <HistorySection bahasaId={bahasa.id} />
          </div>
        ) : (
          <div className="bg-yellow-50 border-l-4 border-yellow-500 p-4 max-w-3xl">
            <p className="text-yellow-800">
              Bahwa tidak ditemukan dengan slug "{params.slug}". Silakan periksa ulang atau kembali ke halaman sebelumnya.
            </p>
          </div>
        )}
      </div>
    </main>
  );
}
