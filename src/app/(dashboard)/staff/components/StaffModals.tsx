"use client";

import { X, Loader2, TrendingUp, TrendingDown, Minus, Plus } from "lucide-react";
import { Button, Card, CardContent, Input } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface StaffFormData {
    id?: string;
    name: string;
    phone: string;
    email: string;
    role: string;
}

interface CommissionAdjustment {
    type: "bonus" | "deduction";
    amount: number;
    reason: string;
}

interface SelectedStaffInfo {
    id: string;
    name: string;
    commission: number;
}

interface CommissionHistoryEntry {
    id: string;
    amount: number;
    type: string;
    created_at: string;
}

interface StaffModalsProps {
    showAddModal: boolean;
    setShowAddModal: (show: boolean) => void;
    newStaff: StaffFormData;
    setNewStaff: (staff: StaffFormData) => void;
    savingStaff: boolean;
    handleAddStaff: () => void;

    showEditModal: boolean;
    setShowEditModal: (show: boolean) => void;
    editStaff: StaffFormData;
    setEditStaff: (staff: StaffFormData) => void;
    handleEditStaff: () => void;

    showCommissionModal: boolean;
    setShowCommissionModal: (show: boolean) => void;
    commissionAdjustment: CommissionAdjustment;
    setCommissionAdjustment: (adj: CommissionAdjustment) => void;
    savingCommission: boolean;
    handleCommissionAdjustment: () => void;
    commissionHistory: CommissionHistoryEntry[];
    selectedStaff: SelectedStaffInfo | null;
}

