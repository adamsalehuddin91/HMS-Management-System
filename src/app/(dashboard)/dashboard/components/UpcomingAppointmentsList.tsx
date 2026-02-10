"use client";

import Link from "next/link";
import { Loader2, MoreVertical, Calendar } from "lucide-react";
import { Card, CardHeader, CardContent, CardTitle, Button, Avatar, Badge } from "@/components/ui";

interface UpcomingAppointment {
    id: string;
    customer: string;
    service: string;
    time: string;
    status: string;
}

interface UpcomingAppointmentsListProps {
    loading: boolean;
    upcomingAppointments: UpcomingAppointment[];
}

export function UpcomingAppointmentsList({
    loading,
    upcomingAppointments
}: UpcomingAppointmentsListProps) {
    return (
        <Card className="border-none shadow-xl bg-white/50 backdrop-blur-md rounded-[2rem] overflow-hidden">
            <CardHeader className="p-8 pb-4">
                <div className="flex items-center justify-between">
                    <div>
                        <CardTitle className="text-xl font-black text-gray-900 tracking-tight">Tempahan Akan Datang</CardTitle>
                        <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">Jadual Semasa</p>
                    </div>
                    <Link href="/appointments">
                        <Button variant="ghost" className="h-10 px-4 rounded-xl text-[#2e7d32] font-black text-xs uppercase tracking-widest hover:bg-[#2e7d32]/5">
                            <Calendar className="h-4 w-4 mr-2" />
                            Lihat Jadual
                        </Button>
                    </Link>
                </div>
            </CardHeader>
            <CardContent className="p-8 pt-0">
                {loading ? (
                    <div className="py-12 flex items-center justify-center">
                        <Loader2 className="h-6 w-6 animate-spin text-[#2e7d32]" />
                    </div>
                ) : upcomingAppointments.length === 0 ? (
                    <div className="py-12 text-center">
                        <p className="text-xs font-black text-gray-400 uppercase tracking-widest">Tiada tempahan akan datang</p>
                    </div>
                ) : (
                    <div className="space-y-4">
                        {upcomingAppointments.map((apt) => (
                            <div
                                key={apt.id}
                                className="group flex items-center justify-between p-5 bg-white border border-gray-50 rounded-[24px] hover:border-[#2e7d32]/10 hover:shadow-lg hover:shadow-[#2e7d32]/5 transition-all duration-300"
                            >
                                <div className="flex items-center gap-5">
                                    <Avatar name={apt.customer} className="h-12 w-12 border-2 border-white shadow-sm group-hover:scale-105 transition-transform" />
                                    <div>
                                        <p className="text-sm font-black text-gray-800 tracking-tight">{apt.customer}</p>
                                        <p className="text-[11px] font-bold text-gray-400 uppercase tracking-widest">{apt.service}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-6">
                                    <div className="text-right">
                                        <p className="text-xs font-black text-gray-800 tracking-tighter mb-1">{apt.time}</p>
                                        <Badge
                                            variant={apt.status === "confirmed" ? "success" : "warning"}
                                            className="font-black text-[9px] uppercase tracking-widest px-2 py-0.5 rounded-lg border-none"
                                        >
                                            {apt.status}
                                        </Badge>
                                    </div>
                                    <button className="p-2 hover:bg-gray-50 rounded-xl transition-colors">
                                        <MoreVertical className="h-5 w-5 text-gray-300" />
                                    </button>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
