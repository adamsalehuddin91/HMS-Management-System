"use client";

import { Search, Plus, Loader2 } from "lucide-react";
import { Button, Card, CardContent, Input, Avatar, Badge } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

type FilterStatus = "semua" | "aktif" | "arkib";

interface StaffWithMetrics {
    id: string;
    name: string;
    phone: string;
    email?: string | null;
    role: string;
    is_active: boolean;
    avatar_url?: string | null;
    commission: number;
    totalSales?: number;
    servicesCount?: number;
    rating?: number;
}

interface StaffMasterListProps {
    staffMembers: StaffWithMetrics[];
    loading: boolean;
    selectedStaffId: string | undefined;
    setSelectedStaff: (staff: StaffWithMetrics) => void;
    searchQuery: string;
    setSearchQuery: (query: string) => void;
    isAdmin: boolean;
    setShowAddModal: (show: boolean) => void;
    filterStatus: FilterStatus;
    setFilterStatus: (f: FilterStatus) => void;
}

const FILTER_TABS: { id: FilterStatus; label: string }[] = [
    { id: "aktif", label: "Aktif" },
    { id: "arkib", label: "Arkib" },
    { id: "semua", label: "Semua" },
];

export function StaffMasterList({
    staffMembers,
    loading,
    selectedStaffId,
    setSelectedStaff,
    searchQuery,
    setSearchQuery,
    isAdmin,
    setShowAddModal,
    filterStatus,
    setFilterStatus,
}: StaffMasterListProps) {
    const filtered = staffMembers
        .filter((s) => {
            if (filterStatus === "aktif") return s.is_active;
            if (filterStatus === "arkib") return !s.is_active;
            return true;
        })
        .filter((s) =>
            s.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
            s.role?.toLowerCase().includes(searchQuery.toLowerCase())
        );

    return (
        <Card className="flex-1 border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
            <CardContent className="p-8">
                {/* Header */}
                <div className="flex items-center justify-between mb-6">
                    <div>
                        <h2 className="text-sm font-black uppercase tracking-tight text-[#2e7d32]">Kakitangan</h2>
                        <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">Urus pasukan anda</p>
                    </div>
                    {isAdmin && (
                        <Button
                            onClick={() => setShowAddModal(true)}
                            className="h-10 px-5 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-lg shadow-[#2e7d32]/10 font-black text-[10px] uppercase tracking-widest"
                        >
                            <Plus className="h-4 w-4 mr-2" />
                            Tambah Staff
                        </Button>
                    )}
                </div>

                {/* Filter tabs */}
                <div className="flex items-center gap-2 bg-gray-100/70 p-1 rounded-2xl w-fit mb-6">
                    {FILTER_TABS.map(({ id, label }) => (
                        <button
                            key={id}
                            onClick={() => setFilterStatus(id)}
                            className={`px-4 py-2 rounded-xl text-[10px] font-black uppercase tracking-widest transition-all duration-200 ${filterStatus === id
                                    ? "bg-white text-[#2e7d32] shadow-md"
                                    : "text-gray-400 hover:text-gray-600"
                                }`}
                        >
                            {label}
                        </button>
                    ))}
                </div>

                {/* Search */}
                <div className="mb-6">
                    <Input
                        placeholder="Cari mengikut nama atau jawatan..."
                        icon={<Search className="h-4 w-4 text-gray-300" />}
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        className="h-12 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 text-sm"
                    />
                </div>

                {/* Staff list */}
                <div className="space-y-3">
                    {loading ? (
                        <div className="py-20 text-center text-gray-400">
                            <Loader2 className="h-6 w-6 animate-spin mx-auto mb-3 text-[#2e7d32]/20" />
                            <p className="text-[10px] font-black uppercase tracking-widest">Memuatkan data pasukan...</p>
                        </div>
                    ) : filtered.length === 0 ? (
                        <div className="py-20 text-center text-[10px] font-black uppercase tracking-widest text-gray-400">
                            Tiada kakitangan dijumpai
                        </div>
                    ) : (
                        filtered.map((staff) => (
                            <div
                                key={staff.id}
                                onClick={() => setSelectedStaff(staff)}
                                className={`flex items-center gap-5 p-5 rounded-[2rem] cursor-pointer transition-all duration-300 group relative border-2 ${selectedStaffId === staff.id
                                        ? "bg-[#2e7d32]/5 border-[#2e7d32]/10 shadow-sm"
                                        : "hover:bg-gray-50/80 border-transparent hover:scale-[1.01]"
                                    }`}
                            >
                                <div className="relative">
                                    <Avatar
                                        name={staff.name}
                                        src={staff.avatar_url || undefined}
                                        className="h-14 w-14 ring-4 ring-white shadow-md group-hover:scale-110 transition-transform"
                                    />
                                    <div className={`absolute -bottom-1 -right-1 h-4 w-4 rounded-full border-2 border-white shadow-sm ${staff.is_active ? "bg-green-500" : "bg-gray-300"}`} />
                                </div>
                                <div className="flex-1 min-w-0">
                                    <div className="flex items-center gap-2 mb-1">
                                        <p className={`font-black text-sm tracking-tight ${selectedStaffId === staff.id ? "text-[#2e7d32]" : "text-gray-900"}`}>
                                            {staff.name}
                                        </p>
                                        <Badge className="bg-white border-gray-100 text-gray-400 text-[8px] h-4 py-0 px-1.5 uppercase font-black tracking-widest">
                                            {staff.role}
                                        </Badge>
                                        {!staff.is_active && (
                                            <Badge className="bg-gray-100 text-gray-400 text-[8px] h-4 py-0 px-1.5 uppercase font-black tracking-widest border-none">
                                                Arkib
                                            </Badge>
                                        )}
                                    </div>
                                    <p className="text-[11px] font-bold text-gray-400 tabular-nums">{staff.phone}</p>
                                </div>
                                <div className="text-right">
                                    <p className="font-black text-sm text-[#2e7d32] tabular-nums tracking-tighter">{formatCurrency(staff.commission)}</p>
                                    <p className="text-[9px] font-black text-gray-400 uppercase tracking-widest">Komisen MTD</p>
                                </div>
                            </div>
                        ))
                    )}
                </div>
            </CardContent>
        </Card>
    );
}
