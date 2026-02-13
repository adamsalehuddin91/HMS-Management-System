"use client";

import { motion } from "framer-motion";
import { Check, MessageCircle, MapPin } from "lucide-react";
import { Card, CardContent, Badge, Button } from "@/components/ui";
import { format } from "date-fns";
import { useRouter } from "next/navigation";
import { Service, BusinessInfo } from "@/lib/utils/booking-utils";

interface BookingSuccessProps {
    bookingId: string | null;
    selectedDate: Date | null;
    selectedTime: string | null;
    selectedService: Service | null;
    getWhatsAppLink: () => string;
    businessInfo: BusinessInfo;
}

export function BookingSuccess({
    bookingId,
    selectedDate,
    selectedTime,
    selectedService,
    getWhatsAppLink,
    businessInfo
}: BookingSuccessProps) {
    const router = useRouter();

    return (
        <motion.div
            key="success"
            initial={{ opacity: 0, scale: 0.9, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            className="text-center py-8"
        >
            <div className="relative mb-8">
                <motion.div
                    initial={{ scale: 0 }}
                    animate={{ scale: 1 }}
                    transition={{ type: "spring", damping: 10, stiffness: 100, delay: 0.2 }}
                    className="w-24 h-24 bg-gradient-to-br from-[#4caf50] to-[#2e7d32] rounded-full flex items-center justify-center mx-auto shadow-2xl shadow-green-200 relative z-10"
                >
                    <Check className="h-12 w-12 text-white stroke-[3px]" />
                </motion.div>
                <div className="absolute inset-0 bg-[#4caf50]/10 rounded-full animate-ping scale-150 opacity-20" />
            </div>

            <h2 className="text-3xl font-black text-gray-900 mb-2 tracking-tight">Tempahan Berjaya!</h2>
            <p className="text-gray-500 font-medium mb-8">Ekslusif untuk anda, kami telah mengesahkan slot anda.</p>

            <Card className="mb-8 overflow-hidden border-none shadow-xl ring-1 ring-black/[0.05]">
                <div className="bg-gray-50 px-4 py-2 border-b border-gray-100 flex justify-between items-center">
                    <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Butiran Tempahan</span>
                    <Badge className="bg-[#e8f5e9] text-[#2e7d32] border-none font-bold text-[10px]">HMS-{bookingId}</Badge>
                </div>
                <CardContent className="p-6 text-left space-y-4">
                    <div className="flex justify-between items-center">
                        <span className="text-sm font-bold text-gray-400">TARIKH</span>
                        <span className="font-extrabold text-gray-800">{selectedDate ? format(selectedDate, 'dd MMM yyyy') : '-'}</span>
                    </div>
                    <div className="flex justify-between items-center">
                        <span className="text-sm font-bold text-gray-400">MASA</span>
                        <span className="font-extrabold text-gray-800">{selectedTime}</span>
                    </div>
                    <div className="flex justify-between items-center bg-[#fcfdfc] p-3 rounded-xl border border-green-50">
                        <span className="text-sm font-bold text-gray-400">SERVIS</span>
                        <span className="font-extrabold text-[#2e7d32]">{selectedService?.name}</span>
                    </div>
                </CardContent>
            </Card>

            <div className="space-y-4">
                <motion.a
                    whileHover={{ scale: 1.02 }}
                    whileTap={{ scale: 0.98 }}
                    href={getWhatsAppLink()}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center justify-center gap-3 w-full py-4 bg-[#25D366] text-white rounded-2xl font-black shadow-lg shadow-green-100 transition-all"
                >
                    <MessageCircle className="h-6 w-6 fill-white" />
                    Hantar ke WhatsApp Pro
                </motion.a>

                <Button
                    variant="ghost"
                    className="w-full text-gray-400 font-bold hover:text-gray-600 hover:bg-gray-50 rounded-2xl h-12"
                    onClick={() => router.push('/book')}
                >
                    Buat Tempahan Baru
                </Button>
            </div>

            <motion.div
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                transition={{ delay: 0.8 }}
                className="mt-12 p-6 bg-gradient-to-br from-[#f1f8f1] to-white rounded-3xl border border-green-50 shadow-inner"
            >
                <p className="text-xs text-[#2e7d32] font-black uppercase tracking-[0.2em] mb-3">Panduan Lokasi</p>
                <div className="flex items-start gap-3 text-sm text-gray-700 font-semibold mb-4 text-left">
                    <div className="p-2 bg-white rounded-lg shadow-sm">
                        <MapPin className="h-4 w-4 text-[#2e7d32]" />
                    </div>
                    <span>{businessInfo.address}</span>
                </div>
                <div className="flex items-center gap-2 text-[10px] text-[#2e7d32]/70 font-bold bg-[#2e7d32]/5 p-3 rounded-xl italic">
                    <p>Sila hadir 10 minit awal sebelum waktu tempahan anda. Terima kasih!</p>
                </div>
            </motion.div>
        </motion.div>
    );
}
