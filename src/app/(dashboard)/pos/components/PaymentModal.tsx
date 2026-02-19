"use client";

import { motion, AnimatePresence } from "framer-motion";
import { X, Banknote, QrCode, CreditCard, Loader2 } from "lucide-react";
import { Button, Card, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { CartItem, StaffMember, getCommissionBreakdown } from "@/lib/utils/pos-calculations";
import { useAuthStore } from "@/lib/store/auth-store";

import type { PaymentMethod } from "@/types";

interface PaymentModalProps {
    total: number;
    paymentMethod: PaymentMethod;
    setPaymentMethod: (method: PaymentMethod) => void;
    savingSale: boolean;
    handleCompleteSale: () => void;
    setShowPaymentModal: (show: boolean) => void;
    selectedCustomer: { id: string; name: string; points_balance?: number } | null;
    pointsEarned: number;
    cart: CartItem[];
    staff: StaffMember[];
}

export function PaymentModal({
    total,
    paymentMethod,
    setPaymentMethod,
    savingSale,
    handleCompleteSale,
    setShowPaymentModal,
    selectedCustomer,
    pointsEarned,
    cart,
    staff
}: PaymentModalProps) {
    const { user } = useAuthStore();
    const isAdmin = user?.role === 'admin';
    const commissionBreakdown = getCommissionBreakdown(cart, staff);
    const totalCommission = commissionBreakdown.reduce((sum, i) => sum + i.amount, 0);

    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
            <motion.div
                initial={{ opacity: 0, scale: 0.9, y: 20 }}
                animate={{ opacity: 1, scale: 1, y: 0 }}
                exit={{ opacity: 0, scale: 0.9, y: 20 }}
                className="w-full max-w-md"
            >
                <Card className="border-none shadow-2xl bg-white overflow-hidden rounded-[32px] max-h-[90vh] flex flex-col">
                    <CardContent className="p-0 flex flex-col h-full overflow-hidden">
                        {/* Modal Header */}
                        <div className="p-6 pb-4 flex items-center justify-between border-b border-gray-50 flex-shrink-0">
                            <div>
                                <h2 className="text-xl font-black text-gray-800 tracking-tight">Checkout</h2>
                                <p className="text-[10px] font-bold text-gray-400 uppercase tracking-widest mt-0.5">Finalize Transaction</p>
                            </div>
                            <button
                                onClick={() => setShowPaymentModal(false)}
                                className="p-2 hover:bg-gray-100 rounded-2xl text-gray-400 transition-colors"
                            >
                                <X className="h-5 w-5" />
                            </button>
                        </div>

                        <div className="p-6 space-y-6 overflow-y-auto custom-scrollbar flex-1">
                            {/* Payment Methods Grid */}
                            <div className="grid grid-cols-2 gap-4">
                                {[
                                    { id: "cash", icon: Banknote, label: "Cash Pay" },
                                    { id: "qr", icon: QrCode, label: "QR Payment" },
                                    { id: "card", icon: CreditCard, label: "Terminal" },
                                    { id: "transfer", icon: CreditCard, label: "Transfer" },
                                ].map((method) => (
                                    <button
                                        key={method.id}
                                        onClick={() => setPaymentMethod(method.id as PaymentMethod)}
                                        className={`p-4 rounded-3xl border-2 text-center transition-all duration-300 relative overflow-hidden group ${paymentMethod === method.id
                                            ? "border-[#2e7d32] bg-[#2e7d32]/5 shadow-lg shadow-[#2e7d32]/10"
                                            : "border-gray-50 hover:border-[#2e7d32]/20 hover:bg-gray-50"
                                            }`}
                                    >
                                        <method.icon className={`h-7 w-7 mx-auto mb-3 transition-colors ${paymentMethod === method.id ? "text-[#2e7d32]" : "text-gray-300 group-hover:text-gray-400"
                                            }`} />
                                        <span className={`text-xs font-black uppercase tracking-widest ${paymentMethod === method.id ? "text-[#2e7d32]" : "text-gray-400"
                                            }`}>
                                            {method.label}
                                        </span>
                                        {paymentMethod === method.id && (
                                            <motion.div
                                                layoutId="active-method"
                                                className="absolute bottom-0 left-1/2 -translate-x-1/2 h-1 w-8 bg-[#2e7d32] rounded-t-full"
                                            />
                                        )}
                                    </button>
                                ))}
                            </div>

                            {/* Amount Summary */}
                            <div className="p-6 bg-gray-50/50 rounded-3xl space-y-4 border border-gray-100">
                                <div className="flex justify-between items-end">
                                    <span className="text-xs font-black text-gray-400 uppercase tracking-widest">Total Payable</span>
                                    <span className="text-4xl font-black text-gray-800">{formatCurrency(total)}</span>
                                </div>
                                {selectedCustomer && (
                                    <div className="flex items-center gap-2 text-[#2e7d32] bg-[#2e7d32]/5 p-2 rounded-xl border border-[#2e7d32]/10">
                                        <div className="h-1.5 w-1.5 rounded-full bg-[#2e7d32] animate-pulse" />
                                        <span className="text-[11px] font-black uppercase tracking-widest">
                                            +{pointsEarned} loyalty points reward
                                        </span>
                                    </div>
                                )}
                            </div>

                            {/* Commission Preview - Admin only */}
                            {isAdmin && (
                                <div className="p-6 bg-[#2e7d32]/5 rounded-3xl border border-[#2e7d32]/10">
                                    <h4 className="text-[10px] font-black text-[#2e7d32] uppercase tracking-widest mb-4">Staff Commission Estimate</h4>
                                    <div className="space-y-3">
                                        {commissionBreakdown.map((item) => (
                                            <div key={item.staffId} className="flex justify-between items-center">
                                                <div>
                                                    <p className="text-xs font-bold text-gray-700">{item.staffName}</p>
                                                    <p className="text-[9px] text-gray-400 font-bold uppercase">{item.role}</p>
                                                </div>
                                                <span className="text-sm font-black text-gray-800">{formatCurrency(item.amount)}</span>
                                            </div>
                                        ))}
                                        <div className="flex justify-between pt-3 border-t border-[#2e7d32]/10">
                                            <span className="text-[10px] font-black text-[#2e7d32] uppercase tracking-widest">Total Payout</span>
                                            <span className="text-sm font-black text-[#2e7d32]">{formatCurrency(totalCommission)}</span>
                                        </div>
                                    </div>
                                </div>
                            )}

                            {/* Pay Button */}
                            <Button
                                className="w-full h-14 rounded-[24px] bg-[#2e7d32] hover:bg-[#1b5e20] shadow-xl shadow-[#2e7d32]/20 text-md font-black tracking-wide disabled:opacity-50 group transition-all flex-shrink-0 mb-2"
                                size="lg"
                                onClick={handleCompleteSale}
                                disabled={savingSale}
                            >
                                {savingSale ? (
                                    <>
                                        <Loader2 className="h-6 w-6 mr-3 animate-spin" />
                                        Processing...
                                    </>
                                ) : (
                                    <span className="flex items-center gap-2">
                                        Confirm & Complete
                                    </span>
                                )}
                            </Button>
                        </div>
                    </CardContent>
                </Card>
            </motion.div>
        </div>
    );
}
