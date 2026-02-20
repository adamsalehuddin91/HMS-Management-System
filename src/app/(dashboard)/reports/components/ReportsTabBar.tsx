"use client";

import { LayoutDashboard, Users, Receipt, Gift } from "lucide-react";

export type ReportTab = "ringkasan" | "kakitangan" | "transaksi" | "mata";

interface ReportsTabBarProps {
    activeTab: ReportTab;
    setActiveTab: (tab: ReportTab) => void;
}

const TABS: { id: ReportTab; label: string; icon: React.ElementType }[] = [
    { id: "ringkasan", label: "Ringkasan", icon: LayoutDashboard },
    { id: "kakitangan", label: "Kakitangan", icon: Users },
    { id: "transaksi", label: "Transaksi", icon: Receipt },
    { id: "mata", label: "Mata Ganjaran", icon: Gift },
];

export function ReportsTabBar({ activeTab, setActiveTab }: ReportsTabBarProps) {
    return (
        <div className="flex items-center gap-2 bg-gray-100/70 p-1.5 rounded-2xl w-fit">
            {TABS.map(({ id, label, icon: Icon }) => {
                const isActive = activeTab === id;
                return (
                    <button
                        key={id}
                        onClick={() => setActiveTab(id)}
                        className={`
              flex items-center gap-2 px-5 py-2.5 rounded-xl text-[11px] font-black uppercase tracking-widest
              transition-all duration-200
              ${isActive
                                ? "bg-white text-[#2e7d32] shadow-md shadow-green-900/10"
                                : "text-gray-400 hover:text-gray-600 hover:bg-white/50"
                            }
            `}
                    >
                        <Icon className={`h-3.5 w-3.5 ${isActive ? "text-[#2e7d32]" : "text-gray-400"}`} />
                        {label}
                    </button>
                );
            })}
        </div>
    );
}
