"use client";

import { Check, Calendar as CalendarIcon, User, Scissors, Clock, ArrowRight } from "lucide-react";
import { Button, Card, CardContent, Badge } from "@/components/ui";
import { format } from "date-fns";
import { formatCurrency } from "@/lib/utils";
import { Service, Staff, Customer } from "@/lib/utils/appointment-utils";

interface BookingCompleteViewProps {
    selectedCustomer: Customer | null;
    walkInName: string;
    selectedService: Service | null;
    selectedStaff: Staff | null;
    selectedDate: Date | null;
    selectedTime: string | null;
    depositAmount: number;
    requireDeposit: boolean;
    onReset: () => void;
    onGoToCalendar: () => void;
}

export function BookingCompleteView({
    selectedCustomer,
    walkInName,
    selectedService,
    selectedStaff,
    selectedDate,
    selectedTime,
    depositAmount,
    requireDeposit,
    onReset,
    onGoToCalendar
}: BookingCompleteViewProps) {
    return (
        <div className="min-h-[70vh] flex items-center justify-center animate-in fade-in zoom-in duration-500">
            <Card className="w-full max-w-lg border-none shadow-2xl bg-white rounded-[3rem] overflow-hidden">
                <div className="h-4 bg-gradient-to-r from-green-400 via-[#2e7d32] to-green-600" />
                <CardContent className="p-10 text-center">
                    <div className="relative mx-auto mb-10">
                        <div className="h-24 w-24 rounded-[2rem] bg-green-50 flex items-center justify-center mx-auto ring-8 ring-green-50/50">
                            <Check className="h-12 w-12 text-[#2e7d32] stroke-[3px]" />
                        </div>
                        <div className="absolute -bottom-2 -right-2 h-8 w-8 bg-green-500 rounded-full border-4 border-white flex items-center justify-center animate-bounce">
                            <Check className="h-3 w-3 text-white stroke-[4px]" />
                        </div>
                    </div>

                    <h2 className="text-3xl font-black text-gray-900 mb-2">Tempahan Berjaya!</h2>
                    <p className="text-sm font-bold text-gray-400 mb-10">Maklumat temujanji telah direkodkan ke dalam kalendar</p>

                    <div className="bg-gray-50/80 backdrop-blur-sm rounded-[2.5rem] p-8 mb-10 text-left space-y-6 border border-gray-100 shadow-inner">
                        <div className="flex justify-between items-center group">
                            <div className="flex items-center gap-3">
                                <div className="p-2 bg-white rounded-xl shadow-sm group-hover:bg-green-50 transition-colors">
                                    <User className="h-4 w-4 text-[#2e7d32]" />
                                </div>
                                <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Pelanggan</span>
                            </div>
                            <span className="text-sm font-extrabold text-gray-800">{selectedCustomer?.name || walkInName}</span>
                        </div>

                        <div className="flex justify-between items-center group">
                            <div className="flex items-center gap-3">
                                <div className="p-2 bg-white rounded-xl shadow-sm group-hover:bg-green-50 transition-colors">
                                    <Scissors className="h-4 w-4 text-[#2e7d32]" />
                                </div>
                                <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Servis</span>
                            </div>
                            <span className="text-sm font-extrabold text-gray-800">{selectedService?.name}</span>
                        </div>

                        <div className="flex justify-between items-center group">
                            <div className="flex items-center gap-3">
                                <div className="p-2 bg-white rounded-xl shadow-sm group-hover:bg-green-50 transition-colors">
                                    <CalendarIcon className="h-4 w-4 text-[#2e7d32]" />
                                </div>
                                <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Waktu</span>
                            </div>
                            <span className="text-sm font-extrabold text-gray-800">
                                {selectedDate ? format(selectedDate, 'dd MMM') : ''} @ {selectedTime}
                            </span>
                        </div>

                        <div className="flex justify-between items-center group">
                            <div className="flex items-center gap-3">
                                <div className="p-2 bg-white rounded-xl shadow-sm group-hover:bg-green-50 transition-colors">
                                    <Clock className="h-4 w-4 text-[#2e7d32]" />
                                </div>
                                <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Stylist</span>
                            </div>
                            <span className="text-sm font-extrabold text-gray-800">{selectedStaff?.name}</span>
                        </div>

                        {requireDeposit && (
                            <div className="flex justify-between items-center pt-5 border-t border-gray-200/50">
                                <div className="flex items-center gap-3">
                                    <div className="p-2 bg-[#2e7d32]/10 rounded-xl">
                                        <Check className="h-4 w-4 text-[#2e7d32]" />
                                    </div>
                                    <span className="text-[10px] font-black text-[#2e7d32] uppercase tracking-widest">Deposit Diperlukan</span>
                                </div>
                                <span className="text-lg font-black text-[#2e7d32]">{formatCurrency(depositAmount)}</span>
                            </div>
                        )}
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <Button
                            className="h-16 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] text-white font-black text-sm uppercase tracking-widest shadow-xl shadow-green-900/10 group transition-all active:scale-95"
                            onClick={onReset}
                        >
                            Tempahan Baru
                            <ArrowRight className="h-4 w-4 ml-2 group-hover:translate-x-1 transition-transform" />
                        </Button>
                        <Button
                            variant="ghost"
                            className="h-16 rounded-2xl border-2 border-gray-100 font-black text-sm uppercase tracking-widest text-gray-400 hover:text-gray-600 hover:bg-gray-50 transition-all active:scale-95"
                            onClick={onGoToCalendar}
                        >
                            Ke Kalendar
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
