"use client";

import { Scissors, Clock, User, Check, Loader2, Search } from "lucide-react";
import { Avatar, Badge, Input } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { Service, Staff } from "@/lib/utils/appointment-utils";

interface ServiceStaffStepProps {
    services: Service[];
    searchService: string;
    setSearchService: (val: string) => void;
    staff: Staff[];
    selectedService: Service | null;
    setSelectedService: (service: Service | null) => void;
    selectedStaff: Staff | null;
    setSelectedStaff: (staff: Staff | null) => void;
    isMember: boolean;
    loading: boolean;
}

export function ServiceStaffStep({
    services,
    searchService,
    setSearchService,
    staff,
    selectedService,
    setSelectedService,
    selectedStaff,
    setSelectedStaff,
    isMember,
    loading
}: ServiceStaffStepProps) {
    return (
        <div className="space-y-8">
            <div className="flex items-center gap-3">
                <div className="p-2.5 bg-green-50 rounded-xl">
                    <Scissors className="h-5 w-5 text-[#2e7d32]" />
                </div>
                <div>
                    <h3 className="text-lg font-black text-gray-900">Servis & Stylist</h3>
                    <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Pilih khidmat dan staf yang bertugas</p>
                </div>
            </div>

            <div className="space-y-4">
                <div className="flex items-center justify-between">
                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] ml-1">Pilih Servis</label>
                    <div className="relative w-48 md:w-64 group">
                        <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-3.5 w-3.5 text-gray-300 group-focus-within:text-[#2e7d32] transition-colors" />
                        <Input
                            placeholder="Cari servis..."
                            value={searchService}
                            onChange={(e) => setSearchService(e.target.value)}
                            className="pl-9 h-9 text-xs rounded-xl border-gray-100 bg-gray-50/50 focus:bg-white transition-all font-bold text-gray-900"
                        />
                    </div>
                </div>
                <div className="grid grid-cols-1 gap-3 max-h-[250px] overflow-y-auto pr-1 scrollbar-thin scrollbar-thumb-gray-200">
                    {loading ? (
                        <div className="py-8 text-center text-gray-400">
                            <Loader2 className="h-6 w-6 animate-spin mx-auto mb-2" />
                            <p className="text-[10px] font-black uppercase tracking-widest">Loading Services...</p>
                        </div>
                    ) : services.map((service) => {
                        const showMemberPrice = isMember && service.member_price && service.member_price < service.price;
                        const displayPrice = showMemberPrice ? service.member_price : service.price;

                        return (
                            <button
                                key={service.id}
                                onClick={() => setSelectedService(service)}
                                className={`p-4 rounded-2xl border text-left transition-all flex items-center gap-4 group ${selectedService?.id === service.id
                                    ? "border-[#2e7d32] bg-green-50/30 ring-1 ring-[#2e7d32]/5 shadow-lg shadow-green-900/5"
                                    : "border-gray-100 bg-white hover:border-gray-200 hover:bg-gray-50/50"
                                    }`}
                            >
                                <div className={`h-12 w-12 rounded-xl flex items-center justify-center transition-colors shadow-inner ${selectedService?.id === service.id ? "bg-white" : "bg-gray-50"
                                    }`}>
                                    <Scissors className={`h-5 w-5 ${selectedService?.id === service.id ? "text-[#2e7d32]" : "text-gray-300"}`} />
                                </div>
                                <div className="flex-1 min-w-0">
                                    <p className="font-extrabold text-gray-900 truncate">{service.name}</p>
                                    <p className="text-xs font-bold text-gray-400 flex items-center gap-1.5 mt-0.5">
                                        <Clock className="h-3 w-3" />
                                        {service.duration_minutes || 60} minit
                                    </p>
                                </div>
                                <div className="text-right">
                                    <p className="font-black text-[#2e7d32] text-sm">
                                        {formatCurrency(displayPrice!)}
                                    </p>
                                    {showMemberPrice && (
                                        <div className="flex items-center gap-1 justify-end">
                                            <p className="text-[10px] font-bold text-gray-300 line-through">
                                                {formatCurrency(service.price)}
                                            </p>
                                            <Badge className="bg-blue-50 text-blue-600 border-none text-[8px] px-1 py-0 h-3 font-black uppercase tracking-tighter">Member</Badge>
                                        </div>
                                    )}
                                </div>
                            </button>
                        );
                    })}
                </div>
            </div>

            <div className="space-y-4">
                <label className="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] ml-1">Tugaskan Staf</label>
                <div className="grid grid-cols-2 gap-3">
                    {loading ? (
                        <div className="col-span-2 py-8 text-center text-gray-400">
                            <Loader2 className="h-6 w-6 animate-spin mx-auto mb-2" />
                            <p className="text-[10px] font-black uppercase tracking-widest">Loading Staff...</p>
                        </div>
                    ) : staff.map((s) => (
                        <button
                            key={s.id}
                            onClick={() => setSelectedStaff(s)}
                            className={`p-4 rounded-2xl border text-left transition-all flex items-center gap-3 group ${selectedStaff?.id === s.id
                                ? "border-[#2e7d32] bg-green-50/30 ring-1 ring-[#2e7d32]/5 shadow-lg shadow-green-900/5 transition-all active:scale-[0.98]"
                                : "border-gray-100 bg-white hover:border-gray-200 hover:bg-gray-50/50"
                                }`}
                        >
                            <Avatar name={s.name} size="sm" className="h-8 w-8 shadow-inner" />
                            <div className="min-w-0">
                                <p className="font-extrabold text-gray-900 text-xs truncate">{s.name.split(' ')[0]}</p>
                                <p className="text-[10px] font-bold text-gray-400 uppercase tracking-tighter">{s.role}</p>
                            </div>
                            {selectedStaff?.id === s.id && (
                                <div className="ml-auto">
                                    <Check className="h-3 w-3 text-[#2e7d32] stroke-[4px]" />
                                </div>
                            )}
                        </button>
                    ))}
                </div>
            </div>
        </div>
    );
}
