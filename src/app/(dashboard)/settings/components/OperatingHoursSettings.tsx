"use client";

import { Check, Loader2, Clock } from "lucide-react";
import { Button, Input, Badge } from "@/components/ui";

interface OperatingHour {
    day: string;
    open: string;
    close: string;
    isOpen: boolean;
}

interface OperatingHoursSettingsProps {
    operatingHours: OperatingHour[];
    setOperatingHours: (hours: OperatingHour[]) => void;
    saving: boolean;
    showSaved: boolean;
    handleSave: () => void;
}

export function OperatingHoursSettings({
    operatingHours,
    setOperatingHours,
    saving,
    showSaved,
    handleSave
}: OperatingHoursSettingsProps) {
    const updateHour = (index: number, field: keyof OperatingHour, value: any) => {
        const updated = [...operatingHours];
        (updated[index] as any)[field] = value;
        setOperatingHours(updated);
    };

    return (
        <div className="space-y-10">
            <div>
                <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Jadual Kerja</h3>
                <p className="text-3xl font-black text-gray-900 tracking-tighter mt-1">Waktu Operasi</p>
                <p className="text-[11px] font-black text-gray-400 uppercase tracking-widest mt-3">Tetapkan waktu buka dan tutup salon anda</p>
            </div>

            <div className="space-y-4">
                {operatingHours.map((schedule, index) => (
                    <div key={schedule.day} className="flex items-center gap-6 p-6 bg-gray-50/50 rounded-[2rem] border border-gray-100 hover:bg-white hover:shadow-xl hover:shadow-green-900/5 transition-all group">
                        <div className="w-40 flex items-center gap-4">
                            <div className={`h-10 w-10 rounded-xl flex items-center justify-center transition-all ${schedule.isOpen ? "bg-[#2e7d32] text-white shadow-lg shadow-green-900/10" : "bg-gray-100 text-gray-300"}`}>
                                <Clock className="h-5 w-5" />
                            </div>
                            <span className={`font-black text-sm tracking-tight ${schedule.isOpen ? "text-gray-900" : "text-gray-400"}`}>{schedule.day}</span>
                        </div>

                        <div className="flex items-center gap-4">
                            <Input
                                type="time"
                                value={schedule.open}
                                disabled={!schedule.isOpen}
                                className="w-40 h-12 bg-white border-none rounded-xl font-bold tabular-nums shadow-sm focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20"
                                onChange={(e) => updateHour(index, 'open', e.target.value)}
                            />
                            <span className="text-[10px] font-black text-gray-300 uppercase tracking-widest">sehingga</span>
                            <Input
                                type="time"
                                value={schedule.close}
                                disabled={!schedule.isOpen}
                                className="w-40 h-12 bg-white border-none rounded-xl font-bold tabular-nums shadow-sm focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20"
                                onChange={(e) => updateHour(index, 'close', e.target.value)}
                            />
                        </div>

                        <div className="flex-1 flex justify-end">
                            <button
                                onClick={() => updateHour(index, 'isOpen', !schedule.isOpen)}
                                className={`px-6 py-2.5 rounded-xl text-[9px] font-black uppercase tracking-widest transition-all border-2 ${schedule.isOpen
                                    ? "bg-white text-[#2e7d32] border-[#2e7d32]/20 hover:bg-[#2e7d32] hover:text-white"
                                    : "bg-gray-100 text-gray-400 border-gray-100 hover:border-gray-200"}`}
                            >
                                {schedule.isOpen ? "Buka" : "Tutup"}
                            </button>
                        </div>
                    </div>
                ))}
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
