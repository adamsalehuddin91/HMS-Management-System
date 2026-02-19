"use client";

import { useState, useEffect } from "react";
import { toast } from "sonner";
import { FileText, Download, MessageCircle, Loader2, ChevronDown, ChevronUp, X } from "lucide-react";
import { Card, CardContent, Badge } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { createClient } from "@/lib/supabase/client";
import { format } from "date-fns";
import { downloadReceipt, generateReceipt, generateWhatsAppReceipt, ReceiptData, ReceiptItem } from "@/lib/utils/receipt-generator";

interface RecentSale {
    id: string;
    shortId: string;
    total: number;
    payment_method: string;
    customer_name: string;
    customer_phone: string | null;
    created_at: string;
    status: string;
}

async function fetchReceiptData(saleId: string): Promise<ReceiptData | null> {
    const supabase = createClient();

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

    // Batch fetch staff names
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
    const pointsDiscount = pointsRedeemed * 0.03;
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
        bookingUrl: bizInfo?.booking_url || "https://hms-salon.vercel.app/book",
        googleReviewUrl: bizInfo?.google_review_url || "https://www.google.com/search?sca_esv=369040512b9c6d40&si=AL3DRZEsmMGCryMMFSHJ3StBhOdZ2-6yYkXd_doETEE1OR-qOYWAuYTwosPcodcQNf31IJH5f8k2nzY7Xy6SkvkU6n2WcrK9Zdiqa6Asxm3B5PS1HIIl7_ZehMuo9ymcOFqOd7HppJAsBloexqhbYQb4o9UVqhJqNQ%3D%3D&q=HAIDA+MUSLIMAH+SALON+Ulasan",
    };
}

interface RecentReceiptsProps {
    isOpen: boolean;
    onClose: () => void;
}

