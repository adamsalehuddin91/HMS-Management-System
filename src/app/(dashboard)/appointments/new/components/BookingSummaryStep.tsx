"use client";

import { User, Scissors, Calendar as CalendarIcon, Clock, Check, AlertCircle } from "lucide-react";
import { Card, CardContent, Badge } from "@/components/ui";
import { format } from "date-fns";
import { formatCurrency } from "@/lib/utils";
import { Service, Staff, Customer } from "@/lib/utils/appointment-utils";

interface BookingSummaryStepProps {
    selectedCustomer: Customer | null;
    walkInName: string;
    walkInPhone: string;
    selectedService: Service | null;
    selectedStaff: Staff | null;
    selectedDate: Date | null;
    selectedTime: string | null;
    notes: string;
    setNotes: (val: string) => void;
    requireDeposit: boolean;
    setRequireDeposit: (val: boolean) => void;
    servicePrice: number;
    depositAmount: number;
}

export function BookingSummaryStep({
    selectedCustomer,
    walkInName,
    walkInPhone,
    selectedService,
    selectedStaff,
    selectedDate,
    selectedTime,
    notes,
    setNotes,
    requireDeposit,
    setRequireDeposit,
    servicePrice,
    depositAmount
}: BookingSummaryStepProps) {
    const customerName = selectedCustomer?.name || walkInName;
    const customerPhone = selectedCustomer?.phone || walkInPhone;

    return (
        <div className="space-y-6">
            <div className="flex items-center gap-3">
                <div className="p-2.5 bg-green-50 rounded-xl">
                    <Check className="h-5 w-5 text-[#2e7d32]" />
                </div>
                <div>
                    <h3 className="text-lg font-black text-gray-900">Sahkan Temujanji</h3>
                    <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Semak butiran sebelum pengesahan</p>
                </div>
            </div>

            <Card className="border-none shadow-xl bg-white ring-1 ring-black/[0.05] rounded-[2rem] overflow-hidden">
                <div className="h-2 bg-gradient-to-r from-[#2e7d32] to-[#4caf50]" />
                <CardContent className="p-8 space-y-8">

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                        {/* Summary Blocks */}
                        <div className="bg-gray-50/50 p-5 rounded-3xl border border-gray-100 flex items-start gap-4">
                            <div className="p-3 bg-white rounded-2xl shadow-sm">
                                <User className="h-5 w-5 text-[#2e7d32]" />
                            </div>
                            <div className="min-w-0">
                                <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Pelanggan</p>
                                <p className="font-extrabold text-gray-900 truncate">{customerName}</p>
                                <p className="text-xs font-bold text-gray-400">{customerPhone}</p>
                            </div>
                        </div>

                        <div className="bg-gray-50/50 p-5 rounded-3xl border border-gray-100 flex items-start gap-4">
                            <div className="p-3 bg-white rounded-2xl shadow-sm">
                                <Scissors className="h-5 w-5 text-[#2e7d32]" />
                            </div>
                            <div className="min-w-0">
                                <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Servis</p>
                                <p className="font-extrabold text-gray-900 truncate">{selectedService?.name}</p>
                                <p className="text-xs font-bold text-[#2e7d32]">{formatCurrency(servicePrice)}</p>
                            </div>
                        </div>

                        <div className="bg-gray-50/50 p-5 rounded-3xl border border-gray-100 flex items-start gap-4">
                            <div className="p-3 bg-white rounded-2xl shadow-sm">
                                <CalendarIcon className="h-5 w-5 text-[#2e7d32]" />
                            </div>
                            <div className="min-w-0">
                                <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Tarikh & Masa</p>
                                <p className="font-extrabold text-gray-900 truncate">
                                    {selectedDate ? format(selectedDate, 'dd MMM yyyy') : '-'}
                                </p>
                                <p className="text-xs font-bold text-gray-400">Pukul {selectedTime}</p>
                            </div>
                        </div>

                        <div className="bg-gray-50/50 p-5 rounded-3xl border border-gray-100 flex items-start gap-4">
                            <div className="p-3 bg-white rounded-2xl shadow-sm">
                                <Clock className="h-5 w-5 text-[#2e7d32]" />
                            </div>
                            <div className="min-w-0">
                                <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Stylist</p>
                                <p className="font-extrabold text-gray-900 truncate">{selectedStaff?.name}</p>
                                <p className="text-xs font-bold text-gray-400 uppercase tracking-tighter">{selectedStaff?.role}</p>
                            </div>
                        </div>
                    </div>

                    <div className="space-y-4">
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] ml-1">Nota / Permintaan</label>
                        <textarea
                            value={notes}
                            onChange={(e) => setNotes(e.target.value)}
                            placeholder="Tulis sebarang nota tambahan di sini..."
                            className="w-full p-5 bg-gray-50 border-gray-100 rounded-[2rem] h-32 text-sm font-bold text-gray-700 focus:bg-white focus:ring-4 focus:ring-green-50 transition-all outline-none resize-none placeholder:text-gray-300"
                        />
                    </div>

                    <div className="p-6 bg-gray-900 rounded-[2rem] text-white shadow-xl flex items-center justify-between group overflow-hidden relative">
                        <div className="absolute top-0 right-0 w-32 h-32 bg-white/5 rounded-full -mr-16 -mt-16 blur-2xl group-hover:bg-white/10 transition-all" />
                        <div className="relative z-10">
                            <div className="flex items-center gap-2 mb-1">
                                <p className="text-[10px] font-black text-green-400 uppercase tracking-widest">Deposit Diperlukan</p>
                                <AlertCircle className="h-3 w-3 text-green-400/50" />
                            </div>
                            <p className="text-sm font-bold text-gray-400">25% daripada jumlah harga</p>
                        </div>
                        <div className="flex items-center gap-4 relative z-10">
                            <div className="text-right">
                                <p className="text-2xl font-black tracking-tighter">{formatCurrency(depositAmount)}</p>
                            </div>
                            <button
                                onClick={() => setRequireDeposit(!requireDeposit)}
                                className={`w-14 h-8 rounded-2xl transition-all p-1 ${requireDeposit ? "bg-[#2e7d32]" : "bg-gray-700"
                                    }`}
                            >
                                <div className={`h-6 w-6 rounded-xl bg-white shadow-lg transition-transform ${requireDeposit ? "translate-x-6" : "translate-x-0"
                                    }`} />
                            </button>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
