"use client";

import { MapContainer, TileLayer } from "react-leaflet";
import { LatLngBounds } from "leaflet";
import { LanguageMarkers } from "./LanguageMarkers";
import type { BahasaMarker } from "@/lib/types";
import styles from "./LanguageMap.module.css";

// Restrict map viewport to Southeast Asia + Papua New Guinea for performance
const SE_ASIA_PNG_BOUNDS = new LatLngBounds(
  [-12, 90],   // Southwest corner
  [10, 155]    // Northeast corner
);

interface LanguageMapProps {
  markers: BahasaMarker[];
  center?: [number, number];
  zoom?: number;
}

export function LanguageMap({ markers, center = [-2.5, 118.0], zoom = 5 }: LanguageMapProps) {
  return (
    <MapContainer
      center={center}
      zoom={zoom}
      className={`w-full h-full ${styles.leafletContainer}`}
      zoomControl={false}
      // Performance optimizations
      preferCanvas={true}
      // Restrict viewport to Southeast Asia + Papua New Guinea
      bounds={SE_ASIA_PNG_BOUNDS}
      maxBounds={SE_ASIA_PNG_BOUNDS}
      maxBoundsViscosity={1.0}
    >
      <TileLayer
        attribution='&copy; <a href="https://carto.com/">CARTO</a>'
        url="https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png"
        // Tile loading optimizations
        maxZoom={18}
        minZoom={3}
        tileSize={256}
        zoomOffset={0}
      />
      <LanguageMarkers markers={markers} />
    </MapContainer>
  );
}
