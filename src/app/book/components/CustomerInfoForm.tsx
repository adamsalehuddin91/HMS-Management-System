"use client";

import { motion } from "framer-motion";
import { Loader2, Check } from "lucide-react";
import { Card, CardContent, Input } from "@/components/ui";

interface CustomerInfoFormProps {
    customerName: string;
    setCustomerName: (name: string) => void;
    customerPhone: string;
    setCustomerPhone: (phone: string) => void;
    customerNotes: string;
    setCustomerNotes: (notes: string) => void;
    existingCustomer: { id: string, name: string, tier: string } | null;
    checkingCustomer: boolean;
}

export function CustomerInfoForm({
    customerName,
    setCustomerName,
    customerPhone,
    setCustomerPhone,
    customerNotes,
    setCustomerNotes,
    existingCustomer,
    checkingCustomer
}: CustomerInfoFormProps) {
    return (
        <motion.div
            key="details"
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -20 }}
            className="space-y-4"
        >
            <h2 className="text-lg font-bold text-gray-800">Maklumat Anda</h2>

            <Card className="border-none shadow-sm overflow-hidden">
                <CardContent className="p-6 space-y-6">
                    {/* Phone first - to check existing customer */}
                    <div className="space-y-1.5">
                        <label className="text-xs font-bold text-gray-500 uppercase tracking-widest ml-1">
                            No. Telefon *
                        </label>
                        <div className="relative">
                            <Input
                                placeholder="Cth: 0123456789"
                                value={customerPhone}
                                onChange={(e) => setCustomerPhone(e.target.value)}
                                className="rounded-xl border-gray-200 focus:border-[#2e7d32] h-12 text-base font-medium"
                            />
                            {checkingCustomer && (
                                <Loader2 className="absolute right-3 top-1/2 -translate-y-1/2 h-5 w-5 animate-spin text-[#2e7d32]" />
                            )}
                        </div>
                        {existingCustomer && (
                            <motion.div
                                initial={{ opacity: 0, y: -5 }}
                                animate={{ opacity: 1, y: 0 }}
                                className="mt-2 p-3 bg-[#e8f5e9] rounded-xl flex items-center gap-2 border border-[#2e7d32]/10"
                            >
                                <div className="w-6 h-6 bg-[#2e7d32] rounded-full flex items-center justify-center">
                                    <Check className="h-3.5 w-3.5 text-white" />
                                </div>
                                <span className="text-sm text-[#2e7d32] font-semibold">
                                    Selamat kembali, {existingCustomer.name}!
                                </span>
                            </motion.div>
                        )}
                    </div>

                    <div className="space-y-1.5">
                        <label className="text-xs font-bold text-gray-500 uppercase tracking-widest ml-1">
                            Nama Penuh *
                        </label>
                        <Input
                            placeholder="Masukkan nama anda"
                            value={customerName}
                            onChange={(e) => setCustomerName(e.target.value)}
                            disabled={!!existingCustomer}
                            className={`rounded-xl border-gray-200 focus:border-[#2e7d32] h-12 text-base font-medium ${existingCustomer ? "bg-gray-50 text-gray-500" : ""}`}
                        />
                    </div>

                    <div className="space-y-1.5">
                        <label className="text-xs font-bold text-gray-500 uppercase tracking-widest ml-1">
                            Nota / Permintaan Khas
                        </label>
                        <textarea
                            placeholder="Sebarang permintaan khas (cth: jenis rambut, cuci rambut, etc)..."
                            value={customerNotes}
                            onChange={(e) => setCustomerNotes(e.target.value)}
                            className="w-full p-4 border border-gray-200 rounded-2xl resize-none h-32 focus:outline-none focus:ring-2 focus:ring-[#2e7d32]/20 focus:border-[#2e7d32] font-medium text-gray-700 transition-all placeholder:text-gray-300"
                        />
                    </div>
                </CardContent>
            </Card>
        </motion.div>
    );
}
