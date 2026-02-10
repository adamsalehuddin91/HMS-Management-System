"use client";

import { Package, AlertTriangle, DollarSign } from "lucide-react";
import { StatCard } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

interface InventoryStatsHeaderProps {
    totalProducts: number;
    lowStockItems: number;
    inventoryValue: number;
}

export function InventoryStatsHeader({
    totalProducts,
    lowStockItems,
    inventoryValue
}: InventoryStatsHeaderProps) {
    return (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <StatCard
                title="Jumlah Produk"
                value={totalProducts}
                change={0}
                icon={Package}
            />
            <StatCard
                title="Stok Rendah / Habis"
                value={lowStockItems}
                className={lowStockItems > 0 ? "border-orange-200" : ""}
                icon={AlertTriangle}
            />
            <StatCard
                title="Nilai Inventori"
                value={formatCurrency(inventoryValue)}
                change={0}
                icon={DollarSign}
            />
        </div>
    );
}
