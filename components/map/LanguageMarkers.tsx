"use client";

import { Marker, Popup, useMap } from "react-leaflet";
import MarkerClusterGroup from "react-leaflet-markercluster";
import { DivIcon } from "leaflet";
import { MapPopup } from "./MapPopup";
import type { BahasaMarker } from "@/lib/types";
import "react-leaflet-markercluster/dist/styles.min.css";

function getMarkerColor(rumpunNama: string | null): string {
  if (rumpunNama === "Papua") return "#8b3a3a";
  if (rumpunNama === "Trans-New Guinea") return "#5a7247";
  return "#c4703f";
}

function getVitalitasSize(jumlahPenutur: number | null): number {
  if (!jumlahPenutur) return 10;
  if (jumlahPenutur >= 50000000) return 18;
  if (jumlahPenutur >= 10000000) return 15;
  if (jumlahPenutur >= 1000000) return 12;
  return 10;
}

function createModernIcon(rumpunNama: string | null, jumlahPenutur: number | null, statusVitalitas: string | null): DivIcon {
  const color = getMarkerColor(rumpunNama);
  const size = getVitalitasSize(jumlahPenutur);
  const isCritical = statusVitalitas === "kritis" || statusVitalitas === "sangat terancam";

  const html = `
    <div style="position: relative; width: ${size + 12}px; height: ${size + 12}px;">
      ${isCritical ? `<div style="position: absolute; inset: 0; border-radius: 50%; background: ${color}; opacity: 0.3; animation: pulse 2s ease-in-out infinite;"></div>` : ""}
      <div style="
        position: absolute;
        top: 6px; left: 6px;
        width: ${size}px; height: ${size}px;
        border-radius: 50%;
        background: ${color};
        border: 3px solid white;
        box-shadow: 0 2px 8px rgba(0,0,0,0.3), 0 0 0 1px rgba(0,0,0,0.1);
      "></div>
    </div>
  `;

  return new DivIcon({
    html,
    className: "modern-marker",
    iconSize: [size + 12, size + 12],
    iconAnchor: [(size + 12) / 2, (size + 12) / 2],
    popupAnchor: [0, -(size + 12) / 2],
  });
}

export function LanguageMarkers({ markers }: { markers: BahasaMarker[] }) {
  const map = useMap();
  
  return (
    <>
      <style>{`
        @keyframes pulse {
          0%, 100% { transform: scale(1); opacity: 0.3; }
          50% { transform: scale(1.8); opacity: 0; }
        }
        .modern-marker { background: none !important; border: none !important; }
        .leaflet-popup-content-wrapper { border-radius: 12px !important; }
        .cluster-marker { background: none !important; border: none !important; }
      `}</style>
      <MarkerClusterGroup
        chunkedLoading={true}
        maxClusterRadius={80}
        iconCreateFunction={(cluster) => {
          const count = cluster.getChildCount();
          const color = "#c4703f";
          const size = count < 10 ? 30 : count < 100 ? 40 : 50;
          
          return new DivIcon({
            html: `<div style="
              background-color: ${color};
              width: ${size}px;
              height: ${size}px;
              border-radius: 50%;
              display: flex;
              align-items: center;
              justify-content: center;
              color: white;
              font-weight: bold;
              font-size: ${size < 40 ? '12px' : '14px'};
              border: 3px solid white;
              box-shadow: 0 2px 8px rgba(0,0,0,0.3);
            ">${count}</div>`,
            className: "cluster-marker",
            iconSize: [size, size],
            iconAnchor: [size / 2, size / 2],
          });
        }}
      >
        {markers.map((m) => (
          <Marker
            key={m.id}
            position={[m.lat, m.lng]}
            icon={createModernIcon(m.rumpunNama, m.jumlahPenutur, m.statusVitalitas)}
            eventHandlers={{
              click: () => { map.flyTo([m.lat, m.lng], 8, { duration: 1 }); },
            }}
          >
            <Popup><MapPopup marker={m} /></Popup>
          </Marker>
        ))}
      </MarkerClusterGroup>
    </>
  );
}
