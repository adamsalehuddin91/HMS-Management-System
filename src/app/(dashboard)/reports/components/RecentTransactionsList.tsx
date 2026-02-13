"use client";

import { useState } from "react";
import { toast } from "sonner";
import { RotateCcw, Loader2, FileText, Download, MessageCircle } from "lucide-react";
import { Card, CardContent, Badge, Button } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { createClient } from "@/lib/supabase/client";
import { downloadReceipt, generateReceipt, generateWhatsAppReceipt, ReceiptData, ReceiptItem } from "@/lib/utils/receipt-generator";

interface RecentTransaction {
    id: string;
    fullId: string;
    customer: string;
    customerId: string | null;
    amount: number;
    pointsRedeemed: number;
    pointsEarned: number;
    date: string;
    status: string;
}

interface RecentTransactionsListProps {
    loading: boolean;
    recentTransactions: RecentTransaction[];
    isAdmin: boolean;
    setSelectedTransaction: (txn: RecentTransaction) => void;
    setShowVoidModal: (show: boolean) => void;
}

async function fetchReceiptData(saleId: string): Promise<ReceiptData | null> {
    const supabase = createClient();

    // Fetch sale, items, and business settings in parallel
    const [saleResult, itemsResult, settingsResult] = await Promise.all([
        supabase
            .from("sales")
            .select("id, total, payment_method, points_redeemed, deposit_deducted, created_at, customer:customers(name, phone)")
            .eq("id", saleId)
            .single(),
        supabase
            .from("sale_items")
            .select("item_name, quantity, price, total, item_type, stylist_id")
            .eq("sale_id", saleId),
        supabase
            .from("business_settings")
            .select("setting_value")
            .eq("setting_key", "business_info")
            .single(),
    ]);

    if (saleResult.error || !saleResult.data) return null;

    const sale = saleResult.data as any;
    const items = (itemsResult.data || []) as any[];
    const bizInfo = settingsResult.data?.setting_value as any;

    // Fetch staff names for items that have a stylist
    const stylistIds = [...new Set(items.map(i => i.stylist_id).filter(Boolean))];
    let staffMap: Record<string, string> = {};
    if (stylistIds.length > 0) {
        const { data: staffData } = await supabase
            .from("staff")
            .select("id, name")
            .in("id", stylistIds);
        if (staffData) {
            staffMap = Object.fromEntries(staffData.map(s => [s.id, s.name]));
        }
    }

    const receiptItems: ReceiptItem[] = items.map((item) => ({
        name: item.item_name,
        quantity: item.quantity,
        price: item.price,
        total: item.total,
        itemType: item.item_type === "product" ? "product" : "service",
        staffName: item.stylist_id ? staffMap[item.stylist_id] : undefined,
    }));

    const subtotal = receiptItems.reduce((sum, i) => sum + i.total, 0);
    const pointsRedeemed = sale.points_redeemed || 0;
    const pointsDiscount = pointsRedeemed * 0.03; // 1 point = RM0.03
    const depositDeducted = sale.deposit_deducted || 0;

    return {
        receiptNo: sale.id.slice(0, 8).toUpperCase(),
        date: new Date(sale.created_at),
        businessName: bizInfo?.name || "HMS Salon",
        businessPhone: bizInfo?.phone || bizInfo?.whatsapp || "-",
        businessAddress: bizInfo?.address,
        customerName: sale.customer?.name,
        customerPhone: sale.customer?.phone,
        items: receiptItems,
        subtotal,
        pointsRedeemed,
        pointsDiscount,
        depositDeducted,
        total: sale.total,
        paymentMethod: sale.payment_method || "cash",
        pointsEarned: Math.floor(sale.total),
    };
}

