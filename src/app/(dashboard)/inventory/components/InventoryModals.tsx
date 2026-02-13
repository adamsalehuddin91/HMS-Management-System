"use client";

import { X, Loader2, Minus, Plus } from "lucide-react";
import { Button, Card, CardContent, Input } from "@/components/ui";

export interface ProductFormData {
    name: string;
    sku?: string;
    brand?: string;
    category: string;
    cost_price: number;
    sell_price: number;
    stock_quantity: number;
    reorder_level: number;
    low_stock_threshold: number;
}

interface StockProductData extends ProductFormData {
    id: string;
}

interface InventoryModalsProps {
    showAddModal: boolean;
    setShowAddModal: (show: boolean) => void;
    newProduct: ProductFormData;
    setNewProduct: (product: ProductFormData) => void;
    savingProduct: boolean;
    handleAddProduct: () => void;

    showEditModal: boolean;
    setShowEditModal: (show: boolean) => void;
    editProduct: ProductFormData;
    setEditProduct: (product: ProductFormData) => void;
    savingEdit: boolean;
    handleEditProduct: () => void;

    showStockModal: boolean;
    setShowStockModal: (show: boolean) => void;
    stockProduct: StockProductData | null;
    setStockProduct: (product: StockProductData | null) => void;
    stockAdjustment: number;
    setStockAdjustment: (adj: number) => void;
    stockReason: string;
    setStockReason: (reason: string) => void;
    savingStock: boolean;
    handleStockAdjustment: () => void;

    productCategories: string[];
}

