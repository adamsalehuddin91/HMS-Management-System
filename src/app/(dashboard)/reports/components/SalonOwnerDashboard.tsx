"use client";

import { TrendingUp, Users, UserCheck, Gift, Award, Scissors } from "lucide-react";
import { Card, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { Loader2 } from "lucide-react";
import { format } from "date-fns";

const MONTHS_SHORT = ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Ogos", "Sep", "Okt", "Nov", "Dis"];

interface SalonOwnerDashboardProps {
    loading: boolean;
    selectedMonth: Date;
    monthlySales: number[];          // 12 values for selected year
    selectedYear: number;
    totalCustomers: number;
    activeStaffCount: number;
    pointsInCirculation: number;
    bestStaff: { name: string; revenue: number } | null;
    bestService: { name: string; count: number; revenue: number } | null;
    monthlySalesThisMonth: number;
    growthPercent: number | null;    // vs prev month, null if no prev data
}

export function SalonOwnerDashboard({
    loading,
    selectedMonth,
    monthlySales,
    selectedYear,
    totalCustomers,
    activeStaffCount,
    pointsInCirculation,
    bestStaff,
    bestService,
    monthlySalesThisMonth,
    growthPercent,
}: SalonOwnerDashboardProps) {
    const maxSale = Math.max(...monthlySales, 1);

    return (
        <div className="space-y-6">
            {/* Title */}
            <div className="flex items-center gap-4">
                <div className="h-1.5 w-10 rounded-full bg-[#2e7d32]" />
                <h2 className="text-[11px] font-black uppercase tracking-[0.25em] text-[#2e7d32]">
                    Papan Pemuka Pemilik Salon
                </h2>
                <div className="h-1.5 flex-1 rounded-full bg-gray-100" />
            </div>

            {/* KPI Cards */}
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-5">
                {/* Monthly Revenue */}
                <Card className="border-none shadow-lg bg-gradient-to-br from-[#2e7d32] to-[#1b5e20] rounded-[2rem] overflow-hidden">
                    <CardContent className="p-7">
                        <TrendingUp className="h-6 w-6 text-white/60 mb-4" />
                        <p className="text-[9px] font-black uppercase tracking-widest text-white/60 mb-2">
                            Jualan {format(selectedMonth, "MMM yyyy")}
                        </p>
                        <p className="text-2xl font-black text-white tabular-nums tracking-tighter">
                            {loading ? "..." : formatCurrency(monthlySalesThisMonth)}
                        </p>
                        {growthPercent !== null && !loading && (
                            <p className={`text-[10px] font-black mt-2 ${growthPercent >= 0 ? "text-green-200" : "text-red-200"}`}>
                                {growthPercent >= 0 ? "▲" : "▼"} {Math.abs(growthPercent).toFixed(1)}% vs bulan lepas
                            </p>
                        )}
                    </CardContent>
                </Card>

                {/* Total Customers */}
                <Card className="border-none shadow-lg bg-white rounded-[2rem] overflow-hidden">
                    <CardContent className="p-7">
                        <Users className="h-6 w-6 text-blue-400 mb-4" />
                        <p className="text-[9px] font-black uppercase tracking-widest text-gray-400 mb-2">
                            Jumlah Pelanggan
                        </p>
                        <p className="text-2xl font-black text-gray-900 tabular-nums tracking-tighter">
                            {loading ? "..." : totalCustomers.toLocaleString()}
                        </p>
                    </CardContent>
                </Card>

                {/* Staff */}
                <Card className="border-none shadow-lg bg-white rounded-[2rem] overflow-hidden">
                    <CardContent className="p-7">
                        <UserCheck className="h-6 w-6 text-purple-400 mb-4" />
                        <p className="text-[9px] font-black uppercase tracking-widest text-gray-400 mb-2">
                            Kakitangan Aktif
                        </p>
                        <p className="text-2xl font-black text-gray-900 tabular-nums tracking-tighter">
                            {loading ? "..." : activeStaffCount}
                        </p>
                    </CardContent>
                </Card>

                {/* Points */}
                <Card className="border-none shadow-lg bg-white rounded-[2rem] overflow-hidden">
                    <CardContent className="p-7">
                        <Gift className="h-6 w-6 text-amber-400 mb-4" />
                        <p className="text-[9px] font-black uppercase tracking-widest text-gray-400 mb-2">
                            Mata Aktif Pelanggan
                        </p>
                        <p className="text-2xl font-black text-gray-900 tabular-nums tracking-tighter">
                            {loading ? "..." : pointsInCirculation.toLocaleString()}
                        </p>
                        <p className="text-[9px] font-black text-gray-300 mt-1 uppercase tracking-widest">pts</p>
                    </CardContent>
                </Card>
            </div>

            {/* Revenue Bar Chart + Highlights */}
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-5">
                {/* 12-month Revenue Chart */}
                <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden lg:col-span-2">
                    <CardContent className="p-10">
                        <div className="mb-8">
                            <p className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">
                                Trend Jualan
                            </p>
                            <p className="text-2xl font-black text-gray-900 tracking-tight mt-1">
                                {selectedYear} — Bulanan
                            </p>
                        </div>

                        {loading ? (
                            <div className="py-16 flex items-center justify-center">
                                <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                            </div>
                        ) : (
                            <div className="flex items-end gap-2 h-40">
                                {monthlySales.map((val, idx) => {
                                    const heightPct = maxSale > 0 ? (val / maxSale) * 100 : 0;
                                    const isCurrentMonth =
                                        idx === new Date().getMonth() &&
                                        selectedYear === new Date().getFullYear();
                                    return (
                                        <div
                                            key={idx}
                                            className="flex-1 flex flex-col items-center gap-2 group"
                                            title={`${MONTHS_SHORT[idx]}: ${formatCurrency(val)}`}
                                        >
                                            <div className="relative w-full flex items-end h-32">
                                                <div
                                                    className={`w-full rounded-t-xl transition-all duration-700 ${isCurrentMonth
                                                            ? "bg-[#2e7d32]"
                                                            : val > 0
                                                                ? "bg-[#2e7d32]/20 group-hover:bg-[#2e7d32]/40"
                                                                : "bg-gray-100"
                                                        }`}
                                                    style={{ height: `${Math.max(heightPct, val > 0 ? 4 : 2)}%` }}
                                                />
                                            </div>
                                            <p
                                                className={`text-[8px] font-black uppercase tracking-widest ${isCurrentMonth ? "text-[#2e7d32]" : "text-gray-300"
                                                    }`}
                                            >
                                                {MONTHS_SHORT[idx]}
                                            </p>
                                        </div>
                                    );
                                })}
                            </div>
                        )}

                        {!loading && (
                            <div className="mt-6 pt-6 border-t border-gray-50 flex items-center justify-between">
                                <p className="text-[10px] font-black uppercase tracking-widest text-gray-400">
                                    Jumlah Setahun
                                </p>
                                <p className="font-black text-lg text-[#2e7d32] tabular-nums tracking-tighter italic">
                                    {formatCurrency(monthlySales.reduce((s, v) => s + v, 0))}
                                </p>
                            </div>
                        )}
                    </CardContent>
                </Card>

                {/* Best Staff + Best Service */}
                <div className="space-y-5">
                    {/* Best Staff */}
                    <Card className="border-none shadow-lg bg-white rounded-[2.5rem] overflow-hidden flex-1">
                        <CardContent className="p-8">
                            <Award className="h-6 w-6 text-[#2e7d32] mb-4" />
                            <p className="text-[9px] font-black uppercase tracking-widest text-gray-400 mb-1">
                                Kakitangan Terbaik
                            </p>
                            {loading ? (
                                <Loader2 className="h-5 w-5 animate-spin text-gray-200 mt-2" />
                            ) : bestStaff ? (
                                <>
                                    <p className="text-lg font-black text-gray-900 tracking-tight italic mt-2">
                                        {bestStaff.name}
                                    </p>
                                    <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">
                                        {format(selectedMonth, "MMM yyyy")}
                                    </p>
                                    <p className="text-xl font-black text-[#2e7d32] tabular-nums tracking-tighter mt-3">
                                        {formatCurrency(bestStaff.revenue)}
                                    </p>
                                </>
                            ) : (
                                <p className="text-[10px] font-black text-gray-300 uppercase tracking-widest mt-3">
                                    Tiada data
                                </p>
                            )}
                        </CardContent>
                    </Card>

                    {/* Best Service */}
                    <Card className="border-none shadow-lg bg-white rounded-[2.5rem] overflow-hidden flex-1">
                        <CardContent className="p-8">
                            <Scissors className="h-6 w-6 text-purple-400 mb-4" />
                            <p className="text-[9px] font-black uppercase tracking-widest text-gray-400 mb-1">
                                Servis Terlaris
                            </p>
                            {loading ? (
                                <Loader2 className="h-5 w-5 animate-spin text-gray-200 mt-2" />
                            ) : bestService ? (
                                <>
                                    <p className="text-lg font-black text-gray-900 tracking-tight italic mt-2 leading-tight">
                                        {bestService.name}
                                    </p>
                                    <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">
                                        {bestService.count}x tempahan
                                    </p>
                                    <p className="text-xl font-black text-purple-500 tabular-nums tracking-tighter mt-3">
                                        {formatCurrency(bestService.revenue)}
                                    </p>
                                </>
                            ) : (
                                <p className="text-[10px] font-black text-gray-300 uppercase tracking-widest mt-3">
                                    Tiada data
                                </p>
                            )}
                        </CardContent>
                    </Card>
                </div>
            </div>
        </div>
    );
}
