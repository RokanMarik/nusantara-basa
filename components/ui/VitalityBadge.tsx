import { VITALITAS_COLORS } from "@/lib/types";

interface VitalityBadgeProps {
  status: string | null;
  size?: "sm" | "md";
}

export function VitalityBadge({ status, size = "sm" }: VitalityBadgeProps) {
  if (!status) return null;
  const color = VITALITAS_COLORS[status] ?? "#666680";
  const sizeClasses = size === "sm" ? "text-[10px] px-2 py-0.5" : "text-xs px-3 py-1";
  return (
    <span className={`inline-flex items-center gap-1.5 rounded-full font-medium text-[#0a0a0f] ${sizeClasses}`} style={{ backgroundColor: color }}>
      <span className="w-1.5 h-1.5 rounded-full bg-[#0a0a0f]/40" />
      {status.charAt(0).toUpperCase() + status.slice(1)}
    </span>
  );
}