export function StaffModals({
    showAddModal,
    setShowAddModal,
    newStaff,
    setNewStaff,
    savingStaff,
    handleAddStaff,
    showEditModal,
    setShowEditModal,
    editStaff,
    setEditStaff,
    handleEditStaff,
    showCommissionModal,
    setShowCommissionModal,
    commissionAdjustment,
    setCommissionAdjustment,
    savingCommission,
    handleCommissionAdjustment,
    commissionHistory,
    selectedStaff
}: StaffModalsProps) {
    if (!showAddModal && !showEditModal && !showCommissionModal) return null;

    const closeModal = () => {
        setShowAddModal(false);
        setShowEditModal(false);
        setShowCommissionModal(false);
    };

    if (showCommissionModal && selectedStaff) {
        return (
            <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
                <Card className="w-full max-w-md border-none shadow-2xl bg-white rounded-[2.5rem] overflow-hidden">
                    <CardContent className="p-10">
                        <div className="flex items-center justify-between mb-8">
                            <div>
                                <h3 className="text-2xl font-black text-gray-900 tracking-tight">Pelarasan Komisen</h3>
                                <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">{selectedStaff.name}</p>
                            </div>
                            <button onClick={closeModal} className="h-10 w-10 flex items-center justify-center rounded-xl bg-gray-50 text-gray-400 hover:text-red-500 hover:bg-red-50 transition-all">
                                <X className="h-5 w-5" />
                            </button>
                        </div>

                        <div className="p-6 bg-[#2e7d32]/5 rounded-[2rem] mb-8 text-center border border-[#2e7d32]/10">
                            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1.5">Baki Semasa (MTD)</p>
                            <p className="text-3xl font-black text-[#2e7d32] tabular-nums tracking-tighter">{formatCurrency(selectedStaff.commission)}</p>
                        </div>

                        <div className="space-y-8">
                            <div>
                                <label className="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-4">Jenis Pelarasan</label>
                                <div className="flex gap-3">
                                    <button
                                        onClick={() => setCommissionAdjustment({ ...commissionAdjustment, type: "bonus" })}
                                        className={`flex-1 flex items-center justify-center gap-2 h-14 rounded-2xl border-2 transition-all ${commissionAdjustment.type === "bonus"
                                            ? "border-[#2e7d32] bg-[#2e7d32]/5 text-[#2e7d32]"
                                            : "border-gray-100 text-gray-300 hover:bg-gray-50"
                                            }`}
                                    >
                                        <TrendingUp className="h-5 w-5" />
                                        <span className="font-black text-[10px] uppercase tracking-widest">Bonus</span>
                                    </button>
                                    <button
                                        onClick={() => setCommissionAdjustment({ ...commissionAdjustment, type: "deduction" })}
                                        className={`flex-1 flex items-center justify-center gap-2 h-14 rounded-2xl border-2 transition-all ${commissionAdjustment.type === "deduction"
                                            ? "border-red-500 bg-red-50 text-red-500"
                                            : "border-gray-100 text-gray-300 hover:bg-gray-50"
                                            }`}
                                    >
                                        <TrendingDown className="h-5 w-5" />
                                        <span className="font-black text-[10px] uppercase tracking-widest">Tolak</span>
                                    </button>
                                </div>
                            </div>

                            <div>
                                <label className="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-4">Jumlah (RM)</label>
                                <div className="flex items-center gap-4 bg-gray-50/50 p-2 rounded-[24px] border border-gray-100">
                                    <button
                                        onClick={() => setCommissionAdjustment({ ...commissionAdjustment, amount: Math.max(0, commissionAdjustment.amount - 10) })}
                                        className="h-11 w-11 rounded-2xl bg-white shadow-sm flex items-center justify-center hover:bg-red-50 hover:text-red-500 transition-all active:scale-95"
                                    >
                                        <Minus className="h-5 w-5" />
                                    </button>
                                    <input
                                        type="number"
                                        value={commissionAdjustment.amount || ""}
                                        onChange={(e) => setCommissionAdjustment({ ...commissionAdjustment, amount: Number(e.target.value) })}
                                        className="flex-1 text-center text-3xl font-black bg-transparent outline-none tabular-nums tracking-tighter"
                                        placeholder="0"
                                    />
                                    <button
                                        onClick={() => setCommissionAdjustment({ ...commissionAdjustment, amount: commissionAdjustment.amount + 10 })}
                                        className="h-11 w-11 rounded-2xl bg-white shadow-sm flex items-center justify-center hover:bg-green-50 hover:text-green-500 transition-all active:scale-95"
                                    >
                                        <Plus className="h-5 w-5" />
                                    </button>
                                </div>
                            </div>

                            <div className="pt-2">
                                <Button
                                    className={`w-full h-14 rounded-[1.5rem] font-black uppercase tracking-[0.1em] text-[11px] shadow-xl ${commissionAdjustment.type === 'bonus' ? 'bg-[#2e7d32] hover:bg-[#1b5e20] shadow-green-900/10' : 'bg-red-500 hover:bg-red-600 shadow-red-900/10'}`}
                                    onClick={handleCommissionAdjustment}
                                    disabled={savingCommission || commissionAdjustment.amount <= 0}
                                >
                                    {savingCommission ? (
                                        <Loader2 className="h-5 w-5 animate-spin" />
                                    ) : (
                                        `Sahkan ${commissionAdjustment.type === "bonus" ? "Bonus" : "Deduction"}`
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
    const currentStaff = isEdit ? editStaff : newStaff;
    const setCurrentStaff = isEdit ? setEditStaff : setNewStaff;
    const handleSave = isEdit ? handleEditStaff : handleAddStaff;

    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
            <Card className="w-full max-w-lg border-none shadow-2xl bg-white rounded-[2.5rem] overflow-hidden">
                <CardContent className="p-10">
                    <div className="flex items-center justify-between mb-8">
                        <div>
                            <h3 className="text-2xl font-black text-gray-900 tracking-tight">{isEdit ? "Kemaskini Profil" : "Kakitangan Baru"}</h3>
                            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">Sila isi maklumat pasukan</p>
                        </div>
                        <button onClick={closeModal} className="h-10 w-10 flex items-center justify-center rounded-xl bg-gray-50 text-gray-400 hover:text-red-500 hover:bg-red-50 transition-all">
                            <X className="h-5 w-5" />
                        </button>
                    </div>

                    <div className="space-y-6">
                        <div className="space-y-2">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Nama Penuh *</label>
                            <Input
                                placeholder="cth: Siti Aminah"
                                value={currentStaff.name}
                                onChange={(e) => setCurrentStaff({ ...currentStaff, name: e.target.value })}
                                className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
                            />
                        </div>

                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">No. Telefon *</label>
                                <Input
                                    placeholder="+60 12-345 6789"
                                    value={currentStaff.phone}
                                    onChange={(e) => setCurrentStaff({ ...currentStaff, phone: e.target.value })}
                                    className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold tabular-nums"
                                />
                            </div>
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Jawatan</label>
                                <select
                                    value={currentStaff.role}
                                    onChange={(e) => setCurrentStaff({ ...currentStaff, role: e.target.value })}
                                    className="w-full h-12 px-5 bg-gray-50 border-none rounded-2xl focus:outline-none focus:ring-1 focus:ring-[#2e7d32]/20 font-bold text-xs transition-all appearance-none"
                                >
                                    <option>Stylist</option>
                                    <option>Senior Stylist</option>
                                    <option>Hairstylist</option>
                                    <option>Assistant Hairstylist</option>
                                    <option>Therapist</option>
                                    <option>Receptionist</option>
                                    <option>Manager</option>
                                </select>
                            </div>
                        </div>

                        <div className="space-y-2">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Email (Pilihan)</label>
                            <Input
                                type="email"
                                placeholder="staff@email.com"
                                value={currentStaff.email}
                                onChange={(e) => setCurrentStaff({ ...currentStaff, email: e.target.value })}
                                className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
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
                            disabled={savingStaff}
                        >
                            {savingStaff ? (
                                <Loader2 className="h-5 w-5 animate-spin" />
                            ) : (
                                isEdit ? "Simpan Perubahan" : "Terbitkan Profil"
                            )}
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
