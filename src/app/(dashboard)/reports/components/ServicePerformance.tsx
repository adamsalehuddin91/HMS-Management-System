"use client";

import { Loader2 } from "lucide-react";
import { Button, Card, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface TopService {
    name: string;
    count: number;
    revenue: number;
}

interface StaffPerformance {
    id: string;
    name: string;
    services: number;
    revenue: number;
    commission: number;
}

interface ServicePerformanceProps {
    loading: boolean;
    topServices: TopService[];
    staffPerformance: StaffPerformance[];
    setShowFullReport: (show: boolean) => void;
}

export function ServicePerformance({
    loading,
    topServices,
    staffPerformance,
    setShowFullReport
}: ServicePerformanceProps) {
    return (
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Top Services */}
            <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
                <CardContent className="p-10">
                    <div className="flex items-center justify-between mb-8">
                        <div>
                            <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Prestasi</h3>
                            <p className="text-2xl font-black text-gray-900 tracking-tight mt-1">Servis Terlaris</p>
                        </div>
                    </div>
                    {loading ? (
                        <div className="py-20 flex items-center justify-center">
                            <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                        </div>
                    ) : topServices.length === 0 ? (
                        <div className="py-20 text-center text-[10px] font-black uppercase tracking-widest text-gray-400">Tiada data servis</div>
                    ) : (
                        <div className="space-y-6">
                            {topServices.map((service, idx) => (
                                <div key={service.name} className="flex items-center gap-5 group">
                                    <div className="h-10 w-10 shrink-0 flex items-center justify-center rounded-xl bg-gray-50 text-[10px] font-black text-[#2e7d32] border border-gray-100 group-hover:bg-[#2e7d32] group-hover:text-white transition-all">
                                        #{idx + 1}
                                    </div>
                                    <div className="flex-1">
                                        <p className="font-black text-sm text-gray-900 tracking-tight">{service.name}</p>
                                        <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-0.5">{service.count} Tempahan</p>
                                    </div>
                                    <div className="text-right">
                                        <p className="font-black text-sm text-[#2e7d32] tabular-nums tracking-tighter">{formatCurrency(service.revenue)}</p>
                                        <div className="h-1 w-16 bg-gray-50 rounded-full mt-1 overflow-hidden">
                                            <div
                                                className="h-full bg-[#2e7d32] rounded-full transition-all duration-1000"
                                                style={{ width: `${Math.max(20, (service.revenue / topServices[0].revenue) * 100)}%` }}
                                            />
                                        </div>
                                    </div>
                                </div>
                            ))}
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* Staff Performance */}
            <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
                <CardContent className="p-10">
                    <div className="flex items-center justify-between mb-8">
                        <div>
                            <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Prestasi</h3>
                            <p className="text-2xl font-black text-gray-900 tracking-tight mt-1">Kakitangan</p>
                        </div>
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={() => setShowFullReport(true)}
                            className="h-10 px-5 rounded-2xl border-none bg-gray-50 font-black text-[9px] uppercase tracking-widest text-gray-500 hover:bg-[#2e7d32]/5 hover:text-[#2e7d32]"
                        >
                            Laporan Penuh
                        </Button>
                    </div>
                    {loading ? (
                        <div className="py-20 flex items-center justify-center">
                            <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                        </div>
                    ) : staffPerformance.length === 0 ? (
                        <div className="py-20 text-center text-[10px] font-black uppercase tracking-widest text-gray-400">Tiada data kakitangan</div>
                    ) : (
                        <div className="overflow-x-auto custom-scrollbar">
                            <table className="w-full">
                                <thead>
                                    <tr className="border-b border-gray-50">
                                        <th className="text-left py-4 text-[10px] font-black text-gray-400 uppercase tracking-widest">Pasukan</th>
                                        <th className="text-left py-4 text-[10px] font-black text-gray-400 uppercase tracking-widest">Servis</th>
                                        <th className="text-right py-4 text-[10px] font-black text-gray-400 uppercase tracking-widest">Jualan (RM)</th>
                                        <th className="text-right py-4 text-[10px] font-black text-gray-400 uppercase tracking-widest">Komisen</th>
                                    </tr>
                                </thead>
                                <tbody className="divide-y divide-gray-50">
                                    {staffPerformance.slice(0, 5).map((staff) => (
                                        <tr key={staff.id} className="group hover:bg-gray-50/50 transition-all">
                                            <td className="py-5 font-black text-sm text-gray-900 tracking-tight not-italic">{staff.name}</td>
                                            <td className="py-5 font-bold text-xs text-gray-500 tabular-nums uppercase">{staff.services} Kali</td>
                                            <td className="py-5 text-right font-black text-sm text-gray-700 tabular-nums tracking-tighter">{formatCurrency(staff.revenue)}</td>
                                            <td className="py-5 text-right font-black text-sm text-[#2e7d32] tabular-nums tracking-tighter not-italic">{formatCurrency(staff.commission)}</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
