import Link from "next/link";
import { VitalityBadge } from "@/components/ui/VitalityBadge";
import type { BahasaMarker } from "@/lib/types";

// SVG Icons
const ExternalLink = () => (
  <svg className="w-3 h-3 inline ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" />
  </svg>
);

export function MapPopup({ marker }: { marker: BahasaMarker }) {
  const penutur = marker.jumlahPenutur ? marker.jumlahPenutur.toLocaleString("id-ID") : "Tidak diketahui";
  const coordinates = marker.lat && marker.lng 
    ? `${marker.lat.toFixed(2)}°, ${marker.lng.toFixed(2)}°` 
    : null;
  
  return (
    <div className="min-w-[220px]" role="dialog" aria-label={`Language details for ${marker.namaBahasa}`}>
      <div className="flex items-center gap-2 mb-2">
        <div
          className="w-3 h-3 rounded-full flex-shrink-0"
          style={{ backgroundColor: marker.rumpunNama === "Papua" ? "#8b3a3a" : marker.rumpunNama === "Trans-New Guinea" ? "#5a7247" : "#c4703f" }}
          aria-hidden="true"
        />
        <h3 className="font-semibold text-[#1a1209] text-base">{marker.namaBahasa}</h3>
      </div>
      
      {marker.namaLokal && <p className="text-sm text-earth-600 italic mb-1">{marker.namaLokal}</p>}
      {marker.kodeIso639 && (
        <p className="text-xs text-earth-500 mb-3 font-mono">ISO 639-3: {marker.kodeIso639}</p>
      )}
      
      <div className="space-y-1.5 text-sm">
        <div className="flex justify-between items-center">
          <span className="text-earth-600">Penutur</span>
          <span className="font-semibold text-[#1a1209]">{penutur}</span>
        </div>
        {marker.rumpunNama && (
          <div className="flex justify-between items-center">
            <span className="text-earth-600">Rumpun</span>
            <span className="font-medium text-[#1a1209]">{marker.rumpunNama}</span>
          </div>
        )}
        <div className="flex justify-between items-center">
          <span className="text-earth-600">Status</span>
          <VitalityBadge status={marker.statusVitalitas} />
        </div>
        {coordinates && (
          <div className="flex justify-between items-center">
            <span className="text-earth-600">Koordinat</span>
            <span className="text-xs font-mono text-[#1a1209]">{coordinates}</span>
          </div>
        )}
      </div>
      
      <Link
        href={`/explore/bahasa/${marker.id}`}
        className="mt-3 block text-center text-sm text-amber-700 hover:text-amber-800 hover:underline font-medium transition-colors duration-200 cursor-pointer"
        aria-label={`View full details for ${marker.namaBahasa}`}
      >
        Lihat detail lengkap <ExternalLink />
      </Link>
    </div>
  );
}
