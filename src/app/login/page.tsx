"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Leaf, Mail, Lock, Eye, EyeOff } from "lucide-react";
import { Button, Input, Card, CardContent } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";

export default function LoginPage() {
  const router = useRouter();
  const { setUser } = useAuthStore();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);
  // const [error, setError] = useState(""); // Removed error state

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    // setError(""); // Removed setError
    setLoading(true);

    try {
      const supabase = createClient();

      // Determine if input is email or username
      // If no '@' symbol, assume username and append dummy domain
      const finalEmail = email.includes('@') ? email : `${email.toLowerCase().replace(/\s+/g, '')}@hms.local`;

      const { data, error: authError } = await supabase.auth.signInWithPassword({
        email: finalEmail,
        password,
      });

      if (authError) {
        toast.error(authError.message); // Use toast for error
        return; // Stop execution
      }

      if (data.user) {
        // Update store
        const userData = {
          id: data.user.id,
          email: data.user.email!,
          name: data.user.user_metadata.name || data.user.email!.split('@')[0],
          role: (data.user.user_metadata.role as "admin" | "staff") || "staff",
          phone: data.user.phone || "",
          created_at: data.user.created_at,
          updated_at: data.user.updated_at || new Date().toISOString(),
          avatar_url: data.user.user_metadata.avatar_url
        };

        setUser(userData);
        toast.success("Login successful! Redirecting..."); // Use toast for success
        router.push("/dashboard");
      }
    } catch (err: any) {
      console.error("Login failed:", err);
      toast.error(err.message || "Invalid email or password"); // Use toast for catch-all errors
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-[var(--background)] flex flex-col items-center justify-center p-4">
      {/* Logo */}
      <div className="mb-8 text-center">
        <div className="mx-auto h-16 w-16 rounded-full bg-white shadow-sm flex items-center justify-center mb-4">
          <Leaf className="h-10 w-10 text-[var(--primary)]" />
        </div>
        <h1 className="text-2xl font-bold">HMS Salon</h1>
        <p className="text-[var(--muted)]">Muslimah Salon Management</p>
      </div>

      {/* Login Card */}
      <Card className="w-full max-w-md">
        <CardContent className="p-8">
          <div className="text-center mb-8">
            <h2 className="text-2xl font-bold">Welcome Back</h2>
            <p className="text-[var(--muted)] mt-1">Manage your salon with peace and grace.</p>
          </div>

          <form onSubmit={handleLogin} className="space-y-5">
            <div>
              <label className="block text-sm font-medium mb-2">Username or Email</label>
              <Input
                type="text"
                placeholder="Enter your username or email"
                icon={<Mail className="h-5 w-5" />}
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />
            </div>

            <div>
              <div className="flex items-center justify-between mb-2">
                <label className="block text-sm font-medium">Password</label>
                <button type="button" className="text-sm text-[var(--primary)] hover:underline opacity-50 cursor-not-allowed" disabled title="Akan datang">
                  Forgot password?
                </button>
              </div>
              <div className="relative">
                <div className="relative">
                  <Input
                    type={showPassword ? "text" : "password"}
                    placeholder="••••••••"
                    icon={<Lock className="h-5 w-5" />}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    required
                  />
                  <button
                    type="button"
                    className="absolute right-3 top-1/2 -translate-y-1/2 z-10 p-2 text-[var(--muted)] hover:text-[var(--foreground)]"
                    onClick={() => setShowPassword(!showPassword)}
                  >
                    {showPassword ? <EyeOff className="h-5 w-5" /> : <Eye className="h-5 w-5" />}
                  </button>
                </div>
              </div>
            </div>

            <div className="flex items-center gap-2">
              <input type="checkbox" id="remember" className="rounded border-[var(--border)]" />
              <label htmlFor="remember" className="text-sm text-[var(--muted)]">
                Keep me logged in
              </label>
            </div>



            <Button type="submit" className="w-full" size="lg" loading={loading}>
              Login to Dashboard
            </Button>
          </form>

          <div className="mt-6 pt-6 border-t border-[var(--border)] text-center">
            <p className="text-sm text-[var(--muted)]">
              Need help? <span className="font-medium text-[var(--foreground)]">Contact Admin Support</span>
            </p>
          </div>
        </CardContent>
      </Card>

      {/* Footer Image Placeholder */}
      <div className="mt-8 opacity-50">
        <div className="w-24 h-24 bg-[var(--secondary)] rounded-lg" />
      </div>
    </div>
  );
}
