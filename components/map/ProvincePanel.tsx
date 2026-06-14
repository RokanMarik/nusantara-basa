"use client";

import { useEffect, useState } from "react";
import { ResponsiveContainer, PieChart, Pie, Cell, Tooltip } from "recharts";

interface ProvinceStats {
  provinsi: string;
  total_bahasa: number;
  aman: number;
  rentan: number;
  terancam: number;
  punah: number;
  total_penutur: number;
  avg_vitality_score: number;
}

const COLORS = {
  Aman: "#10b981",
  Rentan: "#f59e0b",
  Terancam: "#ef4444",
  Punah: "#6b7280",
};

export function ProvincePanel() {
  const [provinces, setProvinces] = useState<ProvinceStats[]>([]);
  const [loading, setLoading] = useState(true);
  const [selected, setSelected] = useState<ProvinceStats | null>(null);

  useEffect(() => {
    fetch("/api/stats/provinces")
      .then((r) => r.json())
      .then((data) => {
        setProvinces(data);
        if (data.length > 0) setSelected(data[0]);
      })
      .finally(() => setLoading(false));
  }, []);

  if (loading) {
    return (
      <div className="bg-white rounded-lg shadow-lg p-4 w-80">
        <div className="animate-pulse space-y-2">
          <div className="h-4 bg-gray-200 rounded"></div>
          <div className="h-8 bg-gray-200 rounded"></div>
        </div>
      </div>
    );
  }

  if (selected) {
    const pieData = [
      { name: "Aman", value: selected.aman },
      { name: "Rentan", value: selected.rentan },
      { name: "Terancam", value: selected.terancam },
      { name: "Punah", value: selected.punah },
    ].filter((d) => d.value > 0);

    return (
      <div className="bg-white rounded-lg shadow-lg p-4 w-80 max-h-96 overflow-y-auto">
        <div className="flex items-center justify-between mb-3">
          <h3 className="font-semibold text-lg text-gray-900">
            {selected.provinsi}
          </h3>
          <button
            onClick={() => setSelected(null)}
            className="text-gray-400 hover:text-gray-600 text-sm"
          >
            ← List
          </button>
        </div>

        <div className="space-y-2 mb-4">
          <div className="flex justify-between text-sm">
            <span className="text-gray-600">Total Bahasa</span>
            <span className="font-semibold">{selected.total_bahasa}</span>
          </div>
          <div className="flex justify-between text-sm">
            <span className="text-gray-600">Total Penutur</span>
            <span className="font-semibold">
              {selected.total_penutur.toLocaleString("id-ID")}
            </span>
          </div>
          <div className="flex justify-between text-sm">
            <span className="text-gray-600">Skor Vitalitas</span>
            <span
              className="font-semibold"
              style={{
                color:
                  selected.avg_vitality_score >= 70
                    ? "#10b981"
                    : selected.avg_vitality_score >= 40
                    ? "#f59e0b"
                    : "#ef4444",
              }}
            >
              {selected.avg_vitality_score}/100
            </span>
          </div>
        </div>

        {pieData.length > 0 && (
          <div className="border-t pt-3">
            <h4 className="text-sm font-medium text-gray-700 mb-2">
              Distribusi Status
            </h4>
            <ResponsiveContainer width="100%" height={180}>
              <PieChart>
                <Pie
                  data={pieData}
                  cx="50%"
                  cy="50%"
                  labelLine={false}
                  label={(entry) => `${entry.name}: ${entry.value}`}
                  outerRadius={60}
                  fill="#8884d8"
                  dataKey="value"
                >
                  {pieData.map((entry, index) => (
                    <Cell
                      key={`cell-${index}`}
                      fill={COLORS[entry.name as keyof typeof COLORS]}
                    />
                  ))}
                </Pie>
                <Tooltip />
              </PieChart>
            </ResponsiveContainer>
          </div>
        )}
      </div>
    );
  }

  return (
    <div className="bg-white rounded-lg shadow-lg p-4 w-80 max-h-96 overflow-y-auto">
      <h3 className="font-semibold text-lg text-gray-900 mb-3">
        Statistik per Provinsi
      </h3>
      <div className="space-y-1">
        {provinces.slice(0, 20).map((p) => (
          <button
            key={p.provinsi}
            onClick={() => setSelected(p)}
            className="w-full text-left px-3 py-2 rounded hover:bg-gray-50 transition-colors"
          >
            <div className="flex justify-between items-center">
              <span className="text-sm font-medium text-gray-900">
                {p.provinsi}
              </span>
              <span className="text-xs text-gray-500">
                {p.total_bahasa} bahasa
              </span>
            </div>
            <div className="flex items-center gap-2 mt-1">
              <div
                className="h-1.5 flex-1 rounded-full bg-gray-200"
                style={{
                  background: `linear-gradient(to right, #10b981 0%, #10b981 ${
                    (p.aman / p.total_bahasa) * 100
                  }%, #f59e0b ${
                    (p.aman / p.total_bahasa) * 100
                  }%, #f59e0b ${
                    ((p.aman + p.rentan) / p.total_bahasa) * 100
                  }%, #ef4444 ${
                    ((p.aman + p.rentan) / p.total_bahasa) * 100
                  }%, #ef4444 ${
                    ((p.aman + p.rentan + p.terancam) / p.total_bahasa) * 100
                  }%, #6b7280 ${
                    ((p.aman + p.rentan + p.terancam) / p.total_bahasa) * 100
                  }%, #6b7280 100%)`,
                }}
              ></div>
              <span className="text-xs font-mono text-gray-600 w-8">
                {p.avg_vitality_score}
              </span>
            </div>
          </button>
        ))}
      </div>
      {provinces.length > 20 && (
        <p className="text-xs text-gray-500 text-center mt-2">
          + {provinces.length - 20} provinsi lainnya
        </p>
      )}
    </div>
  );
}
