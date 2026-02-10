"use client";

import { useState, useRef, useEffect } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { Loader2, MoreVertical, Calendar, ShoppingCart, Eye, XCircle } from "lucide-react";
import { Card, CardHeader, CardContent, CardTitle, Button, Avatar, Badge } from "@/components/ui";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";

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
    const router = useRouter();
    const [openMenuId, setOpenMenuId] = useState<string | null>(null);
    const menuRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        function handleClickOutside(e: MouseEvent) {
            if (menuRef.current && !menuRef.current.contains(e.target as Node)) {
                setOpenMenuId(null);
            }
        }
        document.addEventListener("mousedown", handleClickOutside);
        return () => document.removeEventListener("mousedown", handleClickOutside);
    }, []);

    const handleCancel = async (apt: UpcomingAppointment) => {
        setOpenMenuId(null);
        if (!confirm(`Batalkan tempahan ${apt.customer}?`)) return;
        const supabase = createClient();
        const { error } = await supabase
            .from("bookings")
            .update({ status: "cancelled" })
            .eq("id", apt.id);
        if (error) {
            toast.error("Gagal batalkan tempahan");
        } else {
            toast.success("Tempahan dibatalkan");
            window.location.reload();
        }
    };

    return (
        <Card className="border-none shadow-xl bg-white/50 backdrop-blur-md rounded-[2rem] overflow-visible">
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
                                    <div className="relative" ref={openMenuId === apt.id ? menuRef : undefined}>
                                        <button
                                            onClick={(e) => { e.stopPropagation(); setOpenMenuId(openMenuId === apt.id ? null : apt.id); }}
                                            className="p-2 hover:bg-gray-50 rounded-xl transition-colors"
                                        >
                                            <MoreVertical className="h-5 w-5 text-gray-300" />
                                        </button>
                                        {openMenuId === apt.id && (
                                            <div
                                                className="absolute right-0 top-10 w-48 bg-white rounded-2xl shadow-2xl border border-gray-100 py-2 z-50 animate-in fade-in slide-in-from-top-2 duration-200"
                                            >
                                                <button
                                                    onClick={() => { setOpenMenuId(null); router.push(`/pos?booking_id=${apt.id}`); }}
                                                    className="w-full flex items-center gap-3 px-4 py-2.5 text-left text-sm font-bold text-gray-700 hover:bg-[#2e7d32]/5 hover:text-[#2e7d32] transition-colors"
                                                >
                                                    <ShoppingCart className="h-4 w-4" />
                                                    Mula Servis
                                                </button>
                                                <button
                                                    onClick={() => { setOpenMenuId(null); router.push("/appointments"); }}
                                                    className="w-full flex items-center gap-3 px-4 py-2.5 text-left text-sm font-bold text-gray-700 hover:bg-gray-50 transition-colors"
                                                >
                                                    <Eye className="h-4 w-4" />
                                                    Lihat Detail
                                                </button>
                                                <div className="border-t border-gray-100 my-1" />
                                                <button
                                                    onClick={() => handleCancel(apt)}
                                                    className="w-full flex items-center gap-3 px-4 py-2.5 text-left text-sm font-bold text-red-500 hover:bg-red-50 transition-colors"
                                                >
                                                    <XCircle className="h-4 w-4" />
                                                    Batalkan
                                                </button>
                                            </div>
                                        )}
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