export function RecentReceipts({ isOpen, onClose }: RecentReceiptsProps) {
    const [sales, setSales] = useState<RecentSale[]>([]);
    const [loading, setLoading] = useState(false);
    const [loadingReceiptId, setLoadingReceiptId] = useState<string | null>(null);
    const [menuId, setMenuId] = useState<string | null>(null);

    useEffect(() => {
        if (!isOpen) return;
        const fetchRecent = async () => {
            setLoading(true);
            const supabase = createClient();
            const { data } = await supabase
                .from("sales")
                .select("id, total, payment_method, status, created_at, customer:customers(name, phone)")
                .neq("status", "voided")
                .order("created_at", { ascending: false })
                .limit(10);

            if (data) {
                setSales(data.map((s: any) => ({
                    id: s.id,
                    shortId: s.id.slice(0, 8).toUpperCase(),
                    total: s.total,
                    payment_method: s.payment_method || "cash",
                    customer_name: s.customer?.name || "Walk-in",
                    customer_phone: s.customer?.phone || null,
                    created_at: s.created_at,
                    status: s.status,
                })));
            }
            setLoading(false);
        };
        fetchRecent();
    }, [isOpen]);

    const handleAction = async (saleId: string, action: "download" | "whatsapp") => {
        setLoadingReceiptId(saleId);
        setMenuId(null);
        try {
            const data = await fetchReceiptData(saleId);
            if (!data) {
                toast.error("Gagal mendapatkan data resit.");
                return;
            }

            if (action === "download") {
                await downloadReceipt(data);
            } else {
                const plainMessage = generateWhatsAppReceipt(data);
                const encodedMessage = encodeURIComponent(plainMessage);
                const doc = await generateReceipt(data);
                const pdfBlob = doc.output("blob");
                const file = new File([pdfBlob], `resit-${data.receiptNo}.pdf`, { type: "application/pdf" });

                // @ts-ignore
                if (navigator.share && navigator.canShare && navigator.canShare({ files: [file] })) {
                    await navigator.share({ files: [file], title: `Resit ${data.receiptNo}`, text: plainMessage });
                } else {
                    await downloadReceipt(data);
                    let phone = "";
                    if (data.customerPhone) {
                        const raw = data.customerPhone.replace(/\D/g, "");
                        phone = raw.startsWith("1") ? "60" + raw : raw.startsWith("01") ? "6" + raw : raw;
                    }
                    window.open(`https://wa.me/${phone}?text=${encodedMessage}`, "_blank");
                }
            }
        } catch {
            toast.error("Gagal menjana resit.");
        } finally {
            setLoadingReceiptId(null);
        }
    };

    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-start justify-center pt-20 p-4" onClick={onClose}>
            <Card className="w-full max-w-lg border-none shadow-2xl bg-white rounded-[2rem] max-h-[70vh] flex flex-col" onClick={(e) => e.stopPropagation()}>
                <CardContent className="p-0 flex flex-col overflow-hidden">
                    {/* Header */}
                    <div className="flex items-center justify-between p-6 pb-4 border-b border-gray-100 shrink-0">
                        <div>
                            <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Resit Terkini</h3>
                            <p className="text-lg font-black text-gray-900 tracking-tight mt-0.5">10 Transaksi Terakhir</p>
                        </div>
                        <button onClick={onClose} className="h-10 w-10 rounded-xl flex items-center justify-center hover:bg-gray-100 transition-colors">
                            <X className="h-5 w-5 text-gray-400" />
                        </button>
                    </div>

                    {/* Sales List */}
                    <div className="overflow-y-auto flex-1 p-4 space-y-3">
                        {loading ? (
                            <div className="py-12 flex items-center justify-center">
                                <Loader2 className="h-6 w-6 animate-spin text-[#2e7d32]/30" />
                            </div>
                        ) : sales.length === 0 ? (
                            <div className="py-12 text-center text-xs font-bold text-gray-400">Tiada transaksi</div>
                        ) : (
                            sales.map((sale) => (
                                <div key={sale.id} className="flex items-center justify-between p-4 bg-gray-50/80 rounded-2xl border border-gray-100/50 hover:bg-white hover:shadow-lg transition-all group">
                                    <div className="flex-1 min-w-0">
                                        <p className="font-bold text-sm text-gray-900 truncate">{sale.customer_name}</p>
                                        <p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mt-0.5">
                                            #{sale.shortId} &bull; {format(new Date(sale.created_at), "dd MMM, h:mm a")}
                                        </p>
                                    </div>
                                    <div className="flex items-center gap-3 ml-3">
                                        <p className="text-sm font-black text-gray-900 tabular-nums">{formatCurrency(sale.total)}</p>
                                        {/* Receipt menu */}
                                        <div className="relative">
                                            <button
                                                onClick={() => setMenuId(menuId === sale.id ? null : sale.id)}
                                                disabled={loadingReceiptId === sale.id}
                                                className="h-9 w-9 flex items-center justify-center rounded-xl bg-[#2e7d32]/10 text-[#2e7d32] hover:bg-[#2e7d32]/20 transition-all active:scale-95"
                                                title="Resit"
                                            >
                                                {loadingReceiptId === sale.id ? (
                                                    <Loader2 className="h-4 w-4 animate-spin" />
                                                ) : (
                                                    <FileText className="h-4 w-4" />
                                                )}
                                            </button>
                                            {menuId === sale.id && (
                                                <>
                                                    <div className="fixed inset-0 z-40" onClick={() => setMenuId(null)} />
                                                    <div className="absolute right-0 top-11 z-50 bg-white rounded-2xl shadow-2xl border border-gray-100 p-2 min-w-[180px]">
                                                        <button
                                                            onClick={() => handleAction(sale.id, "download")}
                                                            className="w-full flex items-center gap-3 px-4 py-3 rounded-xl hover:bg-gray-50 transition-colors text-left"
                                                        >
                                                            <Download className="h-4 w-4 text-[#2e7d32]" />
                                                            <span className="text-xs font-bold text-gray-700">Muat Turun PDF</span>
                                                        </button>
                                                        <button
                                                            onClick={() => handleAction(sale.id, "whatsapp")}
                                                            className="w-full flex items-center gap-3 px-4 py-3 rounded-xl hover:bg-gray-50 transition-colors text-left"
                                                        >
                                                            <MessageCircle className="h-4 w-4 text-[#25D366]" />
                                                            <span className="text-xs font-bold text-gray-700">Hantar WhatsApp</span>
                                                        </button>
                                                    </div>
                                                </>
                                            )}
                                        </div>
                                    </div>
                                </div>
                            ))
                        )}
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
