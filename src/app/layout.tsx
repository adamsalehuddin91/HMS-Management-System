import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import { AnimationProvider } from "@/components/providers/animation-provider";
import { AuthProvider } from "@/components/providers/auth-provider";
import { FontSizeManager } from "@/components/providers/font-size-manager";
import { Toaster } from "@/components/ui/toaster";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

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

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <head>
        <meta name="theme-color" content="#2e7d32" />
        <meta name="mobile-web-app-capable" content="yes" />
      </head>
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased font-size-medium`}
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
