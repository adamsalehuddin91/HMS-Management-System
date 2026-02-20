"use client";

import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";
import { cn } from "@/lib/utils";
import { Avatar, Button } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { useUIStore } from "@/lib/store/ui-store";
import {
  LayoutDashboard,
  Calendar,
  Users,
  UserCog,
  Scissors,
  Package,
  Receipt,
  BarChart3,
  Settings,
  LogOut,
  ShoppingCart,
  Plus,
  Leaf,
  Tag,
} from "lucide-react";

const adminNavItems = [
  { href: "/dashboard", label: "Dashboard", icon: LayoutDashboard },
  { href: "/appointments", label: "Appointments", icon: Calendar },
  { href: "/customers", label: "Customers", icon: Users },
  { href: "/staff", label: "Staff", icon: UserCog },
  { href: "/services", label: "Services", icon: Scissors },
  { href: "/inventory", label: "Inventory", icon: Package },
  { href: "/pos", label: "POS", icon: Receipt },
  { href: "/reports", label: "Reports", icon: BarChart3 },
  { href: "/promotions", label: "Promotions", icon: Tag },
];

const staffNavItems = [
  { href: "/dashboard", label: "Dashboard", icon: LayoutDashboard },
  { href: "/appointments", label: "Appointments", icon: Calendar },
  { href: "/customers", label: "Customers", icon: Users },
  { href: "/pos", label: "POS", icon: Receipt },
];

interface SidebarProps {
  user: {
    name: string;
    role: "admin" | "staff";
    avatar_url?: string;
  };
}

export function Sidebar({ user }: SidebarProps) {
  const pathname = usePathname();
  const router = useRouter();
  const { logout } = useAuthStore();
  const { isSidebarOpen, closeSidebar } = useUIStore();
  const navItems = user.role === "admin" ? adminNavItems : staffNavItems;

  const handleLogout = () => {
    logout();
    router.push("/login");
  };

  return (
    <>
      {/* Mobile Backdrop */}
      {isSidebarOpen && (
        <div
          className="fixed inset-0 bg-black/50 backdrop-blur-sm z-40 md:hidden"
          onClick={closeSidebar}
        />
      )}

      {/* Sidebar */}
      <aside
        className={cn(
          "fixed inset-y-0 left-0 w-64 bg-white/80 backdrop-blur-xl border-r border-white/20 shadow-xl flex flex-col z-50 transition-transform duration-300 ease-in-out md:translate-x-0",
          isSidebarOpen ? "translate-x-0" : "-translate-x-full"
        )}
      >
        {/* Logo */}
        <div className="p-6 flex items-center gap-3">
          <div className="h-10 w-10 rounded-xl bg-gradient-to-br from-[var(--primary)] to-[var(--primary-dark)] flex items-center justify-center shadow-lg shadow-green-900/20">
            <Leaf className="h-6 w-6 text-white" />
          </div>
          <div>
            <h1 className="font-bold text-lg tracking-tight">HMS Salon</h1>
            <p className="text-xs text-[var(--muted)] font-medium">Premium Management</p>
          </div>
        </div>

        {/* Navigation */}
        <nav className="flex-1 px-3 py-4 space-y-1 overflow-y-auto custom-scrollbar">
          {navItems.map((item) => {
            const isActive = pathname === item.href || pathname.startsWith(`${item.href}/`);
            return (
              <Link
                key={item.href}
                href={item.href}
                className={cn(
                  "flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium transition-all duration-200 group relative overflow-hidden",
                  isActive
                    ? "text-white shadow-md shadow-green-900/20"
                    : "text-[var(--muted)] hover:bg-white/50 hover:text-[var(--foreground)]"
                )}
              >
                {isActive && (
                  <div className="absolute inset-0 bg-gradient-to-r from-[var(--primary)] to-[var(--primary-dark)] z-0" />
                )}
                <item.icon className={cn("h-5 w-5 relative z-10", isActive ? "text-white" : "text-[var(--muted)] group-hover:text-[var(--primary)] transition-colors")} />
                <span className="relative z-10">{item.label}</span>
              </Link>
            );
          })}
        </nav>

        {/* Quick Actions */}
        <div className="px-3 py-4 space-y-3">
          <Link href="/pos">
            <Button className="w-full gap-2 shadow-lg shadow-green-900/20" size="lg">
              <ShoppingCart className="h-5 w-5" />
              New Sale
            </Button>
          </Link>
          <Link href="/appointments/new">
            <Button variant="secondary" className="w-full gap-2 bg-white/50 hover:bg-white/80 border border-white/20" size="lg">
              <Plus className="h-5 w-5" />
              New Booking
            </Button>
          </Link>
        </div>

        {/* Bottom Section */}
        <div className="p-3 border-t border-[var(--border)]/50">
          {user.role === "admin" && (
            <Link
              href="/settings"
              className={cn(
                "flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium transition-colors mb-2 group",
                pathname === "/settings"
                  ? "bg-[var(--primary-light)] text-[var(--primary-dark)]"
                  : "text-[var(--muted)] hover:bg-white/50 hover:text-[var(--foreground)]"
              )}
            >
              <Settings className="h-5 w-5 group-hover:rotate-90 transition-transform duration-500" />
              Settings
            </Link>
          )}
          <button
            className="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-[var(--error)] hover:bg-red-50 transition-colors w-full"
            onClick={handleLogout}
          >
            <LogOut className="h-5 w-5" />
            Logout
          </button>
        </div>

        {/* User Profile */}
        <div className="p-4 border-t border-[var(--border)]/50 flex items-center gap-3 bg-white/30">
          <Avatar name={user.name} src={user.avatar_url} />
          <div className="flex-1 min-w-0">
            <p className="text-sm font-bold truncate">{user.name}</p>
            <p className="text-xs text-[var(--muted)] capitalize font-medium">{user.role}</p>
          </div>
        </div>
      </aside>
    </>
  );
}
