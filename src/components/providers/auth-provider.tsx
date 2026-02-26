"use client";

import { useEffect } from "react";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";

export function AuthProvider({ children }: { children: React.ReactNode }) {
    const { checkSession, setUser, setLoading } = useAuthStore();

    useEffect(() => {
        // On mount: fetch user + role from public.users
        checkSession();

        const supabase = createClient();
        const {
            data: { subscription },
        } = supabase.auth.onAuthStateChange(async (event, session) => {
            if (event === "INITIAL_SESSION") {
                // Already handled by checkSession() above — skip to avoid race condition
                return;
            }

            if (event === "TOKEN_REFRESHED") {
                // Silent token refresh — role unchanged, do NOT touch user state
                return;
            }

            if (session?.user) {
                // SIGNED_IN: user just logged in — fetch correct role from public.users
                await checkSession();
            } else {
                // SIGNED_OUT
                setUser(null);
                setLoading(false);
            }
        });

        return () => {
            subscription.unsubscribe();
        };
    }, []); // eslint-disable-line react-hooks/exhaustive-deps

    return <>{children}</>;
}
