"use client";

import { useEffect } from "react";
import { MapContainer, TileLayer } from "react-leaflet";
import { LatLngBounds } from "leaflet";
import { LanguageMarkers } from "./LanguageMarkers";
import type { BahasaMarker } from "@/lib/types";
import styles from "./LanguageMap.module.css";

// Restrict map to Indonesia territory only for better focus
const INDONESIA_BOUNDS = new LatLngBounds(
  [-11, 95],   // Southwest: Aceh/southern Indonesia
  [6, 141]     // Northeast: Papua/northern Indonesia
);

interface LanguageMapProps {
  markers: BahasaMarker[];
}

export function LanguageMap({ markers }: LanguageMapProps) {
  // Load Leaflet CSS dynamically to avoid render-blocking
  useEffect(() => {
    const link = document.createElement('link');
    link.rel = 'stylesheet';
    link.href = 'https://unpkg.com/leaflet@1.9.4/dist/leaflet.css';
    document.head.appendChild(link);
    
    return () => {
      if (link.parentNode) {
        link.parentNode.removeChild(link);
      }
    };
  }, []);

  return (
    <MapContainer
      center={[-2.5, 118]}
      zoom={5}
      minZoom={4}
      maxZoom={12}
      maxBounds={INDONESIA_BOUNDS}
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
