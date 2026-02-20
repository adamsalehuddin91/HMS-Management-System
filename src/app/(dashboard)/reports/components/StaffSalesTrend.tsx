"use client";

import { ChevronLeft, ChevronRight, Users2, Trophy } from "lucide-react";
import { Card, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { Loader2 } from "lucide-react";

const MONTHS_SHORT = ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Ogos", "Sep", "Okt", "Nov", "Dis"];

export interface StaffMonthlyRow {
    id: string;
    name: string;
    monthlyRevenue: number[]; // index 0=Jan ... 11=Dec
}

interface StaffSalesTrendProps {
    loading: boolean;
    staffYearlySales: StaffMonthlyRow[];
    selectedYear: number;
    setSelectedYear: (year: number) => void;
}

export function StaffSalesTrend({
    loading,
    staffYearlySales,
    selectedYear,
    setSelectedYear,
}: StaffSalesTrendProps) {
    const currentYear = new Date().getFullYear();

    // find max revenue per month for highlight
    const monthMaxes = MONTHS_SHORT.map((_, mIdx) =>
        Math.max(...staffYearlySales.map((s) => s.monthlyRevenue[mIdx] || 0), 0)
    );

    // yearly totals per staff
    const withTotals = staffYearlySales.map((s) => ({
        ...s,
        total: s.monthlyRevenue.reduce((sum, v) => sum + v, 0),
    }));

    const grandTotal = withTotals.reduce((sum, s) => sum + s.total, 0);
    const topStaff = [...withTotals].sort((a, b) => b.total - a.total)[0];

    return (
        <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
            <CardContent className="p-10">
                {/* Header */}
                <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-6 mb-8">
                    <div className="flex items-center gap-5">
                        <div className="h-14 w-14 rounded-2xl bg-[#2e7d32]/10 flex items-center justify-center shadow-xl shadow-green-900/5">
                            <Users2 className="h-7 w-7 text-[#2e7d32]" />
                        </div>
                        <div>
                            <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">
                                Prestasi Kakitangan
                            </h3>
                            <p className="text-2xl font-black text-gray-900 tracking-tight mt-1">
                                Jualan (RM) Bulanan
                            </p>
                        </div>
                    </div>

                    {/* Year Selector */}
                    <div className="flex items-center gap-3">
                        <button
                            onClick={() => setSelectedYear(selectedYear - 1)}
                            className="h-10 w-10 flex items-center justify-center rounded-xl bg-gray-50 text-gray-400 hover:text-[#2e7d32] hover:bg-[#2e7d32]/5 transition-all active:scale-95"
                        >
                            <ChevronLeft className="h-5 w-5" />
                        </button>
                        <div className="h-10 px-5 bg-gray-50 rounded-xl flex items-center">
                            <span className="font-black text-xs uppercase tracking-widest text-gray-700">
                                {selectedYear}
                            </span>
                        </div>
                        <button
                            onClick={() => {
                                if (selectedYear < currentYear) setSelectedYear(selectedYear + 1);
                            }}
                            disabled={selectedYear >= currentYear}
                            className={`h-10 w-10 flex items-center justify-center rounded-xl transition-all active:scale-95 ${selectedYear >= currentYear
                                    ? "bg-gray-50 text-gray-200 cursor-not-allowed"
                                    : "bg-gray-50 text-gray-400 hover:text-[#2e7d32] hover:bg-[#2e7d32]/5"
                                }`}
                        >
                            <ChevronRight className="h-5 w-5" />
                        </button>
                    </div>
                </div>

                {/* Top staff badge */}
                {!loading && topStaff && topStaff.total > 0 && (
                    <div className="flex items-center gap-3 mb-6 p-4 bg-[#2e7d32]/5 rounded-2xl border border-[#2e7d32]/10">
                        <Trophy className="h-5 w-5 text-[#2e7d32]" />
                        <p className="text-xs font-black text-gray-700">
                            Top Kakitangan {selectedYear}:{" "}
                            <span className="text-[#2e7d32]">{topStaff.name}</span>
                            {" — "}
                            <span className="tabular-nums">{formatCurrency(topStaff.total)}</span>
                        </p>
                    </div>
                )}

                {loading ? (
                    <div className="py-20 flex items-center justify-center">
                        <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                    </div>
                ) : staffYearlySales.length === 0 ? (
                    <div className="py-20 text-center text-[10px] font-black uppercase tracking-widest text-gray-300">
                        Tiada data kakitangan untuk {selectedYear}
                    </div>
                ) : (
                    <div className="overflow-x-auto -mx-10 px-10 pb-4">
                        <table className="w-full min-w-[800px]">
                            <thead>
                                <tr className="border-b-2 border-gray-50">
                                    <th className="text-left py-4 pr-4 text-[9px] font-black text-gray-400 uppercase tracking-widest sticky left-0 bg-white">
                                        Kakitangan
                                    </th>
                                    {MONTHS_SHORT.map((m) => (
                                        <th
                                            key={m}
                                            className="py-4 px-2 text-center text-[9px] font-black text-gray-400 uppercase tracking-widest"
                                        >
                                            {m}
                                        </th>
                                    ))}
                                    <th className="py-4 pl-4 text-right text-[9px] font-black text-[#2e7d32] uppercase tracking-widest">
                                        Total
                                    </th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-gray-50/50">
                                {withTotals
                                    .sort((a, b) => b.total - a.total)
                                    .map((staff) => (
                                        <tr key={staff.id} className="hover:bg-gray-50/40 transition-all group">
                                            <td className="py-4 pr-4 font-black text-sm text-gray-900 tracking-tight italic sticky left-0 bg-white group-hover:bg-gray-50/40">
                                                {staff.name}
                                            </td>
                                            {staff.monthlyRevenue.map((rev, mIdx) => {
                                                const isTop = rev > 0 && rev === monthMaxes[mIdx];
                                                return (
                                                    <td key={mIdx} className="py-4 px-2 text-center">
                                                        {rev > 0 ? (
                                                            <span
                                                                className={`inline-block px-2 py-1 rounded-lg text-[10px] font-black tabular-nums ${isTop
                                                                        ? "bg-[#2e7d32]/10 text-[#2e7d32]"
                                                                        : "text-gray-500"
                                                                    }`}
                                                            >
                                                                {formatCurrency(rev)}
                                                            </span>
                                                        ) : (
                                                            <span className="text-gray-200 text-[10px] font-black">—</span>
                                                        )}
                                                    </td>
                                                );
                                            })}
                                            <td className="py-4 pl-4 text-right font-black text-sm text-[#2e7d32] tabular-nums tracking-tighter italic">
                                                {formatCurrency(staff.total)}
                                            </td>
                                        </tr>
                                    ))}
                            </tbody>
                            <tfoot className="border-t-2 border-[#2e7d32]/10 bg-[#2e7d32]/5">
                                <tr>
                                    <td className="py-5 pr-4 text-[10px] font-black uppercase tracking-widest text-[#2e7d32]">
                                        Jumlah
                                    </td>
                                    {MONTHS_SHORT.map((_, mIdx) => {
                                        const colTotal = withTotals.reduce(
                                            (sum, s) => sum + (s.monthlyRevenue[mIdx] || 0),
                                            0
                                        );
                                        return (
                                            <td
                                                key={mIdx}
                                                className="py-5 px-2 text-center text-[10px] font-black text-gray-700 tabular-nums"
                                            >
                                                {colTotal > 0 ? formatCurrency(colTotal) : "—"}
                                            </td>
                                        );
                                    })}
                                    <td className="py-5 pl-4 text-right font-black text-base text-[#2e7d32] tabular-nums tracking-tighter italic">
                                        {formatCurrency(grandTotal)}
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
