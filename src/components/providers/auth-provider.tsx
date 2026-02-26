"use client";

import { useEffect } from "react";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import type { User } from "@/types";

export function AuthProvider({ children }: { children: React.ReactNode }) {
    const { checkSession, setUser, setLoading } = useAuthStore();

    // Run ONCE on mount only — never re-run on navigation
    useEffect(() => {
        checkSession();

        const supabase = createClient();
        const {
            data: { subscription },
        } = supabase.auth.onAuthStateChange(async (event, session) => {
            if (session?.user) {
                // TOKEN_REFRESHED: skip re-fetching — existing user state is correct
                if (event === "TOKEN_REFRESHED") {
                    setLoading(false);
                    return;
                }

                // SIGNED_IN: fetch role from public.users (not user_metadata — may be empty)
                const { data: profile } = await supabase
                    .from("users")
                    .select("*")
                    .eq("id", session.user.id)
                    .single();

                const userData: User = {
                    id: session.user.id,
                    email: session.user.email!,
                    name: profile?.name || session.user.user_metadata.name || session.user.email?.split("@")[0] || "User",
                    role: (profile?.role as "admin" | "staff") || "staff",
                    phone: profile?.phone || session.user.phone || "",
                    created_at: session.user.created_at,
                    updated_at: profile?.updated_at || new Date().toISOString(),
                    avatar_url: profile?.avatar_url || session.user.user_metadata.avatar_url,
                };
                setUser(userData);
            } else {
                setUser(null);
            }
            setLoading(false);
        });

        return () => {
            subscription.unsubscribe();
        };
    }, []); // eslint-disable-line react-hooks/exhaustive-deps

    return <>{children}</>;
}
