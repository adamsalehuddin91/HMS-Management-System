"use client";

import { X, Loader2, Download, AlertTriangle } from "lucide-react";
import { Badge, Button, Card, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface ReportsModalsProps {
    showFullReport: boolean;
    setShowFullReport: (show: boolean) => void;
    staffPerformance: any[];
    handleExportReport: () => void;

    showVoidModal: boolean;
    setShowVoidModal: (show: boolean) => void;
    selectedTransaction: any;
    voidReason: string;
    setVoidReason: (reason: string) => void;
    voidingTransaction: boolean;
    handleVoidTransaction: () => void;
}

export function ReportsModals({
    showFullReport,
    setShowFullReport,
    staffPerformance,
    handleExportReport,
    showVoidModal,
    setShowVoidModal,
    selectedTransaction,
    voidReason,
    setVoidReason,
    voidingTransaction,
    handleVoidTransaction
}: ReportsModalsProps) {
    if (!showFullReport && !showVoidModal) return null;

    const closeModal = () => {
        setShowFullReport(false);
        setShowVoidModal(false);
    };

    if (showVoidModal && selectedTransaction) {
        return (
            <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
                <Card className="w-full max-w-md border-none shadow-2xl bg-white rounded-[2.5rem] overflow-hidden">
                    <CardContent className="p-10">
                        <div className="flex items-center gap-5 mb-8">
                            <div className="h-14 w-14 rounded-2xl bg-red-50 flex items-center justify-center text-red-500 shadow-xl shadow-red-900/5">
                                <AlertTriangle className="h-7 w-7" />
                            </div>
                            <div>
                                <h3 className="text-2xl font-black text-gray-900 tracking-tight">Void Transaksi</h3>
                                <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">Tindakan ini tidak boleh diundur</p>
                            </div>
                        </div>

                        <div className="p-6 bg-red-50/30 rounded-[2rem] border border-red-100/50 mb-8">
                            <div className="flex justify-between items-center mb-4">
                                <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">ID Transaksi</span>
                                <span className="font-black text-gray-900 font-mono tracking-tight">{selectedTransaction.id}</span>
                            </div>
                            <div className="flex justify-between items-center">
                                <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Jumlah</span>
                                <span className="font-black text-red-500 tabular-nums italic">{formatCurrency(selectedTransaction.amount)}</span>
                            </div>
                        </div>

                        <div className="space-y-4 mb-10">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Sebab Pembatalan</label>
                            <select
                                value={voidReason}
                                onChange={(e) => setVoidReason(e.target.value)}
                                className="w-full h-12 px-5 bg-gray-50 border-none rounded-2xl focus:outline-none focus:ring-1 focus:ring-red-500/20 font-bold text-xs transition-all appearance-none"
                            >
                                <option>Permintaan Pelanggan</option>
                                <option>Kesalahan Input / Harga</option>
                                <option>Test Transaction</option>
                                <option>Lain-lain</option>
                            </select>
                        </div>

                        <div className="flex gap-4">
                            <Button
                                variant="outline"
                                className="flex-1 h-13 rounded-2xl border-gray-100 text-[11px] font-black uppercase tracking-widest text-gray-400 hover:bg-gray-50"
                                onClick={closeModal}
                            >
                                Batal
                            </Button>
                            <Button
                                className="flex-1 h-13 rounded-2xl bg-red-500 hover:bg-red-600 shadow-xl shadow-red-900/10 font-black uppercase tracking-widest text-[11px] text-white"
                                onClick={handleVoidTransaction}
                                disabled={voidingTransaction}
                            >
                                {voidingTransaction ? <Loader2 className="h-5 w-5 animate-spin" /> : "Sahkan Void"}
                            </Button>
                        </div>
                    </CardContent>
                </Card>
            </div>
        );
    }

    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
            <Card className="w-full max-w-5xl border-none shadow-2xl bg-white rounded-[3rem] overflow-hidden group">
                <CardContent className="p-10 lg:p-14">
                    <div className="flex items-center justify-between mb-10">
                        <div>
                            <h3 className="text-3xl font-black text-gray-900 tracking-tighter italic">Laporan Prestasi Komisen</h3>
                            <p className="text-[11px] font-black text-gray-400 uppercase tracking-[0.2em] mt-2 italic">Data terperinci setiap kakitangan</p>
                        </div>
                        <button onClick={closeModal} className="h-12 w-12 flex items-center justify-center rounded-[1.25rem] bg-gray-50 text-gray-400 hover:text-red-500 hover:bg-red-50 transition-all">
                            <X className="h-6 w-6" />
                        </button>
                    </div>

                    <div className="overflow-x-auto custom-scrollbar -mx-10 lg:-mx-14 px-10 lg:px-14 pb-8">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b-2 border-gray-50">
                                    <th className="text-left py-6 px-4 text-[11px] font-black text-gray-400 uppercase tracking-widest">Kakitangan</th>
                                    <th className="text-left py-6 px-4 text-[11px] font-black text-gray-400 uppercase tracking-widest">Jumlah Servis</th>
                                    <th className="text-left py-6 px-4 text-[11px] font-black text-gray-400 uppercase tracking-widest">Jumlah Jualan</th>
                                    <th className="text-left py-6 px-4 text-[11px] font-black text-gray-400 uppercase tracking-widest text-center">Kadar</th>
                                    <th className="text-left py-6 px-4 text-[11px] font-black text-gray-400 uppercase tracking-widest text-right">Komisen Terkumpul</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-gray-50/50">
                                {staffPerformance.map((staff) => (
                                    <tr key={staff.id} className="group hover:bg-[#2e7d32]/5 transition-all duration-300">
                                        <td className="py-6 px-4 font-black text-[15px] text-gray-900 tracking-tight italic">{staff.name}</td>
                                        <td className="py-6 px-4 font-black text-sm text-gray-400 tabular-nums">{staff.services}</td>
                                        <td className="py-6 px-4 font-black text-sm text-gray-900 tabular-nums tracking-tighter">{formatCurrency(staff.revenue)}</td>
                                        <td className="py-6 px-4 text-center">
                                            <Badge className="bg-gray-50 text-gray-400 border-none font-black text-[9px] uppercase tracking-widest px-3 py-1 text-center">15%</Badge>
                                        </td>
                                        <td className="py-6 px-4 text-right">
                                            <span className="font-black text-lg text-[#2e7d32] tabular-nums tracking-tighter italic">{formatCurrency(staff.commission)}</span>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                            <tfoot className="bg-[#2e7d32]/5 border-t-2 border-[#2e7d32]/10">
                                <tr className="font-black">
                                    <td className="py-10 px-8 text-lg italic text-[#2e7d32]">Jumlah Keseluruhan</td>
                                    <td className="py-10 px-4 text-gray-900 tabular-nums">{staffPerformance.reduce((s, p) => s + p.services, 0)}</td>
                                    <td className="py-10 px-4 text-gray-900 tabular-nums tracking-tighter">{formatCurrency(staffPerformance.reduce((s, p) => s + p.revenue, 0))}</td>
                                    <td className="py-10 px-4">-</td>
                                    <td className="py-10 px-8 text-right text-2xl text-[#2e7d32] tabular-nums tracking-tighter italic shadow-[inset_-20px_0_20px_rgba(46,125,50,0.05)]">
                                        {formatCurrency(staffPerformance.reduce((s, p) => s + p.commission, 0))}
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                    <div className="flex justify-end gap-5 mt-12">
                        <Button
                            variant="outline"
                            className="h-14 px-10 rounded-[1.5rem] border-gray-100 text-[11px] font-black uppercase tracking-widest text-gray-400 hover:bg-gray-50"
                            onClick={closeModal}
                        >
                            Tutup
                        </Button>
                        <Button
                            className="h-14 px-10 rounded-[1.5rem] bg-[#2e7d32] hover:bg-[#1b5e20] shadow-2xl shadow-green-900/10 font-black uppercase tracking-widest text-[11px] text-white"
                            onClick={handleExportReport}
                        >
                            <Download className="h-5 w-5 mr-3" />
                            Eksport CSV
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
