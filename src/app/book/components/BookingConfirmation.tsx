"use client";

import { motion } from "framer-motion";
import { Scissors, Clock, Calendar, User, MapPin } from "lucide-react";
import { Card, CardContent, Badge } from "@/components/ui";
import { format } from "date-fns";
import { ms } from "date-fns/locale/ms";
import { formatCurrency } from "@/lib/utils";
import { Service, Staff, BusinessInfo } from "@/lib/utils/booking-utils";

interface BookingConfirmationProps {
    selectedService: Service | null;
    selectedDate: Date | null;
    selectedTime: string | null;
    selectedStaff: Staff | null;
    customerName: string;
    customerPhone: string;
    customerNotes: string;
    businessInfo: BusinessInfo;
    existingCustomer: { id: string, name: string, tier: string } | null;
}

export function BookingConfirmation({
    selectedService,
    selectedDate,
    selectedTime,
    selectedStaff,
    customerName,
    customerPhone,
    customerNotes,
    businessInfo,
    existingCustomer
}: BookingConfirmationProps) {
    return (
        <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0, scale: 1.05 }}
            className="space-y-6"
        >
            <h2 className="text-2xl font-bold text-gray-800 text-center mb-6">Sahkan Tempahan</h2>

            <Card className="overflow-hidden border-none shadow-xl bg-white ring-1 ring-black/[0.05]">
                <div className="h-2 bg-gradient-to-r from-[#2e7d32] via-[#4caf50] to-[#2e7d32]" />
                <CardContent className="p-6 space-y-6">

                    {/* Service Summary Header */}
                    <div className="flex items-start gap-4 pb-6 border-b border-gray-100">
                        <div className="w-20 h-20 bg-gradient-to-br from-[#f1f8f1] to-[#e8f5e9] rounded-2xl flex items-center justify-center shadow-inner flex-shrink-0 border border-green-50 overflow-hidden">
                            {selectedService?.image_url ? (
                                <img
                                    src={selectedService.image_url}
                                    alt={selectedService.name}
                                    className="w-full h-full object-cover"
                                />
                            ) : (
                                <Scissors className="h-8 w-8 text-[#2e7d32]" />
                            )}
                        </div>
                        <div className="flex-1 min-w-0">
                            <p className="text-[10px] font-bold text-[#2e7d32] uppercase tracking-[0.2em] mb-1">
                                {selectedService?.category || 'Servis'}
                            </p>
                            <h3 className="text-xl font-extrabold text-gray-900 leading-tight mb-1">
                                {selectedService?.name}
                            </h3>
                            <div className="flex items-center text-gray-400 text-xs font-medium">
                                <Clock className="w-3.5 h-3.5 mr-1" />
                                {selectedService?.duration || 60} minit
                            </div>
                        </div>
                        <div className="text-right">
                            {selectedService?.promo_active && selectedService?.promo_price != null ? (
                                <>
                                    <p className="text-sm text-gray-400 line-through">{formatCurrency(selectedService.price)}</p>
                                    <p className="text-2xl font-black text-orange-600">{formatCurrency(selectedService.promo_price)}</p>
                                </>
                            ) : (
                                <p className="text-2xl font-black text-[#2e7d32]">
                                    {formatCurrency(selectedService?.price || 0)}
                                </p>
                            )}
                        </div>
                    </div>

                    {/* Booking Details Grid */}
                    <div className="grid gap-4 sm:grid-cols-2">
                        <div className="bg-[#fcfdfc] p-4 rounded-2xl border border-green-50/50">
                            <div className="flex items-center gap-3 mb-2">
                                <div className="p-2 bg-white rounded-xl shadow-sm border border-green-50">
                                    <Calendar className="h-4 w-4 text-[#2e7d32]" />
                                </div>
                                <span className="text-[10px] text-gray-400 font-bold uppercase tracking-wider">Tarikh</span>
                            </div>
                            <p className="font-bold text-gray-800 ml-11">
                                {selectedDate ? format(selectedDate, 'EEEE, dd MMM yyyy', { locale: ms }) : '-'}
                            </p>
                        </div>

                        <div className="bg-[#fcfdfc] p-4 rounded-2xl border border-green-50/50">
                            <div className="flex items-center gap-3 mb-2">
                                <div className="p-2 bg-white rounded-xl shadow-sm border border-green-50">
                                    <Clock className="h-4 w-4 text-[#2e7d32]" />
                                </div>
                                <span className="text-[10px] text-gray-400 font-bold uppercase tracking-wider">Masa</span>
                            </div>
                            <p className="font-bold text-gray-800 ml-11">
                                {selectedTime || '-'}
                            </p>
                        </div>

                        <div className="bg-[#fcfdfc] p-4 rounded-2xl border border-green-50/50">
                            <div className="flex items-center gap-3 mb-2">
                                <div className="p-2 bg-white rounded-xl shadow-sm border border-green-50">
                                    <User className="h-4 w-4 text-[#2e7d32]" />
                                </div>
                                <span className="text-[10px] text-gray-400 font-bold uppercase tracking-wider">Stylist</span>
                            </div>
                            <p className="font-bold text-gray-800 ml-11">
                                {selectedStaff?.name || 'Sesiapa tersedia'}
                            </p>
                        </div>

                        <div className="bg-[#fcfdfc] p-4 rounded-2xl border border-green-50/50">
                            <div className="flex items-center gap-3 mb-2">
                                <div className="p-2 bg-white rounded-xl shadow-sm border border-green-50">
                                    <MapPin className="h-4 w-4 text-[#2e7d32]" />
                                </div>
                                <span className="text-[10px] text-gray-400 font-bold uppercase tracking-wider">Lokasi</span>
                            </div>
                            <p className="font-bold text-gray-800 ml-11 line-clamp-1">
                                {businessInfo.name}
                            </p>
                        </div>
                    </div>

                    {/* Customer Details */}
                    <div className="pt-4 border-t border-dashed border-gray-100">
                        <h4 className="text-xs font-bold text-gray-400 uppercase tracking-widest mb-4 flex items-center gap-2">
                            <div className="w-1.5 h-1.5 rounded-full bg-[#2e7d32]"></div>
                            Maklumat Pelanggan
                        </h4>
                        <div className="bg-gray-50/50 border border-gray-100 rounded-2xl p-5 relative overflow-hidden">
                            <div className="flex items-start justify-between relative z-10">
                                <div>
                                    <p className="text-lg font-extrabold text-gray-900">{customerName}</p>
                                    <p className="text-sm font-semibold text-gray-400 mt-1">{customerPhone}</p>
                                </div>
                                {existingCustomer && (
                                    <Badge className="bg-[#2e7d32] text-white hover:bg-[#1b5e20] border-none px-4 py-1.5 rounded-full text-[10px] font-black tracking-tighter uppercase">
                                        {existingCustomer.tier} Member
                                    </Badge>
                                )}
                            </div>
                            {customerNotes && (
                                <div className="mt-4 pt-4 border-t border-gray-200/50">
                                    <p className="text-[9px] font-black text-gray-300 uppercase tracking-[0.2em] mb-2">Nota Permintaan</p>
                                    <p className="text-sm text-gray-600 italic bg-white/50 p-4 rounded-xl border border-gray-100 leading-relaxed shadow-sm">
                                        "{customerNotes}"
                                    </p>
                                </div>
                            )}
                        </div>
                    </div>

                    {/* Total Summary */}
                    <div className="mt-2 pt-6 border-t border-gray-100 flex items-center justify-between">
                        <span className="text-gray-400 font-extrabold text-sm uppercase tracking-widest">Jumlah Anggaran</span>
                        <div className="text-right">
                            {selectedService?.promo_active && selectedService?.promo_price != null ? (
                                <div>
                                    <span className="text-lg text-gray-400 line-through mr-2">
                                        {formatCurrency(selectedService.price)}
                                    </span>
                                    <span className="text-4xl font-black text-orange-600 tracking-tighter">
                                        {formatCurrency(selectedService.promo_price)}
                                    </span>
                                </div>
                            ) : (
                                <span className="text-4xl font-black text-[#2e7d32] tracking-tighter">
                                    {formatCurrency(selectedService?.price || 0)}
                                </span>
                            )}
                        </div>
                    </div>

                </CardContent>
            </Card>

            <div className="text-center space-y-4 pt-4">
                <p className="text-xs text-gray-400 leading-relaxed max-w-[280px] mx-auto">
                    Dengan menekan butang bawah, anda bersetuju dengan
                    <span className="text-[#2e7d32] font-bold cursor-pointer hover:underline mx-1 underline-offset-2">Terma & Syarat</span>
                    Tempahan HMS Salon.
                </p>
            </div>
        </motion.div>
    );
}
