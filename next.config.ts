import type { NextConfig } from 'next'

const nextConfig: NextConfig = {
  images: {
    formats: ['image/webp'],
    deviceSizes: [360, 640, 828, 1080, 1200, 1600],
    // Εικόνες που ανεβαίνουν από το admin (Vercel Blob, public store).
    remotePatterns: [{ protocol: 'https', hostname: '*.public.blob.vercel-storage.com' }],
  },
}

export default nextConfig