export function InventoryModals({
    showAddModal,
    setShowAddModal,
    newProduct,
    setNewProduct,
    savingProduct,
    handleAddProduct,
    showEditModal,
    setShowEditModal,
    editProduct,
    setEditProduct,
    savingEdit,
    handleEditProduct,
    showStockModal,
    setShowStockModal,
    stockProduct,
    setStockProduct,
    stockAdjustment,
    setStockAdjustment,
    stockReason,
    setStockReason,
    savingStock,
    handleStockAdjustment,
    productCategories
}: InventoryModalsProps) {
    if (!showAddModal && !showEditModal && !showStockModal) return null;

    const closeModal = () => {
        setShowAddModal(false);
        setShowEditModal(false);
        setShowStockModal(false);
    };

    // Stock Adjustment Modal
    if (showStockModal && stockProduct) {
        return (
            <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
                <Card className="w-full max-w-md border-none shadow-2xl bg-white rounded-[2.5rem] overflow-hidden">
                    <CardContent className="p-10">
                        <div className="flex items-center justify-between mb-8">
                            <div>
                                <h3 className="text-2xl font-black text-gray-900 tracking-tight">Pelarasan Stok</h3>
                                <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">{stockProduct.name}</p>
                            </div>
                            <button onClick={closeModal} className="h-10 w-10 flex items-center justify-center rounded-xl bg-gray-50 text-gray-400 hover:text-red-500 hover:bg-red-50 transition-all">
                                <X className="h-5 w-5" />
                            </button>
                        </div>

                        <div className="p-6 bg-[#2e7d32]/5 rounded-[2rem] border border-[#2e7d32]/10 text-center mb-8">
                            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Stok Sedia Ada</p>
                            <p className="text-3xl font-black text-[#2e7d32] tabular-nums tracking-tighter">{stockProduct.stock_quantity} Unit</p>
                        </div>

                        <div className="space-y-8">
                            <div>
                                <label className="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-4">Ubah Kuantiti</label>
                                <div className="flex items-center gap-4 bg-gray-50/50 p-2 rounded-[24px] border border-gray-100">
                                    <button
                                        onClick={() => setStockAdjustment(stockAdjustment - 1)}
                                        className="h-11 w-11 rounded-2xl bg-white shadow-sm flex items-center justify-center hover:bg-red-50 hover:text-red-500 transition-all active:scale-95"
                                    >
                                        <Minus className="h-5 w-5" />
                                    </button>
                                    <input
                                        type="number"
                                        value={stockAdjustment === 0 ? "" : stockAdjustment}
                                        onChange={(e) => setStockAdjustment(Number(e.target.value))}
                                        className={`flex-1 text-center text-3xl font-black bg-transparent outline-none tabular-nums tracking-tighter ${stockAdjustment > 0 ? "text-[#2e7d32]" : stockAdjustment < 0 ? "text-red-500" : "text-gray-300"}`}
                                        placeholder="0"
                                    />
                                    <button
                                        onClick={() => setStockAdjustment(stockAdjustment + 1)}
                                        className="h-11 w-11 rounded-2xl bg-white shadow-sm flex items-center justify-center hover:bg-green-50 hover:text-green-500 transition-all active:scale-95"
                                    >
                                        <Plus className="h-5 w-5" />
                                    </button>
                                </div>
                                <p className="text-[9px] font-bold text-gray-400 text-center mt-3 uppercase tracking-widest">
                                    Stok baru: <span className="text-gray-900">{Math.max(0, stockProduct.stock_quantity + stockAdjustment)} unit</span>
                                </p>
                            </div>

                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Sebab Perubahan</label>
                                <select
                                    value={stockReason}
                                    onChange={(e) => setStockReason(e.target.value)}
                                    className="w-full h-12 px-5 bg-gray-50 border-none rounded-2xl focus:outline-none focus:ring-1 focus:ring-[#2e7d32]/20 font-bold text-xs transition-all appearance-none"
                                >
                                    <option>Stok Masuk / Restock</option>
                                    <option>Dipulangkan</option>
                                    <option>Kerosakan / Expired</option>
                                    <option>Kegunaan Kedai</option>
                                    <option>Pelarasan Manual</option>
                                </select>
                            </div>

                            <div className="pt-2">
                                <Button
                                    className="w-full h-14 rounded-[1.5rem] bg-[#2e7d32] hover:bg-[#1b5e20] shadow-xl shadow-green-900/10 font-black uppercase tracking-[0.1em] text-[11px]"
                                    onClick={handleStockAdjustment}
                                    disabled={savingStock || stockAdjustment === 0}
                                >
                                    {savingStock ? (
                                        <Loader2 className="h-5 w-5 animate-spin" />
                                    ) : (
                                        "Sahkan Pelarasan"
                                    )}
                                </Button>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>
        );
    }

    const isEdit = showEditModal;
    const currentProduct = isEdit ? editProduct : newProduct;
    const setCurrentProduct = isEdit ? setEditProduct : setNewProduct;
    const handleSave = isEdit ? handleEditProduct : handleAddProduct;

    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
            <Card className="w-full max-w-lg border-none shadow-2xl bg-white rounded-[2.5rem] overflow-hidden">
                <CardContent className="p-10">
                    <div className="flex items-center justify-between mb-8">
                        <div>
                            <h3 className="text-2xl font-black text-gray-900 tracking-tight">{isEdit ? "Kemaskini Produk" : "Produk Baru"}</h3>
                            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">Sila isi maklumat inventori</p>
                        </div>
                        <button onClick={closeModal} className="h-10 w-10 flex items-center justify-center rounded-xl bg-gray-50 text-gray-400 hover:text-red-500 hover:bg-red-50 transition-all">
                            <X className="h-5 w-5" />
                        </button>
                    </div>

                    <div className="space-y-6">
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Nama Produk *</label>
                                <Input
                                    placeholder="cth: Hair Oil"
                                    value={currentProduct.name}
                                    onChange={(e) => setCurrentProduct({ ...currentProduct, name: e.target.value })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
                                />
                            </div>
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Jenama</label>
                                <Input
                                    placeholder="cth: L'Oreal"
                                    value={currentProduct.brand || ""}
                                    onChange={(e) => setCurrentProduct({ ...currentProduct, brand: e.target.value })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
                                />
                            </div>
                        </div>

                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Kategori</label>
                                <select
                                    value={currentProduct.category}
                                    onChange={(e) => setCurrentProduct({ ...currentProduct, category: e.target.value })}
                                    className="w-full h-12 px-5 bg-gray-50 border-none rounded-2xl focus:outline-none focus:ring-1 focus:ring-[#2e7d32]/20 font-bold text-xs transition-all appearance-none"
                                >
                                    {productCategories.map(cat => (
                                        <option key={cat} value={cat}>{cat}</option>
                                    ))}
                                </select>
                            </div>
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">SKU</label>
                                <Input
                                    placeholder="SKU-XXX"
                                    value={currentProduct.sku || ""}
                                    onChange={(e) => setCurrentProduct({ ...currentProduct, sku: e.target.value })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold uppercase"
                                />
                            </div>
                        </div>

                        <div className="grid grid-cols-2 sm:grid-cols-3 gap-6">
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Harga Kos</label>
                                <div className="relative">
                                    <span className="absolute left-4 top-1/2 -translate-y-1/2 text-[10px] font-black text-gray-300">RM</span>
                                    <Input
                                        type="number"
                                        value={currentProduct.cost_price || ""}
                                        onChange={(e) => setCurrentProduct({ ...currentProduct, cost_price: Number(e.target.value) })}
                                        className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold pl-10 tabular-nums"
                                    />
                                </div>
                            </div>
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Harga Jual *</label>
                                <div className="relative">
                                    <span className="absolute left-4 top-1/2 -translate-y-1/2 text-[10px] font-black text-gray-300">RM</span>
                                    <Input
                                        type="number"
                                        value={currentProduct.sell_price || ""}
                                        onChange={(e) => setCurrentProduct({ ...currentProduct, sell_price: Number(e.target.value) })}
                                        className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold pl-10 tabular-nums text-[#2e7d32]"
                                    />
                                </div>
                            </div>
                            <div className="space-y-2 col-span-2 sm:col-span-1">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Stok Awal</label>
                                <Input
                                    type="number"
                                    value={currentProduct.stock_quantity || ""}
                                    onChange={(e) => setCurrentProduct({ ...currentProduct, stock_quantity: Number(e.target.value) })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold tabular-nums"
                                    disabled={isEdit}
                                />
                            </div>
                        </div>

                        <div className="space-y-2">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Had Stok Rendah (Amaran)</label>
                            <Input
                                type="number"
                                value={currentProduct.low_stock_threshold}
                                onChange={(e) => setCurrentProduct({ ...currentProduct, low_stock_threshold: Number(e.target.value) })}
                                className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold tabular-nums"
                            />
                        </div>
                    </div>

                    <div className="flex gap-4 mt-10">
                        <Button
                            variant="outline"
                            className="flex-1 h-13 rounded-2xl border-gray-100 text-[11px] font-black uppercase tracking-widest text-gray-400 hover:bg-gray-50"
                            onClick={closeModal}
                        >
                            Batal
                        </Button>
                        <Button
                            className="flex-1 h-13 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-xl shadow-green-900/10 font-black uppercase tracking-widest text-[11px]"
                            onClick={handleSave}
                            disabled={(isEdit ? savingEdit : savingProduct)}
                        >
                            {(isEdit ? savingEdit : savingProduct) ? (
                                <Loader2 className="h-5 w-5 animate-spin" />
                            ) : (
                                isEdit ? "Simpan Perubahan" : "Tambah Produk"
                            )}
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
