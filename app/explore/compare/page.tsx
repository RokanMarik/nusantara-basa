"use client";

import { useState, useEffect } from "react";
import Link from "next/link";

const ArrowLeft = () => (
  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m0 0H21" /></svg>
);

const RUMPUN_COLORS: Record<string, string> = { Austronesia: "#c4703f", Papua: "#8b3a3a", "Trans-New Guinea": "#5a7247" };
const VITALITAS_COLORS: Record<string, string> = { aman: "#22c55e", rentan: "#eab308", terancam: "#f97316", "sangat terancam": "#f97316", kritis: "#ef4444" };

interface Bahasa { id: string; nama_bahasa: string; nama_lokal: string | null; kode_iso_639: string | null; jumlah_penutur: number | null; status_vitalitas: string | null; rumpun_bahasa: { nama_rumpun: string | null } | null; }

export default function ComparePage() {
  const [bahasaList, setBahasaList] = useState<Bahasa[]>([]);
  const [selected, setSelected] = useState<string[]>([]);
  const [selectedData, setSelectedData] = useState<Bahasa[]>([]);

  useEffect(() => {
    fetch("/api/bahasa?limit=500").then(r => r.json()).then(d => setBahasaList(d.data || [])).catch(() => {});
  }, []);

  useEffect(() => {
    const data = bahasaList.filter(b => selected.includes(b.id));
    setSelectedData(data);
  }, [selected, bahasaList]);

  const toggle = (id: string) => {
    setSelected(prev => prev.includes(id) ? prev.filter(i => i !== id) : prev.length < 5 ? [...prev, id] : prev);
  };

  const formatPenutur = (n: number | null) => n ? (n >= 1000000 ? `${(n/1000000).toFixed(1)}M` : `${(n/1000).toFixed(0)}K`) : "—";

  return (
    <div className="min-h-screen bg-[#faf8f5]">
      <header className="bg-white/90 backdrop-blur-md border-b border-earth-300/50 px-4 py-3">
        <div className="max-w-6xl mx-auto flex items-center justify-between">
          <Link href="/" className="font-black text-[#1a1209] text-sm tracking-tight hover:text-amber-700 transition-colors duration-200 cursor-pointer">Nusantara<span className="text-amber-700">Basa</span></Link>
          <Link href="/" className="inline-flex items-center gap-1 text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer"><ArrowLeft /> Kembali</Link>
        </div>
      </header>

      <main className="max-w-6xl mx-auto px-4 py-6 md:py-8">
        <div className="mb-6">
          <span className="text-[10px] font-semibold uppercase tracking-widest text-amber-700 mb-1 block">Research</span>
          <h1 className="text-2xl md:text-3xl font-black text-[#1a1209] tracking-tight">Bandingkan Bahasa</h1>
          <p className="text-earth-600 mt-1 text-sm">Pilih 2-5 bahasa untuk dibandingkan</p>
        </div>

        {/* Selection */}
        <div className="bg-white rounded-2xl p-4 border border-earth-300/50 shadow-sm mb-6">
          <div className="flex flex-wrap gap-2 max-h-40 overflow-y-auto" role="listbox" aria-label="Select languages to compare">
            {bahasaList.map(b => (
              <button key={b.id} onClick={() => toggle(b.id)}
                className={`px-3 py-1.5 rounded-full text-sm font-medium transition-all duration-200 cursor-pointer ${
                  selected.includes(b.id) ? 'bg-amber-700 text-white' : 'bg-earth-100 text-earth-700 hover:bg-earth-200'
                }`}
                aria-pressed={selected.includes(b.id)}
              >
                {b.nama_bahasa}
              </button>
            ))}
          </div>
        </div>

        {/* Comparison */}
        {selectedData.length >= 2 && (
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
            {selectedData.map(b => {
              const rumpunColor = RUMPUN_COLORS[b.rumpun_bahasa?.nama_rumpun || ''] || '#6b5b8a';
              const vitalitasColor = VITALITAS_COLORS[b.status_vitalitas || ''] || '#9ca3af';
              return (
                <div key={b.id} className="bg-white rounded-2xl border border-earth-300/50 shadow-sm overflow-hidden">
                  <div className="p-4 border-b border-earth-300" style={{ backgroundColor: rumpunColor + "10" }}>
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-xl flex items-center justify-center text-white font-bold" style={{ backgroundColor: rumpunColor }}>{b.nama_bahasa.charAt(0)}</div>
                      <div>
                        <h3 className="font-bold text-[#1a1209]">{b.nama_bahasa}</h3>
                        {b.nama_lokal && <p className="text-xs text-earth-600 italic">{b.nama_lokal}</p>}
                      </div>
                    </div>
                  </div>
                  <dl className="p-4 space-y-2 text-sm">
                    <div className="flex justify-between"><dt className="text-earth-600">ISO</dt><dd className="font-mono">{b.kode_iso_639 || "—"}</dd></div>
                    <div className="flex justify-between"><dt className="text-earth-600">Penutur</dt><dd className="font-bold">{formatPenutur(b.jumlah_penutur)}</dd></div>
                    <div className="flex justify-between"><dt className="text-earth-600">Rumpun</dt><dd style={{ color: rumpunColor }}>{b.rumpun_bahasa?.nama_rumpun || "—"}</dd></div>
                    <div className="flex justify-between items-center"><dt className="text-earth-600">Status</dt><dd><span className="inline-flex items-center gap-1 text-xs px-2 py-0.5 rounded-full font-medium" style={{ backgroundColor: vitalitasColor + "15", color: vitalitasColor }}><span className="w-1.5 h-1.5 rounded-full" style={{ backgroundColor: vitalitasColor }} />{b.status_vitalitas || "—"}</span></dd></div>
                  </dl>
                </div>
              );
            })}
          </div>
        )}

        {selectedData.length < 2 && <p className="text-center text-earth-600 py-8">Pilih minimal 2 bahasa untuk membandingkan.</p>}
      </main>
    </div>
  );
}
