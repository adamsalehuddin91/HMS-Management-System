"use client";

import { useEffect, useState, useCallback } from "react";
import { inventoryService } from "@/lib/services/inventory-service";
import { Loader2, ArrowUpRight, ArrowDownLeft, RefreshCcw, Search, Filter, ChevronLeft, ChevronRight } from "lucide-react";
import { Badge, Button, Input } from "@/components/ui";

const PAGE_SIZE = 15;

const TYPE_OPTIONS = [
    { value: "", label: "Semua Jenis" },
    { value: "in", label: "Masuk" },
    { value: "out", label: "Keluar" },
    { value: "adjust", label: "Pelarasan" },
];

export function InventoryHistoryTab() {
    const [history, setHistory] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [total, setTotal] = useState(0);
    const [page, setPage] = useState(0);

    // Filters
    const [products, setProducts] = useState<{ id: string; name: string }[]>([]);
    const [filterProduct, setFilterProduct] = useState("");
    const [filterType, setFilterType] = useState("");
    const [filterDateFrom, setFilterDateFrom] = useState("");
    const [filterDateTo, setFilterDateTo] = useState("");

    useEffect(() => {
        inventoryService.getProductList().then(setProducts).catch(() => { });
    }, []);

    const fetchHistory = useCallback(async () => {
        setLoading(true);
        try {
            const { data, total: count } = await inventoryService.getMovementHistory({
                limit: PAGE_SIZE,
                offset: page * PAGE_SIZE,
                productId: filterProduct || undefined,
                type: filterType || undefined,
                dateFrom: filterDateFrom || undefined,
                dateTo: filterDateTo || undefined,
            });
            setHistory(data);
            setTotal(count);
        } catch (error) {
            console.error("Failed to fetch history:", error);
        }
        setLoading(false);
    }, [page, filterProduct, filterType, filterDateFrom, filterDateTo]);

    useEffect(() => {
        fetchHistory();
    }, [fetchHistory]);

    const totalPages = Math.ceil(total / PAGE_SIZE);

    const handleFilterChange = () => {
        setPage(0);
    };

    return (
        <div className="space-y-6">
            {/* Filters */}
            <div className="bg-white rounded-[2rem] shadow-sm border border-gray-50 p-6">
                <div className="flex items-center gap-2 mb-4">
                    <Filter className="h-4 w-4 text-gray-400" />
                    <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Tapis Rekod</span>
                </div>
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                    <div>
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5 block">Produk</label>
                        <select
                            value={filterProduct}
                            onChange={(e) => { setFilterProduct(e.target.value); handleFilterChange(); }}
                            className="w-full h-11 px-4 rounded-xl border border-gray-200 text-sm font-bold text-gray-700 bg-white focus:border-[#2e7d32] focus:ring-1 focus:ring-[#2e7d32] outline-none transition-colors"
                        >
                            <option value="">Semua Produk</option>
                            {products.map(p => (
                                <option key={p.id} value={p.id}>{p.name}</option>
                            ))}
                        </select>
                    </div>
                    <div>
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5 block">Jenis</label>
                        <select
                            value={filterType}
                            onChange={(e) => { setFilterType(e.target.value); handleFilterChange(); }}
                            className="w-full h-11 px-4 rounded-xl border border-gray-200 text-sm font-bold text-gray-700 bg-white focus:border-[#2e7d32] focus:ring-1 focus:ring-[#2e7d32] outline-none transition-colors"
                        >
                            {TYPE_OPTIONS.map(opt => (
                                <option key={opt.value} value={opt.value}>{opt.label}</option>
                            ))}
                        </select>
                    </div>
                    <div>
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5 block">Dari Tarikh</label>
                        <input
                            type="date"
                            value={filterDateFrom}
                            onChange={(e) => { setFilterDateFrom(e.target.value); handleFilterChange(); }}
                            className="w-full h-11 px-4 rounded-xl border border-gray-200 text-sm font-bold text-gray-700 bg-white focus:border-[#2e7d32] focus:ring-1 focus:ring-[#2e7d32] outline-none transition-colors"
                        />
                    </div>
                    <div>
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5 block">Hingga Tarikh</label>
                        <input
                            type="date"
                            value={filterDateTo}
                            onChange={(e) => { setFilterDateTo(e.target.value); handleFilterChange(); }}
                            className="w-full h-11 px-4 rounded-xl border border-gray-200 text-sm font-bold text-gray-700 bg-white focus:border-[#2e7d32] focus:ring-1 focus:ring-[#2e7d32] outline-none transition-colors"
                        />
                    </div>
                </div>
            </div>

            {/* Table */}
            {loading ? (
                <div className="py-24 text-center text-gray-400 bg-white rounded-[2.5rem] shadow-sm">
                    <Loader2 className="h-8 w-8 animate-spin mx-auto mb-4 text-[#2e7d32]/20" />
                    <p className="text-[10px] font-black uppercase tracking-widest">Memuatkan Rekod...</p>
                </div>
            ) : history.length === 0 ? (
                <div className="py-24 text-center bg-white rounded-[2.5rem] shadow-sm">
                    <p className="text-[10px] font-black uppercase tracking-widest text-gray-400">
                        {filterProduct || filterType || filterDateFrom || filterDateTo
                            ? "Tiada rekod sepadan dengan tapisan"
                            : "Tiada rekod pergerakan stok ditemui"}
                    </p>
                    <p className="text-[10px] text-gray-300 mt-2">
                        Rekod akan muncul selepas pelarasan stok atau jualan produk
                    </p>
                </div>
            ) : (
                <>
                    <div className="bg-white rounded-[2.5rem] shadow-sm overflow-hidden border border-gray-50">
                        <div className="overflow-x-auto">
                            <table className="w-full">
                                <thead>
                                    <tr className="bg-gray-50/50">
                                        <th className="text-left py-5 px-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Tarikh & Masa</th>
                                        <th className="text-left py-5 px-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Produk</th>
                                        <th className="text-left py-5 px-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Jenis</th>
                                        <th className="text-center py-5 px-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Kuantiti</th>
                                        <th className="text-center py-5 px-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Sebelum</th>
                                        <th className="text-center py-5 px-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Selepas</th>
                                        <th className="text-left py-5 px-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Sebab</th>
                                        <th className="text-left py-5 px-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Oleh</th>
                                    </tr>
                                </thead>
                                <tbody className="divide-y divide-gray-50">
                                    {history.map((record) => (
                                        <tr key={record.id} className="group hover:bg-gray-50/50 transition-colors">
                                            <td className="py-4 px-6">
                                                <div className="flex flex-col">
                                                    <span className="text-sm font-bold text-gray-900">
                                                        {new Date(record.created_at).toLocaleDateString('ms-MY')}
                                                    </span>
                                                    <span className="text-[10px] font-bold text-gray-400 tracking-widest">
                                                        {new Date(record.created_at).toLocaleTimeString('ms-MY', { hour: '2-digit', minute: '2-digit' })}
                                                    </span>
                                                </div>
                                            </td>
                                            <td className="py-4 px-6">
                                                <div className="flex flex-col">
                                                    <span className="text-sm font-black text-gray-900">{record.product?.name || '-'}</span>
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase tracking-widest">{record.product?.brand || ''}</span>
                                                </div>
                                            </td>
                                            <td className="py-4 px-6">
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
                                            <td className="py-4 px-6 text-center">
                                                <span className={`text-sm font-black tabular-nums ${record.quantity > 0 ? "text-green-600" : "text-red-600"}`}>
                                                    {record.quantity > 0 ? `+${record.quantity}` : record.quantity}
                                                </span>
                                            </td>
                                            <td className="py-4 px-6 text-center text-sm font-bold text-gray-400 tabular-nums">
                                                {record.balance_before}
                                            </td>
                                            <td className="py-4 px-6 text-center text-sm font-black text-gray-700 tabular-nums">
                                                {record.balance_after}
                                            </td>
                                            <td className="py-4 px-6 text-sm text-gray-500 italic max-w-[160px] truncate">
                                                {record.reason || "-"}
                                            </td>
                                            <td className="py-4 px-6 text-sm text-gray-500">
                                                {record.performer?.name || "-"}
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </div>

                    {/* Pagination */}
                    {totalPages > 1 && (
                        <div className="flex items-center justify-between px-2">
                            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest">
                                {page * PAGE_SIZE + 1}–{Math.min((page + 1) * PAGE_SIZE, total)} daripada {total} rekod
                            </p>
                            <div className="flex items-center gap-2">
                                <Button
                                    variant="outline"
                                    size="sm"
                                    onClick={() => setPage(p => Math.max(0, p - 1))}
                                    disabled={page === 0}
                                    className="h-9 w-9 p-0 rounded-xl"
                                >
                                    <ChevronLeft className="h-4 w-4" />
                                </Button>
                                <span className="text-sm font-black text-gray-600 tabular-nums px-2">
                                    {page + 1} / {totalPages}
                                </span>
                                <Button
                                    variant="outline"
                                    size="sm"
                                    onClick={() => setPage(p => Math.min(totalPages - 1, p + 1))}
                                    disabled={page >= totalPages - 1}
                                    className="h-9 w-9 p-0 rounded-xl"
                                >
                                    <ChevronRight className="h-4 w-4" />
                                </Button>
                            </div>
                        </div>
                    )}
                </>
            )}
        </div>
    );
}
