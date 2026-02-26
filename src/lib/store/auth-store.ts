import { create } from "zustand";
import { persist } from "zustand/middleware";
import type { User } from "@/types";
import { createClient } from "@/lib/supabase/client";
import { logError } from "@/lib/utils/error-logger";

interface AuthState {
  user: User | null;
  isAuthenticated: boolean;
  isLoading: boolean;
  setUser: (user: User | null) => void;
  setLoading: (loading: boolean) => void;
  checkSession: () => Promise<void>;
  logout: () => Promise<void>;
}

export const useAuthStore = create<AuthState>()(
  persist(
    (set) => ({
      user: null,
      isAuthenticated: false,
      isLoading: true,
      setUser: (user) => set({ user, isAuthenticated: !!user, isLoading: false }),
      setLoading: (isLoading) => set({ isLoading }),
      checkSession: async () => {
        try {
          const supabase = createClient();
          const sessionPromise = supabase.auth.getSession();
          const timeoutPromise = new Promise<never>((_, reject) =>
            setTimeout(() => reject(new Error('checkSession timeout')), 8000)
          );
          const { data: { session } } = await Promise.race([sessionPromise, timeoutPromise]);

          if (session?.user) {
            // Fetch profile from public.users
            const { data: profile, error: profileError } = await supabase
              .from('users')
              .select('*')
              .eq('id', session.user.id)
              .single();

            if (profileError) {
              logError('Auth Store - profile fetch', profileError);
            }

            // Role priority: public.users → user_metadata → default staff
            const role = (profile?.role as "admin" | "staff")
              || (session.user.user_metadata?.role as "admin" | "staff")
              || "staff";

            const userData: User = {
              id: session.user.id,
              email: session.user.email!,
              name: profile?.name || session.user.user_metadata?.name || session.user.email?.split('@')[0] || "User",
              role,
              phone: profile?.phone || session.user.phone || "",
              created_at: session.user.created_at,
              updated_at: profile?.updated_at || new Date().toISOString(),
              avatar_url: profile?.avatar_url || session.user.user_metadata?.avatar_url
            };
            set({ user: userData, isAuthenticated: true, isLoading: false });
          } else {
            set({ user: null, isAuthenticated: false, isLoading: false });
          }
        } catch (error) {
          if ((error as Error).message === 'checkSession timeout') {
            // Network slow — keep existing auth state, just unblock loading
            set({ isLoading: false });
          } else {
            logError('Auth Store', error);
            set({ user: null, isAuthenticated: false, isLoading: false });
          }
        }
      },
      logout: async () => {
        const supabase = createClient();
        await supabase.auth.signOut();
        set({ user: null, isAuthenticated: false });
      },
    }),
    {
      name: "hms-auth",
      partialize: (state) => ({ user: state.user, isAuthenticated: state.isAuthenticated }),
    }
  )
);

