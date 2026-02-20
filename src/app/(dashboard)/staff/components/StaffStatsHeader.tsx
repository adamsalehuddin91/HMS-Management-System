"use client";

import { Users, DollarSign, Scissors } from "lucide-react";
import { StatCard } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { format, subMonths, addMonths } from "date-fns";

interface StaffStatsHeaderProps {
    totalStaff: number;
    activeStaff: number;
    totalCommission: number;
    totalServices: number;
    selectedMonth: Date;
    setSelectedMonth: (d: Date) => void;
    isCurrentMonth: boolean;
    loading: boolean;
}

export function StaffStatsHeader({
    totalStaff,
    activeStaff,
    totalCommission,
    totalServices,
    selectedMonth,
    setSelectedMonth,
    isCurrentMonth,
    loading,
}: StaffStatsHeaderProps) {
    return (
        <div className="space-y-6">
            {/* Month navigator */}
            <div className="flex items-center gap-4">
                <button
                    onClick={() => setSelectedMonth(subMonths(selectedMonth, 1))}
                    className="h-10 w-10 flex items-center justify-center rounded-xl bg-white shadow-sm border border-gray-100 text-gray-400 hover:text-[#2e7d32] transition-all"
                >
                    ‹
                </button>
                <div className="h-10 px-6 bg-white border border-gray-100 rounded-xl shadow-sm flex items-center min-w-[160px] justify-center">
                    <span className="font-black text-xs uppercase tracking-widest text-gray-700">
                        {format(selectedMonth, "MMMM yyyy")}
                    </span>
                </div>
                <button
                    onClick={() => {
                        const next = addMonths(selectedMonth, 1);
                        if (next <= new Date()) setSelectedMonth(next);
                    }}
                    disabled={isCurrentMonth}
                    className={`h-10 w-10 flex items-center justify-center rounded-xl transition-all ${isCurrentMonth
                            ? "bg-gray-50 text-gray-200 cursor-not-allowed"
                            : "bg-white shadow-sm border border-gray-100 text-gray-400 hover:text-[#2e7d32]"
                        }`}
                >
                    ›
                </button>
            </div>

            {/* Stat cards */}
            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6">
                <StatCard
                    title="Jumlah Staff"
                    value={loading ? "..." : totalStaff}
                    icon={Users}
                />
                <StatCard
                    title="Staff Aktif"
                    value={loading ? "..." : activeStaff}
                    icon={Users}
                />
                <StatCard
                    title="Jumlah Komisen (MTD)"
                    value={loading ? "..." : formatCurrency(totalCommission)}
                    icon={DollarSign}
                />
                <StatCard
                    title="Jumlah Servis (MTD)"
                    value={loading ? "..." : totalServices}
                    icon={Scissors}
                />
            </div>
        </div>
    );
}
