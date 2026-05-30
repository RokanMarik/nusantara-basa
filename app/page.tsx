"use client";

import { useState, useEffect } from "react";
import dynamic from "next/dynamic";
import { Logo } from "@/components/shared/Logo";
import { SearchInput } from "@/components/ui/SearchInput";
import Link from "next/link";
import type { BahasaMarker } from "@/lib/types";

const LanguageMap = dynamic(
  () => import("@/components/map/LanguageMap").then((m) => ({ default: m.LanguageMap })),
  { ssr: false, loading: () => <div className="absolute inset-0 bg-earth-200" /> }
);

export default function HomePage() {
  const [markers, setMarkers] = useState<BahasaMarker[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [filtered, setFiltered] = useState<BahasaMarker[]>([]);

  useEffect(() => {
    fetch("/api/locations/markers")
      .then((r) => r.json())
      .then((data) => { setMarkers(data); setFiltered(data); })
      .finally(() => setLoading(false));
  }, []);

  useEffect(() => {
    if (!search) { setFiltered(markers); return; }
    const q = search.toLowerCase();
    setFiltered(markers.filter(
      (b) => b.namaBahasa.toLowerCase().includes(q) || b.namaLokal?.toLowerCase().includes(q) || b.rumpunNama?.toLowerCase().includes(q)
    ));
  }, [search, markers]);

  return (
    <div className="h-screen relative">
      {/* Full-screen map as hero */}
      <div className="absolute inset-0">
        <LanguageMap markers={filtered} center={[-2.5, 118.0]} zoom={5} />
      </div>

      {/* Floating top bar */}
      <div className="absolute top-0 left-0 right-0 z-[1000] p-3 md:p-4">
        <div className="max-w-4xl mx-auto">
          <div className="bg-white/95 backdrop-blur-md rounded-2xl shadow-xl border border-amber-200/50 overflow-hidden">
            {/* Logo + Search row */}
            <div className="flex items-center gap-3 p-3">
              <Link href="/" className="flex-shrink-0">
                <Logo size="sm" />
              </Link>
              <div className="flex-1">
                <SearchInput value={search} onChange={setSearch} onSearch={() => {}} loading={false} placeholder="Cari bahasa, rumpun, daerah..." />
              </div>
              <Link href="/explore/map" className="flex-shrink-0 btn-primary rounded-xl text-sm px-5 py-2.5">
                Peta Lengkap
              </Link>
            </div>
            {/* Quick stats */}
            <div className="px-3 pb-3 flex gap-4 text-xs text-[#5c4a35]">
              <span className="flex items-center gap-1">
                <span className="w-2 h-2 rounded-full bg-amber-700" />
                {markers.length} bahasa
              </span>
              <span className="flex items-center gap-1">
                <span className="w-2 h-2 rounded-full bg-red-800" />
                3 rumpun
              </span>
            </div>
          </div>
        </div>
      </div>

      {/* Floating info panel - bottom left */}
      <div className="absolute bottom-6 left-3 md:left-6 z-[1000]">
        <div className="bg-white/95 backdrop-blur-md rounded-2xl shadow-xl border border-amber-200/50 p-4 max-w-xs">
          <h2 className="font-bold text-[#1a1209] text-lg mb-1">Nusantara Basa</h2>
          <p className="text-sm text-[#5c4a35] mb-3">Peta interaktif bahasa daerah Indonesia. Klik marker untuk detail.</p>
          <div className="flex flex-wrap gap-2">
            <span className="flex items-center gap-1 text-xs px-2 py-1 rounded-full bg-amber-50 text-amber-800"><span className="w-2 h-2 rounded-full bg-amber-700" /> Austronesia</span>
            <span className="flex items-center gap-1 text-xs px-2 py-1 rounded-full bg-red-50 text-red-800"><span className="w-2 h-2 rounded-full bg-red-800" /> Papua</span>
            <span className="flex items-center gap-1 text-xs px-2 py-1 rounded-full bg-green-50 text-green-800"><span className="w-2 h-2 rounded-full bg-green-800" /> TNG</span>
          </div>
        </div>
      </div>

      {/* Search results floating - bottom right */}
      {search && filtered.length > 0 && (
        <div className="absolute bottom-6 right-3 md:right-6 z-[1000] max-h-[50vh] overflow-hidden">
          <div className="bg-white/95 backdrop-blur-md rounded-2xl shadow-xl border border-amber-200/50 p-3 w-64">
            <p className="text-xs text-[#8b7355] mb-2">{filtered.length} hasil untuk "{search}"</p>
            <div className="max-h-[40vh] overflow-y-auto space-y-1.5">
              {filtered.slice(0, 10).map((b) => (
                <Link key={b.id} href={`/explore/bahasa/${b.id}`} className="block p-2 rounded-lg hover:bg-amber-50 transition-colors">
                  <div className="flex items-center gap-2">
                    <div className="w-6 h-6 rounded-md flex items-center justify-center text-white text-xs font-bold flex-shrink-0" style={{ backgroundColor: b.rumpunNama === "Papua" ? "#991b1b" : b.rumpunNama === "Trans-New Guinea" ? "#166534" : "#b45309" }}>
                      {b.namaBahasa.charAt(0)}
                    </div>
                    <div className="min-w-0">
                      <div className="text-sm font-semibold text-[#1a1209] truncate">{b.namaBahasa}</div>
                      <div className="text-xs text-[#8b7355] truncate">{b.rumpunNama}</div>
                    </div>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
