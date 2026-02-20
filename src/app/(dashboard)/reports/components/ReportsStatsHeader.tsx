"use client";

import { Calendar, ChevronLeft, ChevronRight, Download, BarChart3, DollarSign, ShoppingCart, Users, Gift, TrendingDown } from "lucide-react";
import { Button, StatCard } from "@/components/ui";
import { format, subMonths, addMonths } from "date-fns";
import { formatCurrency } from "@/lib/utils";

interface ReportsStatsHeaderProps {
    selectedMonth: Date;
    setSelectedMonth: (date: Date | ((prev: Date) => Date)) => void;
    isCurrentMonth: boolean;
    handleExportReport: () => void;
    salesData: { overall: number; monthly: number };
    totalTransactions: number;
    activeCustomers: number;
    pointsIssued: number;
    totalPointsRedeemed: number;
    loading: boolean;
}

export function ReportsStatsHeader({
    selectedMonth,
    setSelectedMonth,
    isCurrentMonth,
    handleExportReport,
    salesData,
    totalTransactions,
    activeCustomers,
    pointsIssued,
    totalPointsRedeemed,
    loading
}: ReportsStatsHeaderProps) {
    return (
        <div className="space-y-8">
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-6">
                <div className="flex items-center gap-4">
                    <button
                        onClick={() => setSelectedMonth(prev => subMonths(prev, 1))}
                        className="h-12 w-12 flex items-center justify-center rounded-2xl bg-white shadow-sm border border-gray-100 text-gray-400 hover:text-[#2e7d32] hover:border-[#2e7d32]/20 transition-all active:scale-95"
                    >
                        <ChevronLeft className="h-6 w-6" />
                    </button>
                    <div className="h-12 px-6 bg-white border border-gray-100 rounded-2xl shadow-sm flex items-center gap-3 min-w-[220px] justify-center">
                        <Calendar className="h-4 w-4 text-[#2e7d32]" />
                        <span className="font-black text-xs uppercase tracking-widest text-gray-700">{format(selectedMonth, 'MMMM yyyy')}</span>
                    </div>
                    <button
                        onClick={() => {
                            const next = addMonths(selectedMonth, 1);
                            if (next <= new Date()) setSelectedMonth(next);
                        }}
                        className={`h-12 w-12 flex items-center justify-center rounded-2xl transition-all active:scale-95 ${isCurrentMonth
                            ? 'bg-gray-50 text-gray-200 cursor-not-allowed border border-gray-50'
                            : 'bg-white shadow-sm border border-gray-100 text-gray-400 hover:text-[#2e7d32] hover:border-[#2e7d32]/20'}`}
                        disabled={isCurrentMonth}
                    >
                        <ChevronRight className="h-6 w-6" />
                    </button>
                    {!isCurrentMonth && (
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={() => setSelectedMonth(new Date())}
                            className="h-12 border-none bg-white shadow-sm rounded-2xl px-6 font-black text-[10px] uppercase tracking-widest text-[#2e7d32] hover:bg-gray-50"
                        >
                            Bulan Ini
                        </Button>
                    )}
                </div>
                <Button
                    variant="outline"
                    onClick={handleExportReport}
                    className="h-12 rounded-2xl border-none bg-[#2e7d32] text-white hover:bg-[#1b5e20] shadow-xl shadow-green-900/10 font-black text-[10px] uppercase tracking-widest px-8"
                >
                    <Download className="h-4 w-4 mr-2" />
                    Export Laporan (CSV)
                </Button>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-6 gap-6">
                <StatCard
                    title="Jumlah Jualan Keseluruhan"
                    value={loading ? "..." : formatCurrency(salesData.overall)}
                    icon={BarChart3}
                />
                <StatCard
                    title={`Jualan ${format(selectedMonth, 'MMM yyyy')}`}
                    value={loading ? "..." : formatCurrency(salesData.monthly)}
                    icon={DollarSign}
                />
                <StatCard
                    title="Transaksi"
                    value={loading ? "..." : totalTransactions.toLocaleString()}
                    icon={ShoppingCart}
                />
                <StatCard
                    title="Pelanggan Aktif"
                    value={loading ? "..." : activeCustomers.toLocaleString()}
                    icon={Users}
                />
                <StatCard
                    title="Mata Ganjaran Dikeluarkan"
                    value={loading ? "..." : `${pointsIssued.toLocaleString()} pts`}
                    icon={Gift}
                />
                <StatCard
                    title="Mata Ditebus"
                    value={loading ? "..." : `${totalPointsRedeemed.toLocaleString()} pts`}
                    icon={TrendingDown}
                />
            </div>
        </div>
    );
}
