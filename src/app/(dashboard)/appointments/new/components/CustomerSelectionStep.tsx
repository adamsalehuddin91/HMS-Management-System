"use client";

import { Search, User, Check, Loader2 } from "lucide-react";
import { Button, Input, Avatar, Badge } from "@/components/ui";
import { Customer } from "@/lib/utils/appointment-utils";

interface CustomerSelectionStepProps {
    isWalkIn: boolean;
    setIsWalkIn: (val: boolean) => void;
    searchCustomer: string;
    setSearchCustomer: (val: string) => void;
    selectedCustomer: Customer | null;
    setSelectedCustomer: (customer: Customer | null) => void;
    walkInName: string;
    setWalkInName: (val: string) => void;
    walkInPhone: string;
    setWalkInPhone: (val: string) => void;
    filteredCustomers: Customer[];
    loading: boolean;
}

export function CustomerSelectionStep({
    isWalkIn,
    setIsWalkIn,
    searchCustomer,
    setSearchCustomer,
    selectedCustomer,
    setSelectedCustomer,
    walkInName,
    setWalkInName,
    walkInPhone,
    setWalkInPhone,
    filteredCustomers,
    loading
}: CustomerSelectionStepProps) {
    return (
        <div className="space-y-6">
            <div className="flex items-center gap-3 mb-2">
                <div className="p-2.5 bg-green-50 rounded-xl">
                    <User className="h-5 w-5 text-[#2e7d32]" />
                </div>
                <div>
                    <h3 className="text-lg font-black text-gray-900">Maklumat Pelanggan</h3>
                    <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Pilih pelanggan sedia ada atau "Walk-in"</p>
                </div>
            </div>

            <div className="flex gap-3 p-1.5 bg-gray-100/50 rounded-2xl">
                <Button
                    variant="ghost"
                    onClick={() => setIsWalkIn(false)}
                    className={`flex-1 h-12 rounded-xl font-black text-xs uppercase tracking-widest transition-all ${!isWalkIn ? "bg-white text-[#2e7d32] shadow-sm" : "text-gray-400 hover:text-gray-600"}`}
                >
                    Existing Customer
                </Button>
                <Button
                    variant="ghost"
                    onClick={() => {
                        setIsWalkIn(true);
                        setSelectedCustomer(null);
                    }}
                    className={`flex-1 h-12 rounded-xl font-black text-xs uppercase tracking-widest transition-all ${isWalkIn ? "bg-white text-[#2e7d32] shadow-sm" : "text-gray-400 hover:text-gray-600"}`}
                >
                    Walk-in
                </Button>
            </div>

            {!isWalkIn ? (
                <div className="space-y-4">
                    <div className="relative group">
                        <Search className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-300 group-focus-within:text-[#2e7d32] transition-colors" />
                        <Input
                            placeholder="Cari nama atau no. telefon..."
                            value={searchCustomer}
                            onChange={(e) => setSearchCustomer(e.target.value)}
                            className="pl-11 h-14 rounded-2xl border-gray-100 bg-gray-50/50 focus:bg-white focus:ring-4 focus:ring-green-50 transition-all font-bold text-gray-900"
                        />
                    </div>

                    <div className="space-y-2 max-h-[300px] overflow-y-auto pr-1 scrollbar-thin scrollbar-thumb-gray-200">
                        {loading ? (
                            <div className="py-12 text-center text-gray-400">
                                <Loader2 className="h-8 w-8 animate-spin mx-auto mb-3" />
                                <p className="font-black text-[10px] uppercase tracking-widest">Memuatkan Senarai...</p>
                            </div>
                        ) : filteredCustomers.length === 0 ? (
                            <div className="py-12 text-center border-2 border-dashed border-gray-100 rounded-3xl">
                                <p className="text-sm font-bold text-gray-400">Tiada pelanggan ditemui.</p>
                            </div>
                        ) : filteredCustomers.map((customer) => (
                            <button
                                key={customer.id}
                                onClick={() => setSelectedCustomer(customer)}
                                className={`w-full p-4 rounded-2xl border transition-all flex items-center gap-4 group ${selectedCustomer?.id === customer.id
                                        ? "border-[#2e7d32] bg-green-50/30 ring-1 ring-[#2e7d32]/5 shadow-lg shadow-green-900/5"
                                        : "border-gray-100 bg-white hover:border-gray-200 hover:bg-gray-50/50"
                                    }`}
                            >
                                <Avatar name={customer.name} className="h-10 w-10 shadow-inner" />
                                <div className="flex-1 text-left min-w-0">
                                    <div className="flex items-center gap-2 mb-0.5">
                                        <span className="font-extrabold text-gray-900 truncate">{customer.name}</span>
                                        <Badge className={`border-none text-[8px] font-black uppercase tracking-tighter ${customer.tier === 'VIP' ? 'bg-amber-100 text-amber-600' :
                                                customer.tier === 'Member' ? 'bg-blue-100 text-blue-600' : 'bg-gray-100 text-gray-400'
                                            }`}>
                                            {customer.tier}
                                        </Badge>
                                    </div>
                                    <p className="text-xs font-bold text-gray-400">{customer.phone}</p>
                                </div>
                                {selectedCustomer?.id === customer.id && (
                                    <div className="h-6 w-6 bg-[#2e7d32] rounded-full flex items-center justify-center shadow-lg shadow-green-100">
                                        <Check className="h-3 w-3 text-white stroke-[4px]" />
                                    </div>
                                )}
                            </button>
                        ))}
                    </div>
                </div>
            ) : (
                <div className="space-y-5 animate-in fade-in slide-in-from-bottom-2">
                    <div className="space-y-2">
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] ml-1">Nama Customer</label>
                        <Input
                            placeholder="Masukkan nama penuh"
                            value={walkInName}
                            onChange={(e) => setWalkInName(e.target.value)}
                            className="h-14 rounded-2xl border-gray-100 bg-gray-50/50 font-bold text-gray-900 focus:bg-white transition-all"
                        />
                    </div>
                    <div className="space-y-2">
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] ml-1">No. Telefon</label>
                        <Input
                            placeholder="Cth: 012-345 6789"
                            value={walkInPhone}
                            onChange={(e) => setWalkInPhone(e.target.value)}
                            className="h-14 rounded-2xl border-gray-100 bg-gray-50/50 font-bold text-gray-900 focus:bg-white transition-all"
                        />
                    </div>
                </div>
            )}
        </div>
    );
}
