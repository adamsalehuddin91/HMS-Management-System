"use client";

import { MessageSquare, Edit3, Loader2, Minus, Plus, Scissors, User } from "lucide-react";
import { Button, Card, CardContent, Avatar, Badge } from "@/components/ui";
import { format } from "date-fns";
import type { Customer } from "@/types";

interface CustomerDetailViewProps {
    customer: Customer | null;
    loadingLog: boolean;
    activityLog: any[];
    showAllLogs: boolean;
    setShowAllLogs: (show: boolean) => void;
    isAdmin: boolean;
    adjustmentAmount: number;
    setAdjustmentAmount: (amount: number) => void;
    adjustmentReason: string;
    setAdjustmentReason: (reason: string) => void;
    handleUpdateBalance: () => void;
    openEditModal: (customer: Customer) => void;
    isBirthdayToday: (birthday: string | null) => boolean;
    tierColors: Record<string, "default" | "success" | "warning">;
}

export function CustomerDetailView({
    customer,
    loadingLog,
    activityLog,
    showAllLogs,
    setShowAllLogs,
    isAdmin,
    adjustmentAmount,
    setAdjustmentAmount,
    adjustmentReason,
    setAdjustmentReason,
    handleUpdateBalance,
    openEditModal,
    isBirthdayToday,
    tierColors
}: CustomerDetailViewProps) {
    if (!customer) {
        return (
            <div className="flex-1 flex flex-col items-center justify-center text-gray-300">
                <div className="w-24 h-24 bg-gray-50 rounded-[2rem] flex items-center justify-center mb-6">
                    <User className="h-10 w-10 text-gray-200" />
                </div>
                <h3 className="text-xl font-black uppercase tracking-widest">Pilih Pelanggan</h3>
                <p className="text-[10px] font-black uppercase tracking-widest text-gray-400 mt-2">Pilih untuk melihat profil dan log aktiviti</p>
            </div>
        );
    }

    return (
        <div className="flex-1 flex flex-col gap-6 lg:h-full lg:overflow-y-auto pr-2 custom-scrollbar pb-6">
            {/* Summary Card */}
            <Card className="border-none shadow-xl bg-white rounded-2xl overflow-hidden">
                <div className="bg-gradient-to-r from-[#2e7d32] to-[#4caf50] h-16 relative">
                    <div className="absolute -bottom-8 left-6">
                        <Avatar name={customer.name} className="h-16 w-16 border-4 border-white shadow-xl text-xl font-black" />
                    </div>
                    <div className="absolute top-6 right-8 flex gap-2">
                        <Button
                            variant="secondary"
                            size="sm"
                            className="bg-white/20 backdrop-blur-md border border-white/20 text-white hover:bg-white/30 rounded-xl h-9 w-9 p-0"
                            onClick={() => openEditModal(customer)}
                        >
                            <Edit3 className="h-4 w-4" />
                        </Button>
                    </div>
                </div>
                <CardContent className="pt-10 pb-5 px-6">
                    <div className="flex flex-col md:flex-row md:items-end justify-between gap-4">
                        <div>
                            <div className="flex items-center gap-3 mb-1.5">
                                <h2 className="text-2xl font-black text-gray-900 tracking-tighter">{customer.name}</h2>
                                <Badge
                                    variant={tierColors[customer.tier] || "default"}
                                    className="uppercase font-black tracking-[0.15em] text-[9px] px-2.5 py-1 rounded-lg border-none"
                                >
                                    {customer.tier} TIER
                                </Badge>
                                {isBirthdayToday((customer as any).birthday) && (
                                    <span className="text-3xl animate-bounce">🎂</span>
                                )}
                            </div>
                            <p className="text-xs text-gray-400 font-bold uppercase tracking-widest flex flex-wrap gap-x-6 gap-y-2">
                                <span className="flex items-center gap-2">📱 {customer.phone}</span>
                                {customer.email && <span className="flex items-center gap-2">📧 {customer.email}</span>}
                            </p>
                        </div>

                        <div className="flex gap-3">
                            <div className="bg-gray-50/80 px-4 py-3 rounded-xl border border-gray-100 text-center min-w-[100px]">
                                <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest mb-0.5">Point Terkumpul</p>
                                <p className="text-xl font-black text-[#2e7d32] tabular-nums tracking-tighter">{customer.points_balance.toLocaleString()}</p>
                            </div>
                            <div className="bg-gray-50/80 px-4 py-3 rounded-xl border border-gray-100 text-center min-w-[100px]">
                                <p className="text-[8px] font-black text-gray-400 uppercase tracking-widest mb-0.5">Jumlah Jualan</p>
                                <p className="text-xl font-black text-gray-900 tabular-nums tracking-tighter">RM {customer.total_spent?.toLocaleString()}</p>
                            </div>
                        </div>
                    </div>

                    {(customer as any).notes && (
                        <div className="mt-5 p-4 bg-orange-50/50 border border-orange-100/50 rounded-xl relative overflow-hidden group">
                            <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:scale-125 transition-transform">
                                <MessageSquare className="h-10 w-10 text-orange-400" />
                            </div>
                            <p className="text-[10px] font-black text-orange-400 uppercase tracking-widest mb-2 flex items-center gap-2">
                                <MessageSquare className="h-3.5 w-3.5" /> Nota Pelanggan
                            </p>
                            <p className="text-sm text-orange-900/80 font-bold italic leading-relaxed">"{(customer as any).notes}"</p>
                        </div>
                    )}
                </CardContent>
            </Card>

            <div className="flex flex-col xl:flex-row gap-6">
                {/* Activity Log */}
                <div className="flex-1">
                    <div className="flex items-center justify-between mb-6 px-4">
                        <h3 className="text-sm font-black uppercase tracking-widest text-gray-900 flex items-center gap-3">
                            <div className="w-1.5 h-1.5 bg-[#2e7d32] rounded-full shadow-[0_0_8px_rgba(46,125,50,0.5)]" />
                            Log Aktiviti
                        </h3>
                        {activityLog.length > 5 && (
                            <Button
                                variant="ghost"
                                size="sm"
                                className="h-8 rounded-lg text-[10px] font-black uppercase tracking-widest text-[#2e7d32] hover:bg-[#2e7d32]/5"
                                onClick={() => setShowAllLogs(!showAllLogs)}
                            >
                                {showAllLogs ? "Lihat Ringkas" : `Semua Rekod (${activityLog.length})`}
                            </Button>
                        )}
                    </div>

                    <div className="space-y-4">
                        {loadingLog ? (
                            <div className="py-16 text-center">
                                <Loader2 className="h-6 w-6 animate-spin mx-auto text-[#2e7d32]/20" />
                            </div>
                        ) : activityLog.length === 0 ? (
                            <Card className="py-20 text-center border-dashed border shadow-none border-gray-200 bg-transparent rounded-[2rem]">
                                <p className="text-[10px] font-black uppercase tracking-widest text-gray-400">Tiada rekod aktiviti setakat ini</p>
                            </Card>
                        ) : (
                            (showAllLogs ? activityLog : activityLog.slice(0, 8)).map((item) => (
                                <Card key={item.id} className="border-none shadow-md shadow-gray-200/50 bg-white rounded-xl overflow-hidden group transition-all duration-300 hover:shadow-lg hover:shadow-gray-200">
                                    <div className="p-3.5 flex items-start gap-3">
                                        <div className={`h-9 w-9 rounded-xl flex items-center justify-center shrink-0 border transition-all duration-500 group-hover:rotate-12 ${item.type === "earned" ? "bg-green-50 border-green-100/50 text-green-600" :
                                            item.type === "redeemed" ? "bg-red-50 border-red-100/50 text-red-600" :
                                                "bg-blue-50 border-blue-100/50 text-blue-600"
                                            }`}>
                                            {item.type === "earned" ? <Plus className="h-4 w-4" /> :
                                                item.type === "redeemed" ? <Minus className="h-4 w-4" /> :
                                                    <Edit3 className="h-4 w-4" />}
                                        </div>
                                        <div className="flex-1 min-w-0">
                                            <div className="flex justify-between items-start mb-1">
                                                <p className={`text-base font-black tracking-tighter ${item.points > 0 ? "text-green-600" :
                                                    item.points < 0 ? "text-red-600" : "text-blue-600"
                                                    }`}>
                                                    {item.points > 0 ? "+" : ""}{item.points.toLocaleString()} Points
                                                </p>
                                                <span className="text-[10px] font-black text-gray-400 uppercase tabular-nums tracking-widest">
                                                    {format(new Date(item.created_at), 'd MMM, HH:mm')}
                                                </span>
                                            </div>
                                            <p className="text-xs font-bold text-gray-500 uppercase tracking-tight leading-relaxed">{item.reason}</p>
                                        </div>
                                    </div>

                                    {/* Nested Service Details */}
                                    {item.services && item.services.length > 0 && (
                                        <div className="px-5 pb-5">
                                            <div className="bg-gray-50/80 rounded-2xl p-4 space-y-3 border border-gray-100">
                                                {item.services.map((service: any, idx: number) => (
                                                    <div key={idx} className="flex items-center justify-between text-xs">
                                                        <div className="flex items-center gap-3">
                                                            <div className="w-2 h-2 rounded-full bg-[#2e7d32] shadow-sm" />
                                                            <span className="font-black text-gray-800 tracking-tight">{service.name}</span>
                                                            <Badge variant="default" className="text-[8px] h-4 bg-white border-gray-100 text-gray-400 px-1.5 font-bold tracking-widest uppercase">
                                                                {service.stylist}
                                                            </Badge>
                                                        </div>
                                                        <span className="font-black text-gray-900 tabular-nums">RM {service.amount?.toFixed(2)}</span>
                                                    </div>
                                                ))}
                                            </div>
                                        </div>
                                    )}
                                </Card>
                            ))
                        )}
                    </div>
                </div>

                {/* Admin Control Panel */}
                {isAdmin && (
                    <Card className="w-full xl:w-72 shrink-0 border-none shadow-xl bg-white rounded-2xl self-start sticky top-6">
                        <CardContent className="p-5">
                            <div className="flex items-center gap-2.5 mb-5">
                                <div className="h-8 w-8 rounded-lg bg-[#2e7d3210] flex items-center justify-center shadow-inner">
                                    <Scissors className="h-4 w-4 text-[#2e7d32]" />
                                </div>
                                <h3 className="font-black uppercase tracking-tight text-[#2e7d32] text-sm">
                                    Pelarasan Point
                                </h3>
                            </div>

                            <div className="space-y-5">
                                <div>
                                    <label className="block text-[9px] font-black text-gray-400 uppercase tracking-widest mb-2.5">
                                        Jumlah Pelarasan
                                    </label>
                                    <div className="flex items-center gap-3 bg-gray-50/50 p-2 rounded-xl border border-gray-100">
                                        <button
                                            onClick={() => setAdjustmentAmount(adjustmentAmount - 10)}
                                            className="h-9 w-9 rounded-lg bg-white shadow-sm flex items-center justify-center hover:bg-red-50 hover:text-red-500 transition-all active:scale-95"
                                        >
                                            <Minus className="h-4 w-4" />
                                        </button>
                                        <input
                                            type="number"
                                            value={adjustmentAmount}
                                            onChange={(e) => setAdjustmentAmount(Number(e.target.value))}
                                            className="flex-1 w-full text-center text-2xl font-black bg-transparent outline-none tabular-nums tracking-tighter"
                                        />
                                        <button
                                            onClick={() => setAdjustmentAmount(adjustmentAmount + 10)}
                                            className="h-9 w-9 rounded-lg bg-white shadow-sm flex items-center justify-center hover:bg-green-50 hover:text-green-500 transition-all active:scale-95"
                                        >
                                            <Plus className="h-4 w-4" />
                                        </button>
                                    </div>
                                    <p className="text-[9px] text-gray-400 text-center mt-3 font-black uppercase tracking-[0.1em]">
                                        Negatif: Tolak • Positif: Bonus
                                    </p>
                                </div>

                                <div>
                                    <label className="block text-[9px] font-black text-gray-400 uppercase tracking-widest mb-2">
                                        Sebab Pelarasan
                                    </label>
                                    <select
                                        value={adjustmentReason}
                                        onChange={(e) => setAdjustmentReason(e.target.value)}
                                        className="w-full h-10 px-4 bg-gray-50/50 border border-gray-100 rounded-xl focus:outline-none focus:ring-2 focus:ring-[#2e7d32]/10 font-bold text-xs transition-all appearance-none"
                                    >
                                        <option>Referral Bonus</option>
                                        <option>Birthday Bonus</option>
                                        <option>Correction</option>
                                        <option>Promotion</option>
                                        <option>Other</option>
                                    </select>
                                </div>

                                <div className="pt-2 space-y-3">
                                    <Button
                                        className="w-full h-11 rounded-xl font-black uppercase tracking-[0.15em] text-[10px] shadow-lg shadow-green-100 bg-[#2e7d32] hover:bg-[#1b5e20] transition-all active:scale-95"
                                        onClick={handleUpdateBalance}
                                    >
                                        Sahkan Pelarasan
                                    </Button>
                                    <button
                                        className="w-full py-2 text-[10px] font-black uppercase tracking-widest text-gray-400 hover:text-[#2e7d32] transition-colors"
                                        onClick={() => {
                                            setAdjustmentAmount(100);
                                            setAdjustmentReason("Referral Bonus");
                                        }}
                                    >
                                        Set Semula Borang
                                    </button>
                                </div>
                            </div>

                            <div className="mt-6 p-3.5 bg-blue-50/30 rounded-xl border border-blue-100/50">
                                <p className="text-[9px] text-blue-600 font-black leading-relaxed tracking-wide">
                                    ⓘ Perhatian: Setiap pelarasan akan direkodkan bersama ID admin dan boleh disemak dalam laporan audit.
                                </p>
                            </div>
                        </CardContent>
                    </Card>
                )}
            </div>
        </div>
    );
}
