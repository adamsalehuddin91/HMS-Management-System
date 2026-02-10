"use client";

import { Loader2 } from "lucide-react";
import { Card, CardHeader, CardContent } from "@/components/ui";

interface TopService {
    name: string;
    count: number;
}

interface TopServicesListProps {
    loading: boolean;
    topServices: TopService[];
}

export function TopServicesList({
    loading,
    topServices
}: TopServicesListProps) {
    const totalCount = topServices.reduce((sum, s) => sum + s.count, 0);

    return (
        <Card className="border-none shadow-xl bg-white/50 backdrop-blur-md rounded-[2rem] overflow-hidden">
            <CardHeader className="p-8 pb-0">
                <div className="flex items-center justify-between">
                    <div>
                        <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Perkhidmatan Teratas</p>
                        <div className="flex items-baseline gap-2 mt-1">
                            <span className="text-3xl font-black text-gray-900 tracking-tighter">
                                {loading ? "..." : `Total ${totalCount}`}
                            </span>
                            <span className="text-xs font-bold text-gray-400">Bulan Ini</span>
                        </div>
                    </div>
                </div>
            </CardHeader>
            <CardContent className="p-8">
                {loading ? (
                    <div className="h-44 flex items-center justify-center">
                        <Loader2 className="h-6 w-6 animate-spin text-[#2e7d32]" />
                    </div>
                ) : topServices.length === 0 ? (
                    <div className="h-44 flex items-center justify-center text-xs font-bold text-gray-400 uppercase tracking-widest">
                        Tiada data perkhidmatan
                    </div>
                ) : (
                    <div className="space-y-6">
                        {topServices.map((service, index) => (
                            <div key={service.name} className="flex items-center gap-4 group">
                                <div className="h-10 w-10 rounded-2xl bg-gray-50 flex items-center justify-center text-xs font-black text-gray-400 group-hover:bg-[#2e7d32]/5 group-hover:text-[#2e7d32] transition-colors">
                                    0{index + 1}
                                </div>
                                <div className="flex-1">
                                    <div className="flex items-center justify-between mb-2">
                                        <span className="text-sm font-black text-gray-800 tracking-tight">{service.name}</span>
                                        <span className="text-[10px] font-black text-[#2e7d32] bg-[#2e7d32]/5 px-2 py-0.5 rounded-lg">{service.count} Kali</span>
                                    </div>
                                    <div className="h-2 bg-gray-50 rounded-full overflow-hidden">
                                        <div
                                            className="h-full bg-[#2e7d32] rounded-full group-hover:bg-[#4caf50] transition-all duration-700"
                                            style={{ width: `${topServices[0].count > 0 ? (service.count / topServices[0].count) * 100 : 0}%` }}
                                        />
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
