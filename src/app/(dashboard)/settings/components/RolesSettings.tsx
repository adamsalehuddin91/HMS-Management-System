"use client";

import { Button, Card, CardContent } from "@/components/ui";

export function RolesSettings() {
    return (
        <div className="space-y-10">
            <div>
                <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Keselamatan</h3>
                <p className="text-3xl font-black text-gray-900 tracking-tighter mt-1">Peranan & Keizinan</p>
                <p className="text-[11px] font-black text-gray-400 uppercase tracking-widest mt-3">Urus tahap akses untuk setiap kategori pengguna</p>
            </div>

            <div className="space-y-6">
                <Card className="border-none shadow-xl bg-gray-50/50 rounded-[2.5rem] overflow-hidden group hover:bg-white transition-all">
                    <CardContent className="p-8">
                        <div className="flex items-center justify-between mb-8">
                            <div>
                                <h3 className="text-xl font-black text-gray-900 tracking-tight italic">Admin / Pengurus</h3>
                                <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1 italic">Akses penuh ke semua modul sistem</p>
                            </div>
                            <Button variant="outline" size="sm" className="h-10 px-6 rounded-xl border-none bg-white font-black text-[9px] uppercase tracking-widest text-[#2e7d32]" disabled title="Akan datang">Ubah Izin</Button>
                        </div>
                        <div className="flex flex-wrap gap-3">
                            {["Dashboard", "POS", "Bookings", "Customers", "Staff", "Inventory", "Reports", "Settings"].map((p) => (
                                <span key={p} className="px-5 py-2.5 bg-white border border-gray-100 text-[#2e7d32] rounded-2xl text-[9px] font-black uppercase tracking-widest shadow-sm group-hover:border-[#2e7d32]/20 transition-all">
                                    {p}
                                </span>
                            ))}
                        </div>
                    </CardContent>
                </Card>

                <Card className="border-none shadow-xl bg-gray-50/50 rounded-[2.5rem] overflow-hidden group hover:bg-white transition-all">
                    <CardContent className="p-8">
                        <div className="flex items-center justify-between mb-8">
                            <div>
                                <h3 className="text-xl font-black text-gray-900 tracking-tight italic">Staff / Gunting</h3>
                                <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1 italic">Akses operasi terhad</p>
                            </div>
                            <Button variant="outline" size="sm" className="h-10 px-6 rounded-xl border-none bg-white font-black text-[9px] uppercase tracking-widest text-gray-500" disabled title="Akan datang">Ubah Izin</Button>
                        </div>
                        <div className="flex flex-wrap gap-3">
                            {["Dashboard", "POS", "Bookings", "Customers (Paparan)"].map((p) => (
                                <span key={p} className="px-5 py-2.5 bg-white border border-gray-100 text-gray-400 rounded-2xl text-[9px] font-black uppercase tracking-widest shadow-sm group-hover:border-gray-200 transition-all">
                                    {p}
                                </span>
                            ))}
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
