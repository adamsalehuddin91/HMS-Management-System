"use client";

import { useState, useMemo } from "react";
import { toast } from "sonner";
import { motion } from "framer-motion";
import { Check, Plus, ArrowLeft, Download, Loader2, MessageCircle } from "lucide-react";
import { Button, Card, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { CartItem, StaffMember, getCommissionBreakdown } from "@/lib/utils/pos-calculations";
import { useAuthStore } from "@/lib/store/auth-store";
import { downloadReceipt, generateWhatsAppReceipt, generateReceipt, ReceiptData, ReceiptItem } from "@/lib/utils/receipt-generator";
import { logError } from "@/lib/utils/error-logger";

interface SuccessModalProps {
    total: number;
    subtotal: number;
    pointsRedeemed: number;
    pointsDiscount: number;
    depositDeducted: number;
    paymentMethod: string;
    selectedCustomer: any;
    pointsEarned: number;
    cart: CartItem[];
    staff: StaffMember[];
    saleId: string;
    businessInfo: {
        name: string;
        phone: string;
        address?: string;
        bookingUrl?: string;
        googleReviewUrl?: string;
    };
    handleNewSale: () => void;
    router: any;
}

export function SuccessModal({
    total,
    subtotal,
    pointsRedeemed,
    pointsDiscount,
    depositDeducted,
    paymentMethod,
    selectedCustomer,
    pointsEarned,
    cart,
    staff,
    saleId,
    businessInfo,
    handleNewSale,
    router
}: SuccessModalProps) {
    const [downloading, setDownloading] = useState(false);
    const { user } = useAuthStore();
    const isAdmin = user?.role === 'admin';
    const commissionBreakdown = getCommissionBreakdown(cart, staff);
    const totalCommission = commissionBreakdown.reduce((sum, i) => sum + i.amount, 0);
    const receiptNo = saleId.slice(0, 8).toUpperCase();

    // Memoize receipt data so it can be reused
    const receiptData: ReceiptData = useMemo(() => {
        const receiptItems: ReceiptItem[] = cart.map(item => {
            const primaryStaff = staff.find(s => s.id === item.primaryStaffId);
            return {
                name: item.name,
                quantity: item.quantity,
                price: item.price,
                total: item.price * item.quantity,
                itemType: item.itemType,
                staffName: primaryStaff?.name
            };
        });

        return {
            receiptNo,
            date: new Date(),
            businessName: businessInfo.name || "HMS Salon",
            businessPhone: businessInfo.phone || "-",
            businessAddress: businessInfo.address,
            customerName: selectedCustomer?.name,
            customerPhone: selectedCustomer?.phone,
            items: receiptItems,
            subtotal,
            pointsRedeemed,
            pointsDiscount,
            depositDeducted,
            total,
            paymentMethod,
            pointsEarned,
            bookingUrl: businessInfo.bookingUrl,
            googleReviewUrl: businessInfo.googleReviewUrl,
        };
    }, [
        cart, staff, receiptNo, businessInfo, selectedCustomer,
        subtotal, pointsRedeemed, pointsDiscount, depositDeducted,
        total, paymentMethod, pointsEarned
    ]);

    const handleDownloadReceipt = async () => {
        setDownloading(true);
        try {
            await downloadReceipt(receiptData);
        } catch (error) {
            logError('Success Modal - Receipt', error);
            toast.error("Gagal menjana resit. Sila cuba lagi.");
        } finally {
            setDownloading(false);
        }
    };

    const handleWhatsAppReceipt = async () => {
        const plainMessage = generateWhatsAppReceipt(receiptData);
        const encodedMessage = encodeURIComponent(plainMessage);
        let phone = "";

        // Try to use customer phone if available
        if (selectedCustomer?.phone) {
            // Remove non-digit chars
            const rawPhone = selectedCustomer.phone.replace(/\D/g, "");
            // Ensure 60 prefix for Malaysia if starting with 1
            if (rawPhone.startsWith("1")) {
                phone = "60" + rawPhone;
            } else if (rawPhone.startsWith("01")) {
                phone = "6" + rawPhone;
            } else {
                phone = rawPhone;
            }
        }

        setDownloading(true);
        try {
            // Generate PDF Blob
            const doc = await generateReceipt(receiptData);
            const pdfBlob = doc.output('blob');
            const file = new File([pdfBlob], `resit-${receiptData.receiptNo}.pdf`, { type: "application/pdf" });

            // Check if Web Share API is supported and can share files
            // @ts-ignore - navigator.share / canShare types might be missing in some setups
            if (navigator.share && navigator.canShare && navigator.canShare({ files: [file] })) {
                await navigator.share({
                    files: [file],
                    title: `Resit ${receiptData.receiptNo}`,
                    text: plainMessage,
                });
            } else {
                // Fallback: Download PDF & Open WhatsApp
                await downloadReceipt(receiptData);

                // Construct WhatsApp URL
                const url = `https://wa.me/${phone}?text=${encodedMessage}`;
                window.open(url, "_blank");

                toast.info("Resit telah dimuat turun. Sila lampirkan PDF secara manual di WhatsApp.");
            }
        } catch (error) {
            logError('Success Modal - Share', error);
            // Fallback on error too
            const url = `https://wa.me/${phone}?text=${encodedMessage}`;
            window.open(url, "_blank");
        } finally {
            setDownloading(false);
        }
    };

    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-md flex items-center justify-center z-50 p-4">
            <motion.div
                initial={{ opacity: 0, scale: 0.8, y: 40 }}
                animate={{ opacity: 1, scale: 1, y: 0 }}
                className="w-full max-w-lg"
            >
                <Card className="border-none shadow-2xl bg-white overflow-hidden rounded-[40px] max-h-[96vh] flex flex-col">
                    <CardContent className="p-0 flex flex-col overflow-hidden">
                        {/* Header / Big Checkmark - Fixed */}
                        <div className="bg-[#2e7d32] p-8 md:p-10 text-center relative overflow-hidden shrink-0">
                            <motion.div
                                initial={{ scale: 0 }}
                                animate={{ scale: 1 }}
                                transition={{ type: "spring", damping: 12, stiffness: 200, delay: 0.2 }}
                                className="h-20 w-20 md:h-24 md:w-24 rounded-full bg-white/20 backdrop-blur-md border border-white/30 flex items-center justify-center mx-auto relative z-10"
                            >
                                <Check className="h-10 w-10 md:h-12 md:w-12 text-white stroke-[4px]" />
                            </motion.div>
                            <div className="mt-4 md:mt-6 relative z-10">
                                <h2 className="text-2xl md:text-3xl font-black text-white tracking-tight">Payment Complete!</h2>
                                <p className="text-white/70 font-bold uppercase tracking-widest text-[10px] md:text-xs mt-2">No. Resit: #{receiptNo}</p>
                            </div>

                            {/* Decorative Elements */}
                            <div className="absolute top-0 left-0 w-full h-full opacity-10">
                                <div className="absolute top-[-10%] left-[-10%] w-40 h-40 bg-white rounded-full blur-3xl" />
                                <div className="absolute bottom-[-10%] right-[-10%] w-40 h-40 bg-white rounded-full blur-3xl" />
                            </div>
                        </div>

                        {/* Scrollable Content */}
                        <div className="p-6 md:p-8 space-y-6 md:space-y-8 overflow-y-auto custom-scrollbar flex-1">
                            {/* Summary Stats */}
                            <div className="grid grid-cols-2 gap-4">
                                <div className="p-4 md:p-5 bg-gray-50 rounded-3xl border border-gray-100/50">
                                    <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1">Received</p>
                                    <p className="text-xl md:text-2xl font-black text-gray-800">{formatCurrency(total)}</p>
                                </div>
                                <div className="p-4 md:p-5 bg-gray-50 rounded-3xl border border-gray-100/50">
                                    <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1">Method</p>
                                    <p className="text-xs md:text-sm font-bold text-gray-800 uppercase tracking-wider">{paymentMethod}</p>
                                </div>
                            </div>

                            {selectedCustomer && (
                                <div className="p-4 md:p-5 bg-[#2e7d32]/5 rounded-3xl border border-[#2e7d32]/10 flex items-center justify-between">
                                    <div>
                                        <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1">Customer Reward</p>
                                        <p className="text-xs md:text-sm font-bold text-gray-800">{selectedCustomer.name}</p>
                                    </div>
                                    <div className="text-right">
                                        <p className="text-lg md:text-xl font-black text-[#2e7d32]">+{pointsEarned} pts</p>
                                    </div>
                                </div>
                            )}

                            {/* Commission Breakdown - Admin only */}
                            {isAdmin && (
                                <div className="p-5 md:p-6 border border-gray-100 rounded-3xl bg-white shadow-sm">
                                    <h4 className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-4">Staff Payout Summary</h4>
                                    <div className="space-y-4">
                                        {commissionBreakdown.map((item) => (
                                            <div key={item.staffId} className="flex justify-between items-center group">
                                                <div className="flex items-center gap-3">
                                                    <div className="h-2 w-2 rounded-full bg-[#2e7d32] opacity-20 group-hover:opacity-100 transition-opacity" />
                                                    <div>
                                                        <p className="text-xs font-bold text-gray-700">{item.staffName}</p>
                                                        <p className="text-[9px] text-gray-400 font-bold uppercase">{item.role}</p>
                                                    </div>
                                                </div>
                                                <div className="text-right">
                                                    <p className="text-sm font-black text-[#2e7d32]">{formatCurrency(item.amount)}</p>
                                                    <p className="text-[9px] text-gray-400 font-bold">{item.rate}% commission</p>
                                                </div>
                                            </div>
                                        ))}
                                        <div className="flex justify-between pt-4 border-t border-gray-100">
                                            <span className="text-xs font-black text-gray-800 uppercase tracking-widest">Total Commission</span>
                                            <span className="text-sm font-black text-[#2e7d32]">{formatCurrency(totalCommission)}</span>
                                        </div>
                                    </div>
                                </div>
                            )}

                            {/* Action Buttons */}
                            <div className="space-y-3 pb-2">
                                <Button
                                    className="w-full h-12 md:h-14 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-xl shadow-[#2e7d32]/20 text-md font-black tracking-wide transition-all"
                                    onClick={handleNewSale}
                                >
                                    <Plus className="h-5 w-5 mr-3" />
                                    Initiate Next Sale
                                </Button>
                                <Button
                                    variant="outline"
                                    className="w-full h-11 md:h-12 rounded-2xl border-[#2e7d32] text-[#2e7d32] hover:bg-[#2e7d32]/5 font-bold uppercase tracking-widest text-[11px] transition-all"
                                    onClick={handleDownloadReceipt}
                                    disabled={downloading}
                                >
                                    {downloading ? (
                                        <>
                                            <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                                            Menjana Resit...
                                        </>
                                    ) : (
                                        <>
                                            <Download className="h-4 w-4 mr-2" />
                                            Muat Turun Resit
                                        </>
                                    )}
                                </Button>
                                <Button
                                    variant="ghost"
                                    className="w-full h-11 md:h-12 rounded-2xl text-gray-400 font-bold hover:text-gray-600 hover:bg-gray-50 transition-all uppercase tracking-widest text-[11px]"
                                    onClick={() => router.push("/dashboard")}
                                >
                                    <ArrowLeft className="h-4 w-4 mr-2" />
                                    Exit to Dashboard
                                </Button>
                            </div>

                            <Button
                                className="w-full h-11 md:h-12 rounded-2xl bg-[#25D366] hover:bg-[#128C7E] text-white font-bold uppercase tracking-widest text-[11px] transition-all shadow-lg shadow-[#25D366]/20 mt-2"
                                onClick={handleWhatsAppReceipt}
                            >
                                <MessageCircle className="h-4 w-4 mr-2" />
                                Hantar WhatsApp
                            </Button>

                        </div>
                    </CardContent>
                </Card>
            </motion.div>
        </div>
    );
}
