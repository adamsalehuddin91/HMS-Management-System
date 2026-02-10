"use client";

import { MoreVertical, Loader2, Edit3, PackagePlus } from "lucide-react";
import { Card, CardContent, Badge } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface ProductWithUI {
    id: string;
    name: string;
    brand: string | null;
    category: string;
    sku: string | null;
    stockLevel: number;
    status: 'in_stock' | 'low_stock' | 'out_of_stock';
    price: number;
    image: string;
}

interface ProductMasterTableProps {
    loading: boolean;
    products: ProductWithUI[];
    actionMenuId: string | null;
    setActionMenuId: (id: string | null) => void;
    openEditModal: (product: ProductWithUI) => void;
    openStockModal: (product: ProductWithUI) => void;
}

export function ProductMasterTable({
    loading,
    products,
    actionMenuId,
    setActionMenuId,
    openEditModal,
    openStockModal
}: ProductMasterTableProps) {
    const getStockIndicator = (status: string, level: number) => {
        if (status === "out_of_stock") {
            return (
                <Badge className="bg-red-50 text-red-600 border-none font-black text-[9px] uppercase tracking-widest px-2 py-0.5 rounded-lg">
                    Habis Stok
                </Badge>
            );
        }

        const colorClass = status === "low_stock" ? "bg-orange-500" : "bg-[#2e7d32]";
        const bgClass = status === "low_stock" ? "bg-orange-50" : "bg-green-50";
        const textClass = status === "low_stock" ? "text-orange-600" : "text-[#2e7d32]";

        return (
            <div className="flex items-center gap-3">
                <div className={`w-16 h-1.5 ${bgClass} rounded-full overflow-hidden border border-gray-100/50`}>
                    <div
                        className={`h-full ${colorClass} rounded-full transition-all duration-1000 shadow-[0_0_8px_rgba(46,125,50,0.3)]`}
                        style={{ width: `${Math.min(100, (level / 50) * 100)}%` }}
                    />
                </div>
                <span className={`text-[10px] font-black ${textClass} tabular-nums uppercase tracking-widest`}>{level} Unit</span>
            </div>
        );
    };

    return (
        <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
            <CardContent className="p-0">
                <div className="hidden md:block overflow-x-auto">
                    <table className="w-full">
                        <thead>
                            <tr className="bg-gray-50/50">
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Produk</th>
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Kategori</th>
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Tahap Stok</th>
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Harga Jualan</th>
                                <th className="text-left py-6 px-8 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Tindakan</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-gray-50">
                            {loading ? (
                                <tr>
                                    <td colSpan={5} className="py-24 text-center text-gray-400">
                                        <Loader2 className="h-8 w-8 animate-spin mx-auto mb-4 text-[#2e7d32]/20" />
                                        <p className="text-[10px] font-black uppercase tracking-widest">Memuatkan Inventori...</p>
                                    </td>
                                </tr>
                            ) : products.length === 0 ? (
                                <tr>
                                    <td colSpan={5} className="py-24 text-center text-[10px] font-black uppercase tracking-widest text-gray-400">Tiada produk dijumpai</td>
                                </tr>
                            ) : (
                                products.map((product) => (
                                    <tr key={product.id} className="group hover:bg-gray-50/50 transition-all duration-300">
                                        <td className="py-5 px-8">
                                            <div className="flex items-center gap-5">
                                                <img
                                                    src={product.image}
                                                    alt={product.name}
                                                    className="h-12 w-12 rounded-2xl object-cover shadow-sm group-hover:scale-105 transition-transform"
                                                />
                                                <div>
                                                    <span className="font-black text-sm text-gray-900 tracking-tight block mb-0.5">{product.name}</span>
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase tracking-widest">{product.brand || "Tiada Jenama"}</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td className="py-5 px-8">
                                            <Badge className="bg-white border-gray-100 text-gray-400 font-black text-[8px] uppercase tracking-widest px-2.5 py-1 rounded-lg group-hover:border-[#2e7d32]/20 group-hover:text-[#2e7d32] transition-colors">{product.category}</Badge>
                                        </td>
                                        <td className="py-5 px-8">
                                            {getStockIndicator(product.status, product.stockLevel)}
                                        </td>
                                        <td className="py-5 px-8 font-black text-sm text-gray-900 tabular-nums">{formatCurrency(product.price)}</td>
                                        <td className="py-5 px-8">
                                            <div className="relative" data-action-menu>
                                                <button
                                                    onClick={(e) => { e.stopPropagation(); setActionMenuId(actionMenuId === product.id ? null : product.id); }}
                                                    className="h-10 w-10 flex items-center justify-center rounded-xl hover:bg-white hover:shadow-md text-gray-300 hover:text-[#2e7d32] transition-all"
                                                >
                                                    <MoreVertical className="h-5 w-5" />
                                                </button>
                                                {actionMenuId === product.id && (
                                                    <div className="absolute right-0 top-full mt-2 w-56 bg-white border border-gray-100 rounded-[1.5rem] shadow-2xl p-2 z-50">
                                                        <button
                                                            onClick={(e) => { e.stopPropagation(); openEditModal(product); }}
                                                            className="w-full flex items-center gap-3 px-4 py-3 text-[10px] font-black uppercase tracking-widest text-gray-500 hover:text-[#2e7d32] hover:bg-[#2e7d32]/5 rounded-xl transition-colors"
                                                        >
                                                            <Edit3 className="h-4 w-4" /> Kemaskini Produk
                                                        </button>
                                                        <button
                                                            onClick={(e) => { e.stopPropagation(); openStockModal(product); }}
                                                            className="w-full flex items-center gap-3 px-4 py-3 text-[10px] font-black uppercase tracking-widest text-gray-500 hover:text-[#2e7d32] hover:bg-[#2e7d32]/5 rounded-xl transition-colors"
                                                        >
                                                            <PackagePlus className="h-4 w-4" /> Selaras Stok
                                                        </button>
                                                    </div>
                                                )}
                                            </div>
                                        </td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                </div>

                {/* Mobile View */}
                <div className="md:hidden p-6 space-y-4">
                    {loading ? (
                        <div className="py-12 text-center">
                            <Loader2 className="h-6 w-6 animate-spin mx-auto text-[#2e7d32]/20" />
                        </div>
                    ) : products.length === 0 ? (
                        <p className="text-center py-12 text-[10px] font-black uppercase tracking-widest text-gray-400">Tiada produk</p>
                    ) : (
                        products.map((product) => (
                            <div key={product.id} className="bg-gray-50/50 p-6 rounded-[2rem] border border-gray-100/50 relative overflow-hidden group">
                                <div className="flex items-start justify-between mb-6">
                                    <div className="flex items-center gap-4">
                                        <img
                                            src={product.image}
                                            alt={product.name}
                                            className="h-14 w-14 rounded-2xl object-cover shadow-md"
                                        />
                                        <div>
                                            <h4 className="font-black text-gray-900 tracking-tight">{product.name}</h4>
                                            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">{product.brand}</p>
                                        </div>
                                    </div>
                                    <div className="relative" data-action-menu>
                                        <button
                                            onClick={(e) => { e.stopPropagation(); setActionMenuId(actionMenuId === product.id ? null : product.id); }}
                                            className="h-10 w-10 flex items-center justify-center rounded-xl bg-white shadow-sm text-gray-300"
                                        >
                                            <MoreVertical className="h-5 w-5" />
                                        </button>
                                        {actionMenuId === product.id && (
                                            <div className="absolute right-0 top-full mt-2 w-48 bg-white border border-gray-100 rounded-2xl shadow-xl p-2 z-50">
                                                <button onClick={() => openEditModal(product)} className="w-full flex items-center gap-3 px-4 py-3 text-[10px] font-black uppercase tracking-widest text-gray-500 hover:text-[#2e7d32] hover:bg-[#2e7d32]/5 rounded-xl">
                                                    Edit
                                                </button>
                                                <button onClick={() => openStockModal(product)} className="w-full flex items-center gap-3 px-4 py-3 text-[10px] font-black uppercase tracking-widest text-gray-500 hover:text-[#2e7d32] hover:bg-[#2e7d32]/5 rounded-xl">
                                                    Stok
                                                </button>
                                            </div>
                                        )}
                                    </div>
                                </div>

                                <div className="space-y-4">
                                    <div className="flex justify-between items-center bg-white/50 p-4 rounded-xl border border-white">
                                        <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Kategori</span>
                                        <Badge className="bg-[#2e7d32]/10 text-[#2e7d32] border-none font-black text-[9px] uppercase tracking-widest">{product.category}</Badge>
                                    </div>
                                    <div className="flex justify-between items-center bg-white/50 p-4 rounded-xl border border-white">
                                        <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Harga Jualan</span>
                                        <span className="font-black text-gray-900 tabular-nums">{formatCurrency(product.price)}</span>
                                    </div>
                                    <div className="pt-2">
                                        <div className="flex justify-between items-center mb-2">
                                            <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Status Stok</span>
                                            <span className="text-[10px] font-black text-gray-900 tabular-nums uppercase tracking-widest">{product.stockLevel} Unit</span>
                                        </div>
                                        {getStockIndicator(product.status, product.stockLevel)}
                                    </div>
                                </div>
                            </div>
                        ))
                    )}
                </div>
            </CardContent>
        </Card>
    );
}
