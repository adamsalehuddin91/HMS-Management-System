"use client";

import { TrendingUp, Calendar, User, ShoppingBag } from "lucide-react";
import { Card, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { Loader2 } from "lucide-react";
import { format } from "date-fns";

interface StaffSaleItem {
    serviceName: string;
    amount: number;
    date: string;
    customer: string;
}

interface StaffMyPerformanceProps {
    loading: boolean;
    staffName: string;
    salesToday: number;
    salesThisMonth: number;
    commissionToday: number;
    commissionThisMonth: number;
    servicesThisMonth: number;
    recentSales: StaffSaleItem[];
    selectedMonth: Date;
}

export function StaffMyPerformance({
    loading,
    staffName,
    salesToday,
    salesThisMonth,
    commissionToday,
    commissionThisMonth,
    servicesThisMonth,
    recentSales,
    selectedMonth,
}: StaffMyPerformanceProps) {
    return (
        <div className="space-y-8">
            {/* Greeting */}
            <div className="flex items-center gap-4">
                <div className="h-1.5 w-10 rounded-full bg-[#2e7d32]" />
                <h2 className="text-[11px] font-black uppercase tracking-[0.25em] text-[#2e7d32]">
                    Prestasi Saya
                </h2>
                <div className="h-1.5 flex-1 rounded-full bg-gray-100" />
                <div className="flex items-center gap-2 h-8 px-4 bg-[#2e7d32]/10 rounded-xl">
                    <User className="h-3.5 w-3.5 text-[#2e7d32]" />
                    <span className="text-[10px] font-black uppercase tracking-widest text-[#2e7d32]">
                        {staffName}
                    </span>
                </div>
            </div>

            {/* KPI Cards */}
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
                {/* Sales Today */}
                <Card className="border-none shadow-xl bg-gradient-to-br from-[#2e7d32] to-[#1b5e20] rounded-[2rem] overflow-hidden">
                    <CardContent className="p-8">
                        <Calendar className="h-6 w-6 text-white/60 mb-4" />
                        <p className="text-[9px] font-black uppercase tracking-widest text-white/60 mb-2">
                            Jualan Hari Ini
                        </p>
                        {loading ? (
                            <Loader2 className="h-6 w-6 animate-spin text-white/40 mt-2" />
                        ) : (
                            <>
                                <p className="text-3xl font-black text-white tabular-nums tracking-tighter">
                                    {formatCurrency(salesToday)}
                                </p>
                                <p className="text-[10px] font-black text-green-200 mt-2">
                                    Komisen: {formatCurrency(commissionToday)}
                                </p>
                            </>
                        )}
                    </CardContent>
                </Card>

                {/* Sales This Month */}
                <Card className="border-none shadow-xl bg-white rounded-[2rem] overflow-hidden">
                    <CardContent className="p-8">
                        <TrendingUp className="h-6 w-6 text-[#2e7d32] mb-4" />
                        <p className="text-[9px] font-black uppercase tracking-widest text-gray-400 mb-2">
                            Jualan {format(selectedMonth, "MMM yyyy")}
                        </p>
                        {loading ? (
                            <Loader2 className="h-6 w-6 animate-spin text-gray-200 mt-2" />
                        ) : (
                            <>
                                <p className="text-3xl font-black text-gray-900 tabular-nums tracking-tighter">
                                    {formatCurrency(salesThisMonth)}
                                </p>
                                <p className="text-[10px] font-black text-[#2e7d32] mt-2">
                                    Komisen: {formatCurrency(commissionThisMonth)}
                                </p>
                            </>
                        )}
                    </CardContent>
                </Card>

                {/* Services Count */}
                <Card className="border-none shadow-xl bg-white rounded-[2rem] overflow-hidden">
                    <CardContent className="p-8">
                        <ShoppingBag className="h-6 w-6 text-purple-400 mb-4" />
                        <p className="text-[9px] font-black uppercase tracking-widest text-gray-400 mb-2">
                            Servis Bulan Ini
                        </p>
                        {loading ? (
                            <Loader2 className="h-6 w-6 animate-spin text-gray-200 mt-2" />
                        ) : (
                            <>
                                <p className="text-3xl font-black text-gray-900 tabular-nums tracking-tighter">
                                    {servicesThisMonth}
                                </p>
                                <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-2">
                                    transaksi
                                </p>
                            </>
                        )}
                    </CardContent>
                </Card>
            </div>

            {/* Recent Transactions */}
            <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
                <CardContent className="p-10">
                    <div className="mb-8">
                        <p className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">
                            Transaksi Terkini
                        </p>
                        <p className="text-2xl font-black text-gray-900 tracking-tight mt-1">
                            {format(selectedMonth, "MMMM yyyy")}
                        </p>
                    </div>

                    {loading ? (
                        <div className="py-16 flex items-center justify-center">
                            <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                        </div>
                    ) : recentSales.length === 0 ? (
                        <div className="py-16 text-center text-[10px] font-black uppercase tracking-widest text-gray-300">
                            Tiada transaksi bulan ini
                        </div>
                    ) : (
                        <div className="space-y-3">
                            {recentSales.map((sale, idx) => (
                                <div
                                    key={idx}
                                    className="flex items-center gap-4 p-4 rounded-2xl bg-gray-50/60 hover:bg-[#2e7d32]/5 transition-all"
                                >
                                    <div className="h-9 w-9 rounded-xl bg-white flex items-center justify-center text-[10px] font-black text-[#2e7d32] border border-green-100 shadow-sm shrink-0">
                                        {idx + 1}
                                    </div>
                                    <div className="flex-1 min-w-0">
                                        <p className="font-black text-sm text-gray-900 truncate">{sale.serviceName}</p>
                                        <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest mt-0.5 truncate">
                                            {sale.customer} · {sale.date}
                                        </p>
                                    </div>
                                    <p className="font-black text-sm text-[#2e7d32] tabular-nums tracking-tighter shrink-0">
                                        {formatCurrency(sale.amount)}
                                    </p>
                                </div>
                            ))}
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
