"use client";

import { X, Loader2 } from "lucide-react";
import { Button, Card, CardContent, Input } from "@/components/ui";

export interface ServiceFormData {
    name: string;
    category: string;
    price: number;
    member_price: number;
    duration: number;
    commission_rate: number;
    // Promo fields
    promo_id?: string;
    promo_price?: number;
    promo_description?: string;
    promo_start_date?: string;
    promo_end_date?: string;
    promo_active?: boolean;
    has_promo?: boolean; // UI toggle state
}

interface ServiceModalsProps {
    showAddModal: boolean;
    setShowAddModal: (show: boolean) => void;
    newService: ServiceFormData;
    setNewService: (service: ServiceFormData) => void;

    showEditModal: boolean;
    setShowEditModal: (show: boolean) => void;
    editService: ServiceFormData;
    setEditService: (service: ServiceFormData) => void;

    savingService: boolean;
    handleAddService: () => void;
    handleEditService: () => void;
    categories: string[];
}

export function ServiceModals({
    showAddModal,
    setShowAddModal,
    newService,
    setNewService,
    showEditModal,
    setShowEditModal,
    editService,
    setEditService,
    savingService,
    handleAddService,
    handleEditService,
    categories
}: ServiceModalsProps) {
    if (!showAddModal && !showEditModal) return null;

    const isEdit = showEditModal;
    const currentService = isEdit ? editService : newService;
    const setCurrentService = isEdit ? setEditService : setNewService;
    const handleSave = isEdit ? handleEditService : handleAddService;
    const closeModal = () => isEdit ? setShowEditModal(false) : setShowAddModal(false);

    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
            <Card className="w-full max-w-lg border-none shadow-2xl bg-white rounded-[2.5rem] overflow-hidden">
                <CardContent className="p-10">
                    <div className="flex items-center justify-between mb-8">
                        <div>
                            <h3 className="text-2xl font-black text-gray-900 tracking-tight">{isEdit ? "Kemaskini Servis" : "Tambah Servis Baru"}</h3>
                            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">Sila isi maklumat perkhidmatan</p>
                        </div>
                        <button
                            onClick={closeModal}
                            className="h-10 w-10 flex items-center justify-center rounded-xl bg-gray-50 text-gray-400 hover:text-red-500 hover:bg-red-50 transition-all"
                        >
                            <X className="h-5 w-5" />
                        </button>
                    </div>

                    <div className="space-y-6">
                        <div className="space-y-2">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Nama Perkhidmatan *</label>
                            <Input
                                placeholder="cth: Gunting Rambut Basic"
                                value={currentService.name}
                                onChange={(e) => setCurrentService({ ...currentService, name: e.target.value })}
                                className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
                            />
                        </div>

                        <div className="space-y-2">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Kategori</label>
                            <select
                                value={currentService.category}
                                onChange={(e) => setCurrentService({ ...currentService, category: e.target.value })}
                                className="w-full h-12 px-5 bg-gray-50 border-none rounded-2xl focus:outline-none focus:ring-1 focus:ring-[#2e7d32]/20 font-bold text-xs transition-all appearance-none"
                            >
                                {categories.filter(c => c !== "All").map(cat => (
                                    <option key={cat} value={cat}>{cat}</option>
                                ))}
                            </select>
                        </div>

                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Harga (RM) *</label>
                                <Input
                                    type="number"
                                    placeholder="0"
                                    value={currentService.price || ""}
                                    onChange={(e) => setCurrentService({ ...currentService, price: Number(e.target.value) })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold tabular-nums"
                                />
                            </div>
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1 text-[#2e7d32]">Harga Ahli (VIP)</label>
                                <Input
                                    type="number"
                                    placeholder="0"
                                    value={currentService.member_price || ""}
                                    onChange={(e) => setCurrentService({ ...currentService, member_price: Number(e.target.value) })}
                                    className="h-12 bg-green-50/50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold tabular-nums text-[#2e7d32]"
                                />
                            </div>
                        </div>

                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Durasi (Minit)</label>
                                <Input
                                    type="number"
                                    value={currentService.duration}
                                    onChange={(e) => setCurrentService({ ...currentService, duration: Number(e.target.value) })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold tabular-nums"
                                />
                            </div>
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Kadar Komisen (%)</label>
                                <Input
                                    type="number"
                                    value={currentService.commission_rate}
                                    onChange={(e) => setCurrentService({ ...currentService, commission_rate: Number(e.target.value) })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold tabular-nums"
                                />
                            </div>
                        </div>

                        {/* Promotion Section */}
                        {isEdit && (
                            <div className="pt-6 border-t border-gray-100">
                                <div className="flex items-center justify-between mb-6">
                                    <div>
                                        <h4 className="text-sm font-black text-gray-900 uppercase tracking-tight">Tetapan Promosi</h4>
                                        <p className="text-[10px] font-bold text-gray-400">Aktifkan harga istimewa untuk tempoh terhad</p>
                                    </div>
                                    <div className="flex items-center gap-3">
                                        <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">
                                            {currentService.has_promo ? "ON" : "OFF"}
                                        </span>
                                        <button
                                            onClick={() => setCurrentService({ ...currentService, has_promo: !currentService.has_promo })}
                                            className={`relative h-6 w-11 rounded-full transition-colors ${currentService.has_promo ? "bg-[#2e7d32]" : "bg-gray-200"}`}
                                        >
                                            <span className={`absolute top-0.5 h-5 w-5 rounded-full bg-white shadow transition-transform ${currentService.has_promo ? "translate-x-5" : "translate-x-0.5"}`} />
                                        </button>
                                    </div>
                                </div>

                                {currentService.has_promo && (
                                    <div className="space-y-6 animate-in fade-in slide-in-from-top-2 duration-300">
                                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                                            <div className="space-y-2">
                                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1 text-amber-600">Harga Promosi (RM)</label>
                                                <div className="relative">
                                                    <Input
                                                        type="number"
                                                        placeholder="0.00"
                                                        value={currentService.promo_price || ""}
                                                        onChange={(e) => setCurrentService({ ...currentService, promo_price: parseFloat(e.target.value) })}
                                                        className="h-12 bg-amber-50/50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-amber-500/20 font-bold tabular-nums text-amber-700 pr-16"
                                                    />
                                                    {currentService.price > 0 && (currentService.promo_price || 0) > 0 && (currentService.promo_price || 0) < currentService.price && (
                                                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                                                            <span className="text-[9px] font-black text-amber-600 bg-amber-100 px-2 py-0.5 rounded-lg">
                                                                -{Math.round(((currentService.price - (currentService.promo_price || 0)) / currentService.price) * 100)}%
                                                            </span>
                                                        </div>
                                                    )}
                                                </div>
                                            </div>
                                            <div className="space-y-2">
                                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Status</label>
                                                <select
                                                    value={currentService.promo_active ? "active" : "inactive"}
                                                    onChange={(e) => setCurrentService({ ...currentService, promo_active: e.target.value === "active" })}
                                                    className="w-full h-12 px-5 bg-gray-50 border-none rounded-2xl focus:outline-none focus:ring-1 focus:ring-[#2e7d32]/20 font-bold text-xs transition-all appearance-none"
                                                >
                                                    <option value="active">Aktif</option>
                                                    <option value="inactive">Tidak Aktif (Disimpan)</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div className="space-y-2">
                                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Ayat Promosi (Pemasaran)</label>
                                            <textarea
                                                placeholder="cth: Istimewa Hari Raya! Potongan 20% untuk semua pelanggan."
                                                value={currentService.promo_description || ""}
                                                onChange={(e) => setCurrentService({ ...currentService, promo_description: e.target.value })}
                                                className="w-full h-20 p-4 bg-gray-50 border-none rounded-2xl focus:outline-none focus:ring-1 focus:ring-[#2e7d32]/20 font-bold text-sm resize-none"
                                            />
                                        </div>

                                        <div className="grid grid-cols-2 gap-6">
                                            <div className="space-y-2">
                                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Tarikh Mula</label>
                                                <Input
                                                    type="date"
                                                    value={currentService.promo_start_date || ""}
                                                    onChange={(e) => setCurrentService({ ...currentService, promo_start_date: e.target.value })}
                                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
                                                />
                                            </div>
                                            <div className="space-y-2">
                                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Tarikh Tamat</label>
                                                <Input
                                                    type="date"
                                                    value={currentService.promo_end_date || ""}
                                                    min={currentService.promo_start_date || undefined}
                                                    onChange={(e) => {
                                                        const endDate = e.target.value;
                                                        if (currentService.promo_start_date && endDate < currentService.promo_start_date) return;
                                                        setCurrentService({ ...currentService, promo_end_date: endDate });
                                                    }}
                                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                )}
                            </div>
                        )}
                    </div>

                    <div className="flex gap-4 mt-10">
                        <Button
                            variant="outline"
                            className="flex-1 h-13 rounded-2xl border-gray-100 text-[11px] font-black uppercase tracking-widest text-gray-400"
                            onClick={closeModal}
                        >
                            Batal
                        </Button>
                        <Button
                            className="flex-1 h-13 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-xl shadow-green-100 text-[11px] font-black uppercase tracking-widest"
                            onClick={handleSave}
                            disabled={savingService}
                        >
                            {savingService ? (
                                <Loader2 className="h-5 w-5 animate-spin" />
                            ) : (
                                isEdit ? "Simpan Perubahan" : "Terbitkan Servis"
                            )}
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div >
    );
}
