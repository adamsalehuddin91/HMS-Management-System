"use client";

import { TrendingUp, DollarSign, Loader2 } from "lucide-react";
import { Card, CardContent } from "@/components/ui";
import { format } from "date-fns";
import { formatCurrency } from "@/lib/utils";

interface FinancialOverviewProps {
    loading: boolean;
    isCurrentMonth: boolean;
    selectedMonth: Date;
    salesData: { daily: number; weekly: number; monthly: number };
    totalTransactions: number;
}

export function FinancialOverview({
    loading,
    isCurrentMonth,
    selectedMonth,
    salesData,
    totalTransactions
}: FinancialOverviewProps) {
    return (
        <Card className="border-none shadow-xl bg-white rounded-2xl overflow-hidden group">
            <CardContent className="p-6">
                <div className="flex items-center justify-between mb-5">
                    <div>
                        <h3 className="text-[9px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Ringkasan Jualan</h3>
                        <p className="text-xl font-black text-gray-900 tracking-tight mt-0.5">Prestasi Kewangan</p>
                    </div>
                </div>

                {loading ? (
                    <div className="py-24 flex items-center justify-center">
                        <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                    </div>
                ) : (
                    <div className="space-y-4">
                        {isCurrentMonth && (
                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                <div className="flex items-center justify-between p-4 bg-gray-50/80 rounded-xl border border-gray-100 hover:bg-white hover:shadow-lg hover:shadow-green-900/5 transition-all group/stat">
                                    <div>
                                        <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest mb-1">Hari Ini</p>
                                        <p className="text-xl font-black text-gray-900 tabular-nums tracking-tighter group-hover/stat:scale-110 transition-transform origin-left">{formatCurrency(salesData.daily)}</p>
                                    </div>
                                    <div className="h-9 w-9 rounded-xl bg-white shadow-sm flex items-center justify-center text-[#2e7d32]/30 group-hover/stat:text-[#2e7d32] transition-colors">
                                        <TrendingUp className="h-4 w-4" />
                                    </div>
                                </div>
                                <div className="flex items-center justify-between p-4 bg-gray-50/80 rounded-xl border border-gray-100 hover:bg-white hover:shadow-lg hover:shadow-green-900/5 transition-all group/stat">
                                    <div>
                                        <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest mb-1">Minggu Ini</p>
                                        <p className="text-xl font-black text-gray-900 tabular-nums tracking-tighter group-hover/stat:scale-110 transition-transform origin-left">{formatCurrency(salesData.weekly)}</p>
                                    </div>
                                    <div className="h-9 w-9 rounded-xl bg-white shadow-sm flex items-center justify-center text-[#2e7d32]/30 group-hover/stat:text-[#2e7d32] transition-colors">
                                        <TrendingUp className="h-4 w-4" />
                                    </div>
                                </div>
                            </div>
                        )}
                        <div className="flex items-center justify-between p-5 bg-[#2e7d32]/5 rounded-2xl border border-[#2e7d32]/10 relative overflow-hidden group/primary">
                            <div className="relative z-10">
                                <p className="text-[9px] font-black text-[#2e7d32] uppercase tracking-[0.2em] mb-1">{format(selectedMonth, 'MMMM yyyy')}</p>
                                <p className="text-3xl font-black text-[#2e7d32] tabular-nums tracking-tighter group-hover/primary:scale-110 transition-transform origin-left">{formatCurrency(salesData.monthly)}</p>
                            </div>
                            <div className="text-right relative z-10">
                                <div className="flex items-center justify-end gap-2 text-[#2e7d32]/50 font-black text-[10px] uppercase tracking-widest mb-2">
                                    <TrendingUp className="h-4 w-4" />
                                    <span>{totalTransactions} Transaksi</span>
                                </div>
                                <div className="h-1 w-24 bg-[#2e7d32]/10 rounded-full ml-auto overflow-hidden">
                                    <div className="h-full bg-[#2e7d32] rounded-full w-[65%]" />
                                </div>
                            </div>
                            <div className="absolute -right-8 -bottom-8 opacity-[0.03] group-hover/primary:scale-125 transition-transform duration-1000">
                                <TrendingUp className="h-40 w-40" />
                            </div>
                        </div>
                        <div className="flex items-center justify-between p-4 bg-gray-50/80 rounded-xl border border-gray-100 hover:bg-white hover:shadow-lg hover:shadow-green-900/5 transition-all group/stat">
                            <div>
                                <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest mb-1">Purata per Transaksi</p>
                                <p className="text-xl font-black text-gray-900 tabular-nums tracking-tighter group-hover/stat:scale-110 transition-transform origin-left">
                                    {totalTransactions > 0 ? formatCurrency(salesData.monthly / totalTransactions) : 'RM 0'}
                                </p>
                            </div>
                            <div className="h-9 w-9 rounded-xl bg-white shadow-sm flex items-center justify-center text-gray-200 group-hover/stat:text-orange-400 transition-colors">
                                <DollarSign className="h-4 w-4" />
                            </div>
                        </div>
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
