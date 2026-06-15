import Link from "next/link";

// SVG Icons
const ArrowLeft = () => (
  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m0 0H21" />
  </svg>
);

const BookIcon = () => (
  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
  </svg>
);

const GlobeIcon = () => (
  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9" />
  </svg>
);

const RobotIcon = () => (
  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
  </svg>
);

const DatabaseIcon = () => (
  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
  </svg>
);

const CodeIcon = () => (
  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
  </svg>
);

export default function SumberDataPage() {
  const sources = [
    {
      icon: <DatabaseIcon />,
      title: "DapoBas Kemendikbud",
      desc: "Database Bahasa Indonesia - Kementerian Pendidikan dan Kebudayaan",
      detail: "Sumber data primer utama proyek ini. Berisi data 603 bahasa baru dan 107 update bahasa dari seluruh Indonesia, mencakup nama, lokasi, jumlah penutur, dan status vitalitas.",
      url: "https://dapo.kemdikbud.go.id/",
      coverage: "603 bahasa baru + 107 update",
    },
    {
      icon: <BookIcon />,
      title: "Statistik Kebahasaan 2023",
      desc: "Publikasi Badan Pengembangan dan Pembinaan Bahasa",
      detail: "Laporan statistik resmi dari Badan Bahasa Kemendikbud. Digunakan untuk menambah dan memverifikasi data 49 bahasa daerah yang belum tercatat di DapoBas.",
      url: "https://badanbahasa.kemdikbud.go.id/",
      coverage: "49 bahasa tambahan",
    },
    {
      icon: <GlobeIcon />,
      title: "Ethnologue",
      desc: "Database bahasa dunia paling komprehensif",
      detail: "Sumber data jumlah penutur, status vitalitas, dan klasifikasi EGIDS (Expanded Graded Intergenerational Disruption Scale). Digunakan untuk cross-validasi data primer.",
      url: "https://www.ethnologue.com/country/ID",
      coverage: "700+ bahasa Indonesia terdokumentasi",
    },
    {
      icon: <GlobeIcon />,
      title: "Glottolog",
      desc: "Database linguistik oleh Max Planck Institute for Evolutionary Anthropology",
      detail: "Digunakan untuk verifikasi rumpun bahasa, kode ISO 639-3, dan klasifikasi linguistik. Cross-reference untuk memastikan akurasi family tree.",
      url: "https://glottolog.org/",
      coverage: "Seluruh bahasa terdokumentasi",
    },
    {
      icon: <CodeIcon />,
      title: "ISO 639-3 Registry (SIL International)",
      desc: "Standar kode bahasa internasional",
      detail: "Digunakan sebagai basis validasi kode ISO 639-3. Saat ini 461 dari 510 kode awal terverifikasi valid (90.4%). Kode invalid dihapus untuk menjaga integritas data.",
      url: "https://iso639-3.sil.org/",
      coverage: "461 kode valid dari 998 bahasa (46.2%)",
    },
    {
      icon: <RobotIcon />,
      title: "AI Summary (9Router)",
      desc: "Ringkasan otomatis per bahasa via AI gateway",
      detail: "Menggunakan 9Router AI gateway untuk menghasilkan ringkasan informatif dari data yang tersedia. Setiap bahasa mendapat summary unik 3 paragraf.",
      url: null,
      coverage: "398 bahasa (100%)",
    },
    {
      icon: <GlobeIcon />,
      title: "Wikipedia",
      desc: "Artikel bahasa daerah Indonesia (ID & EN)",
      detail: "Digunakan untuk ekstraksi data provinsi, deskripsi bahasa, dan informasi linguistik dasar melalui Jina Reader API.",
      url: "https://id.wikipedia.org/wiki/Daftar_bahasa_di_Indonesia",
      coverage: "~50 bahasa dengan artikel lengkap",
    },
  ];

  return (
    <div className="min-h-screen bg-[#faf8f5]">
      {/* Header */}
      <header className="bg-white/90 backdrop-blur-md border-b border-earth-300/50 px-4 py-3">
        <div className="max-w-4xl mx-auto flex items-center justify-between">
          <Link href="/" className="font-black text-[#1a1209] text-sm tracking-tight hover:text-amber-700 transition-colors duration-200 cursor-pointer" aria-label="Home">
            Nusantara<span className="text-amber-700">Basa</span>
          </Link>
          <Link href="/" className="inline-flex items-center gap-1 text-sm text-earth-600 hover:text-earth-700 transition-colors duration-200 cursor-pointer" aria-label="Back to home">
            <ArrowLeft />
            Kembali
          </Link>
        </div>
      </header>

      <main className="max-w-4xl mx-auto px-4 py-8 md:py-12">
        <div className="text-center mb-8 md:mb-12">
          <span className="text-[10px] font-semibold uppercase tracking-widest text-amber-700 mb-2 block">Transparansi</span>
          <h1 className="text-3xl md:text-4xl font-black text-[#1a1209] tracking-tight">Sumber Data</h1>
          <p className="text-earth-600 mt-3 max-w-lg mx-auto">
            Data yang ditampilkan di Nusantara Basa berasal dari berbagai sumber terpercaya.
          </p>
        </div>

        <div className="space-y-4 md:space-y-6">
          {sources.map((source, i) => (
            <div key={i} className="bg-white rounded-2xl p-5 md:p-6 border border-earth-300/50 shadow-sm hover:shadow-md transition-all duration-200">
              <div className="flex items-start gap-4">
                <div className="flex-shrink-0 w-10 h-10 md:w-12 md:h-12 rounded-xl bg-amber-50 text-amber-700 flex items-center justify-center">
                  {source.icon}
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-start justify-between gap-3 flex-wrap">
                    <div>
                      <h2 className="text-lg md:text-xl font-bold text-[#1a1209]">{source.title}</h2>
                      <p className="text-sm text-earth-600 mt-0.5">{source.desc}</p>
                    </div>
                    <span className="text-[10px] font-mono px-2 py-1 bg-earth-100 text-earth-700 rounded-full whitespace-nowrap">
                      {source.coverage}
                    </span>
                  </div>
                  <p className="text-sm text-earth-600 mt-3 leading-relaxed">{source.detail}</p>
                  {source.url && (
                    <a href={source.url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-sm text-amber-700 hover:text-amber-800 mt-3 transition-colors duration-200 cursor-pointer" aria-label={`Visit ${source.title}`}>
                      Kunjungi sumber
                      <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" /></svg>
                    </a>
                  )}
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Disclaimer */}
        <div className="mt-8 md:mt-12 bg-amber-50 border border-amber-200 rounded-2xl p-5 md:p-6">
          <h3 className="font-bold text-amber-800 mb-2 flex items-center gap-2">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L4.082 16.5c-.77.833.192 2.5 1.732 2.5z" /></svg>
            Catatan
          </h3>
          <p className="text-sm text-amber-700 leading-relaxed">
            Data jumlah penutur dan status vitalitas untuk bahasa-bahasa kecil mungkin tidak akurat karena keterbatasan sumber online. Untuk data penelitian, silakan verifikasi ke sumber primer seperti Ethnologue atau Badan Bahasa Kemdikbud.
          </p>
        </div>
      </main>
    </div>
  );
}
