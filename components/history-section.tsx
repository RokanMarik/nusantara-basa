"use client";

import { useEffect, useState } from "react";

interface HistorySectionProps {
  bahasaId: string;
}

interface HistoricalEvent {
  id: string;
  tahunMulai: number | null;
  tahunSelesai: number | null;
  jenisPeristiwa: string;
  eraHistoris: string | null;
  dampakPadaBahasa: string | null;
  wilayahTerdampak: string | null;
  sumberSejarah: string | null;
}

interface LanguageInfluence {
  id: string;
  bahasaAsal: string;
  periodePengaruh: string | null;
  jenisPengaruh: string | null;
  contohKosakata: Array<{ kata: string; arti: string; periode: number }>;
  estimasiSerapan: number | null;
  jalurMasuk: string | null;
}

interface HistoricalSpeaker {
  id: string;
  tahunSensus: number;
  jumlahPenutur: number;
  metodePencacahan: string | null;
  sumberData: string | null;
}

interface NameHistory {
  id: string;
  namaLama: string;
  periodeDigunakan: string | null;
  digunakanOleh: string | null;
  aksaraAsli: string | null;
  alasanPerubahan: string | null;
}

export default function HistorySection({ bahasaId }: HistorySectionProps) {
  const [events, setEvents] = useState<HistoricalEvent[]>([]);
  const [influences, setInfluences] = useState<LanguageInfluence[]>([]);
  const [speakers, setSpeakers] = useState<HistoricalSpeaker[]>([]);
  const [nameHistory, setNameHistory] = useState<NameHistory[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchHistory() {
      try {
        setLoading(true);
        
        // Fetch all historical data in parallel
        const [eventsRes, influencesRes, speakersRes, languageRes] = await Promise.all([
          fetch(`/api/peristiwa-sejarah?bahasa_id=${bahasaId}&limit=10`),
          fetch(`/api/pengaruh-bahasa?bahasa_id=${bahasaId}&limit=10`),
          fetch(`/api/penutur-historis?bahasa_id=${bahasaId}&limit=20`),
          fetch(`/api/bahasa/${bahasaId}`)
        ]);

        if (!eventsRes.ok || !influencesRes.ok || !speakersRes.ok) {
          throw new Error("Failed to fetch historical data");
        }

        const [eventsData, influencesData, speakersData, languageData] = await Promise.all([
          eventsRes.json(),
          influencesRes.json(),
          speakersRes.json(),
          languageRes.json()
        ]);

        setEvents(eventsData);
        setInfluences(influencesData);
        setSpeakers(speakersData);
        setNameHistory(languageData.riwayatNama || []);
      } catch (err) {
        console.error("Error fetching historical data:", err);
        setError(err instanceof Error ? err.message : "An error occurred");
      } finally {
        setLoading(false);
      }
    }

    if (bahasaId) {
      fetchHistory();
    }
  }, [bahasaId]);

  if (loading) {
    return (
      <section className="py-8" aria-labelledby="history-heading">
        <div className="animate-pulse space-y-4">
          <div className="h-6 bg-gray-200 rounded w-1/3"></div>
          <div className="h-4 bg-gray-200 rounded w-full"></div>
          <div className="h-4 bg-gray-200 rounded w-2/3"></div>
        </div>
      </section>
    );
  }

  if (error) {
    return (
      <section className="py-8" aria-labelledby="history-heading">
        <div className="bg-red-50 border-l-4 border-red-500 p-4">
          <p className="text-red-700">Error loading historical data: {error}</p>
        </div>
      </section>
    );
  }

  const hasNoData = 
    events.length === 0 && 
    influences.length === 0 && 
    speakers.length === 0 && 
    nameHistory.length === 0;

  if (hasNoData) {
    return (
      <section className="py-8" aria-labelledby="history-heading">
        <div className="bg-gray-50 border-l-4 border-yellow-500 p-4">
          <p className="text-gray-600">Belum ada data historis untuk bahasa ini.</p>
        </div>
      </section>
    );
  }

  return (
    <section className="py-8 border-t border-earth-300/50" aria-labelledby="history-heading">
      <h2 id="history-heading" className="text-2xl md:text-3xl font-bold mb-6 text-earth-900">
        📜 Sejarah & Evolusi Bahasa
      </h2>

      {/* Timeline of Historical Events */}
      {events.length > 0 && (
        <article className="mb-8" aria-labelledby="events-heading">
          <h3 id="events-heading" className="text-xl font-semibold mb-4 flex items-center gap-2">
            <span className="text-earth-600">⏳</span> Peristiwa Sejarah
          </h3>
          <ol className="space-y-4 relative border-l-2 border-earth-300 ml-3">
            {events.map((event, index) => (
              <li key={event.id} className="mb-6 pl-6 relative">
                <div className="absolute -left-[29px] top-1 w-4 h-4 bg-earth-500 rounded-full"></div>
                <div className="bg-white p-4 rounded-lg shadow-sm border border-earth-200">
                  <div className="flex flex-wrap items-center gap-2 mb-2">
                    <span className="font-bold text-lg">
                      {event.tahunMulai} - {event.tahunSelesai ?? "Sekarang"}
                    </span>
                    {event.eraHistoris && (
                      <span className="inline-block px-2 py-1 bg-earth-100 text-earth-800 text-xs rounded-full">
                        {event.eraHistoris}
                      </span>
                    )}
                  </div>
                  <p className="font-medium text-earth-900">{event.jenisPeristiwa}</p>
                  
                  {event.dampakPadaBahasa && (
                    <p className="text-gray-700 mt-2">
                      <strong>Dampak:</strong> {event.dampakPadaBahasa}
                    </p>
                  )}
                  
                  {event.wilayahTerdampak && (
                    <p className="text-gray-700 mt-1">
                      <strong>Wilayah:</strong> {event.wilayahTerdampak}
                    </p>
                  )}
                  
                  {event.sumberSejarah && (
                    <p className="text-gray-600 text-sm mt-2 italic">
                      Sumber: {event.sumberSejarah}
                    </p>
                  )}
                </div>
              </li>
            ))}
          </ol>
        </article>
      )}

      {/* Language Influences */}
      {influences.length > 0 && (
        <article className="mb-8" aria-labelledby="influences-heading">
          <h3 id="influences-heading" className="text-xl font-semibold mb-4 flex items-center gap-2">
            <span className="text-earth-600">🌐</span> Pengaruh Bahasa Lain
          </h3>
          <div className="grid md:grid-cols-2 gap-4">
            {influences.map((influence) => (
              <div key={influence.id} className="bg-white p-4 rounded-lg shadow-sm border border-earth-200">
                <div className="flex justify-between items-start mb-2">
                  <h4 className="font-semibold text-earth-900">{influence.bahasaAsal}</h4>
                  {influence.periodePengaruh && (
                    <span className="text-xs text-gray-600">{influence.periodePengaruh}</span>
                  )}
                </div>
                
                {influence.jenisPengaruh && (
                  <p className="text-gray-700 text-sm mb-2">Jenis: {influence.jenisPengaruh}</p>
                )}
                
                {influence.estimasiSerapan && (
                  <p className="text-gray-700 text-sm">
                    Estimasi kosakata serapan: {influence.estimasiSerapan}%
                  </p>
                )}
                
                {influence.jalurMasuk && (
                  <p className="text-gray-600 text-sm mt-2 italic">
                    Masuk melalui: {influence.jalurMasuk}
                  </p>
                )}
                
                {influence.contohKosakata?.length > 0 && (
                  <div className="mt-3 pt-3 border-t border-earth-200">
                    <p className="text-xs font-medium text-gray-700 mb-2">Contoh kosakata:</p>
                    <ul className="list-disc list-inside space-y-1">
                      {influence.contohKosakata.slice(0, 5).map((contoh, i) => (
                        <li key={i} className="text-sm">
                          <strong>{contoh.kata}</strong> → {contoh.arti}
                        </li>
                      ))}
                      {influence.contohKosakata.length > 5 && (
                        <li className="text-sm text-gray-500">
                          ... dan {influence.contohKosakata.length - 5} lagi
                        </li>
                      )}
                    </ul>
                  </div>
                )}
              </div>
            ))}
          </div>
        </article>
      )}

      {/* Historical Speaker Count Evolution */}
      {speakers.length > 0 && (
        <article className="mb-8" aria-labelledby="speakers-heading">
          <h3 id="speakers-heading" className="text-xl font-semibold mb-4 flex items-center gap-2">
            <span className="text-earth-600">👥</span> Perkembangan Jumlah Penutur
          </h3>
          <div className="overflow-x-auto">
            <table className="w-full min-w-[600px] bg-white rounded-lg shadow-sm border border-earth-200">
              <thead>
                <tr className="bg-earth-50">
                  <th className="px-4 py-3 text-left font-semibold text-earth-900">Tahun Sensus</th>
                  <th className="px-4 py-3 text-left font-semibold text-earth-900">Jumlah Penutur</th>
                  <th className="px-4 py-3 text-left font-semibold text-earth-900">Metode Pencacahan</th>
                  <th className="px-4 py-3 text-left font-semibold text-earth-900">Sumber Data</th>
                </tr>
              </thead>
              <tbody>
                {speakers.map((speaker) => (
                  <tr key={speaker.id} className="border-t border-earth-200 hover:bg-earth-50/50">
                    <td className="px-4 py-3">{speaker.tahunSensus}</td>
                    <td className="px-4 py-3 font-medium">
                      {speaker.jumlahPenutur.toLocaleString('id-ID')}
                    </td>
                    <td className="px-4 py-3 text-sm text-gray-600">
                      {speaker.metodePencacahan ?? '-'}
                    </td>
                    <td className="px-4 py-3 text-sm text-gray-600">
                      {speaker.sumberData ?? '-'}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          
          {/* Trend indicator */}
          {speakers.length >= 2 && (
            <div className="mt-4 text-sm text-gray-600">
              Tren penutur:{" "}
              <span className={speakers[speakers.length - 1].jumlahPenutur >= speakers[0].jumlahPenutur 
                ? "text-green-600 font-medium" 
                : "text-red-600 font-medium"}>
                {speakers[speakers.length - 1].jumlahPenutur >= speakers[0].jumlahPenutur 
                  ? "Meningkat ⬆️" 
                  : "Menurun ⬇️"}
              </span>
            </div>
          )}
        </article>
      )}

      {/* Name Changes Over Time */}
      {nameHistory.length > 0 && (
        <article aria-labelledby="name-history-heading">
          <h3 id="name-history-heading" className="text-xl font-semibold mb-4 flex items-center gap-2">
            <span className="text-earth-600">📝</span> Riwayat Nama
          </h3>
          <div className="grid md:grid-cols-2 gap-4">
            {nameHistory.map((history) => (
              <div key={history.id} className="bg-white p-4 rounded-lg shadow-sm border border-earth-200">
                <h4 className="font-semibold text-earth-900 mb-2">{history.namaLama}</h4>
                
                {history.periodeDigunakan && (
                  <p className="text-sm text-gray-600 mb-2">
                    Digunakan: {history.periodeDigunakan}
                  </p>
                )}
                
                {history.digunakanOleh && (
                  <p className="text-sm text-gray-700">
                    <strong>Digunakan oleh:</strong> {history.digunakanOleh}
                  </p>
                )}
                
                {history.aksaraAsli && (
                  <p className="text-sm text-gray-700 mt-2">
                    <strong>Aksara asli:</strong> {history.aksaraAsli}
                  </p>
                )}
                
                {history.alasanPerubahan && (
                  <p className="text-sm text-gray-600 mt-3 italic">
                    Alasan perubahan: {history.alasanPerubahan}
                  </p>
                )}
              </div>
            ))}
          </div>
        </article>
      )}
    </section>
  );
}
