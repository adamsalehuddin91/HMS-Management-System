"use client";

import { useEffect } from "react";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";

export function AuthProvider({ children }: { children: React.ReactNode }) {
    const { checkSession, setUser, setLoading } = useAuthStore();

    useEffect(() => {
        // Initial session load — fetches role from public.users (correct)
        checkSession();

        const supabase = createClient();
        const {
            data: { subscription },
        } = supabase.auth.onAuthStateChange(async (event, session) => {
            if (event === "TOKEN_REFRESHED") {
                // Silent token refresh — do NOT touch user state, role stays correct
                return;
            }

            if (session?.user) {
                // SIGNED_IN / INITIAL_SESSION: reuse checkSession which reads role from public.users
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
