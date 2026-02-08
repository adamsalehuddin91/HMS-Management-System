"use client";

import { useEffect } from "react";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { useRouter, usePathname } from "next/navigation";
import type { User } from "@/types";

export function AuthProvider({ children }: { children: React.ReactNode }) {
    const { checkSession, setUser, setLoading } = useAuthStore();
    const router = useRouter();
    const pathname = usePathname();

    useEffect(() => {
        const initAuth = async () => {
            await checkSession();
        };

        initAuth();

        const supabase = createClient();
        const {
            data: { subscription },
        } = supabase.auth.onAuthStateChange(async (event, session) => {
            if (session?.user) {
                const userData: User = {
                    id: session.user.id,
                    email: session.user.email!,
                    name: session.user.user_metadata.name || session.user.email?.split('@')[0] || "User",
                    role: (session.user.user_metadata.role as "admin" | "staff") || "staff",
                    phone: session.user.phone || "",
                    created_at: session.user.created_at,
                    updated_at: session.user.updated_at || new Date().toISOString(),
                    avatar_url: session.user.user_metadata.avatar_url
                };
                setUser(userData);
            } else {
                // If we are on a protected route and lose session, redirect to login
                // But dashboard layout handles this, so we just update store here.
                // except we need to be careful about not clearing user if checkSession is in progress? 
                // No, onAuthStateChange is authoritative.
                setUser(null);
            }
            setLoading(false);
        });

        return () => {
            subscription.unsubscribe();
        };
    }, [checkSession, setUser, setLoading, router, pathname]);

    return <>{children}</>;
}
