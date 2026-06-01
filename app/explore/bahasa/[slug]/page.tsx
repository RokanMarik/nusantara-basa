        {/* Tabs */}
        <nav className="flex gap-1 mb-6 md:mb-8 bg-earth-100/50 rounded-xl p-1" aria-label="Language detail tabs">
          <Link href={`/explore/bahasa/${bahasa.id}`}
            className="flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold bg-white text-[#1a1209] shadow-sm transition-all duration-200 cursor-pointer"
            aria-current="page">
            Tentang
          </Link>
          <Link href={`/explore/bahasa/${bahasa.id}/linguistik`}
            className="flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold text-earth-600 hover:text-earth-700 transition-all duration-200 cursor-pointer">
            Linguistik
          </Link>
          <Link href={`/explore/bahasa/${bahasa.id}/kosakata`}
            className="flex-1 text-center py-2 px-3 rounded-lg text-sm font-semibold text-earth-600 hover:text-earth-700 transition-all duration-200 cursor-pointer">
            Kosakata
          </Link>
        </nav>