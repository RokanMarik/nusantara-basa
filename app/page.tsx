"use client";

import { useState, useEffect } from "react";
import dynamic from "next/dynamic";
import { Logo } from "@/components/shared/Logo";
import { SearchInput } from "@/components/ui/SearchInput";
import Link from "next/link";
import type { BahasaMarker } from "@/lib/types";

const LanguageMap = dynamic(
  () => import("@/components/map/LanguageMap").then((m) => ({ default: m.LanguageMap })),
  { ssr: false, loading: () => <div className="absolute inset-0 bg-[#1a1209]" /> }
);

export default function HomePage() {
  const [markers, setMarkers] = useState<BahasaMarker[]>([]);
  const [search, setSearch] = useState("");
  const [filtered, setFiltered] = useState<BahasaMarker[]>([]);
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    fetch("/api/locations/markers")
      .then((r) => r.json())
      .then((data) => { setMarkers(data); setFiltered(data); });
  }, []);

  useEffect(() => {
    if (!search) { setFiltered(markers); return; }
    const q = search.toLowerCase();
    setFiltered(markers.filter(
      (b) => b.namaBahasa.toLowerCase().includes(q) || b.namaLokal?.toLowerCase().includes(q) || b.rumpunNama?.toLowerCase().includes(q)
    ));
  }, [search, markers]);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 50);
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  return (
    <div className="min-h-screen bg-[#faf8f5]">
      {/* ===== HERO: Full-screen map ===== */}
      <section className="relative h-screen overflow-hidden">
        {/* Map background */}
        <div className="absolute inset-0">
          <LanguageMap markers={filtered} center={[-2.5, 118.0]} zoom={5} />
        </div>

        {/* Gradient overlay */}
        <div className="absolute inset-0 bg-gradient-to-b from-[#1a1209]/70 via-[#1a1209]/30 to-transparent" />

        {/* Hero content */}
        <div className="relative h-full flex flex-col items-center justify-center px-4 text-center">
          {/* Logo */}
          <div className="mb-6 bg-white/10 backdrop-blur-md rounded-2xl px-5 py-3 border border-white/20">
            <Logo size="md" />
          </div>

          {/* Headline */}
          <h1 className="text-5xl md:text-7xl font-black text-white mb-4 tracking-tight leading-[1.1]">
            Bahasa Daerah<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-300 via-orange-300 to-amber-400">
              Warisan Nusantara
            </span>
          </h1>

          <p className="text-lg md:text-xl text-white/70 mb-10 max-w-lg">
            Jelajahi ratusan bahasa dari Aceh sampai Papua
          </p>

          {/* Search bar */}
          <div className="w-full max-w-xl">
            <div className="bg-white/95 backdrop-blur-md rounded-2xl shadow-2xl p-2">
              <SearchInput value={search} onChange={setSearch} onSearch={() => {}} loading={false} placeholder="Cari bahasa, rumpun, daerah..." />
            </div>
          </div>

          {/* CTA buttons */}
          <div className="flex gap-3 mt-6">
            <Link href="/explore/map" className="px-8 py-3 bg-gradient-to-r from-amber-600 to-orange-600 text-white rounded-full font-bold text-sm hover:from-amber-700 hover:to-orange-700 transition-all shadow-lg shadow-amber-900/30">
              Buka Peta Lengkap
            </Link>
          </div>
        </div>

        {/* Scroll indicator */}
        <div className="absolute bottom-8 left-1/2 -translate-x-1/2 animate-bounce">
          <svg className="w-6 h-6 text-white/50" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 14l-7 7m0 0l-7-7m7 7V3" /></svg>
        </div>
      </section>

      {/* ===== STATS SECTION ===== */}
      <section className="py-20 px-4 bg-[#faf8f5]">
        <div className="max-w-5xl mx-auto">
          {/* Section header */}
          <div className="text-center mb-12">
            <span className="text-xs font-bold uppercase tracking-widest text-amber-700 mb-2 block">Eksplorasi</span>
            <h2 className="text-3xl md:text-4xl font-black text-[#1a1209]">Peta Interaktif Bahasa Indonesia</h2>
          </div>

          {/* Stats grid */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-16">
            {[
              { label: "Bahasa Daerah", value: markers.length.toString(), icon: "🗣️" },
              { label: "Rumpun Bahasa", value: "3", icon: "🌿" },
              { label: "Wilayah Sebaran", value: "20+", icon: "📍" },
              { label: "Status Vitalitas", value: "4", icon: "📊" },
            ].map((s, i) => (
              <div key={i} className="bg-white rounded-2xl p-6 text-center border border-amber-100/50 hover:border-amber-200 transition-colors group">
                <div className="text-3xl mb-2">{s.icon}</div>
                <div className="text-3xl font-black text-[#1a1209] group-hover:text-amber-700 transition-colors">{s.value}</div>
                <div className="text-sm text-[#8b7355] mt-1">{s.label}</div>
              </div>
            ))}
          </div>

          {/* Featured languages */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            {markers.slice(0, 8).map((b) => {
              const color = b.rumpunNama === "Papua" ? "#991b1b" : b.rumpunNama === "Trans-New Guinea" ? "#166534" : "#b45309";
              const penutur = b.jumlahPenutur ? b.jumlahPenutur >= 1000000 ? `${(b.jumlahPenutur / 1000000).toFixed(1)}M` : `${(b.jumlahPenutur / 1000).toFixed(0)}K` : '—';
              return (
                <Link key={b.id} href={`/explore/bahasa/${b.id}`}
                  className="group bg-white rounded-2xl p-4 border border-amber-100/50 hover:border-amber-300 hover:shadow-lg transition-all">
                  <div className="flex items-center gap-3 mb-2">
                    <div className="w-10 h-10 rounded-xl flex items-center justify-center text-white font-bold text-sm" style={{ backgroundColor: color }}>
                      {b.namaBahasa.charAt(0)}
                    </div>
                    <div className="min-w-0">
                      <h3 className="font-bold text-[#1a1209] text-sm truncate">{b.namaBahasa}</h3>
                      {b.namaLokal && <p className="text-xs text-[#8b7355] truncate italic">{b.namaLokal}</p>}
                    </div>
                  </div>
                  <div className="text-xs text-[#8b7355] mt-2">
                    <span className="font-semibold" style={{ color }}>{penutur}</span> penutur
                  </div>
                </Link>
              );
            })}
          </div>

          {/* CTA */}
          <div className="text-center mt-12">
            <Link href="/explore/map" className="inline-flex items-center gap-2 px-10 py-4 bg-[#1a1209] text-white rounded-full font-bold text-lg hover:bg-[#2d1f0e] transition-colors shadow-xl">
              Mulai Jelajahi
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" /></svg>
            </Link>
          </div>
        </div>
      </section>

      {/* ===== FOOTER ===== */}
      <footer className="py-12 px-4 bg-[#1a1209] text-white/60">
        <div className="max-w-4xl mx-auto text-center">
          <div className="flex justify-center mb-4">
            <div className="bg-white/10 rounded-xl px-4 py-2">
              <Logo size="sm" />
            </div>
          </div>
          <p className="text-sm">© 2026 Nusantara Basa — Peta Interaktif Bahasa Indonesia</p>
        </div>
      </footer>
    </div>
  );
}
