/** @type {import('next').NextConfig} */
const nextConfig = {
  // Target modern browsers to reduce bundle size
  swcMinify: true,
  
  // Optimize package imports - only import what's needed
  experimental: {
    optimizePackageImports: ['lucide-react', 'recharts', '@radix-ui/react-slot'],
  },
  
  // Image optimization
  images: {
    formats: ['image/avif', 'image/webp'],
  },
  
  // Compiler optimizations
  compiler: {
    removeConsole: process.env.NODE_ENV === 'production' ? {
      exclude: ['error', 'warn'],
    } : false,
  },
};

export default nextConfig;
