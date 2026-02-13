"use client";

import { X, Cake, MessageSquare, Loader2 } from "lucide-react";
import { Button, Card, CardContent, Input } from "@/components/ui";

type CustomerTier = 'Normal' | 'Member' | 'VIP';

export interface CustomerFormData {
    id?: string;
    name: string;
    phone: string;
    email: string;
    tier: CustomerTier;
    birthday: string;
    notes: string;
}

interface CustomerModalsProps {
    showNewModal: boolean;
    setShowNewModal: (show: boolean) => void;
    newCustomer: CustomerFormData;
    setNewCustomer: (customer: CustomerFormData) => void;
    savingNew: boolean;
    handleAddCustomer: () => void;

    showEditModal: boolean;
    setShowEditModal: (show: boolean) => void;
    editCustomer: CustomerFormData;
    setEditCustomer: (customer: CustomerFormData) => void;
    savingEdit: boolean;
    handleEditCustomer: () => void;
}

export function CustomerModals({
    showNewModal,
    setShowNewModal,
    newCustomer,
    setNewCustomer,
    savingNew,
    handleAddCustomer,
    showEditModal,
    setShowEditModal,
    editCustomer,
    setEditCustomer,
    savingEdit,
    handleEditCustomer
}: CustomerModalsProps) {
    if (!showNewModal && !showEditModal) return null;

    const isEdit = showEditModal;
    const currentCustomer = isEdit ? editCustomer : newCustomer;
    const setCurrentCustomer = isEdit ? setEditCustomer : setNewCustomer;
    const handleSave = isEdit ? handleEditCustomer : handleAddCustomer;
    const isSaving = isEdit ? savingEdit : savingNew;
    const closeModal = () => isEdit ? setShowEditModal(false) : setShowNewModal(false);

    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
            <Card className="w-full max-w-lg border-none shadow-2xl bg-white rounded-[2.5rem] overflow-hidden">
                <CardContent className="p-10">
                    <div className="flex items-center justify-between mb-8">
                        <div>
                            <h3 className="text-2xl font-black text-gray-900 tracking-tight">{isEdit ? "Kemaskini Profil" : "Pelanggan Baru"}</h3>
                            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">Sila isi maklumat pelanggan</p>
                        </div>
                        <button
                            onClick={closeModal}
                            className="h-10 w-10 flex items-center justify-center rounded-xl bg-gray-50 text-gray-400 hover:text-red-500 hover:bg-red-50 transition-all"
                        >
                            <X className="h-5 w-5" />
                        </button>
                    </div>

                    <div className="space-y-6">
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Nama Penuh *</label>
                                <Input
                                    placeholder="cth: Ahmad Ali"
                                    value={currentCustomer.name}
                                    onChange={(e) => setCurrentCustomer({ ...currentCustomer, name: e.target.value })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20"
                                />
                            </div>

                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">No. Telefon *</label>
                                <Input
                                    placeholder="+60 12-345 6789"
                                    value={currentCustomer.phone}
                                    onChange={(e) => setCurrentCustomer({ ...currentCustomer, phone: e.target.value })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20"
                                />
                            </div>
                        </div>

                        <div className="space-y-2">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Email (Pilihan)</label>
                            <Input
                                type="email"
                                placeholder="customer@email.com"
                                value={currentCustomer.email}
                                onChange={(e) => setCurrentCustomer({ ...currentCustomer, email: e.target.value })}
                                className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20"
                            />
                        </div>

                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Kategori Ahli</label>
                                <select
                                    value={currentCustomer.tier}
                                    onChange={(e) => setCurrentCustomer({ ...currentCustomer, tier: e.target.value as CustomerTier })}
                                    className="w-full h-12 px-5 bg-gray-50 border-none rounded-2xl focus:outline-none focus:ring-1 focus:ring-[#2e7d32]/20 font-bold text-xs transition-all appearance-none"
                                >
                                    <option value="Normal">Normal</option>
                                    <option value="Member">Member</option>
                                    <option value="VIP">VIP</option>
                                </select>
                            </div>

                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1 flex items-center gap-1.5 focus-within:text-[#2e7d32]">
                                    <Cake className="h-3 w-3" /> Tarikh Lahir
                                </label>
                                <Input
                                    type="date"
                                    value={currentCustomer.birthday}
                                    onChange={(e) => setCurrentCustomer({ ...currentCustomer, birthday: e.target.value })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20"
                                />
                            </div>
                        </div>

                        <div className="space-y-2">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1 flex items-center gap-1.5">
                                <MessageSquare className="h-3 w-3" /> Nota & Pilihan
                            </label>
                            <textarea
                                placeholder="Alergi, pilihan servis, atau nota tambahan..."
                                value={currentCustomer.notes}
                                onChange={(e) => setCurrentCustomer({ ...currentCustomer, notes: e.target.value })}
                                className="w-full p-5 bg-gray-50 border-none rounded-[2rem] resize-none h-28 focus:outline-none focus:ring-1 focus:ring-[#2e7d32]/20 text-xs font-bold leading-relaxed"
                            />
                        </div>
                    </div>

                    <div className="flex gap-4 mt-10">
                        <Button
                            variant="outline"
                            className="flex-1 h-12 rounded-2xl border-gray-100 text-[10px] font-black uppercase tracking-widest text-gray-400 hover:bg-gray-50"
                            onClick={closeModal}
                        >
                            Batal
                        </Button>
                        <Button
                            className="flex-1 h-12 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-xl shadow-green-100 font-black uppercase tracking-widest text-[10px]"
                            onClick={handleSave}
                            disabled={isSaving}
                        >
                            {isSaving ? (
                                <Loader2 className="h-4 w-4 animate-spin" />
                            ) : (
                                isEdit ? "Simpan Perubahan" : "Tambah Pelanggan"
                            )}
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