export function RecentTransactionsList({
    loading,
    recentTransactions,
    isAdmin,
    setSelectedTransaction,
    setShowVoidModal
}: RecentTransactionsListProps) {
    const [loadingReceiptId, setLoadingReceiptId] = useState<string | null>(null);
    const [receiptMenuId, setReceiptMenuId] = useState<string | null>(null);

    const handleReceiptAction = async (saleId: string, action: "download" | "whatsapp") => {
        setLoadingReceiptId(saleId);
        setReceiptMenuId(null);
        try {
            const data = await fetchReceiptData(saleId);
            if (!data) {
                toast.error("Gagal mendapatkan data resit.");
                return;
            }

            if (action === "download") {
                await downloadReceipt(data);
            } else {
                // WhatsApp share
                const message = generateWhatsAppReceipt(data);
                const doc = await generateReceipt(data);
                const pdfBlob = doc.output("blob");
                const file = new File([pdfBlob], `resit-${data.receiptNo}.pdf`, { type: "application/pdf" });

                // @ts-ignore
                if (navigator.share && navigator.canShare && navigator.canShare({ files: [file] })) {
                    await navigator.share({ files: [file], title: `Resit ${data.receiptNo}`, text: decodeURIComponent(message) });
                } else {
                    await downloadReceipt(data);
                    let phone = "";
                    if (data.customerPhone) {
                        const raw = data.customerPhone.replace(/\D/g, "");
                        phone = raw.startsWith("1") ? "60" + raw : raw.startsWith("01") ? "6" + raw : raw;
                    }
                    window.open(`https://wa.me/${phone}?text=${message}`, "_blank");
                }
            }
        } catch (error) {
            console.error("Receipt error:", error);
            toast.error("Gagal menjana resit.");
        } finally {
            setLoadingReceiptId(null);
        }
    };
    return (
        <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
            <CardContent className="p-10">
                <div className="flex items-center justify-between mb-8">
                    <div>
                        <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Log Aktiviti</h3>
                        <p className="text-2xl font-black text-gray-900 tracking-tight mt-1">Transaksi Terkini</p>
                    </div>
                </div>

                {loading ? (
                    <div className="py-20 flex items-center justify-center">
                        <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                    </div>
                ) : recentTransactions.length === 0 ? (
                    <div className="py-20 text-center text-[10px] font-black uppercase tracking-widest text-gray-400">Tiada transaksi direkodkan</div>
                ) : (
                    <div className="space-y-4">
                        {recentTransactions.map((txn) => (
                            <div key={txn.fullId} className="flex items-center justify-between p-6 bg-gray-50/50 rounded-[2rem] border border-gray-100/50 hover:bg-white hover:shadow-xl hover:shadow-green-900/5 transition-all group">
                                <div className="flex items-center gap-5">
                                    <div className="h-12 w-12 rounded-2xl bg-white shadow-sm flex items-center justify-center group-hover:scale-110 transition-transform">
                                        <div className={`h-2.5 w-2.5 rounded-full ${txn.status === 'completed' ? 'bg-[#2e7d32]' : 'bg-red-500'} shadow-[0_0_8px_rgba(46,125,50,0.3)]`} />
                                    </div>
                                    <div>
                                        <p className="font-black text-sm text-gray-900 tracking-tight italic">{txn.customer}</p>
                                        <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest mt-1">
                                            ID: <span className="text-gray-900 font-bold font-mono">{txn.id}</span> • {txn.date}
                                        </p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-4">
                                    {/* Receipt Actions */}
                                    {txn.status === "completed" && (
                                        <div className="relative">
                                            <button
                                                onClick={() => setReceiptMenuId(receiptMenuId === txn.fullId ? null : txn.fullId)}
                                                disabled={loadingReceiptId === txn.fullId}
                                                className="h-10 w-10 flex items-center justify-center rounded-xl text-[#2e7d32]/40 hover:text-[#2e7d32] hover:bg-[#2e7d32]/10 transition-all active:scale-95"
                                                title="Resit"
                                            >
                                                {loadingReceiptId === txn.fullId ? (
                                                    <Loader2 className="h-4 w-4 animate-spin" />
                                                ) : (
                                                    <FileText className="h-4.5 w-4.5" />
                                                )}
                                            </button>
                                            {receiptMenuId === txn.fullId && (
                                                <>
                                                    <div className="fixed inset-0 z-40" onClick={() => setReceiptMenuId(null)} />
                                                    <div className="absolute right-0 top-12 z-50 bg-white rounded-2xl shadow-2xl border border-gray-100 p-2 min-w-[180px]">
                                                        <button
                                                            onClick={() => handleReceiptAction(txn.fullId, "download")}
                                                            className="w-full flex items-center gap-3 px-4 py-3 rounded-xl hover:bg-gray-50 transition-colors text-left"
                                                        >
                                                            <Download className="h-4 w-4 text-[#2e7d32]" />
                                                            <span className="text-xs font-bold text-gray-700">Muat Turun PDF</span>
                                                        </button>
                                                        <button
                                                            onClick={() => handleReceiptAction(txn.fullId, "whatsapp")}
                                                            className="w-full flex items-center gap-3 px-4 py-3 rounded-xl hover:bg-gray-50 transition-colors text-left"
                                                        >
                                                            <MessageCircle className="h-4 w-4 text-[#25D366]" />
                                                            <span className="text-xs font-bold text-gray-700">Hantar WhatsApp</span>
                                                        </button>
                                                    </div>
                                                </>
                                            )}
                                        </div>
                                    )}
                                    {/* Void Button */}
                                    {isAdmin && txn.status === "completed" && (
                                        <button
                                            onClick={() => {
                                                setSelectedTransaction(txn);
                                                setShowVoidModal(true);
                                            }}
                                            className="h-10 w-10 flex items-center justify-center rounded-xl text-red-300 hover:text-red-500 hover:bg-red-50 transition-all active:scale-95"
                                            title="Void Transaksi"
                                        >
                                            <RotateCcw className="h-4.5 w-4.5" />
                                        </button>
                                    )}
                                    <div className="text-right">
                                        <p className={`text-sm font-black italic tracking-tighter tabular-nums ${txn.status === "voided" ? "text-red-300 line-through" : "text-gray-900"}`}>
                                            {formatCurrency(txn.amount)}
                                        </p>
                                        <div className="flex justify-end mt-1">
                                            <Badge variant={txn.status === "completed" ? "success" : "error"} className="font-black text-[8px] uppercase tracking-widest px-2 py-0.5 rounded-lg border-none italic">
                                                {txn.status === 'completed' ? 'Berjaya' : 'Batal'}
                                            </Badge>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
