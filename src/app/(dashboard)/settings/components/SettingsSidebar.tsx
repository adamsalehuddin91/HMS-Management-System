"use client";

import { Card, CardContent } from "@/components/ui";
import { LucideIcon } from "lucide-react";

interface Tab {
    id: string;
    label: string;
    icon: LucideIcon;
}

interface SettingsSidebarProps {
    tabs: Tab[];
    activeTab: string;
    setActiveTab: (id: string) => void;
}

export function SettingsSidebar({
    tabs,
    activeTab,
    setActiveTab
}: SettingsSidebarProps) {
    return (
        <Card className="w-80 h-fit border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden shrink-0">
            <CardContent className="p-4 space-y-2">
                <div className="px-6 py-6 mb-4">
                    <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Konfigurasi</h3>
                    <p className="text-xl font-black text-gray-900 tracking-tight mt-1">Tetapan Sistem</p>
                </div>
                {tabs.map((tab) => (
                    <button
                        key={tab.id}
                        onClick={() => setActiveTab(tab.id)}
                        className={`w-full flex items-center gap-4 px-6 py-4 rounded-2xl transition-all group ${activeTab === tab.id
                                ? "bg-[#2e7d32] text-white shadow-lg shadow-green-900/10"
                                : "text-gray-400 hover:bg-gray-50 hover:text-gray-600"
                            }`}
                    >
                        <tab.icon className={`h-5 w-5 ${activeTab === tab.id ? "text-white" : "text-gray-300 group-hover:text-[#2e7d32]"} transition-colors`} />
                        <span className="font-black text-[10px] uppercase tracking-widest">{tab.label}</span>
                    </button>
                ))}
            </CardContent>
        </Card>
    );
}
