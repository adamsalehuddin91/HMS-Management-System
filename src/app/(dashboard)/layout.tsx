"use client";

import { useEffect, useState, useRef } from "react";
import { useRouter } from "next/navigation";
import { Sidebar } from "@/components/layout/sidebar";
import { useAuthStore } from "@/lib/store/auth-store";

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const router = useRouter();
  const { user, isAuthenticated, isLoading } = useAuthStore();
  const [isHydrated, setIsHydrated] = useState(false);

  // ── Stable user snapshot: capture once on first confirmed load ────────────
  // This prevents Supabase token refresh from flickering the sidebar role.
  const stableUserRef = useRef<typeof user | null>(null);
  const [stableUser, setStableUser] = useState<typeof user | null>(null);

  useEffect(() => {
    if (user && !stableUserRef.current) {
      stableUserRef.current = user;
      setStableUser(user);
    }
  }, [user]);

  // Wait for hydration
  useEffect(() => {
    setIsHydrated(true);
  }, []);

  // Client-side fallback guard (server middleware is primary protection)
  useEffect(() => {
    if (isHydrated && !isLoading && !isAuthenticated) {
      router.replace("/login");
    }
  }, [isHydrated, isLoading, isAuthenticated, router]);

  // Show loading during initial hydration or auth check
  if (!isHydrated || isLoading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin h-8 w-8 border-4 border-[var(--primary)] border-t-transparent rounded-full" />
      </div>
    );
  }

  // Client-side fallback - middleware handles this server-side
  if (!isAuthenticated || !stableUser) {
    return null;
  }

  return (
    <div className="min-h-screen bg-[var(--background)]">
      {/* Pass stable snapshot — never flickers on token refresh */}
      <Sidebar user={stableUser} />
      <main className="md:ml-64 min-h-screen transition-all duration-300">{children}</main>
    </div>
  );
}
