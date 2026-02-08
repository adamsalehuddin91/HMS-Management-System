"use client";

import { cn } from "@/lib/utils";
import { LucideIcon, TrendingUp, TrendingDown } from "lucide-react";

export interface StatCardProps {
  title: string;
  value: string | number;
  change?: number;
  changeLabel?: string;
  icon?: LucideIcon;
  className?: string;
}

export function StatCard({ title, value, change, changeLabel, icon: Icon, className }: StatCardProps) {
  const isPositive = change !== undefined && change >= 0;

  return (
    <div className={cn("bg-[var(--card)] rounded-2xl border border-[var(--border)] p-5", className)}>
      <div className="flex items-start justify-between">
        <div>
          <p className="text-sm font-medium text-[var(--primary)] uppercase tracking-wide">{title}</p>
          <p className="mt-2 text-3xl font-bold text-[var(--foreground)]">{value}</p>
          {change !== undefined && (
            <div className={cn("mt-2 flex items-center gap-1 text-sm", isPositive ? "text-[var(--success)]" : "text-[var(--error)]")}>
              {isPositive ? <TrendingUp className="h-4 w-4" /> : <TrendingDown className="h-4 w-4" />}
              <span>{isPositive ? "+" : ""}{change}%</span>
              {changeLabel && <span className="text-[var(--muted)]">{changeLabel}</span>}
            </div>
          )}
        </div>
        {Icon && (
          <div className="p-2 bg-[var(--primary-light)] rounded-xl">
            <Icon className="h-5 w-5 text-[var(--primary)]" />
          </div>
        )}
      </div>
    </div>
  );
}
