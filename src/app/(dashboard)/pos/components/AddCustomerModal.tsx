"use client";

import { motion } from "framer-motion";
import { X, User, Phone, Loader2, UserPlus } from "lucide-react";
import { Button, Card, CardContent, Input } from "@/components/ui";

interface AddCustomerModalProps {
    newCustomerName: string;
    setNewCustomerName: (name: string) => void;
    newCustomerPhone: string;
    setNewCustomerPhone: (phone: string) => void;
    savingCustomer: boolean;
    handleAddCustomer: () => void;
    setShowAddCustomerModal: (show: boolean) => void;
}

export function AddCustomerModal({
    newCustomerName,
    setNewCustomerName,
    newCustomerPhone,
    setNewCustomerPhone,
    savingCustomer,
    handleAddCustomer,
    setShowAddCustomerModal
}: AddCustomerModalProps) {
    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-[60] p-4">
            <motion.div
                initial={{ opacity: 0, scale: 0.95, y: 20 }}
                animate={{ opacity: 1, scale: 1, y: 0 }}
            >
                <Card className="w-full max-w-md border-none shadow-2xl bg-white rounded-[32px] overflow-hidden max-h-[96vh] flex flex-col">
                    <CardContent className="p-0 flex flex-col overflow-hidden">
                        <div className="p-6 md:p-8 pb-4 md:pb-6 bg-[#2e7d32]/5 flex items-center justify-between border-b border-[#2e7d32]/10 shrink-0">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-2xl bg-[#2e7d32] flex items-center justify-center">
                                    <UserPlus className="h-5 w-5 text-white" />
                                </div>
                                <div>
                                    <h2 className="text-xl font-black text-gray-800 tracking-tight">New Member</h2>
                                    <p className="text-[10px] font-black text-[#2e7d32] uppercase tracking-widest">Enrollment</p>
                                </div>
                            </div>
                            <button
                                onClick={() => {
                                    setShowAddCustomerModal(false);
                                    setNewCustomerName("");
                                    setNewCustomerPhone("");
                                }}
                                className="p-2.5 hover:bg-white rounded-2xl text-gray-400 transition-colors"
                            >
                                <X className="h-5 w-5" />
                            </button>
                        </div>

                        <div className="p-6 md:p-8 space-y-6 overflow-y-auto custom-scrollbar flex-1">
                            <div className="space-y-4">
                                <div className="space-y-2">
                                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Full Name</label>
                                    <div className="relative group">
                                        <Input
                                            placeholder="e.g. John Doe"
                                            className="h-11 md:h-12 pl-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 transition-all font-bold"
                                            value={newCustomerName}
                                            onChange={(e) => setNewCustomerName(e.target.value)}
                                        />
                                        <User className="absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-gray-300 group-focus-within:text-[#2e7d32] transition-colors" />
                                    </div>
                                </div>

                                <div className="space-y-2">
                                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Contact Number</label>
                                    <div className="relative group">
                                        <Input
                                            placeholder="e.g. +60123456789"
                                            className="h-11 md:h-12 pl-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 transition-all font-mono font-bold"
                                            value={newCustomerPhone}
                                            onChange={(e) => setNewCustomerPhone(e.target.value)}
                                        />
                                        <Phone className="absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-gray-300 group-focus-within:text-[#2e7d32] transition-colors" />
                                    </div>
                                </div>
                            </div>

                            <div className="flex gap-4 pt-4 pb-2">
                                <Button
                                    variant="outline"
                                    className="flex-1 h-11 md:h-12 rounded-2xl border-none bg-gray-100 text-gray-400 font-bold hover:bg-gray-200 transition-all"
                                    onClick={() => {
                                        setShowAddCustomerModal(false);
                                        setNewCustomerName("");
                                        setNewCustomerPhone("");
                                    }}
                                >
                                    Discard
                                </Button>
                                <Button
                                    className="flex-1 h-11 md:h-12 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-lg shadow-[#2e7d32]/20 font-black tracking-wide transition-all"
                                    onClick={handleAddCustomer}
                                    disabled={savingCustomer || !newCustomerName.trim() || !newCustomerPhone.trim()}
                                >
                                    {savingCustomer ? (
                                        <Loader2 className="h-5 w-5 animate-spin" />
                                    ) : (
                                        "Create Profile"
                                    )}
                                </Button>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </motion.div>
        </div>
    );
}
