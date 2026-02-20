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
        <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
            {services.map((service) => (
                <Card
                    key={service.id}
                    className={`border-none shadow-xl bg-white rounded-[2rem] overflow-hidden transition-all duration-500 hover:shadow-2xl hover:shadow-[#2e7d32]/5 group ${!service.isActive ? "grayscale opacity-60" : ""}`}
                >
                    <CardContent className="p-8">
                        <div className="flex items-start justify-between mb-8">
                            <div className="relative">
                                <img
                                    src={service.image}
                                    alt={service.name}
                                    className="h-16 w-16 rounded-2xl object-cover shadow-lg group-hover:scale-110 transition-transform duration-500"
                                />
                                <div className="absolute -top-2 -right-2">
                                    <Badge
                                        variant={service.isActive ? "success" : "default"}
                                        className="h-5 text-[8px] font-black uppercase tracking-widest px-1.5 rounded-lg border-2 border-white"
                                    >
                                        {service.isActive ? "Aktif" : "Arkib"}
                                    </Badge>
                                </div>
                            </div>
                            <button className="h-10 w-10 flex items-center justify-center rounded-xl hover:bg-gray-50 text-gray-300 transition-colors">
                                <MoreVertical className="h-5 w-5" />
                            </button>
                        </div>

                        <div className="mb-8">
                            <p className="text-[10px] font-black text-[#2e7d32] uppercase tracking-[0.2em] mb-1.5">{service.category}</p>
                            <h3 className="font-black text-xl text-gray-900 tracking-tight leading-tight">{service.name}</h3>
                        </div>

                        <div className="space-y-4">
                            <div className="flex items-center justify-between bg-gray-50/50 p-4 rounded-2xl border border-gray-100/50">
                                <div>
                                    <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest mb-0.5">Harga Biasa</p>
                                    <p className="text-xl font-black text-gray-900 tabular-nums tracking-tighter">{formatCurrency(service.price)}</p>
                                </div>
                                <div className="text-right">
                                    <p className="text-[8px] font-black text-[#2e7d32] uppercase tracking-widest mb-0.5">Ahli (VIP)</p>
                                    <p className="text-xl font-black text-[#2e7d32] tabular-nums tracking-tighter">{formatCurrency(service.memberPrice)}</p>
                                </div>
                            </div>

                            <div className="flex items-center justify-between px-2">
                                <div className="flex items-center gap-2 text-[10px] font-black text-gray-400 uppercase tracking-widest">
                                    <Clock className="h-3.5 w-3.5" />
                                    {service.duration} Minit
                                </div>
                                <div className="flex items-center gap-2 text-[10px] font-black text-gray-400 uppercase tracking-widest">
                                    <Percent className="h-3.5 w-3.5" />
                                    {service.commissionRate}% Komisen
                                </div>
                            </div>
                        </div>

                        {isAdmin && (
                            <div className="flex gap-3 mt-8">
                                <Button
                                    variant="outline"
                                    size="sm"
                                    className="flex-1 h-11 rounded-xl border-gray-100 text-[10px] font-black uppercase tracking-widest text-gray-500 hover:bg-gray-50"
                                    onClick={() => openEditModal(service)}
                                >
                                    Kemaskini
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="sm"
                                    className={`flex-1 h-11 rounded-xl text-[10px] font-black uppercase tracking-widest ${service.isActive ? "text-red-400 hover:text-red-500 hover:bg-red-50" : "text-green-500 hover:text-green-600 hover:bg-green-50"}`}
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
