"use client";

import { useEffect, useState } from "react";
import { inventoryService } from "@/lib/services/inventory-service";
import { Loader2, ArrowUpRight, ArrowDownLeft, RefreshCcw } from "lucide-react";
import { formatCurrency } from "@/lib/utils";
import { Badge } from "@/components/ui";

export function InventoryHistoryTab() {
    const [history, setHistory] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchHistory = async () => {
            setLoading(true);
            try {
                const data = await inventoryService.getMovementHistory();
                setHistory(data);
            } catch (error) {
                console.error("Failed to fetch history:", error);
            }
            setLoading(false);
        };
        fetchHistory();
    }, []);

    if (loading) {
        return (
            <div className="py-24 text-center text-gray-400 bg-white rounded-[2.5rem] shadow-sm">
                <Loader2 className="h-8 w-8 animate-spin mx-auto mb-4 text-[#2e7d32]/20" />
                <p className="text-[10px] font-black uppercase tracking-widest">Memuatkan Rekod...</p>
            </div>
        );
    }

    if (history.length === 0) {
        return (
            <div className="py-24 text-center text-[10px] font-black uppercase tracking-widest text-gray-400 bg-white rounded-[2.5rem] shadow-sm">
                Tiada rekod pergerakan stok ditemui
            </div>
        );
    }

    return (
        <div className="bg-white rounded-[2.5rem] shadow-sm overflow-hidden border border-gray-50">
            <div className="overflow-x-auto">
                <table className="w-full">
                    <thead>
                        <tr className="bg-gray-50/50">
                            <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Tarikh & Masa</th>
                            <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Produk</th>
                            <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Jenis</th>
                            <th className="text-center py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Kuantiti</th>
                            <th className="text-center py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Baki</th>
                            <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Sebab</th>
                        </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-50">
                        {history.map((record) => (
                            <tr key={record.id} className="group hover:bg-gray-50/50 transition-colors">
                                <td className="py-5 px-8">
                                    <div className="flex flex-col">
                                        <span className="text-sm font-bold text-gray-900">
                                            {new Date(record.created_at).toLocaleDateString()}
                                        </span>
                                        <span className="text-[10px] font-bold text-gray-400 uppercase tracking-widest">
                                            {new Date(record.created_at).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}
                                        </span>
                                    </div>
                                </td>
                                <td className="py-5 px-8">
                                    <div className="flex flex-col">
                                        <span className="text-sm font-black text-gray-900">{record.product?.name}</span>
                                        <span className="text-[10px] font-bold text-gray-400 uppercase tracking-widest">{record.product?.brand}</span>
                                    </div>
                                </td>
                                <td className="py-5 px-8">
                                    {record.type === 'in' ? (
                                        <Badge className="bg-green-50 text-green-600 border-none font-black text-[9px] uppercase tracking-widest px-2.5 py-1 rounded-lg">
                                            <ArrowUpRight className="h-3 w-3 mr-1" /> Masuk
                                        </Badge>
                                    ) : record.type === 'out' ? (
                                        <Badge className="bg-red-50 text-red-600 border-none font-black text-[9px] uppercase tracking-widest px-2.5 py-1 rounded-lg">
                                            <ArrowDownLeft className="h-3 w-3 mr-1" /> Keluar
                                        </Badge>
                                    ) : (
                                        <Badge className="bg-blue-50 text-blue-600 border-none font-black text-[9px] uppercase tracking-widest px-2.5 py-1 rounded-lg">
                                            <RefreshCcw className="h-3 w-3 mr-1" /> Pelarasan
                                        </Badge>
                                    )}
                                </td>
                                <td className="py-5 px-8 text-center">
                                    <span className={`text-sm font-black tabular-nums ${record.quantity > 0 ? "text-green-600" : "text-red-600"}`}>
                                        {record.quantity > 0 ? `+${record.quantity}` : record.quantity}
                                    </span>
                                </td>
                                <td className="py-5 px-8 text-center text-sm font-bold text-gray-500 tabular-nums">
                                    {record.balance_after}
                                </td>
                                <td className="py-5 px-8 text-sm text-gray-500 italic">
                                    {record.reason || "-"}
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
}
