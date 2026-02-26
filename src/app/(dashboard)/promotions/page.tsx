"use client";

import { useState, useEffect } from "react";
import { Plus, Edit2, Trash2, Tag, Calendar, ChevronLeft, ChevronRight, Loader2, AlertCircle } from "lucide-react";
import { Button, Card, CardContent, Input, Badge } from "@/components/ui";
import { createClient } from "@/lib/supabase/client";
import { useAuthStore } from "@/lib/store/auth-store";
import { toast } from "sonner";
import { logError } from "@/lib/utils/error-logger";
import { formatCurrency } from "@/lib/utils";
import { useRouter } from "next/navigation";
import type { Promotion, Service } from "@/types";

interface PromotionWithService extends Promotion {
    service?: Service;
}

export default function PromotionsPage() {
    const [promotions, setPromotions] = useState<PromotionWithService[]>([]);
    const [loading, setLoading] = useState(true);
    const router = useRouter();
    const supabase = createClient();

    const today = new Date().toISOString().split("T")[0];

    useEffect(() => {
        const abortController = new AbortController();
        const fetchData = async () => {
            setLoading(true);
            try {
                const { data: promos } = await supabase
                    .from("promotions")
                    .select("*, service:services(id, name, price, category)")
                    .order("is_active", { ascending: false })
                    .order("created_at", { ascending: false })
                    .abortSignal(abortController.signal);

                if (promos && !abortController.signal.aborted) setPromotions(promos);
            } catch (err) {
                if ((err as Error).name !== 'AbortError') {
                    logError("Promotions Page", err);
                    toast.error("Gagal muatkan data promosi.");
                }
            } finally {
                if (!abortController.signal.aborted) setLoading(false);
            }
        };
        fetchData();
        return () => abortController.abort();
    }, []);

    const getStatus = (promo: Promotion): "aktif" | "akan_datang" | "tamat" | "tidak_aktif" => {
        if (!promo.is_active) return "tidak_aktif";
        if (today < promo.start_date) return "akan_datang";
        if (today > promo.end_date) return "tamat";
        return "aktif";
    };

    const statusBadge = (status: string) => {
        switch (status) {
            case "aktif": return <span className="px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-lg bg-green-50 text-green-600 border border-green-100">Aktif</span>;
            case "akan_datang": return <span className="px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-lg bg-blue-50 text-blue-500 border border-blue-100">Akan Datang</span>;
            case "tamat": return <span className="px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-lg bg-gray-50 text-gray-400 border border-gray-100">Tamat</span>;
            default: return <span className="px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-lg bg-red-50 text-red-400 border border-red-100">Tidak Aktif</span>;
        }
    };

    return (
        <div className="min-h-screen bg-[#fcfdfd]">
            <div className="p-4 md:p-8 max-w-[1200px] mx-auto space-y-8">
                {/* Header */}
                <div className="flex items-center justify-between">
                    <div>
                        <h1 className="text-2xl font-black text-gray-900 tracking-tight">Dashboard Promosi</h1>
                        <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">
                            Lihat promosi aktif (Urus di Halaman Servis)
                        </p>
                    </div>
                    <Button
                        onClick={() => router.push("/services")}
                        className="h-11 px-6 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-lg font-black text-[11px] uppercase tracking-widest"
                    >
                        <Tag className="h-4 w-4 mr-2" />
                        Urus Promosi
                    </Button>
                </div>

                {/* Info banner */}
                <div className="flex items-start gap-3 p-4 bg-amber-50 rounded-2xl border border-amber-100">
                    <AlertCircle className="h-4 w-4 text-amber-500 mt-0.5 shrink-0" />
                    <p className="text-[11px] font-bold text-amber-700">
                        Transaksi promosi akan mengguna pakai harga promosi dan menghalang penebusan mata ganjaran. Mata masih diperoleh berdasarkan harga promosi.
                    </p>
                </div>

                {/* List */}
                {loading ? (
                    <div className="py-20 flex items-center justify-center">
                        <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                    </div>
                ) : promotions.length === 0 ? (
                    <Card className="border-none shadow-xl bg-white rounded-[2.5rem]">
                        <CardContent className="p-16 text-center">
                            <div className="w-16 h-16 bg-gray-50 rounded-3xl flex items-center justify-center mx-auto mb-4">
                                <Tag className="h-8 w-8 text-gray-200" />
                            </div>
                            <p className="text-[10px] font-black uppercase tracking-widest text-gray-300">Tiada promosi lagi</p>
                        </CardContent>
                    </Card>
                ) : (
                    <div className="grid gap-4">
                        {promotions.map(promo => {
                            const status = getStatus(promo);
                            const service = promo.service;
                            const saving = service?.price && promo.promo_price < service.price
                                ? ((service.price - promo.promo_price) / service.price * 100).toFixed(0) : null;

                            return (
                                <Card key={promo.id} className="border-none shadow-md bg-white rounded-[2rem] overflow-hidden">
                                    <CardContent className="p-6">
                                        <div className="flex items-start gap-5">
                                            {/* Icon */}
                                            <div className="h-14 w-14 bg-[#2e7d32]/5 rounded-2xl flex items-center justify-center shrink-0">
                                                <Tag className="h-6 w-6 text-[#2e7d32]" />
                                            </div>

                                            {/* Content */}
                                            <div className="flex-1 min-w-0">
                                                <div className="flex items-center gap-3 mb-1 flex-wrap">
                                                    <h3 className="font-black text-gray-900 tracking-tight">{promo.name}</h3>
                                                    {statusBadge(status)}
                                                </div>
                                                <p className="text-[11px] font-bold text-gray-400 mb-3">
                                                    {service ? service.name : "Semua perkhidmatan"}
                                                    {service && (
                                                        <span className="text-gray-300 ml-2">
                                                            (asal {formatCurrency(service.price)})
                                                        </span>
                                                    )}
                                                </p>
                                                {promo.description && (
                                                    <p className="text-[12px] font-medium text-gray-600 mb-4 line-clamp-2 italic">
                                                        "{promo.description}"
                                                    </p>
                                                )}
                                                <div className="flex items-center gap-6 flex-wrap">
                                                    <div>
                                                        <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest">Harga Promosi</p>
                                                        <p className="font-black text-xl text-[#2e7d32] tabular-nums">{formatCurrency(promo.promo_price)}</p>
                                                        {saving && <p className="text-[9px] text-orange-500 font-black">Jimat {saving}%</p>}
                                                    </div>
                                                    <div>
                                                        <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest">Tempoh</p>
                                                        <p className="font-bold text-sm text-gray-700 flex items-center gap-1.5">
                                                            <Calendar className="h-3.5 w-3.5" />
                                                            {promo.start_date} → {promo.end_date}
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            {/* Actions */}
                                            <div className="flex items-center gap-2 shrink-0">
                                                <Button
                                                    variant="ghost"
                                                    size="sm"
                                                    className="h-9 px-3 rounded-xl hover:bg-gray-100 text-gray-400 font-bold text-xs"
                                                    onClick={() => router.push("/services")}
                                                >
                                                    <Edit2 className="h-3.5 w-3.5 mr-2" />
                                                    Urus
                                                </Button>
                                            </div>
                                        </div>
                                    </CardContent>
                                </Card>
                            );
                        })}
                    </div>
                )}
            </div>
        </div >
    );
}
