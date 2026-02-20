"use client";

import { Clock, Percent, MoreVertical, Loader2 } from "lucide-react";
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

interface ServiceGridProps {
    loading: boolean;
    services: ServiceWithUI[];
    isAdmin: boolean;
    openEditModal: (service: ServiceWithUI) => void;
    handleToggleActive: (service: ServiceWithUI) => void;
}

export function ServiceGrid({
    loading,
    services,
    isAdmin,
    openEditModal,
    handleToggleActive
}: ServiceGridProps) {
    if (loading) {
        return (
            <div className="py-24 text-center text-gray-400">
                <Loader2 className="h-8 w-8 animate-spin mx-auto mb-4 text-[#2e7d32]/20" />
                <p className="text-[10px] font-black uppercase tracking-widest">Memuatkan Perkhidmatan...</p>
            </div>
        );
    }

    if (services.length === 0) {
        return (
            <div className="py-24 text-center text-gray-400">
                <p className="text-[10px] font-black uppercase tracking-widest">Tiada perkhidmatan dijumpai</p>
            </div>
        );
    }

    return (
        <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-4">
            {services.map((service) => (
                <Card
                    key={service.id}
                    className={`border-none shadow-lg bg-white rounded-2xl overflow-hidden transition-all duration-500 hover:shadow-xl hover:shadow-[#2e7d32]/5 group ${!service.isActive ? "grayscale opacity-60" : ""}`}
                >
                    <CardContent className="p-5">
                        <div className="flex items-start justify-between mb-4">
                            <div className="relative">
                                <img
                                    src={service.image}
                                    alt={service.name}
                                    className="h-12 w-12 rounded-xl object-cover shadow-md group-hover:scale-110 transition-transform duration-500"
                                />
                                <div className="absolute -top-1.5 -right-1.5">
                                    <Badge
                                        variant={service.isActive ? "success" : "default"}
                                        className="h-4 text-[7px] font-black uppercase tracking-widest px-1 rounded-md border-2 border-white"
                                    >
                                        {service.isActive ? "Aktif" : "Arkib"}
                                    </Badge>
                                </div>
                            </div>
                            <button className="h-8 w-8 flex items-center justify-center rounded-lg hover:bg-gray-50 text-gray-300 transition-colors">
                                <MoreVertical className="h-4 w-4" />
                            </button>
                        </div>

                        <div className="mb-4">
                            <div className="flex items-center gap-1.5 mb-1">
                                <p className="text-[9px] font-black text-[#2e7d32] uppercase tracking-[0.2em]">{service.category}</p>
                                {service.promo_id && service.promo_active !== false && (
                                    <span className="bg-orange-500 text-white text-[7px] font-black px-1.5 py-0.5 rounded-full uppercase tracking-wider animate-pulse">
                                        Promosi
                                    </span>
                                )}
                            </div>
                            <h3 className="font-black text-base text-gray-900 tracking-tight leading-tight truncate">{service.name}</h3>
                        </div>

                        <div className="space-y-2.5">
                            <div className="flex items-center justify-between bg-gray-50/50 p-3 rounded-xl border border-gray-100/50">
                                <div>
                                    <p className="text-[7px] font-black text-gray-400 uppercase tracking-widest mb-0.5">Harga Biasa</p>
                                    <p className="text-base font-black text-gray-900 tabular-nums tracking-tighter">{formatCurrency(service.price)}</p>
                                </div>
                                <div className="text-right">
                                    <p className="text-[7px] font-black text-[#2e7d32] uppercase tracking-widest mb-0.5">Ahli (VIP)</p>
                                    <p className="text-base font-black text-[#2e7d32] tabular-nums tracking-tighter">{formatCurrency(service.memberPrice)}</p>
                                </div>
                            </div>

                            {service.promo_id && service.promo_active !== false && service.promo_price != null && (
                                <div className="flex items-center justify-between bg-orange-50 p-3 rounded-xl border border-orange-200/50">
                                    <div>
                                        <p className="text-[7px] font-black text-orange-500 uppercase tracking-widest mb-0.5">Harga Promosi</p>
                                        <p className="text-base font-black text-orange-600 tabular-nums tracking-tighter">{formatCurrency(service.promo_price)}</p>
                                    </div>
                                    <div className="text-right">
                                        <p className="text-[7px] font-black text-gray-400 uppercase tracking-widest mb-0.5">Jimat</p>
                                        <p className="text-sm font-black text-red-500 tabular-nums tracking-tighter">
                                            -{Math.round(((service.price - service.promo_price) / service.price) * 100)}%
                                        </p>
                                    </div>
                                </div>
                            )}

                            <div className="flex items-center justify-between px-1">
                                <div className="flex items-center gap-1.5 text-[9px] font-black text-gray-400 uppercase tracking-widest">
                                    <Clock className="h-3 w-3" />
                                    {service.duration} Min
                                </div>
                                <div className="flex items-center gap-1.5 text-[9px] font-black text-gray-400 uppercase tracking-widest">
                                    <Percent className="h-3 w-3" />
                                    {service.commissionRate}%
                                </div>
                            </div>
                        </div>

                        {isAdmin && (
                            <div className="flex gap-2 mt-4">
                                <Button
                                    variant="outline"
                                    size="sm"
                                    className="flex-1 h-9 rounded-lg border-gray-100 text-[9px] font-black uppercase tracking-widest text-gray-500 hover:bg-gray-50"
                                    onClick={() => openEditModal(service)}
                                >
                                    Kemaskini
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="sm"
                                    className={`flex-1 h-9 rounded-lg text-[9px] font-black uppercase tracking-widest ${service.isActive ? "text-red-400 hover:text-red-500 hover:bg-red-50" : "text-green-500 hover:text-green-600 hover:bg-green-50"}`}
                                    onClick={() => handleToggleActive(service)}
                                >
                                    {service.isActive ? "Arkibkan" : "Aktifkan"}
                                </Button>
                            </div>
                        )}
                    </CardContent>
                </Card>
            ))}
        </div>
    );
}
