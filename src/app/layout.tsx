import type { Metadata, Viewport } from "next";
import "./globals.css";
import { AnimationProvider } from "@/components/providers/animation-provider";
import { AuthProvider } from "@/components/providers/auth-provider";
import { FontSizeManager } from "@/components/providers/font-size-manager";
import { Toaster } from "@/components/ui/toaster";

export const metadata: Metadata = {
  title: "HMS Salon - Muslimah Salon Management",
  description: "Digital salon ecosystem for Muslimah salons - POS, Booking, Loyalty, Inventory, Reports",
  keywords: ["salon management", "muslimah salon", "POS", "booking system", "loyalty points"],
  appleWebApp: {
    capable: true,
    statusBarStyle: "default",
    title: "HMS Salon",
  },
  icons: {
    apple: "/icon-192x192.png",
  },
};

export const viewport: Viewport = {
  themeColor: "#2e7d32",
  width: "device-width",
  initialScale: 1,
  viewportFit: "cover",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className="antialiased font-size-medium"
      >
        <AuthProvider>
          <FontSizeManager />
          <AnimationProvider>
            {children}
            <Toaster />
          </AnimationProvider>
        </AuthProvider>
      </body>
    </html>
  );
}
