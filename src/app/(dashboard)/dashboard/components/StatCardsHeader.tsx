"use client";

import { DollarSign, Calendar, TrendingUp, Gift } from "lucide-react";
import { StatCard } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface StatCardsHeaderProps {
    loading: boolean;
    stats: {
        salesToday: number;
        bookingsToday: number;
        monthlyCommission: number;
        pointsIssued: number;
    };
    salesChange: number;
    bookingsChange: number;
}

export function StatCardsHeader({
    loading,
    stats,
    salesChange,
    bookingsChange
}: StatCardsHeaderProps) {
    return (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            <StatCard
                title="Jualan Hari Ini"
                value={loading ? "..." : formatCurrency(stats.salesToday)}
                change={salesChange}
                changeLabel="vs semalam"
                icon={DollarSign}
            />
            <StatCard
                title="Tempahan Hari Ini"
                value={loading ? "..." : stats.bookingsToday}
                change={bookingsChange}
                changeLabel="vs purata"
                icon={Calendar}
            />
            <StatCard
                title="Komisen Sebulan"
                value={loading ? "..." : formatCurrency(stats.monthlyCommission)}
                change={0}
                changeLabel="bulan ini"
                icon={TrendingUp}
            />
            <StatCard
                title="Point Dikeluarkan"
                value={loading ? "..." : `${stats.pointsIssued} pts`}
                change={0}
                changeLabel="bulan ini"
                icon={Gift}
            />
        </div>
    );
}
