"use client";

import { Search, Plus, Download, Loader2 } from "lucide-react";
import { Button, Card, CardContent, Input, Avatar, Badge } from "@/components/ui";
import type { Customer } from "@/types";

interface CustomerMasterListProps {
    customers: Customer[];
    loading: boolean;
    selectedCustomerId: string | null;
    setSelectedCustomer: (customer: Customer) => void;
    searchQuery: string;
    setSearchQuery: (query: string) => void;
    setShowNewCustomerModal: (show: boolean) => void;
    handleExportReport: () => void;
    isBirthdayToday: (birthday: string | null) => boolean;
    tierColors: Record<string, "default" | "success" | "warning">;
}

export function CustomerMasterList({
    customers,
    loading,
    selectedCustomerId,
    setSelectedCustomer,
    searchQuery,
    setSearchQuery,
    setShowNewCustomerModal,
    handleExportReport,
    isBirthdayToday,
    tierColors
}: CustomerMasterListProps) {
    const filteredCustomers = customers.filter(c =>
        c.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        c.phone?.includes(searchQuery) ||
        c.email?.toLowerCase().includes(searchQuery.toLowerCase())
    );

    return (
        <div className="w-full lg:w-[400px] flex flex-col gap-4 lg:h-full shrink-0">
            <Card className="flex-1 flex flex-col overflow-hidden border-none shadow-sm bg-white rounded-[2rem]">
                <CardContent className="p-0 flex flex-col h-full">
                    {/* Search & Actions Header */}
                    <div className="p-6 border-b border-gray-100 space-y-4 bg-white/50 backdrop-blur-sm sticky top-0 z-10">
                        <div className="flex items-center justify-between">
                            <h2 className="font-black uppercase tracking-tight text-[#2e7d32] text-sm">Customers</h2>
                            <Button
                                size="sm"
                                onClick={() => setShowNewCustomerModal(true)}
                                className="h-9 px-4 rounded-xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-lg shadow-[#2e7d32]/10 font-black text-[10px] uppercase tracking-widest"
                            >
                                <Plus className="h-4 w-4 mr-1.5" />
                                Add New
                            </Button>
                        </div>
                        <Input
                            placeholder="Cari nama atau telefon..."
                            icon={<Search className="h-4 w-4 text-gray-300" />}
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="h-11 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 text-sm"
                        />
                        <div className="flex gap-2">
                            <Button
                                variant="ghost"
                                size="sm"
                                onClick={handleExportReport}
                                className="h-8 rounded-lg text-[9px] uppercase font-black tracking-widest text-gray-400 hover:text-[#2e7d32] hover:bg-[#2e7d32]/5"
                            >
                                <Download className="h-3.5 w-3.5 mr-1.5" /> Eksport Laporan (CSV)
                            </Button>
                        </div>
                    </div>

                    {/* Scrollable List */}
                    <div className="flex-1 overflow-y-auto custom-scrollbar p-2">
                        {loading ? (
                            <div className="py-12 text-center text-gray-400">
                                <Loader2 className="h-6 w-6 animate-spin mx-auto mb-3 text-[#2e7d32]/30" />
                                <span className="text-[10px] font-black uppercase tracking-widest">Memuatkan...</span>
                            </div>
                        ) : filteredCustomers.length === 0 ? (
                            <div className="py-12 text-center text-gray-400 font-black uppercase tracking-widest text-[10px]">
                                Tiada padanan dijumpai
                            </div>
                        ) : (
                            <div className="space-y-1">
                                {filteredCustomers.map((customer) => (
                                    <div
                                        key={customer.id}
                                        onClick={() => setSelectedCustomer(customer)}
                                        className={`p-4 cursor-pointer transition-all duration-300 group rounded-[20px] relative border-2 ${selectedCustomerId === customer.id
                                            ? "bg-[#2e7d32]/5 border-[#2e7d32]/10 shadow-sm"
                                            : "hover:bg-gray-50/80 border-transparent"
                                            }`}
                                    >
                                        <div className="flex items-center gap-4">
                                            <Avatar name={customer.name} className="h-11 w-11 ring-2 ring-white shadow-sm group-hover:scale-105 transition-transform" />
                                            <div className="flex-1 min-w-0">
                                                <div className="flex items-center justify-between mb-0.5">
                                                    <h4 className={`font-black text-sm truncate tracking-tight ${selectedCustomerId === customer.id ? 'text-[#2e7d32]' : 'text-gray-900'}`}>
                                                        {customer.name}
                                                        {isBirthdayToday((customer as any).birthday) && " 🎂"}
                                                    </h4>
                                                    <span className="text-[10px] font-black tabular-nums text-gray-400">
                                                        {customer.points_balance} pts
                                                    </span>
                                                </div>
                                                <div className="flex items-center gap-2">
                                                    <span className="text-[11px] font-bold text-gray-400 tabular-nums">{customer.phone}</span>
                                                    <Badge
                                                        variant={tierColors[customer.tier] || "default"}
                                                        className="text-[8px] h-3.5 py-0 px-1.5 uppercase font-black tracking-widest border-none"
                                                    >
                                                        {customer.tier}
                                                    </Badge>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
