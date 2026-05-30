"use client";

import { useState, useEffect } from "react";
import dynamic from "next/dynamic";
import Link from "next/link";
import { SearchInput } from "@/components/ui/SearchInput";
import type { BahasaMarker } from "@/lib/types";

const LanguageMap = dynamic(
  () => import("@/components/map/LanguageMap").then((m) => ({ default: m.LanguageMap })),
  { ssr: false, loading: () => <div className="absolute inset-0 bg-earth-200" /> }
);

export default function MapPage() {
  const [markers, setMarkers] = useState<BahasaMarker[]>([]);
  const [bahasaList, setBahasaList] = useState<BahasaMarker[]>([]);
  const [rumpunList, setRumpunList] = useState<{ id: string; namaRumpun: string; bahasaCount: number }[]>([]);
  const [search, setSearch] = useState("");
  const [rumpunFilter, setRumpunFilter] = useState("");
  const [vitalitasFilter, setVitalitasFilter] = useState("");
  const [loading, setLoading] = useState(true);
  const [searchLoading, setSearchLoading] = useState(false);
  const [searchResultInfo, setSearchResultInfo] = useState<string | null>(null);

  useEffect(() => {
    fetch("/api/locations/markers")
      .then((r) => r.json())
      .then((data) => { setMarkers(data); setBahasaList(data); })
      .finally(() => setLoading(false));
  }, []);

  useEffect(() => {
    fetch("/api/rumpun")
      .then((r) => r.json())
      .then((data) => setRumpunList(data));
  }, []);

  const handleSmartSearch = async (query: string) => {
    setSearchLoading(true);
    setSearchResultInfo(null);
    try {
      const res = await fetch("/api/search", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ query }),
      });
      const data = await res.json();
      if (data.results) {
        setBahasaList(data.results);
        setSearchResultInfo(data.usedAI ? `AI: ${data.results.length} hasil` : `${data.results.length} hasil`);
      }
    } catch {
      const q = query.toLowerCase();
      const filtered = markers.filter(
        (b) => b.namaBahasa.toLowerCase().includes(q) || b.namaLokal?.toLowerCase().includes(q)
      );
      setBahasaList(filtered);
      setSearchResultInfo(`${filtered.length} bahasa ditemukan`);
    } finally {
      setSearchLoading(false);
    }
  };

  useEffect(() => {
    if (searchResultInfo) return;
    let filtered = markers;
    if (rumpunFilter) filtered = filtered.filter((b) => b.rumpunNama === rumpunFilter);
    if (vitalitasFilter) filtered = filtered.filter((b) => b.statusVitalitas === vitalitasFilter);
    setBahasaList(filtered);
  }, [rumpunFilter, vitalitasFilter, markers, searchResultInfo]);

  useEffect(() => {
    if (searchResultInfo && (rumpunFilter || vitalitasFilter)) setSearchResultInfo(null);
  }, [rumpunFilter, vitalitasFilter, searchResultInfo]);

  return (
    <div className="h-screen relative bg-[#faf8f5]">
      {/* Map */}
      <div className="absolute inset-0">
        <LanguageMap markers={bahasaList} />
      </div>

      {/* Top bar */}
      <div className="absolute top-3 left-3 right-3 z-[1000]">
        <div className="max-w-4xl mx-auto bg-white/90 backdrop-blur-md rounded-2xl shadow-lg border border-earth-300/50 p-3">
          <div className="flex items-center gap-3">
            <Link href="/" className="flex-shrink-0 font-black text-[#1a1209] text-sm tracking-tight">
              Nusantara<span className="text-amber-700">Basa</span>
            </Link>
            <div className="flex-1">
              <SearchInput value={search} onChange={setSearch} onSearch={handleSmartSearch} loading={searchLoading} placeholder="Cari bahasa, daerah, rumpun..." />
            </div>
            <select
              className="input-field w-auto text-sm rounded-lg bg-earth-100/50 border-earth-300/30"
              value={rumpunFilter}
              onChange={(e) => setRumpunFilter(e.target.value)}
            >
              <option value="">Rumpun</option>
              {rumpunList.map((r) => (
                <option key={r.id} value={r.namaRumpun}>{r.namaRumpun}</option>
              ))}
            </select>
            <select
              className="input-field w-auto text-sm rounded-lg bg-earth-100/50 border-earth-300/30"
              value={vitalitasFilter}
              onChange={(e) => setVitalitasFilter(e.target.value)}
            >
              <option value="">Status</option>
              <option value="aman">Aman</option>
              <option value="rentan">Rentan</option>
              <option value="terancam">Terancam</option>
              <option value="sangat terancam">Sangat terancam</option>
              <option value="kritis">Kritis</option>
            </select>
          </div>
          {searchResultInfo && (
            <p className="text-xs text-earth-600 mt-1.5">{searchResultInfo}</p>
          )}
        </div>
      </div>

      {/* Bottom cards */}
      <div className="absolute bottom-3 left-3 right-3 z-[1000]">
        <div className="max-w-4xl mx-auto">
          {loading ? (
            <div className="bg-white/90 backdrop-blur-md rounded-2xl shadow-lg border border-earth-300/50 p-6 flex items-center justify-center">
              <div className="flex items-center gap-2 text-earth-600">
                <div className="w-5 h-5 border-2 border-earth-400 border-t-earth-700 rounded-full animate-spin" />
                <span className="text-sm">Memuat bahasa...</span>
              </div>
            </div>
          ) : bahasaList.length === 0 ? (
            <div className="bg-white/90 backdrop-blur-md rounded-2xl shadow-lg border border-earth-300/50 p-6 text-center">
              <p className="text-sm text-earth-600">Tidak ada bahasa yang sesuai filter.</p>
            </div>
          ) : (
            <div className="bg-white/90 backdrop-blur-md rounded-2xl shadow-lg border border-earth-300/50 p-3">
              <p className="text-xs text-earth-600 mb-2 px-1">{bahasaList.length} bahasa</p>
              <div className="flex gap-2.5 overflow-x-auto pb-1 snap-x snap-mandatory" style={{ scrollbarWidth: 'thin' }}>
                {bahasaList.map((b) => {
                  const color = b.rumpunNama === "Papua" ? "#8b3a3a" : b.rumpunNama === "Trans-New Guinea" ? "#5a7247" : "#c4703f";
                  const vitalitasColor = b.statusVitalitas === 'aman' ? '#22c55e' : b.statusVitalitas === 'rentan' ? '#eab308' : b.statusVitalitas === 'terancam' ? '#f97316' : '#ef4444';
                  return (
                    <div key={b.id} className="snap-start flex-shrink-0 w-52">
                      <Link
                        href={`/explore/bahasa/${b.id}`}
                        className="block p-3 rounded-xl border border-earth-300/40 hover:border-earth-400 hover:bg-earth-50/50 transition-all bg-earth-50/30 group"
                      >
                        <div className="flex items-start gap-2.5">
                          <div className="flex-shrink-0 w-9 h-9 rounded-xl flex items-center justify-center text-white text-sm font-bold" style={{ backgroundColor: color }}>
                            {b.namaBahasa.charAt(0)}
                          </div>
                          <div className="min-w-0 flex-1">
                            <h3 className="font-bold text-earth-700 text-sm truncate group-hover:text-earth-800 transition-colors">{b.namaBahasa}</h3>
                            {b.namaLokal && <p className="text-[10px] text-earth-600 truncate italic">{b.namaLokal}</p>}
                          </div>
                          <div className="flex-shrink-0 w-2 h-2 rounded-full mt-1" style={{ backgroundColor: vitalitasColor }} />
                        </div>
                        <div className="mt-2 flex items-center gap-2 text-xs text-earth-600">
                          <span className="font-medium">
                            {b.jumlahPenutur ? (b.jumlahPenutur >= 1000000 ? `${(b.jumlahPenutur / 1000000).toFixed(1)}M` : `${(b.jumlahPenutur / 1000).toFixed(0)}K`) : '—'}
                          </span>
                          <span className="w-1 h-1 rounded-full bg-earth-400" />
                          <span className="truncate">{b.rumpunNama}</span>
                        </div>
                      </Link>
                    </div>
                  );
                })}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
