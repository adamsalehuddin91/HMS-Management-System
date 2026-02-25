"use client";

import { useState, useEffect } from "react";
import { Package } from "lucide-react";
import { Header } from "@/components/layout/header";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import type { Product } from "@/types";
import { inventoryService } from "@/lib/services/inventory-service";
import { getProductImage } from "@/lib/constants/images";
import { PRODUCT_CATEGORIES } from "@/lib/constants/categories";

// Sub-components
import { InventoryStatsHeader } from "./components/InventoryStatsHeader";
import { InventoryFilters } from "./components/InventoryFilters";
import { ProductMasterTable } from "./components/ProductMasterTable";
import { InventoryModals, ProductFormData } from "./components/InventoryModals";
import { InventoryHistoryTab } from "./components/InventoryHistoryTab";

interface ProductWithUI extends Product {
  stockLevel: number;
  status: 'in_stock' | 'low_stock' | 'out_of_stock';
  image: string;
  price: number;
}

export default function InventoryPage() {
  const { user } = useAuthStore();
  const [products, setProducts] = useState<ProductWithUI[]>([]);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState<"inventory" | "history">("inventory");
  const [categoryFilter, setCategoryFilter] = useState("Semua Kategori");
  const [searchQuery, setSearchQuery] = useState("");

  const [showAddModal, setShowAddModal] = useState(false);
  const [savingProduct, setSavingProduct] = useState(false);
  const [newProduct, setNewProduct] = useState({ name: "", brand: "", category: "Shampoo", sku: "", cost_price: 0, sell_price: 0, stock_quantity: 0, reorder_level: 5, low_stock_threshold: 5 });

  const [showEditModal, setShowEditModal] = useState(false);
  const [editProduct, setEditProduct] = useState<ProductWithUI | null>(null);
  const [savingEdit, setSavingEdit] = useState(false);

  const [showStockModal, setShowStockModal] = useState(false);
  const [stockProduct, setStockProduct] = useState<ProductWithUI | null>(null);
  const [stockAdjustment, setStockAdjustment] = useState(0);
  const [stockReason, setStockReason] = useState("Restock");
  const [savingStock, setSavingStock] = useState(false);

  const [actionMenuId, setActionMenuId] = useState<string | null>(null);

  const isAdmin = user?.role === "admin";

  useEffect(() => {
    const fetchProducts = async () => {
      setLoading(true);
      try {
        const data = await inventoryService.getProducts();
        setProducts(data.map((p: any) => {
          let status: 'in_stock' | 'low_stock' | 'out_of_stock' = 'in_stock';
          const threshold = p.low_stock_threshold || 5;
          if (p.stock_quantity === 0) status = 'out_of_stock';
          else if (p.stock_quantity <= threshold) status = 'low_stock';
          return { ...p, stockLevel: p.stock_quantity, status, price: p.sell_price, image: p.image_url || getProductImage(p.category) };
        }));
      } catch (error) {
        toast.error("Gagal memuatkan produk.");
      }
      setLoading(false);
    };
    fetchProducts();
  }, []);

  const totalProducts = products.length;
  const lowStockItems = products.filter(p => p.status === 'low_stock' || p.status === 'out_of_stock').length;
  const inventoryValue = products.reduce((sum, p) => sum + (p.price * p.stockLevel), 0);

  const categories = ["Semua Kategori", ...Array.from(new Set(products.map(p => p.category).filter(Boolean)))];
  const productCategories = PRODUCT_CATEGORIES;

  const filteredProducts = products.filter(p => {
    const matchesCategory = categoryFilter === "Semua Kategori" || p.category === categoryFilter;
    const matchesSearch = p.name.toLowerCase().includes(searchQuery.toLowerCase()) || p.brand?.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesCategory && matchesSearch;
  });

  const handleAddProduct = async () => {
    if (!newProduct.name || newProduct.stock_quantity < 0) {
      toast.error("Sila isi nama dan stok yang sah.");
      return;
    }
    setSavingProduct(true);
    const supabase = createClient();
    try {
      const { data, error } = await supabase.from('products').insert({ ...newProduct, is_active: true, created_at: new Date().toISOString() }).select().single();
      if (error) throw error;
      const mapped: ProductWithUI = { ...data, stockLevel: data.stock_quantity, status: data.stock_quantity === 0 ? 'out_of_stock' : (data.stock_quantity <= data.low_stock_threshold ? 'low_stock' : 'in_stock'), price: data.sell_price, image: data.image_url || getProductImage(data.category) };
      setProducts(prev => [mapped, ...prev]);
      setNewProduct({ name: "", brand: "", category: "Shampoo", sku: "", cost_price: 0, sell_price: 0, stock_quantity: 0, reorder_level: 5, low_stock_threshold: 5 });
      setShowAddModal(false);
      toast.success("Produk berjaya dilaraskan!");
    } catch (error) {
      toast.error("Gagal menambah produk.");
    } finally { setSavingProduct(false); }
  };

  const handleEditProduct = async () => {
    if (!editProduct) return;
    setSavingEdit(true);
    const supabase = createClient();
    try {
      const { error } = await supabase.from('products').update({ name: editProduct.name, brand: editProduct.brand, category: editProduct.category, sku: editProduct.sku, cost_price: editProduct.cost_price, sell_price: editProduct.sell_price, low_stock_threshold: (editProduct as any).low_stock_threshold }).eq('id', editProduct.id);
      if (error) throw error;
      setProducts(prev => prev.map(p => p.id === editProduct.id ? { ...p, ...editProduct, price: editProduct.sell_price, status: (editProduct.stock_quantity === 0 ? 'out_of_stock' : (editProduct.stock_quantity <= ((editProduct as any).low_stock_threshold || 5) ? 'low_stock' : 'in_stock')) } : p));
      setShowEditModal(false);
      toast.success("Produk dikemaskini!");
    } catch (error) { toast.error("Gagal kemaskini produk."); }
    finally { setSavingEdit(false); }
  };

  const handleStockAdjustment = async () => {
    if (!stockProduct || stockAdjustment === 0 || !user) return;
    setSavingStock(true);
    try {
      const type = stockAdjustment > 0 ? 'in' : 'out';
      const { balanceAfter } = await inventoryService.adjustStock({
        productId: stockProduct.id,
        changeAmount: stockAdjustment,
        balanceBefore: stockProduct.stock_quantity,
        type,
        reason: stockReason,
        performedBy: user.id
      });

      setProducts(prev => prev.map(p => p.id === stockProduct.id ? {
        ...p,
        stock_quantity: balanceAfter,
        stockLevel: balanceAfter,
        status: (balanceAfter === 0 ? 'out_of_stock' : (balanceAfter <= ((p as any).low_stock_threshold || 5) ? 'low_stock' : 'in_stock'))
      } : p));

      setShowStockModal(false);
      toast.success("Stok dilaraskan!");
    } catch (error) {
      toast.error("Gagal laras stok.");
    } finally {
      setSavingStock(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#fcfdfd]">
      <Header title="Inventori & Bekalan" subtitle="Pantau dan urus stok produk salon anda" user={user!} />

      <div className="p-4 md:p-8 space-y-8 max-w-[1600px] mx-auto">
        <InventoryStatsHeader totalProducts={totalProducts} lowStockItems={lowStockItems} inventoryValue={inventoryValue} />

        <div className="flex items-center gap-4 border-b border-gray-100 overflow-x-auto no-scrollbar">
          <button onClick={() => setActiveTab("inventory")} className={`flex items-center gap-2 px-6 py-4 border-b-2 transition-all font-black text-[10px] uppercase tracking-widest ${activeTab === "inventory" ? "border-[#2e7d32] text-[#2e7d32]" : "border-transparent text-gray-400 hover:text-gray-600"}`}>
            <Package className="h-4 w-4" /> Inventori Aktif
          </button>
          <button onClick={() => setActiveTab("history")} className={`flex items-center gap-2 px-6 py-4 border-b-2 transition-all font-black text-[10px] uppercase tracking-widest ${activeTab === "history" ? "border-[#2e7d32] text-[#2e7d32]" : "border-transparent text-gray-400 hover:text-gray-600"}`}>
            Rekod Masuk/Keluar
          </button>
        </div>

        {activeTab === "inventory" ? (
          <>
            <InventoryFilters searchQuery={searchQuery} setSearchQuery={setSearchQuery} categories={categories} categoryFilter={categoryFilter} setCategoryFilter={setCategoryFilter} onAddProduct={() => setShowAddModal(true)} isAdmin={isAdmin} />

            <ProductMasterTable
              loading={loading}
              products={filteredProducts}
              actionMenuId={actionMenuId}
              setActionMenuId={setActionMenuId}
              openEditModal={(p) => { setEditProduct(p); setShowEditModal(true); setActionMenuId(null); }}
              openStockModal={(p) => { setStockProduct(p); setStockAdjustment(0); setStockReason("Restock"); setShowStockModal(true); setActionMenuId(null); }}
            />
          </>
        ) : (
          <InventoryHistoryTab />
        )}
      </div>

      <InventoryModals
        showAddModal={showAddModal} setShowAddModal={setShowAddModal}
        newProduct={newProduct} setNewProduct={setNewProduct as any}
        savingProduct={savingProduct} handleAddProduct={handleAddProduct}
        showEditModal={showEditModal} setShowEditModal={setShowEditModal}
        editProduct={editProduct as unknown as ProductFormData} setEditProduct={setEditProduct as any}
        savingEdit={savingEdit} handleEditProduct={handleEditProduct}
        showStockModal={showStockModal} setShowStockModal={setShowStockModal}
        stockProduct={stockProduct as any} setStockProduct={setStockProduct as any}
        stockAdjustment={stockAdjustment} setStockAdjustment={setStockAdjustment}
        stockReason={stockReason} setStockReason={setStockReason}
        savingStock={savingStock} handleStockAdjustment={handleStockAdjustment}
        productCategories={productCategories}
      />
    </div>
  );
}
