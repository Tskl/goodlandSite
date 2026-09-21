import type { NextConfig } from 'next'

const nextConfig: NextConfig = {
  images: {
    formats: ['image/webp'],
    deviceSizes: [360, 640, 828, 1080, 1200, 1600],
  },
}

export default nextConfig
