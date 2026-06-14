"use client";

import { useEffect, useState } from "react";
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Legend,
} from "recharts";

interface PenuturHistoris {
  tahun: number;
  jumlah_penutur: number;
  sumber_data: string;
}

interface SpeakerTrendChartProps {
  bahasaId: string;
  bahasaName: string;
}

export function SpeakerTrendChart({ bahasaId, bahasaName }: SpeakerTrendChartProps) {
  const [data, setData] = useState<PenuturHistoris[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchData() {
      try {
        const res = await fetch(`/api/bahasa/${bahasaId}/penutur-historis`);
        if (!res.ok) throw new Error("Failed to fetch data");
        const json = await res.json();
        setData(json);
      } catch (err: any) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, [bahasaId]);

  if (loading) {
    return (
      <div className="h-64 flex items-center justify-center">
        <div className="animate-pulse text-gray-500">Memuat data historis...</div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="h-64 flex items-center justify-center">
        <div className="text-red-500">Error: {error}</div>
      </div>
    );
  }

  if (data.length === 0) {
    return (
      <div className="h-64 flex items-center justify-center">
        <div className="text-gray-500 text-center">
          <p className="font-medium">Belum ada data historis</p>
          <p className="text-sm mt-1">Data tren jumlah penutur belum tersedia untuk bahasa ini</p>
        </div>
      </div>
    );
  }

  // Format data for chart
  const chartData = data.map((d) => ({
    tahun: d.tahun,
    penutur: d.jumlah_penutur,
    sumber: d.sumber_data,
    label: `${d.tahun}`,
  }));

  // Calculate trend
  const firstYear = data[0];
  const lastYear = data[data.length - 1];
  const changePercent = ((lastYear.jumlah_penutur - firstYear.jumlah_penutur) / firstYear.jumlah_penutur) * 100;
  const trend = changePercent > 0 ? "naik" : changePercent < 0 ? "turun" : "stabil";
  const trendColor = trend === "naik" ? "text-green-600" : trend === "turun" ? "text-red-600" : "text-gray-600";

  return (
    <div className="space-y-4">
      {/* Summary Stats */}
      <div className="grid grid-cols-3 gap-4">
        <div className="text-center">
          <div className="text-2xl font-bold text-gray-900">
            {firstYear.tahun}
          </div>
          <div className="text-sm text-gray-500">Tahun Awal</div>
          <div className="text-xs text-gray-400">
            {firstYear.jumlah_penutur.toLocaleString("id-ID")}
          </div>
        </div>
        <div className="text-center">
          <div className={`text-2xl font-bold ${trendColor}`}>
            {changePercent > 0 ? "+" : ""}{changePercent.toFixed(1)}%
          </div>
          <div className="text-sm text-gray-500">Perubahan</div>
          <div className={`text-xs ${trendColor}`}>
            Tren {trend}
          </div>
        </div>
        <div className="text-center">
          <div className="text-2xl font-bold text-gray-900">
            {lastYear.tahun}
          </div>
          <div className="text-sm text-gray-500">Tahun Akhir</div>
          <div className="text-xs text-gray-400">
            {lastYear.jumlah_penutur.toLocaleString("id-ID")}
          </div>
        </div>
      </div>

      {/* Chart */}
      <ResponsiveContainer width="100%" height={300}>
        <LineChart data={chartData}>
          <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
          <XAxis
            dataKey="tahun"
            tick={{ fontSize: 12 }}
            label={{ value: "Tahun", position: "insideBottom", offset: -5, fontSize: 12 }}
          />
          <YAxis
            tick={{ fontSize: 12 }}
            tickFormatter={(value) => {
              if (value >= 1000000) return `${(value / 1000000).toFixed(0)}M`;
              if (value >= 1000) return `${(value / 1000).toFixed(0)}K`;
              return value.toString();
            }}
            label={{ value: "Jumlah Penutur", angle: -90, position: "insideLeft", fontSize: 12 }}
          />
          <Tooltip
            contentStyle={{
              backgroundColor: "white",
              border: "1px solid #e5e7eb",
              borderRadius: "8px",
            }}
            formatter={(value: any) => [
              value.toLocaleString("id-ID") + " orang",
              "Jumlah Penutur",
            ]}
            labelFormatter={(label) => `Tahun ${label}`}
          />
          <Legend />
          <Line
            type="monotone"
            dataKey="penutur"
            stroke="#2563eb"
            strokeWidth={2}
            dot={{ fill: "#2563eb", r: 5 }}
            activeDot={{ r: 7 }}
            name="Jumlah Penutur"
          />
        </LineChart>
      </ResponsiveContainer>

      {/* Data Sources */}
      <div className="text-xs text-gray-500 border-t pt-3">
        <p className="font-medium mb-1">Sumber Data:</p>
        <ul className="space-y-0.5">
          {data.map((d, i) => (
            <li key={i}>
              {d.tahun}: {d.sumber_data}
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}
