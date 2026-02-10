"use client";

import { Check, Loader2, Gift } from "lucide-react";
import { Button, Card, CardContent, Input } from "@/components/ui";

interface LoyaltySettings {
    pointsPerRM: number;
    memberMultiplier: number;
    pointsPerDiscount: number;
    maxRedemption: number;
    expiryMonths: number;
    expiryEnabled: boolean;
}

interface LoyaltySettingsViewProps {
    loyaltySettings: LoyaltySettings;
    setLoyaltySettings: (settings: LoyaltySettings) => void;
    saving: boolean;
    showSaved: boolean;
    handleSave: () => void;
}

export function LoyaltySettingsView({
    loyaltySettings,
    setLoyaltySettings,
    saving,
    showSaved,
    handleSave
}: LoyaltySettingsViewProps) {
    return (
        <div className="space-y-10">
            <div>
                <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Pemasaran</h3>
                <p className="text-3xl font-black text-gray-900 tracking-tighter mt-1">Program Kesetiaan</p>
                <p className="text-[11px] font-black text-gray-400 uppercase tracking-widest mt-3">Konfigurasi mata ganjaran dan peraturan tebusan</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                <Card className="border-none shadow-xl bg-gray-50/50 rounded-[2.5rem] overflow-hidden">
                    <CardContent className="p-8">
                        <div className="flex items-center gap-4 mb-8">
                            <div className="h-10 w-10 rounded-xl bg-white shadow-sm flex items-center justify-center text-[#2e7d32]">
                                <Gift className="h-5 w-5" />
                            </div>
                            <h3 className="font-black text-[10px] uppercase tracking-widest text-gray-900">Pengumpulan Mata</h3>
                        </div>
                        <div className="space-y-6">
                            <div className="space-y-3">
                                <label className="text-[9px] font-black text-gray-400 uppercase tracking-widest ml-1">Mata Ganjaran per RM1 Belanja</label>
                                <Input
                                    type="number"
                                    value={loyaltySettings.pointsPerRM}
                                    onChange={(e) => setLoyaltySettings({ ...loyaltySettings, pointsPerRM: Number(e.target.value) })}
                                    className="h-12 bg-white border-none rounded-xl font-bold tabular-nums"
                                />
                            </div>
                            <div className="space-y-3">
                                <label className="text-[9px] font-black text-gray-400 uppercase tracking-widest ml-1">Multiplier Ganjaran Ahli</label>
                                <Input
                                    type="number"
                                    value={loyaltySettings.memberMultiplier}
                                    onChange={(e) => setLoyaltySettings({ ...loyaltySettings, memberMultiplier: Number(e.target.value) })}
                                    className="h-12 bg-white border-none rounded-xl font-bold tabular-nums"
                                />
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card className="border-none shadow-xl bg-gray-50/50 rounded-[2.5rem] overflow-hidden">
                    <CardContent className="p-8">
                        <div className="flex items-center gap-4 mb-8">
                            <div className="h-10 w-10 rounded-xl bg-white shadow-sm flex items-center justify-center text-orange-400">
                                <Gift className="h-5 w-5" />
                            </div>
                            <h3 className="font-black text-[10px] uppercase tracking-widest text-gray-900">Penebusan Mata</h3>
                        </div>
                        <div className="space-y-6">
                            <div className="space-y-3">
                                <label className="text-[9px] font-black text-gray-400 uppercase tracking-widest ml-1">Mata Ganjaran per RM1 Diskaun</label>
                                <Input
                                    type="number"
                                    value={loyaltySettings.pointsPerDiscount}
                                    onChange={(e) => setLoyaltySettings({ ...loyaltySettings, pointsPerDiscount: Number(e.target.value) })}
                                    className="h-12 bg-white border-none rounded-xl font-bold tabular-nums"
                                />
                            </div>
                            <div className="space-y-3">
                                <label className="text-[9px] font-black text-gray-400 uppercase tracking-widest ml-1">Had Maksimum Tebusan (%) per Bil</label>
                                <Input
                                    type="number"
                                    value={loyaltySettings.maxRedemption}
                                    onChange={(e) => setLoyaltySettings({ ...loyaltySettings, maxRedemption: Number(e.target.value) })}
                                    className="h-12 bg-white border-none rounded-xl font-bold tabular-nums"
                                />
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card className="col-span-1 md:col-span-2 border-none shadow-xl bg-[#2e7d32]/5 rounded-[2.5rem] overflow-hidden border border-[#2e7d32]/10">
                    <CardContent className="p-8">
                        <div className="flex items-center justify-between mb-8">
                            <div className="flex items-center gap-4">
                                <div className="h-10 w-10 rounded-xl bg-white shadow-sm flex items-center justify-center text-[#2e7d32]">
                                    <Gift className="h-5 w-5" />
                                </div>
                                <h3 className="font-black text-[10px] uppercase tracking-widest text-gray-900">Tempoh Tamat Mata Ganjaran</h3>
                            </div>
                            <label className="flex items-center gap-3 cursor-pointer">
                                <input
                                    type="checkbox"
                                    className="h-5 w-5 rounded-lg border-gray-200 text-[#2e7d32] focus:ring-[#2e7d32]/20"
                                    checked={loyaltySettings.expiryEnabled}
                                    onChange={(e) => setLoyaltySettings({ ...loyaltySettings, expiryEnabled: e.target.checked })}
                                />
                                <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Aktifkan Luput</span>
                            </label>
                        </div>
                        <div className={`space-y-3 transition-all ${loyaltySettings.expiryEnabled ? "opacity-100" : "opacity-30 pointer-events-none"}`}>
                            <label className="text-[9px] font-black text-gray-400 uppercase tracking-widest ml-1">Tempoh Luput (Bulan)</label>
                            <Input
                                type="number"
                                value={loyaltySettings.expiryMonths}
                                onChange={(e) => setLoyaltySettings({ ...loyaltySettings, expiryMonths: Number(e.target.value) })}
                                className="h-12 bg-white border-none rounded-xl font-bold tabular-nums max-w-xs"
                            />
                        </div>
                    </CardContent>
                </Card>
            </div>

            <div className="flex justify-end pt-6">
                <Button
                    onClick={handleSave}
                    disabled={saving}
                    className={`h-14 px-10 rounded-2xl font-black text-[11px] uppercase tracking-widest transition-all ${showSaved
                            ? "bg-green-500 hover:bg-green-600 text-white"
                            : "bg-[#2e7d32] hover:bg-[#1b5e20] text-white shadow-xl shadow-green-900/10"
                        }`}
                >
                    {saving ? (
                        <>
                            <Loader2 className="h-4 w-4 mr-3 animate-spin" />
                            Menyimpan...
                        </>
                    ) : showSaved ? (
                        <>
                            <Check className="h-4 w-4 mr-3" />
                            Sudah Disimpan!
                        </>
                    ) : (
                        "Simpan Perubahan"
                    )}
                </Button>
            </div>
        </div>
    );
}
