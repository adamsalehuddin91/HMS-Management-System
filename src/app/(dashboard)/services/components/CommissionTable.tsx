"use client";

import { Loader2 } from "lucide-react";
import { Card, CardContent, Badge, Button } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface ServiceWithUI {
    id: string;
    name: string;
    description?: string;
    category: string;
    price: number;
    member_price?: number;
    memberPrice: number;
    duration: number;
    commission_rate: number;
    commissionRate: number;
    is_active: boolean;
    isActive: boolean;
    is_point_eligible: boolean;
    image_url?: string;
    image: string;
    created_at: string;
    updated_at: string;
    promo_id?: string;
    promo_price?: number;
    promo_description?: string;
    promo_start_date?: string;
    promo_end_date?: string;
    promo_active?: boolean;
}

interface CommissionTableProps {
    loading: boolean;
    services: ServiceWithUI[];
    isAdmin: boolean;
    openEditModal: (service: ServiceWithUI) => void;
}

export function CommissionTable({
    loading,
    services,
    isAdmin,
    openEditModal
}: CommissionTableProps) {
    return (
        <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
            <CardContent className="p-0">
                <div className="hidden md:block overflow-x-auto">
                    <table className="w-full">
                        <thead>
                            <tr className="bg-gray-50/50">
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Perkhidmatan</th>
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Kategori</th>
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Harga</th>
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Kadar Komisen</th>
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Nilai Komisen</th>
                                {isAdmin && <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Tindakan</th>}
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-gray-50">
                            {loading ? (
                                <tr>
                                    <td colSpan={6} className="py-20 text-center text-gray-400">
                                        <Loader2 className="h-6 w-6 animate-spin mx-auto mb-3 text-[#2e7d32]/20" />
                                        <p className="text-[10px] font-black uppercase tracking-widest">Sila tunggu...</p>
                                    </td>
                                </tr>
                            ) : services.length === 0 ? (
                                <tr>
                                    <td colSpan={6} className="py-20 text-center text-[10px] font-black uppercase tracking-widest text-gray-400">Tiada data dijumpai</td>
                                </tr>
                            ) : (
                                services.map((service) => (
                                    <tr key={service.id} className="group hover:bg-gray-50/50 transition-colors">
                                        <td className="py-5 px-8">
                                            <div className="flex items-center gap-4">
                                                <img
                                                    src={service.image}
                                                    alt={service.name}
                                                    className="h-11 w-11 rounded-xl object-cover shadow-sm group-hover:scale-105 transition-transform"
                                                />
                                                <span className="font-black text-sm text-gray-900 tracking-tight">{service.name}</span>
                                            </div>
                                        </td>
                                        <td className="py-5 px-8">
                                            <Badge className="bg-white border-gray-100 text-gray-400 font-black text-[8px] uppercase tracking-widest px-2 py-0.5 rounded-lg group-hover:border-[#2e7d32]/20 group-hover:text-[#2e7d32] transition-colors">{service.category}</Badge>
                                        </td>
                                        <td className="py-5 px-8 font-black text-sm text-gray-900 tabular-nums">{formatCurrency(service.price)}</td>
                                        <td className="py-5 px-8">
                                            <div className="flex items-center gap-3">
                                                <div className="w-20 h-2 bg-gray-100 rounded-full overflow-hidden">
                                                    <div
                                                        className="h-full bg-gradient-to-r from-[#2e7d32] to-[#4caf50] rounded-full transition-all duration-1000"
                                                        style={{ width: `${Math.min(service.commissionRate * 4, 100)}%` }}
                                                    />
                                                </div>
                                                <span className="font-black text-sm text-[#2e7d32] tabular-nums">{service.commissionRate}%</span>
                                            </div>
                                        </td>
                                        <td className="py-5 px-8 font-black text-sm text-[#2e7d32] tabular-nums">
                                            {formatCurrency(service.price * service.commissionRate / 100)}
                                        </td>
                                        {isAdmin && (
                                            <td className="py-5 px-8">
                                                <Button
                                                    variant="outline"
                                                    size="sm"
                                                    onClick={() => openEditModal(service)}
                                                    className="h-9 px-4 rounded-xl border-gray-100 text-[9px] font-black uppercase tracking-widest text-gray-400 hover:text-[#2e7d32] hover:bg-white hover:border-[#2e7d32]/20 shadow-sm transition-all active:scale-95"
                                                >
                                                    Ubah Kadar
                                                </Button>
                                            </td>
                                        )}
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                </div>

                {/* Mobile View */}
                <div className="md:hidden space-y-4 p-6">
                    {loading ? (
                        <div className="text-center py-12">
                            <Loader2 className="h-6 w-6 animate-spin mx-auto text-[#2e7d32]/20" />
                        </div>
                    ) : services.length === 0 ? (
                        <div className="text-center py-12 text-[10px] font-black uppercase tracking-widest text-gray-400">Tiada perkhidmatan</div>
                    ) : (
                        services.map((service) => (
                            <div key={service.id} className="bg-gray-50/50 p-6 rounded-[2rem] border border-gray-100/50">
                                <div className="flex items-center gap-4 mb-6">
                                    <img
                                        src={service.image}
                                        alt={service.name}
                                        className="h-14 w-14 rounded-2xl object-cover shadow-md"
                                    />
                                    <div>
                                        <h4 className="font-black text-gray-900 tracking-tight">{service.name}</h4>
                                        <Badge className="mt-2 bg-white border-gray-100 text-gray-400 font-black text-[8px] uppercase tracking-widest">{service.category}</Badge>
                                    </div>
                                </div>

                                <div className="space-y-4">
                                    <div className="flex justify-between items-center bg-white p-3 rounded-xl shadow-sm border border-gray-50">
                                        <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Harga Jualan</span>
                                        <span className="font-black text-gray-900 tabular-nums">{formatCurrency(service.price)}</span>
                                    </div>
                                    <div className="flex justify-between items-center bg-white p-3 rounded-xl shadow-sm border border-gray-50">
                                        <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Komisen ({service.commissionRate}%)</span>
                                        <span className="font-black text-[#2e7d32] tabular-nums">
                                            {formatCurrency(service.price * service.commissionRate / 100)}
                                        </span>
                                    </div>
                                    <div className="w-full h-1.5 bg-gray-100 rounded-full overflow-hidden">
                                        <div
                                            className="h-full bg-[#2e7d32] rounded-full transition-all duration-1000"
                                            style={{ width: `${Math.min(service.commissionRate * 4, 100)}%` }}
                                        />
                                    </div>
                                </div>

                                {isAdmin && (
                                    <Button
                                        variant="outline"
                                        size="sm"
                                        className="w-full mt-6 h-11 rounded-xl border-gray-100 text-[10px] font-black uppercase tracking-widest text-gray-400"
                                        onClick={() => openEditModal(service)}
                                    >
                                        Ubah Kadar Komisen
                                    </Button>
                                )}
                            </div>
                        )
                        ))}
                </div>
            </CardContent>
        </Card>
    );
}
