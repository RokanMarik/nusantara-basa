"use client";

import { useState, useEffect, useMemo } from "react";
import Link from "next/link";

// SVG Icons
const ArrowLeft = () => (
  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m0 0H21" />
  </svg>
);

const SearchIcon = () => (
  <svg className="w-4 h-4 text-earth-600 absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
  </svg>
);

const ChevronUp = () => (
  <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 15l7-7 7 7" /></svg>
);

const ChevronDown = () => (
  <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" /></svg>
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
};

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

interface Bahasa {
  id: string;
  namaBahasa: string;
  namaLokal: string | null;
  kodeIso639: string | null;
  jumlahPenutur: number | null;
  statusVitalitas: string | null;
  egidsLevel: string | null;
  rumpunNama: string | null;
  autoSummary: string | null;
}

type SortKey = "nama" | "penutur" | "vitalitas" | "rumpun" | "egids";
type SortDir = "asc" | "desc";

export default function DaftarBahasaPage() {
  const [bahasaList, setBahasaList] = useState<Bahasa[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [rumpunFilter, setRumpunFilter] = useState("");
  const [vitalitasFilter, setVitalitasFilter] = useState("");
  const [egidsFilter, setEgidsFilter] = useState("");
  const [sortKey, setSortKey] = useState<SortKey>("nama");
  const [sortDir, setSortDir] = useState<SortDir>("asc");

  useEffect(() => {
    fetch("/api/bahasa?limit=500")
      .then(r => r.json())
      .then(d => { setBahasaList(d.data || []); setLoading(false); })
      .catch(() => setLoading(false));
  }, []);

  const filtered = useMemo(() => {
    let result = bahasaList.filter(b => b && b.namaBahasa);

    if (search) {
      const q = search.toLowerCase();
      result = result.filter(b =>
        b.namaBahasa.toLowerCase().includes(q) ||
        b.namaLokal?.toLowerCase().includes(q) ||
        b.kodeIso639?.toLowerCase().includes(q)
      );
    }

    if (rumpunFilter) {
      result = result.filter(b => b.rumpunNama === rumpunFilter);
    }

    if (vitalitasFilter) {
      result = result.filter(b => b.statusVitalitas === vitalitasFilter);
    }

    if (egidsFilter) {
      result = result.filter(b => b.egidsLevel === egidsFilter);
    }

    result.sort((a, b) => {
      let aVal: string | number = "";
      let bVal: string | number = "";

      switch (sortKey) {
        case "nama":
          aVal = (a.namaBahasa || "").toLowerCase();
          bVal = (b.namaBahasa || "").toLowerCase();
          break;
        case "penutur":
          aVal = a.jumlahPenutur || 0;
          bVal = b.jumlahPenutur || 0;
          break;
        case "vitalitas":
          aVal = a.statusVitalitas || "";
          bVal = b.statusVitalitas || "";
          break;
        case "rumpun":
          aVal = a.rumpunNama || "";
          bVal = b.rumpunNama || "";
          break;
        case "egids":
          aVal = a.egidsLevel || "";
          bVal = b.egidsLevel || "";
          break;
      }

      if (aVal < bVal) return sortDir === "asc" ? -1 : 1;
      if (aVal > bVal) return sortDir === "asc" ? 1 : -1;
      return 0;
    });

    return result;
  }, [bahasaList, search, rumpunFilter, vitalitasFilter, egidsFilter, sortKey, sortDir]);

  const rumpunList = [...new Set(bahasaList.map(b => b.rumpunNama).filter(Boolean))].sort();
  const vitalitasList = [...new Set(bahasaList.map(b => b.statusVitalitas).filter(Boolean))].sort();
  const egidsList = [...new Set(bahasaList.map(b => b.egidsLevel).filter(Boolean))].sort();

  const handleSort = (key: SortKey) => {
    if (sortKey === key) {
      setSortDir(d => d === "asc" ? "desc" : "asc");
    } else {
      setSortKey(key);
      setSortDir("asc");
    }
  };

  const formatPenutur = (n: number | null) => {
    if (!n) return "—";
    if (n >= 1000000) return `${(n / 1000000).toFixed(1)}M`;
    if (n >= 1000) return `${(n / 1000).toFixed(0)}K`;
    return n.toString();
  };

  const SortHeader = ({ label, sort }: { label: string; sort: SortKey }) => (
    <button
      onClick={() => handleSort(sort)}
      className="flex items-center gap-1 text-xs font-semibold uppercase tracking-wider text-earth-600 hover:text-earth-700 transition-colors cursor-pointer"
      aria-label={`Sort by ${label}`}
    >
      {label}
      {sortKey === sort && (sortDir === "asc" ? <ChevronUp /> : <ChevronDown />)}
    </button>
  );

  return (
    <div className="min-h-screen bg-[#faf8f5]">
      {/* Header */}
      <header className="bg-white/90 backdrop-blur-md border-b border-earth-300/50 px-4 py-3 sticky top-0 z-50">
        <div className="max-w-6xl mx-auto flex items-center justify-between">
          <Link href="/" className="font-black text-[#1a1209] text-sm tracking-tight hover:text-amber-700 transition-colors duration-200 cursor-pointer" aria-label="Home">
            Nusantara<span className="text-amber-700">Basa</span>
          </Link>
          <Link href="/" className="inline-flex items-center gap-1 text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer" aria-label="Back to home">
            <ArrowLeft />
            Kembali
          </Link>
        </div>
      </header>

      <main className="max-w-6xl mx-auto px-4 py-6 md:py-8">
        <div className="mb-6 md:mb-8">
          <span className="text-[10px] font-semibold uppercase tracking-widest text-amber-700 mb-1 block">Koleksi Lengkap</span>
          <h1 className="text-2xl md:text-3xl font-black text-[#1a1209] tracking-tight">Daftar Bahasa</h1>
          <p className="text-earth-600 mt-1 text-sm">{bahasaList.length} bahasa terdokumentasi</p>
        </div>

        {/* Filters */}
        <div className="bg-white rounded-2xl p-4 border border-earth-300/50 shadow-sm mb-6">
          <div className="flex flex-col sm:flex-row gap-3">
            <div className="flex-1 relative">
              <SearchIcon />
              <input
                type="search"
                className="input-field pl-10"
                placeholder="Cari bahasa, ISO code..."
                value={search}
                onChange={e => setSearch(e.target.value)}
                aria-label="Search languages"
              />
            </div>
            <select
              className="input-field w-full sm:w-auto text-sm"
              value={rumpunFilter}
              onChange={e => setRumpunFilter(e.target.value)}
              aria-label="Filter by language family"
            >
              <option value="">Semua Rumpun</option>
              {rumpunList.map((r, i) => <option key={`${r}-key-${i}`} value={r ?? ""}>{r ?? "—"}</option>)}
            </select>
            <select
              className="input-field w-full sm:w-auto text-sm"
              value={vitalitasFilter}
              onChange={e => setVitalitasFilter(e.target.value)}
              aria-label="Filter by vitality status"
            >
              <option value="">Semua Status</option>
              {vitalitasList.filter((v): v is string => v !== null).map(v => <option key={v} value={v}>{v.charAt(0).toUpperCase() + v.slice(1)}</option>)}
            </select>
            <select
              className="input-field w-full sm:w-auto text-sm"
              value={egidsFilter}
              onChange={e => setEgidsFilter(e.target.value)}
              aria-label="Filter by EGIDS level"
            >
              <option value="">Semua EGIDS</option>
              {egidsList.filter((v): v is string => v !== null).map(v => <option key={v} value={v}>{v}</option>)}
            </select>
          </div>
        </div>

        {/* Table */}
        <div className="bg-white rounded-2xl border border-earth-300/50 shadow-sm overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full" role="table" aria-label="Language list">
              <thead>
                <tr className="border-b border-earth-300 bg-earth-50/50">
                  <th className="text-left py-3 px-4"><SortHeader label="Bahasa" sort="nama" /></th>
                  <th className="text-left py-3 px-4 hidden md:table-cell"><SortHeader label="ISO" sort="rumpun" /></th>
                  <th className="text-right py-3 px-4"><SortHeader label="Penutur" sort="penutur" /></th>
                  <th className="text-left py-3 px-4 hidden sm:table-cell"><SortHeader label="Rumpun" sort="rumpun" /></th>
                  <th className="text-left py-3 px-4 hidden lg:table-cell"><SortHeader label="EGIDS" sort="egids" /></th>
                  <th className="text-left py-3 px-4 hidden xl:table-cell"><SortHeader label="Status" sort="vitalitas" /></th>
                </tr>
              </thead>
              <tbody>
                {loading ? (
                  <tr><td colSpan={6} className="py-8 text-center text-earth-600">Loading...</td></tr>
                ) : filtered.length === 0 ? (
                  <tr><td colSpan={6} className="py-8 text-center text-earth-600">Tidak ada bahasa yang sesuai filter.</td></tr>
                ) : (
                  filtered.map((b) => {
                    const rumpunColor = RUMPUN_COLORS[b.rumpunNama || ''] || '#6b5b8a';
                    const vitalitasColor = VITALITAS_COLORS[b.statusVitalitas || ''] || '#9ca3af';
                    return (
                      <tr key={b.id} className="border-b border-earth-200 hover:bg-earth-50/50 transition-colors duration-200">
                        <td className="py-3 px-4">
                          <Link href={`/explore/bahasa/${b.id}`} className="group flex items-center gap-2 cursor-pointer" aria-label={`View details for ${b.namaBahasa}`}>
                            <div className="w-7 h-7 rounded-lg flex items-center justify-center text-white text-xs font-bold flex-shrink-0" style={{ backgroundColor: rumpunColor }}>
                              {b.namaBahasa.charAt(0)}
                            </div>
                            <div className="min-w-0">
                              <div className="font-semibold text-[#1a1209] text-sm group-hover:text-amber-700 transition-colors truncate">{b.namaBahasa}</div>
                              {b.namaLokal && <div className="text-[10px] text-earth-600 truncate italic">{b.namaLokal}</div>}
                            </div>
                          </Link>
                        </td>
                        <td className="py-3 px-4 hidden md:table-cell">
                          <span className="font-mono text-xs text-earth-600">{b.kodeIso639 || "—"}</span>
                        </td>
                        <td className="py-3 px-4 text-right">
                          <span className="font-semibold text-[#1a1209] text-sm">{formatPenutur(b.jumlahPenutur)}</span>
                        </td>
                        <td className="py-3 px-4 hidden sm:table-cell">
                          <span className="text-xs font-medium" style={{ color: rumpunColor }}>{b.rumpunNama || "—"}</span>
                        </td>
                        <td className="py-3 px-4 hidden lg:table-cell">
                          {b.egidsLevel && (
                            <span 
                              className="text-xs font-mono text-earth-700"
                              title={EGIDS_DESCRIPTIONS[b.egidsLevel.split(" - ")[0]] || ""}
                            >
                              {b.egidsLevel}
                            </span>
                          )}
                        </td>
                        <td className="py-3 px-4 hidden xl:table-cell">
                          {b.statusVitalitas && (
                            <span className="inline-flex items-center gap-1 text-xs px-2 py-0.5 rounded-full font-medium" style={{ backgroundColor: vitalitasColor + "15", color: vitalitasColor }}>
                              <span className="w-1.5 h-1.5 rounded-full" style={{ backgroundColor: vitalitasColor }} />
                              {b.statusVitalitas.charAt(0).toUpperCase() + b.statusVitalitas.slice(1)}
                            </span>
                          )}
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>
          {/* Footer */}
          <div className="px-4 py-3 border-t border-earth-300 bg-earth-50/30">
            <p className="text-xs text-earth-600">
              Menampilkan <span className="font-semibold">{filtered.length}</span> dari <span className="font-semibold">{bahasaList.length}</span> bahasa
            </p>
          </div>
        </div>
      </main>
    </div>
  );
}
