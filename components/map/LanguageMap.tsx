"use client";

import { MapContainer, TileLayer } from "react-leaflet";
import { LatLngBounds } from "leaflet";
import { LanguageMarkers } from "./LanguageMarkers";
import type { BahasaMarker } from "@/lib/types";
import styles from "./LanguageMap.module.css";

// Restrict map to Southeast Asia + Papua New Guinea for performance
const SE_ASIA_BOUNDS = new LatLngBounds(
  [-11, 92],   // Southwest: southern Indonesia/western PNG
  [28, 155]    // Northeast: northern SEA to eastern PNG
);

interface LanguageMapProps {
  markers: BahasaMarker[];
}

export function LanguageMap({ markers }: LanguageMapProps) {
  return (
    <MapContainer
      center={[5, 115]}
      zoom={4}
      minZoom={4}
      maxZoom={12}
      maxBounds={SE_ASIA_BOUNDS}
      maxBoundsViscosity={1.0}
      className={`w-full h-full ${styles.leafletContainer}`}
      zoomControl={false}
      preferCanvas={true}
    >
      <TileLayer
        attribution='&copy; <a href="https://carto.com/attributions">CARTO</a>'
        url="https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png"
      />
      <LanguageMarkers markers={markers} />
    </MapContainer>
  );
}
