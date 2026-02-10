"use client";

import { Search } from "lucide-react";
import { Input } from "@/components/ui";

interface InventoryFiltersProps {
    searchQuery: string;
    setSearchQuery: (query: string) => void;
    categories: string[];
    categoryFilter: string;
    setCategoryFilter: (category: string) => void;
}

export function InventoryFilters({
    searchQuery,
    setSearchQuery,
    categories,
    categoryFilter,
    setCategoryFilter
}: InventoryFiltersProps) {
    return (
        <div className="flex flex-col lg:flex-row items-center gap-6">
            <div className="flex-1 w-full lg:max-w-md">
                <Input
                    placeholder="Cari produk, jenama atau SKU..."
                    icon={<Search className="h-4 w-4 text-gray-300" />}
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    className="h-12 bg-white border-none rounded-2xl shadow-sm focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 pl-11 font-bold text-sm"
                />
            </div>
            <div className="flex items-center gap-3 overflow-x-auto w-full lg:w-auto pb-2 lg:pb-0 custom-scrollbar no-scrollbar">
                {categories.map((cat) => (
                    <button
                        key={cat}
                        onClick={() => setCategoryFilter(cat)}
                        className={`px-6 py-2.5 rounded-2xl text-[10px] font-black uppercase tracking-widest transition-all whitespace-nowrap border-2 ${categoryFilter === cat
                            ? "bg-[#2e7d32] text-white border-[#2e7d32] shadow-lg shadow-green-900/10"
                            : "bg-white text-gray-400 border-gray-100 hover:border-gray-200"
                            }`}
                    >
                        {cat}
                    </button>
                ))}
            </div>
        </div>
    );
}
