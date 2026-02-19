"use client";

import Link from "next/link";
import { DollarSign, Calendar, Loader2 } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, Button, Badge } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { Header } from "@/components/layout/header";

interface UpcomingAppointment {
    id: string;
    customer: string;
    service: string;
    time: string;
    status: string;
}

interface StaffMyDayViewProps {
    user: any;
    loading: boolean;
    stats: {
        salesToday: number;
    };
    upcomingAppointments: UpcomingAppointment[];
}

export function StaffMyDayView({
    user,
    loading,
    stats,
    upcomingAppointments
}: StaffMyDayViewProps) {
    const todayApts = upcomingAppointments.filter(a => a.time.includes("Hari Ini"));

    return (
        <div className="min-h-screen bg-gray-50/50">
            <Header
                title={`Selamat ${new Date().getHours() < 12 ? "pagi" : "petang"}, ${user.name.split(" ")[0]}`}
                subtitle="Ringkasan tugasan anda hari ini"
                user={user}
            />

            <div className="p-8 space-y-8 max-w-5xl mx-auto">
                {/* Quick Stats */}
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <Card className="border-none shadow-xl bg-white rounded-[2rem] overflow-hidden group">
                        <CardContent className="p-8 flex items-center justify-between">
                            <div>
                                <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Jualan Anda</p>
                                <p className="text-3xl font-black text-gray-900 tracking-tighter">{formatCurrency(stats.salesToday)}</p>
                            </div>
                            <div className="h-14 w-14 rounded-2xl bg-[#2e7d32]/5 flex items-center justify-center text-[#2e7d32] group-hover:scale-110 transition-transform">
                                <DollarSign className="h-7 w-7" />
                            </div>
                        </CardContent>
                    </Card>
                    <Card className="border-none shadow-xl bg-white rounded-[2rem] overflow-hidden group">
                        <CardContent className="p-8 flex items-center justify-between">
                            <div>
                                <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Tempahan Hari Ini</p>
                                <p className="text-3xl font-black text-gray-900 tracking-tighter">{todayApts.length}</p>
                            </div>
                            <div className="h-14 w-14 rounded-2xl bg-[#2e7d32]/5 flex items-center justify-center text-[#2e7d32] group-hover:scale-110 transition-transform">
                                <Calendar className="h-7 w-7" />
                            </div>
                        </CardContent>
                    </Card>
                </div>

                {/* Today's Schedule */}
                <Card className="border-none shadow-xl bg-white rounded-[2rem] overflow-hidden">
                    <CardHeader className="p-8 pb-4">
                        <div className="flex items-center justify-between">
                            <div>
                                <CardTitle className="text-xl font-black text-gray-900 tracking-tight">Jadual Hari Ini</CardTitle>
                                <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">Tempahan Milik Anda</p>
                            </div>
                            <Link href="/appointments">
                                <Button variant="ghost" size="sm" className="h-10 px-4 rounded-xl text-[#2e7d32] font-black text-xs uppercase tracking-widest hover:bg-[#2e7d32]/5">
                                    Lihat Kalendar Full
                                </Button>
                            </Link>
                        </div>
                    </CardHeader>
                    <CardContent className="p-8 pt-0">
                        {loading ? (
                            <div className="py-12 flex items-center justify-center">
                                <Loader2 className="h-6 w-6 animate-spin text-[#2e7d32]" />
                            </div>
                        ) : todayApts.length === 0 ? (
                            <div className="text-center py-16">
                                <p className="text-4xl mb-4">✨</p>
                                <p className="text-xs font-black text-gray-400 uppercase tracking-widest">Tiada tempahan untuk anda hari ini</p>
                            </div>
                        ) : (
                            <div className="space-y-4">
                                {todayApts.map((apt) => (
                                    <div key={apt.id} className="group flex gap-6 items-center p-6 bg-gray-50 border border-transparent rounded-[24px] hover:border-[#2e7d32]/10 hover:bg-white hover:shadow-lg hover:shadow-[#2e7d32]/5 transition-all duration-300">
                                        <div className="w-20 text-center">
                                            <p className="text-lg font-black text-[#2e7d32] tracking-tighter">{apt.time.split(", ")[1]}</p>
                                            <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest">Waktu</p>
                                        </div>
                                        <div className="h-10 w-[1px] bg-gray-200" />
                                        <div className="flex-1">
                                            <h4 className="text-md font-black text-gray-800 tracking-tight">{apt.customer}</h4>
                                            <p className="text-[11px] font-bold text-gray-400 uppercase tracking-widest">{apt.service}</p>
                                        </div>
                                        <Badge
                                            variant={apt.status === "confirmed" ? "success" : "warning"}
                                            className="font-black text-[9px] uppercase tracking-widest px-3 py-1 rounded-xl border-none"
                                        >
                                            {apt.status}
                                        </Badge>
                                    </div>
                                ))}
                            </div>
                        )}
                    </CardContent>
                </Card>

                {/* Quick Actions */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <Link href="/pos" className="contents">
                        <Button size="lg" className="h-20 rounded-[2rem] text-lg font-black tracking-widest uppercase bg-[#2e7d32] hover:bg-[#1b5e20] shadow-xl shadow-[#2e7d32]/20">
                            Buat Jualan (POS)
                        </Button>
                    </Link>
                    <Link href="/appointments" className="contents">
                        <Button variant="outline" size="lg" className="h-20 rounded-[2rem] text-lg font-black tracking-widest uppercase border-gray-200 text-gray-500 hover:bg-gray-50">
                            Tempahan Baru
                        </Button>
                    </Link>
                </div>
            </div>
        </div>
    );
}
