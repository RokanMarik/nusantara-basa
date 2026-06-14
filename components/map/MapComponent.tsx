'use client';

import { useState, useEffect } from 'react';
import { MapContainer, TileLayer, Marker, Popup, useMap } from 'react-leaflet';
import type { LanguageGeoData } from '@/app/api/geo/route';
import 'leaflet/dist/leaflet.css';

// Fix for default markers in react-leaflet
import L from 'leaflet';
import icon from 'leaflet/dist/images/marker-icon.png';
import iconShadow from 'leaflet/dist/images/marker-shadow.png';

let DefaultIcon = L.icon({
  iconUrl: icon.src,
  shadowUrl: iconShadow.src,
  iconSize: [25, 41],
  iconAnchor: [12, 41],
});

L.Marker.prototype.options.icon = DefaultIcon;

interface MapProps {
  languages: LanguageGeoData[];
  center?: [number, number];
  zoom?: number;
  onLanguageClick?: (language: LanguageGeoData) => void;
}

// Component to handle map bounds
function FitBounds({ languages }: { languages: LanguageGeoData[] }) {
  const map = useMap();

  useEffect(() => {
    if (languages.length > 0) {
      const bounds = L.latLngBounds(
        languages
          .filter(l => l.latitude && l.longitude)
          .map(l => [l.latitude!, l.longitude!] as [number, number])
      );
      map.fitBounds(bounds, { padding: [50, 50] });
    }
  }, [languages, map]);

  return null;
}

export default function MapComponent({ 
  languages, 
  center = [-2.5, 118], 
  zoom = 5,
  onLanguageClick 
}: MapProps) {
  const [selectedLanguage, setSelectedLanguage] = useState<LanguageGeoData | null>(null);

  const handleMarkerClick = (language: LanguageGeoData) => {
    setSelectedLanguage(language);
    onLanguageClick?.(language);
  };

  const getVitalityColor = (status: string | null) => {
    switch (status) {
      case 'Aman': return '#10b981'; // green
      case 'Rentan': return '#f59e0b'; // yellow
      case 'Mengalami Kemunduran': return '#f97316'; // orange
      case 'Sangat Terancam': return '#ef4444'; // red
      case 'Hampir Punah': return '#7f1d1d'; // dark red
      case 'Punah': return '#6b7280'; // gray
      default: return '#9ca3af'; // default gray
    }
  };

  return (
    <MapContainer
      center={center}
      zoom={zoom}
      style={{ height: '100%', width: '100%' }}
      scrollWheelZoom={true}
    >
      <TileLayer
        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
      />
      
      <FitBounds languages={languages} />

      {languages.map((language) => {
        if (!language.latitude || !language.longitude) return null;

        return (
          <Marker
            key={language.id}
            position={[language.latitude, language.longitude]}
            eventHandlers={{
              click: () => handleMarkerClick(language),
            }}
          >
            <Popup>
              <div className="p-2">
                <h3 className="font-bold text-lg mb-1">{language.nama_bahasa}</h3>
                <div className="text-sm space-y-1">
                  {language.provinsi && (
                    <p><strong>Provinsi:</strong> {language.provinsi}</p>
                  )}
                  {language.kabupaten && (
                    <p><strong>Kabupaten:</strong> {language.kabupaten}</p>
                  )}
                  {language.status_vitalitas && (
                    <p>
                      <strong>Status:</strong>{' '}
                      <span 
                        className="inline-block px-2 py-0.5 rounded text-white text-xs"
                        style={{ backgroundColor: getVitalityColor(language.status_vitalitas) }}
                      >
                        {language.status_vitalitas}
                      </span>
                    </p>
                  )}
                  {language.jumlah_penutur && (
                    <p><strong>Penutur:</strong> {language.jumlah_penutur.toLocaleString('id-ID')}</p>
                  )}
                  {language.rumpun_bahasa && (
                    <p><strong>Rumpun:</strong> {language.rumpun_bahasa}</p>
                  )}
                </div>
              </div>
            </Popup>
          </Marker>
        );
      })}
    </MapContainer>
  );
}
