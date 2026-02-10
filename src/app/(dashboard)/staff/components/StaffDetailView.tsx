"use client";

import Link from "next/link";
import { DollarSign, Star, Calendar } from "lucide-react";
import { Button, Card, CardContent, Avatar, Badge, StatCard } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface StaffWithMetrics {
    id: string;
    name: string;
    phone: string;
    email?: string | null;
    role: string;
    is_active: boolean;
    avatar_url?: string | null;
    totalSales: number;
    commission: number;
    servicesCount: number;
    rating: number;
}

interface StaffDetailViewProps {
    staff: StaffWithMetrics | null;
    isAdmin: boolean;
    openCommissionModal: () => void;
    openEditModal: () => void;
}

export function StaffDetailView({
    staff,
    isAdmin,
    openCommissionModal,
    openEditModal
}: StaffDetailViewProps) {
    if (!staff) {
        return (
            <div className="w-full lg:w-[400px] flex items-center justify-center p-8 bg-white/50 backdrop-blur-sm rounded-[3rem] border-2 border-dashed border-gray-100 h-full">
                <div className="text-center group">
                    <div className="w-20 h-20 bg-gray-50 rounded-[2.5rem] flex items-center justify-center mx-auto mb-6 group-hover:scale-110 transition-transform duration-500">
                        <Star className="h-8 w-8 text-gray-200" />
                    </div>
                    <p className="text-[10px] font-black uppercase tracking-[0.2em] text-gray-300">Pilih ahli pasukan</p>
                </div>
            </div>
        );
    }

    return (
        <Card className="w-full lg:w-[400px] shrink-0 border-none shadow-2xl bg-white rounded-[3rem] overflow-hidden self-start sticky top-8">
            <CardContent className="p-10">
                <div className="text-center mb-10">
                    <div className="relative inline-block mb-6">
                        <Avatar name={staff.name} src={staff.avatar_url || undefined} className="h-28 w-28 ring-8 ring-gray-50 shadow-xl mx-auto text-3xl font-black" />
                        <div className={`absolute bottom-1 right-1 h-6 w-6 rounded-full border-4 border-white shadow-md ${staff.is_active ? "bg-green-500" : "bg-gray-300"}`} />
                    </div>
                    <h3 className="text-2xl font-black text-gray-900 tracking-tight mb-2">{staff.name}</h3>
                    <div className="flex items-center justify-center gap-2">
                        <Badge className="bg-[#2e7d32] text-white font-black text-[9px] uppercase tracking-widest px-3 py-1 rounded-lg border-none">{staff.role}</Badge>
                        <Badge variant={staff.is_active ? "success" : "default"} className="font-black text-[9px] uppercase tracking-widest px-3 py-1 rounded-lg border-none">
                            {staff.is_active ? "Aktif" : "Arkib"}
                        </Badge>
                    </div>
                </div>

                <div className="space-y-4 mb-10">
                    <div className="flex items-center justify-between py-4 border-b border-gray-50">
                        <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">No. Telefon</span>
                        <span className="font-bold text-gray-700 tabular-nums">{staff.phone}</span>
                    </div>
                    <div className="flex items-center justify-between py-4 border-b border-gray-50">
                        <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Email</span>
                        <span className="font-bold text-gray-700 truncate max-w-[180px]">{staff.email || "-"}</span>
                    </div>
                </div>

                <div className="mb-10">
                    <h4 className="text-[10px] font-black text-[#2e7d32] uppercase tracking-[0.2em] mb-6 flex items-center gap-2">
                        <div className="h-1.5 w-1.5 bg-[#2e7d32] rounded-full" />
                        Prestasi Bulan Ini
                    </h4>
                    <div className="grid grid-cols-2 gap-4">
                        <div className="p-5 bg-gray-50/80 rounded-[2rem] border border-gray-100 text-center transition-all hover:bg-white hover:shadow-xl hover:shadow-green-900/5 group">
                            <p className="text-2xl font-black text-[#2e7d32] tracking-tighter mb-1 group-hover:scale-110 transition-transform">{staff.servicesCount}</p>
                            <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest">Servis</p>
                        </div>
                        <div className="p-5 bg-gray-50/80 rounded-[2rem] border border-gray-100 text-center transition-all hover:bg-white hover:shadow-xl hover:shadow-green-900/5 group">
                            <p className="text-2xl font-black text-gray-900 tracking-tighter mb-1 group-hover:scale-110 transition-transform tabular-nums">RM{Math.round(staff.totalSales / 1000)}k</p>
                            <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest">Jualan</p>
                        </div>
                        <div className="p-5 bg-[#2e7d32]/5 rounded-[2rem] border border-[#2e7d32]/10 text-center transition-all hover:bg-white hover:shadow-xl hover:shadow-green-900/5 group">
                            <p className="text-2xl font-black text-[#2e7d32] tracking-tighter mb-1 group-hover:scale-110 transition-transform tabular-nums">{formatCurrency(staff.commission)}</p>
                            <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest">Komisen</p>
                        </div>
                        <div className="p-5 bg-gray-50/80 rounded-[2rem] border border-gray-100 text-center transition-all hover:bg-white hover:shadow-xl hover:shadow-green-900/5 group">
                            <div className="flex items-center justify-center gap-1.5 text-orange-400 mb-1">
                                <Star className="h-5 w-5 fill-current group-hover:scale-110 transition-transform" />
                                <span className="text-2xl font-black tracking-tighter tabular-nums">{staff.rating || "-"}</span>
                            </div>
                            <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest">Rating</p>
                        </div>
                    </div>
                </div>

                {isAdmin && (
                    <div className="space-y-4">
                        <Button
                            className="w-full h-14 rounded-[1.5rem] bg-[#2e7d32] hover:bg-[#1b5e20] shadow-xl shadow-green-900/10 font-black uppercase tracking-[0.1em] text-[11px]"
                            onClick={openCommissionModal}
                        >
                            <DollarSign className="h-4.5 w-4.5 mr-2" />
                            Pelarasan Komisen
                        </Button>
                        <div className="flex gap-4">
                            <Button
                                variant="outline"
                                className="flex-1 h-12 rounded-[1.25rem] border-gray-100 text-[10px] font-black uppercase tracking-widest text-gray-500 hover:bg-gray-50"
                                onClick={openEditModal}
                            >
                                Edit Profil
                            </Button>
                            <Link href="/appointments" className="flex-1">
                                <Button
                                    variant="outline"
                                    className="w-full h-12 rounded-[1.25rem] border-gray-100 text-[10px] font-black uppercase tracking-widest text-gray-500 hover:bg-gray-50"
                                >
                                    <Calendar className="h-4 w-4 mr-2" />
                                    Jadual
                                </Button>
                            </Link>
                        </div>
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
