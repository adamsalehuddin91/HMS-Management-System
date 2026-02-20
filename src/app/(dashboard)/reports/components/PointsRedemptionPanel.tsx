"use client";

import { Gift, TrendingDown, Users, Star } from "lucide-react";
import { Card, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { Loader2 } from "lucide-react";

interface TopRedeemer {
    customerId: string;
    name: string;
    pointsRedeemed: number;
    rmValue: number;
    count: number;
}

interface PointsRedemptionPanelProps {
    loading: boolean;
    totalPointsRedeemed: number;
    redeemRmValue: number;
    redeemTransactions: number;
    topRedeemers: TopRedeemer[];
}

export function PointsRedemptionPanel({
    loading,
    totalPointsRedeemed,
    redeemRmValue,
    redeemTransactions,
    topRedeemers,
}: PointsRedemptionPanelProps) {
    return (
        <Card className="border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
            <CardContent className="p-10">
                {/* Header */}
                <div className="flex items-center gap-5 mb-8">
                    <div className="h-14 w-14 rounded-2xl bg-amber-50 flex items-center justify-center shadow-xl shadow-amber-900/5">
                        <Gift className="h-7 w-7 text-amber-500" />
                    </div>
                    <div>
                        <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-amber-500">
                            Penebusan Mata
                        </h3>
                        <p className="text-2xl font-black text-gray-900 tracking-tight mt-1">
                            Redemption Pelanggan
                        </p>
                    </div>
                </div>

                {loading ? (
                    <div className="py-16 flex items-center justify-center">
                        <Loader2 className="h-8 w-8 animate-spin text-amber-400/40" />
                    </div>
                ) : (
                    <>
                        {/* KPI Row */}
                        <div className="grid grid-cols-3 gap-4 mb-8">
                            <div className="p-5 bg-amber-50/60 rounded-2xl text-center">
                                <p className="text-[10px] font-black uppercase tracking-widest text-amber-500 mb-1.5">
                                    Mata Ditebus
                                </p>
                                <p className="text-2xl font-black text-gray-900 tabular-nums tracking-tighter">
                                    {totalPointsRedeemed.toLocaleString()}
                                </p>
                                <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest mt-1">
                                    pts
                                </p>
                            </div>
                            <div className="p-5 bg-red-50/60 rounded-2xl text-center">
                                <TrendingDown className="h-4 w-4 text-red-400 mx-auto mb-1.5" />
                                <p className="text-[10px] font-black uppercase tracking-widest text-red-400 mb-1">
                                    Diskaun Diberikan
                                </p>
                                <p className="text-xl font-black text-gray-900 tabular-nums tracking-tighter">
                                    {formatCurrency(redeemRmValue)}
                                </p>
                            </div>
                            <div className="p-5 bg-blue-50/60 rounded-2xl text-center">
                                <Users className="h-4 w-4 text-blue-400 mx-auto mb-1.5" />
                                <p className="text-[10px] font-black uppercase tracking-widest text-blue-400 mb-1">
                                    Transaksi Redeem
                                </p>
                                <p className="text-2xl font-black text-gray-900 tabular-nums tracking-tighter">
                                    {redeemTransactions}
                                </p>
                            </div>
                        </div>

                        {/* Top Redeemers */}
                        <div>
                            <p className="text-[10px] font-black uppercase tracking-[0.2em] text-gray-400 mb-5">
                                Top Penebus Mata Bulan Ini
                            </p>
                            {topRedeemers.length === 0 ? (
                                <div className="py-10 text-center text-[10px] font-black uppercase tracking-widest text-gray-300">
                                    Tiada penebusan bulan ini
                                </div>
                            ) : (
                                <div className="space-y-3">
                                    {topRedeemers.map((r, idx) => (
                                        <div
                                            key={r.customerId}
                                            className="flex items-center gap-4 p-4 rounded-2xl bg-gray-50/60 hover:bg-amber-50/40 transition-all group"
                                        >
                                            <div className="h-9 w-9 rounded-xl bg-white flex items-center justify-center text-[10px] font-black text-amber-500 border border-amber-100 shadow-sm group-hover:bg-amber-500 group-hover:text-white transition-all">
                                                {idx === 0 ? <Star className="h-4 w-4" /> : `#${idx + 1}`}
                                            </div>
                                            <div className="flex-1 min-w-0">
                                                <p className="font-black text-sm text-gray-900 truncate">{r.name}</p>
                                                <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest mt-0.5">
                                                    {r.count}x guna mata
                                                </p>
                                            </div>
                                            <div className="text-right">
                                                <p className="font-black text-sm text-amber-500 tabular-nums">
                                                    {r.pointsRedeemed.toLocaleString()} pts
                                                </p>
                                                <p className="text-[9px] font-black text-red-400 tabular-nums mt-0.5">
                                                    -{formatCurrency(r.rmValue)}
                                                </p>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            )}
                        </div>
                    </>
                )}
            </CardContent>
        </Card>
    );
}
