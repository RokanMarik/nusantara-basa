import type { Metadata } from "next";
import { Noto_Sans, Noto_Serif } from "next/font/google";
import "leaflet/dist/leaflet.css";
import "./globals.css";

const notoSans = Noto_Sans({
  subsets: ["latin"],
  variable: "--font-noto-sans",
  weight: ["300", "400", "500", "600", "700"],
});

const notoSerif = Noto_Serif({
  subsets: ["latin"],
  variable: "--font-noto-serif",
  weight: ["400", "500", "600", "700", "800", "900"],
});

export const metadata: Metadata = {
  title: "Nusantara Basa — Peta Interaktif Bahasa Indonesia",
  description: "Jelajahi 398 bahasa daerah Indonesia melalui peta interaktif. Temukan keragaman linguistik Nusantara.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="id">
      <head>
        <link rel="preconnect" href="https://a.basemaps.cartocdn.com" crossOrigin="anonymous" />
        <link rel="preconnect" href="https://b.basemaps.cartocdn.com" crossOrigin="anonymous" />
        <link rel="preconnect" href="https://c.basemaps.cartocdn.com" crossOrigin="anonymous" />
      </head>
      <body className={`${notoSans.variable} ${notoSerif.variable} font-sans`}>
        {children}
      </body>
    </html>
  );
}
