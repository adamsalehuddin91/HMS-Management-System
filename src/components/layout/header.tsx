"use client";

import { Bell, Search, Menu } from "lucide-react";
import { Avatar, Input } from "@/components/ui";
import { useUIStore } from "@/lib/store/ui-store";

interface HeaderProps {
  title: string;
  subtitle?: string;
  action?: React.ReactNode;
  user: {
    name: string;
    role: string;
    avatar_url?: string;
  };
}

export function Header({ title, subtitle, action, user }: HeaderProps) {
  const { toggleSidebar } = useUIStore();

  return (
    <header className="h-16 bg-[var(--card)]/80 backdrop-blur-md border-b border-[var(--border)] px-4 md:px-6 flex items-center justify-between sticky top-0 z-30">
      {/* Left: Title & Toggle */}
      <div className="flex items-center gap-4">
        <button
          onClick={toggleSidebar}
          className="p-2 -ml-2 rounded-lg hover:bg-[var(--secondary)] md:hidden"
        >
          <Menu className="h-6 w-6 text-[var(--foreground)]" />
        </button>
        <div>
          <h1 className="text-xl font-semibold">{title}</h1>
          {subtitle && <p className="text-sm text-[var(--muted)] hidden md:block">{subtitle}</p>}
        </div>
      </div>

      {/* Center: Search — hidden on mobile */}
      <div className="hidden md:flex flex-1 max-w-md mx-8">
        <Input
          placeholder="Search data..."
          icon={<Search className="h-4 w-4" />}
          className="h-10"
        />
      </div>

      {/* Right: Actions & User */}
      <div className="flex items-center gap-2 md:gap-4">
        {action}
        <button className="relative p-2 rounded-full hover:bg-[var(--secondary)] transition-colors">
          <Bell className="h-5 w-5 text-[var(--muted)]" />
          <span className="absolute top-1 right-1 h-2 w-2 bg-[var(--error)] rounded-full" />
        </button>
        <div className="flex items-center gap-3">
          <div className="text-right hidden md:block">
            <p className="text-sm font-medium">{user.name}</p>
            <p className="text-xs text-[var(--muted)] capitalize">{user.role}</p>
          </div>
          <Avatar name={user.name} src={user.avatar_url} size="lg" />
        </div>
      </div>
    </header>
  );
}
