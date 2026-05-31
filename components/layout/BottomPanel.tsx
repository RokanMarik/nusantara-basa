import { SearchInput } from "@/components/ui/SearchInput";
import Link from "next/link";

// SVG Icons
const SpinnerIcon = () => (
  <div className="w-5 h-5 border-2 border-earth-400 border-t-earth-700 rounded-full animate-spin" aria-hidden="true" />
);

interface BottomPanelProps {
  search: string;
  onSearchChange: (v: string) => void;
  onSmartSearch: (query: string) => void;
  searchLoading: boolean;
  searchResultInfo: string | null;
  rumpunFilter: string;
  onRumpunChange: (v: string) => void;
  vitalitasFilter: string;
  onVitalitasChange: (v: string) => void;
  rumpunList: { id: string; namaRumpun: string; bahasaCount: number }[];
  bahasaList: { id: string; namaBahasa: string; namaLokal: string | null; jumlahPenutur: number | null; statusVitalitas: string | null; rumpunNama: string | null; lat: number; lng: number }[];
  loading: boolean;
}

export function BottomPanel({
  search, onSearchChange, onSmartSearch, searchLoading, searchResultInfo,
  rumpunFilter, onRumpunChange, vitalitasFilter, onVitalitasChange,
  rumpunList, bahasaList, loading,
}: BottomPanelProps) {
  const vitalitasColors: Record<string, string> = {
    aman: '#22c55e', rentan: '#eab308', terancam: '#f97316',
    'sangat terancam': '#f97316', kritis: '#ef4444',
  };

  return (
    <div className="mx-2 md:mx-3 mb-2 md:mb-3" role="region" aria-label="Language list and filters">
      <div className="bg-white/90 backdrop-blur-md rounded-2xl border border-earth-300/50 shadow-sm overflow-hidden">
        {/* Search + Filters */}
        <div className="px-3 md:px-4 py-3 border-b border-earth-300/30">
          <div className="flex flex-col sm:flex-row gap-2">
            <div className="flex-1">
              <SearchInput value={search} onChange={onSearchChange} onSearch={onSmartSearch} loading={searchLoading} placeholder="Cari bahasa, daerah, rumpun..." />
            </div>
            <div className="flex gap-2">
              <select
                className="input-field w-auto text-sm rounded-xl bg-earth-100/50 border-earth-300/30 cursor-pointer"
                value={rumpunFilter}
                onChange={(e) => onRumpunChange(e.target.value)}
                aria-label="Filter by language family"
              >
                <option value="">Rumpun</option>
                {rumpunList.map((r) => (
                  <option key={r.id} value={r.namaRumpun}>{r.namaRumpun}</option>
                ))}
              </select>
              <select
                className="input-field w-auto text-sm rounded-xl bg-earth-100/50 border-earth-300/30 cursor-pointer"
                value={vitalitasFilter}
                onChange={(e) => onVitalitasChange(e.target.value)}
                aria-label="Filter by vitality status"
              >
                <option value="">Status</option>
                <option value="aman">Aman</option>
                <option value="rentan">Rentan</option>
                <option value="terancam">Terancam</option>
                <option value="sangat terancam">Sangat terancam</option>
                <option value="kritis">Kritis</option>
              </select>
            </div>
          </div>
          {searchResultInfo && (
            <p className="text-[10px] font-mono text-earth-600 mt-1.5" aria-live="polite">{searchResultInfo}</p>
          )}
        </div>

        {/* Horizontal scroll cards */}
        <div className="px-3 md:px-4 py-3">
          {loading ? (
            <div className="flex items-center justify-center py-6" role="status" aria-label="Loading languages">
              <div className="flex items-center gap-2 text-earth-600">
                <SpinnerIcon />
                <span className="text-sm font-mono">loading...</span>
              </div>
            </div>
          ) : bahasaList.length === 0 ? (
            <p className="text-center text-xs text-earth-600 py-4 font-mono" role="status">tidak ada hasil</p>
          ) : (
            <>
              <p className="text-[10px] font-mono text-earth-600 mb-2 px-1" aria-live="polite">{bahasaList.length} bahasa</p>
              <div className="flex gap-2 md:gap-2.5 overflow-x-auto pb-1 snap-x snap-mandatory" style={{ scrollbarWidth: 'thin' }} role="list" aria-label="Language list">
                {bahasaList.map((b) => {
                  const color = b.rumpunNama === "Papua" ? "#8b3a3a" : b.rumpunNama === "Trans-New Guinea" ? "#5a7247" : "#c4703f";
                  const vitalitasColor = vitalitasColors[b.statusVitalitas || ''] || '#9ca3af';
                  const penutur = b.jumlahPenutur ? (b.jumlahPenutur >= 1000000 ? `${(b.jumlahPenutur / 1000000).toFixed(1)}M` : `${(b.jumlahPenutur / 1000).toFixed(0)}K`) : '—';
                  return (
                    <div key={b.id} className="snap-start flex-shrink-0 w-48 md:w-52" role="listitem">
                      <Link
                        href={`/explore/bahasa/${b.id}`}
                        className="block p-3 rounded-xl border border-earth-300/40 hover:border-earth-400 hover:bg-earth-50/50 transition-all duration-200 cursor-pointer group"
                        aria-label={`View details about ${b.namaBahasa}`}
                      >
                        <div className="flex items-start gap-2.5">
                          <div className="flex-shrink-0 w-8 h-8 md:w-9 md:h-9 rounded-xl flex items-center justify-center text-white text-xs md:text-sm font-bold" style={{ backgroundColor: color }} aria-hidden="true">
                            {b.namaBahasa.charAt(0)}
                          </div>
                          <div className="min-w-0 flex-1">
                            <h3 className="font-bold text-earth-700 text-sm truncate group-hover:text-earth-800 transition-colors duration-200">{b.namaBahasa}</h3>
                            {b.namaLokal && <p className="text-[10px] text-earth-600 truncate italic">{b.namaLokal}</p>}
                          </div>
                          <div className="flex-shrink-0 w-2 h-2 rounded-full mt-1" style={{ backgroundColor: vitalitasColor }} aria-label={`Vitality: ${b.statusVitalitas || 'unknown'}`} />
                        </div>
                        <div className="mt-2 flex items-center gap-2 text-xs text-earth-600">
                          <span className="font-medium">{penutur}</span>
                          <span className="w-1 h-1 rounded-full bg-earth-400" aria-hidden="true" />
                          <span className="truncate">{b.rumpunNama}</span>
                        </div>
                      </Link>
                    </div>
                  );
                })}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
