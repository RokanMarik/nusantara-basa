"use client";

import { useState, useEffect } from "react";
import dynamic from "next/dynamic";
import { Header } from "@/components/layout/Header";
import { BottomPanel } from "@/components/layout/BottomPanel";
import { ProvincePanel } from "@/components/map/ProvincePanel";
import type { BahasaMarker } from "@/lib/types";

const LanguageMap = dynamic(
  () => import("@/components/map/LanguageMap").then((m) => ({ default: m.LanguageMap })),
  { ssr: false, loading: () => <div className="absolute inset-0 bg-earth-200 flex items-center justify-center"><span className="text-earth-600 font-mono text-xs">loading map...</span></div> }
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
  const [showProvincePanel, setShowProvincePanel] = useState(false);

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
    <div className="h-screen relative" role="main">
      <Header />
      <div className="absolute inset-0">
        <LanguageMap markers={bahasaList} />
      </div>
      
      {/* Province Stats Toggle Button */}
      <button
        onClick={() => setShowProvincePanel(!showProvincePanel)}
        className="absolute top-20 right-4 z-[1000] bg-white rounded-lg shadow-lg px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors"
      >
        {showProvincePanel ? "Tutup" : "Statistik Provinsi"}
      </button>
      
      {/* Province Panel */}
      {showProvincePanel && (
        <div className="absolute top-32 right-4 z-[1000]">
          <ProvincePanel />
        </div>
      )}
      
      <div className="absolute bottom-0 left-0 right-0 z-[1000]">
        <BottomPanel
          search={search}
          onSearchChange={setSearch}
          onSmartSearch={handleSmartSearch}
          searchLoading={searchLoading}
          searchResultInfo={searchResultInfo}
          rumpunFilter={rumpunFilter}
          onRumpunChange={setRumpunFilter}
          vitalitasFilter={vitalitasFilter}
          onVitalitasChange={setVitalitasFilter}
          rumpunList={rumpunList}
          bahasaList={bahasaList.map((b) => ({
            id: b.id, namaBahasa: b.namaBahasa, namaLokal: b.namaLokal,
            jumlahPenutur: b.jumlahPenutur, statusVitalitas: b.statusVitalitas,
            rumpunNama: b.rumpunNama, lat: b.lat, lng: b.lng,
          }))}
          loading={loading}
        />
      </div>
    </div>
  );
}
