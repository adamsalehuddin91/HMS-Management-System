"use client";

import { X, Loader2 } from "lucide-react";
import { Button, Card, CardContent, Input } from "@/components/ui";

interface ServiceFormData {
    name: string;
    category: string;
    price: number;
    member_price: number;
    duration: number;
    commission_rate: number;
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
        </div>
    );
}
