"use client";

import { Loader2 } from "lucide-react";
import { Card, CardHeader, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface WeeklyData {
    day: string;
    value: number;
}

interface SalesPerformanceChartProps {
    loading: boolean;
    weeklyData: WeeklyData[];
    maxValue: number;
}

export function SalesPerformanceChart({
    loading,
    weeklyData,
    maxValue
}: SalesPerformanceChartProps) {
    const totalWeeklySales = weeklyData.reduce((sum, d) => sum + d.value, 0);

    return (
        <Card className="border-none shadow-xl bg-white/50 backdrop-blur-md rounded-[2rem] overflow-hidden">
            <CardHeader className="p-8 pb-0">
                <div className="flex items-center justify-between">
                    <div>
                        <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Prestasi Jualan</p>
                        <div className="flex items-baseline gap-2 mt-1">
                            <span className="text-3xl font-black text-gray-900 tracking-tighter">
                                {loading ? "..." : formatCurrency(totalWeeklySales)}
                            </span>
                            <span className="text-xs font-bold text-gray-400">Minggu Ini</span>
                        </div>
                    </div>
                </div>
            </CardHeader>
            <CardContent className="p-8">
                {loading ? (
                    <div className="h-44 flex items-center justify-center">
                        <Loader2 className="h-6 w-6 animate-spin text-[#2e7d32]" />
                    </div>
                ) : (
                    <div className="flex items-end justify-between h-44 gap-3">
                        {weeklyData.map((item) => (
                            <div key={item.day} className="flex-1 flex flex-col items-center gap-3 group">
                                <div className="w-full relative flex flex-col items-center justify-end h-full">
                                    <div
                                        className="w-full bg-gradient-to-t from-[#2e7d32] to-[#4caf50] rounded-2xl transition-all duration-500 group-hover:shadow-lg group-hover:shadow-green-900/10 group-hover:-translate-y-1"
                                        style={{ height: `${maxValue > 0 ? (item.value / maxValue) * 100 : 5}%`, minHeight: '6px' }}
                                    >
                                        <div className="absolute -top-8 left-1/2 -translate-x-1/2 bg-gray-900 text-white text-[10px] font-black px-2 py-1 rounded-lg opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap">
                                            {formatCurrency(item.value)}
                                        </div>
                                    </div>
                                </div>
                                <span className="text-[10px] font-black text-gray-400 uppercase tracking-tighter">{item.day}</span>
                            </div>
                        ))}
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
