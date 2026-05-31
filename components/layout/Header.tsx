import Link from "next/link";

// SVG Icons
const MapIcon = () => (
  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" />
  </svg>
);

export function Header() {
  return (
    <header className="absolute top-3 left-3 right-3 md:top-4 md:left-4 md:right-4 z-[1000]" role="banner">
      <div className="max-w-4xl mx-auto bg-white/90 backdrop-blur-md rounded-2xl shadow-sm border border-earth-300/50 p-3">
        <div className="flex items-center justify-between">
          <Link href="/" className="font-black text-[#1a1209] text-sm tracking-tight hover:text-amber-700 transition-colors duration-200 cursor-pointer flex items-center gap-2" aria-label="Nusantara Basa Home">
            <MapIcon />
            Nusantara<span className="text-amber-700">Basa</span>
          </Link>
          <nav className="flex items-center gap-3" aria-label="Map navigation">
            <span className="text-xs text-earth-600 hidden sm:inline">Research <span className="text-earth-400">(soon)</span></span>
          </nav>
        </div>
      </div>
    </header>
  );
}
