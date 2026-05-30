import { SearchInput } from "@/components/ui/SearchInput";
import Link from "next/link";

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
  return (
    <div className="mx-3 mb-3">
      <div className="bg-[#12121a]/95 backdrop-blur-md rounded-xl border border-[#2a2a40] overflow-hidden">
        {/* Search + Filters */}
        <div className="px-4 py-3 border-b border-[#2a2a40]">
          <div className="flex gap-2 items-center">
            <div className="flex-1">
              <SearchInput value={search} onChange={onSearchChange} onSearch={onSmartSearch} loading={searchLoading} placeholder="Cari bahasa, daerah, rumpun..." />
            </div>
            <select
              className="w-auto text-sm rounded-lg bg-[#0a0a0f] border border-[#2a2a40] text-[#e8e8e0] px-3 py-2 focus:outline-none focus:border-[#4b9cf5]"
              value={rumpunFilter}
              onChange={(e) => onRumpunChange(e.target.value)}
            >
              <option value="">Rumpun</option>
              {rumpunList.map((r) => (
                <option key={r.id} value={r.namaRumpun}>{r.namaRumpun}</option>
              ))}
            </select>
            <select
              className="w-auto text-sm rounded-lg bg-[#0a0a0f] border border-[#2a2a40] text-[#e8e8e0] px-3 py-2 focus:outline-none focus:border-[#4b9cf5]"
              value={vitalitasFilter}
              onChange={(e) => onVitalitasChange(e.target.value)}
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
            <p className="text-[10px] font-mono text-[#666680] mt-1.5">{searchResultInfo}</p>
          )}
        </div>

        {/* Horizontal scroll cards */}
        <div className="px-4 py-3">
          {loading ? (
            <div className="flex items-center justify-center py-6">
              <div className="flex items-center gap-2 text-[#666680]">
                <div className="w-4 h-4 border-2 border-[#2a2a40] border-t-[#4b9cf5] rounded-full animate-spin" />
                <span className="text-xs font-mono">loading...</span>
              </div>
            </div>
          ) : bahasaList.length === 0 ? (
            <p className="text-center text-xs text-[#666680] py-4 font-mono">tidak ada hasil</p>
          ) : (
            <>
              <p className="text-[10px] font-mono text-[#666680] mb-2">{bahasaList.length} bahasa</p>
              <div className="flex gap-2.5 overflow-x-auto pb-1 snap-x snap-mandatory" style={{ scrollbarWidth: 'thin' }}>
                {bahasaList.map((b) => {
                  const color = b.rumpunNama === "Papua" ? "#e74c3c" : b.rumpunNama === "Trans-New Guinea" ? "#2ecc71" : "#4b9cf5";
                  return (
                    <div key={b.id} className="snap-start flex-shrink-0 w-52">
                      <Link
                        href={`/explore/bahasa/${b.id}`}
                        className="block p-3 rounded-lg border border-[#2a2a40] hover:border-[#4b9cf5] transition-colors bg-[#0a0a0f] group"
                      >
                        <div className="flex items-start gap-2.5">
                          <div className="flex-shrink-0 w-8 h-8 rounded-lg flex items-center justify-center text-[#0a0a0f] text-xs font-bold" style={{ backgroundColor: color }}>
                            {b.namaBahasa.charAt(0)}
                          </div>
                          <div className="min-w-0 flex-1">
                            <h3 className="font-semibold text-[#e8e8e0] text-sm truncate group-hover:text-white transition-colors">{b.namaBahasa}</h3>
                            {b.namaLokal && (
                              <p className="text-[10px] text-[#666680] truncate font-mono">{b.namaLokal}</p>
                            )}
                          </div>
                        </div>
                        <div className="mt-2 flex items-center gap-2 text-[10px] font-mono text-[#666680]">
                          <span className="text-[#4b9cf5]">
                            {b.jumlahPenutur ? (b.jumlahPenutur >= 1000000 ? `${(b.jumlahPenutur / 1000000).toFixed(1)}M` : `${(b.jumlahPenutur / 1000).toFixed(0)}K`) : '—'}
                          </span>
                          <span>·</span>
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
