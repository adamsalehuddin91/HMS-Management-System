"use client";

import { Users, DollarSign, Star } from "lucide-react";
import { StatCard } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface StaffStatsHeaderProps {
    totalStaff: number;
    activeStaff: number;
    totalCommission: number;
}

export function StaffStatsHeader({
    totalStaff,
    activeStaff,
    totalCommission
}: StaffStatsHeaderProps) {
    return (
        <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6">
            <StatCard
                title="Jumlah Staff"
                value={totalStaff}
                icon={Users}
            />
            <StatCard
                title="Staff Aktif"
                value={activeStaff}
                change={0}
                icon={Users}
            />
            <StatCard
                title="Jumlah Komisen (MTD)"
                value={formatCurrency(totalCommission)}
                change={0}
                changeLabel="vs bulan lepas"
                icon={DollarSign}
            />
            <StatCard
                title="Penilaian Purata"
                value="-"
                icon={Star}
            />
        </div>
    );
}
