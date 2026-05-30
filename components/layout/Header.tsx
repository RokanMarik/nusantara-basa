import Link from "next/link";

export function Header() {
  return (
    <header className="absolute top-0 left-0 right-0 z-[1000] px-4 py-3">
      <div className="max-w-7xl mx-auto flex items-center justify-between">
        <Link href="/" className="flex items-center gap-2 hover:opacity-80 transition-opacity">
          <div className="bg-[#12121a]/90 backdrop-blur-md rounded-lg px-3 py-1.5 border border-[#2a2a40]">
            <span className="text-sm font-bold text-[#e8e8e0]">🗺️</span>
          </div>
        </Link>
        <nav className="flex items-center gap-1 bg-[#12121a]/90 backdrop-blur-md rounded-lg px-2 py-1.5 border border-[#2a2a40]">
          <Link href="/explore/map" className="text-sm font-medium text-[#4b9cf5] px-3 py-1 rounded-md bg-[#4b9cf5]/10">Peta</Link>
          <span className="text-[#2a2a40] text-xs">|</span>
          <span className="text-sm text-[#666680] px-3 py-1">Research</span>
        </nav>
      </div>
    </header>
  );
}
