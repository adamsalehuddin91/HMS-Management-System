"use client";

import { RotateCcw, Loader2 } from "lucide-react";
import { Card, CardContent, Badge } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface RecentTransaction {
    id: string;
    fullId: string;
    customer: string;
    customerId: string | null;
    amount: number;
    pointsRedeemed: number;
    pointsEarned: number;
    date: string;
    status: string;
}

interface RecentTransactionsListProps {
    loading: boolean;
    recentTransactions: RecentTransaction[];
    isAdmin: boolean;
    setSelectedTransaction: (txn: RecentTransaction) => void;
    setShowVoidModal: (show: boolean) => void;
}

export function RecentTransactionsList({
    loading,
    recentTransactions,
    isAdmin,
    setSelectedTransaction,
    setShowVoidModal
}: RecentTransactionsListProps) {
    return (
        <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
            <CardContent className="p-10">
                <div className="flex items-center justify-between mb-8">
                    <div>
                        <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Log Aktiviti</h3>
                        <p className="text-2xl font-black text-gray-900 tracking-tight mt-1">Transaksi Terkini</p>
                    </div>
                </div>

                {loading ? (
                    <div className="py-20 flex items-center justify-center">
                        <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                    </div>
                ) : recentTransactions.length === 0 ? (
                    <div className="py-20 text-center text-[10px] font-black uppercase tracking-widest text-gray-400">Tiada transaksi direkodkan</div>
                ) : (
                    <div className="space-y-4">
                        {recentTransactions.map((txn) => (
                            <div key={txn.fullId} className="flex items-center justify-between p-6 bg-gray-50/50 rounded-[2rem] border border-gray-100/50 hover:bg-white hover:shadow-xl hover:shadow-green-900/5 transition-all group">
                                <div className="flex items-center gap-5">
                                    <div className="h-12 w-12 rounded-2xl bg-white shadow-sm flex items-center justify-center group-hover:scale-110 transition-transform">
                                        <div className={`h-2.5 w-2.5 rounded-full ${txn.status === 'completed' ? 'bg-[#2e7d32]' : 'bg-red-500'} shadow-[0_0_8px_rgba(46,125,50,0.3)]`} />
                                    </div>
                                    <div>
                                        <p className="font-black text-sm text-gray-900 tracking-tight italic">{txn.customer}</p>
                                        <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest mt-1">
                                            ID: <span className="text-gray-900 font-bold font-mono">{txn.id}</span> • {txn.date}
                                        </p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-6">
                                    {isAdmin && txn.status === "completed" && (
                                        <button
                                            onClick={() => {
                                                setSelectedTransaction(txn);
                                                setShowVoidModal(true);
                                            }}
                                            className="h-10 w-10 flex items-center justify-center rounded-xl text-red-300 hover:text-red-500 hover:bg-red-50 transition-all active:scale-95"
                                            title="Void Transaksi"
                                        >
                                            <RotateCcw className="h-4.5 w-4.5" />
                                        </button>
                                    )}
                                    <div className="text-right">
                                        <p className={`text-sm font-black italic tracking-tighter tabular-nums ${txn.status === "voided" ? "text-red-300 line-through" : "text-gray-900"}`}>
                                            {formatCurrency(txn.amount)}
                                        </p>
                                        <div className="flex justify-end mt-1">
                                            <Badge variant={txn.status === "completed" ? "success" : "error"} className="font-black text-[8px] uppercase tracking-widest px-2 py-0.5 rounded-lg border-none italic">
                                                {txn.status === 'completed' ? 'Berjaya' : 'Batal'}
                                            </Badge>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
