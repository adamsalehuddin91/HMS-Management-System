import type { MetadataRoute } from "next";

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: "HMS - Haida Muslimah Salon",
    short_name: "HMS Salon",
    description: "Sistem pengurusan salon digital untuk Haida Muslimah Salon",
    start_url: "/",
    display: "standalone",
    background_color: "#ffffff",
    theme_color: "#2e7d32",
    orientation: "portrait",
    icons: [
      {
        src: "/icon-192x192.png",
        sizes: "192x192",
        type: "image/png",
      },
      {
        src: "/icon-512x512.png",
        sizes: "512x512",
        type: "image/png",
      },
      {
        src: "/icon-512x512.png",
        sizes: "512x512",
        type: "image/png",
        purpose: "maskable",
      },
    ],
  };
}
