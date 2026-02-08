"use client";

import { useState, useEffect } from "react";
import {
  Search,
  Plus,
  Package,
  AlertTriangle,
  DollarSign,
  ChevronLeft,
  ChevronRight,
  MoreVertical,
  Loader2,
  X
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent, Input, Badge, StatCard } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { formatCurrency } from "@/lib/utils";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import type { Product } from "@/types";

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
  const [categoryFilter, setCategoryFilter] = useState("All Categories");
  const [searchQuery, setSearchQuery] = useState("");

  // Modal States
  const [showAddModal, setShowAddModal] = useState(false);
  const [savingProduct, setSavingProduct] = useState(false);
  const [newProduct, setNewProduct] = useState({
    name: "",
    brand: "",
    category: "Shampoo",
    sku: "",
    cost_price: 0,
    sell_price: 0,
    stock_quantity: 0,
    low_stock_threshold: 5
  });

  const isAdmin = user?.role === "admin";

  useEffect(() => {
    const fetchProducts = async () => {
      setLoading(true);
      const supabase = createClient();
      const { data, error } = await supabase
        .from('products')
        .select('*')
        .order('name');

      if (error) {
        console.error("Error fetching products:", error);
      } else if (data) {
        const mappedProducts: ProductWithUI[] = data.map((p: any) => {
          let status: 'in_stock' | 'low_stock' | 'out_of_stock' = 'in_stock';
          // Use low_stock_threshold from DB or reorder_level from Type (if they match)
          // DB uses low_stock_threshold
          const threshold = p.low_stock_threshold || p.reorder_level || 5;

          if (p.stock_quantity === 0) status = 'out_of_stock';
          else if (p.stock_quantity <= threshold) status = 'low_stock';

          return {
            ...p,
            stockLevel: p.stock_quantity,
            status,
            price: p.sell_price, // Map sell_price to price for UI
            image: p.image_url || "https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?q=80&w=200&auto=format&fit=crop"
          };
        });
        setProducts(mappedProducts);
      }
      setLoading(false);
    };

    fetchProducts();
  }, []);

  // Compute Stats
  const totalProducts = products.length;
  const lowStockItems = products.filter(p => p.status === 'low_stock' || p.status === 'out_of_stock').length;
  const inventoryValue = products.reduce((sum, p) => sum + (p.price * p.stockLevel), 0);

  const filteredProducts = products.filter(p => {
    const matchesCategory = categoryFilter === "All Categories" || p.category === categoryFilter;
    const matchesSearch = p.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      p.brand?.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesCategory && matchesSearch;
  });

  const getStockBadge = (status: string, level: number) => {
    if (status === "out_of_stock") {
      return <Badge variant="error" className="bg-red-100 text-red-700 hover:bg-red-200">Out of Stock</Badge>;
    }
    if (status === "low_stock") {
      return (
        <div className="flex items-center gap-2">
          <div className="w-16 h-2 bg-orange-200 rounded-full overflow-hidden">
            <div className="h-full bg-orange-500 rounded-full" style={{ width: "20%" }} />
          </div>
          <span className="text-sm text-orange-600">{level} left</span>
        </div>
      );
    }
    return (
      <div className="flex items-center gap-2">
        <div className="w-16 h-2 bg-green-200 rounded-full overflow-hidden">
          <div
            className="h-full bg-green-500 rounded-full"
            style={{ width: `${Math.min(100, (level / 50) * 100)}%` }}
          />
        </div>
        <span className="text-sm text-green-600">{level} left</span>
      </div>
    );
  };

  // Extract unique categories for filter
  const categories = ["All Categories", ...Array.from(new Set(products.map(p => p.category).filter(Boolean)))];
  const productCategories = ["Shampoo", "Conditioner", "Hair Treatment", "Styling", "Skincare", "Tools", "Accessories"];

  const handleAddProduct = async () => {
    if (!newProduct.name || newProduct.stock_quantity < 0) {
      toast.error("Please fill in name and valid stock.");
      return;
    }

    setSavingProduct(true);
    const supabase = createClient();

    try {
      const { data, error } = await supabase
        .from('products') // Assuming 'products' is the correct table name based on original code
        .insert({
          name: newProduct.name,
          brand: newProduct.brand || null,
          category: newProduct.category,
          sku: newProduct.sku || null,
          cost_price: newProduct.cost_price,
          sell_price: newProduct.sell_price,
          stock_quantity: newProduct.stock_quantity,
          low_stock_threshold: newProduct.low_stock_threshold,
          is_active: true,
          created_at: new Date().toISOString()
        })
        .select()
        .single();

      if (error) throw error;

      let status: 'in_stock' | 'low_stock' | 'out_of_stock' = 'in_stock';
      if (data.stock_quantity === 0) status = 'out_of_stock';
      else if (data.stock_quantity <= data.low_stock_threshold) status = 'low_stock';

      const mappedProduct: ProductWithUI = {
        ...data,
        stockLevel: data.stock_quantity,
        status,
        price: data.sell_price,
        image: "https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?q=80&w=200&auto=format&fit=crop"
      };

      setProducts(prev => [mappedProduct, ...prev]);
      setNewProduct({
        name: "",
        brand: "",
        category: "Shampoo",
        sku: "",
        cost_price: 0,
        sell_price: 0,
        stock_quantity: 0,
        low_stock_threshold: 5
      });
      setShowAddModal(false);
      toast.success("Product added successfully!");

    } catch (error) {
      console.error("Error adding product:", error);
      toast.error("Failed to add product. Please try again.");
    } finally {
      setSavingProduct(false);
    }
  };

  return (
    <div className="min-h-screen">
      <Header title="Inventory Management" subtitle="Monitor and manage your salon supplies and products." user={user!} />

      <div className="p-6 space-y-6">
        {/* Stats Row */}
        <div className="flex flex-col lg:flex-row items-start lg:items-center justify-between gap-4">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 flex-1 w-full">
            <StatCard
              title="Total Products"
              value={totalProducts}
              change={0}
              changeLabel="vs last month"
              icon={Package}
            />
            <StatCard
              title="Low Stock Items"
              value={lowStockItems}
              className="border-[var(--warning)]"
              icon={AlertTriangle}
            />
            <StatCard
              title="Inventory Value"
              value={formatCurrency(inventoryValue)}
              change={0}
              changeLabel="vs last month"
              icon={DollarSign}
            />
          </div>
          {isAdmin && (
            <Button className="w-full lg:w-auto ml-0 lg:ml-4" onClick={() => setShowAddModal(true)}>
              <Plus className="h-4 w-4 mr-2" />
              Add New Product
            </Button>
          )}
        </div>

        {/* Tabs */}
        <div className="flex items-center gap-4 border-b border-[var(--border)] overflow-x-auto">
          <button
            onClick={() => setActiveTab("inventory")}
            className={`flex items-center gap-2 px-4 py-3 border-b-2 transition-colors whitespace-nowrap ${activeTab === "inventory"
              ? "border-[var(--primary)] text-[var(--primary)]"
              : "border-transparent text-[var(--muted)] hover:text-[var(--foreground)]"
              }`}
          >
            <Package className="h-4 w-4" />
            Active Inventory
          </button>
          <button
            onClick={() => setActiveTab("history")}
            className={`flex items-center gap-2 px-4 py-3 border-b-2 transition-colors whitespace-nowrap ${activeTab === "history"
              ? "border-[var(--primary)] text-[var(--primary)]"
              : "border-transparent text-[var(--muted)] hover:text-[var(--foreground)]"
              }`}
          >
            <span className="text-lg">🕐</span> Record
          </button>
        </div>

        {/* Filters */}
        <div className="flex flex-col lg:flex-row items-center gap-4">
          <div className="flex-1 w-full lg:max-w-md">
            <Input
              placeholder="Search products, brands or SKU..."
              icon={<Search className="h-4 w-4" />}
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
          </div>
          <div className="flex items-center gap-2 overflow-x-auto w-full lg:w-auto pb-2 lg:pb-0">
            {categories.slice(0, 5).map((cat: any) => (
              <button
                key={cat}
                onClick={() => setCategoryFilter(cat)}
                className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors whitespace-nowrap ${categoryFilter === cat
                  ? "bg-[var(--card)] shadow-sm border border-[var(--border)]"
                  : "hover:bg-[var(--secondary)]"
                  }`}
              >
                {cat}
              </button>
            ))}
          </div>
        </div>

        {/* Products Table */}
        <Card>
          <CardContent className="p-0">
            <div className="hidden md:block overflow-x-auto">
              <table className="w-full">
                <thead>
                  <tr className="border-b border-[var(--border)]">
                    <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                      Product Name
                    </th>
                    <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                      Brand
                    </th>
                    <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                      Category
                    </th>
                    <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                      Stock Level
                    </th>
                    <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                      Price
                    </th>
                    <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                      Action
                    </th>
                  </tr>
                </thead>
                <tbody>
                  {loading ? (
                    <tr>
                      <td colSpan={6} className="py-8 text-center text-[var(--muted)]">
                        <Loader2 className="h-6 w-6 animate-spin mx-auto mb-2" />
                        Loading inventory...
                      </td>
                    </tr>
                  ) : filteredProducts.length === 0 ? (
                    <tr>
                      <td colSpan={6} className="py-8 text-center text-[var(--muted)]">
                        No products found.
                      </td>
                    </tr>
                  ) : (
                    filteredProducts.map((product) => (
                      <tr key={product.id} className="border-b border-[var(--border)] hover:bg-[var(--secondary)]">
                        <td className="py-4 px-6">
                          <div className="flex items-center gap-3">
                            <img
                              src={product.image}
                              alt={product.name}
                              className="h-10 w-10 rounded-lg object-cover"
                            />
                            <span className="font-medium">{product.name}</span>
                          </div>
                        </td>
                        <td className="py-4 px-6 text-[var(--muted)]">{product.brand}</td>
                        <td className="py-4 px-6">
                          <Badge variant="default">{product.category}</Badge>
                        </td>
                        <td className="py-4 px-6">
                          {getStockBadge(product.status, product.stockLevel)}
                        </td>
                        <td className="py-4 px-6 font-medium">{formatCurrency(product.price)}</td>
                        <td className="py-4 px-6">
                          <button className="p-2 hover:bg-[var(--card)] rounded-lg">
                            <MoreVertical className="h-4 w-4 text-[var(--muted)]" />
                          </button>
                        </td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>

            {/* Mobile View */}
            <div className="md:hidden space-y-4 p-4">
              {loading ? (
                <div className="text-center text-[var(--muted)] py-8">
                  <Loader2 className="h-6 w-6 animate-spin mx-auto mb-2" />
                  Loading inventory...
                </div>
              ) : filteredProducts.length === 0 ? (
                <div className="text-center text-[var(--muted)] py-8">No products found.</div>
              ) : (
                filteredProducts.map((product) => (
                  <div key={product.id} className="bg-[var(--background)] p-4 rounded-xl border border-[var(--border)]">
                    <div className="flex items-start justify-between mb-3">
                      <div className="flex items-center gap-3">
                        <img
                          src={product.image}
                          alt={product.name}
                          className="h-12 w-12 rounded-lg object-cover"
                        />
                        <div>
                          <h4 className="font-bold">{product.name}</h4>
                          <p className="text-xs text-[var(--muted)]">{product.brand}</p>
                        </div>
                      </div>
                      <button className="p-2 hover:bg-[var(--secondary)] rounded-lg">
                        <MoreVertical className="h-4 w-4 text-[var(--muted)]" />
                      </button>
                    </div>

                    <div className="space-y-3">
                      <div className="flex justify-between items-center text-sm">
                        <span className="text-[var(--muted)]">Category</span>
                        <Badge variant="default" className="text-xs">{product.category}</Badge>
                      </div>
                      <div className="flex justify-between items-center text-sm">
                        <span className="text-[var(--muted)]">Price</span>
                        <span className="font-bold">{formatCurrency(product.price)}</span>
                      </div>
                      <div className="pt-2 border-t border-[var(--border)]">
                        <div className="flex justify-between items-center mb-1">
                          <span className="text-sm font-medium">Stock Status</span>
                          {product.status === "out_of_stock"
                            ? <span className="text-xs font-bold text-red-600">Out of Stock</span>
                            : <span className="text-xs font-bold text-[var(--foreground)]">{product.stockLevel} units</span>
                          }
                        </div>
                        {getStockBadge(product.status, product.stockLevel)}
                      </div>
                    </div>
                  </div>
                ))
              )}
            </div>

            {/* Pagination (Simplified) */}
            {/* <div className="flex items-center justify-between p-4 border-t border-[var(--border)]">...</div> */}
          </CardContent>
        </Card>
      </div>

      {/* Add Product Modal */}
      {showAddModal && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <Card className="w-full max-w-lg mx-4">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-xl font-bold">Add New Product</h3>
                <button
                  onClick={() => setShowAddModal(false)}
                  className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>

              <div className="space-y-4">
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium mb-2">Product Name *</label>
                    <Input
                      placeholder="Enter product name"
                      value={newProduct.name}
                      onChange={(e) => setNewProduct({ ...newProduct, name: e.target.value })}
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">Brand</label>
                    <Input
                      placeholder="Enter brand"
                      value={newProduct.brand}
                      onChange={(e) => setNewProduct({ ...newProduct, brand: e.target.value })}
                    />
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium mb-2">Category</label>
                    <select
                      value={newProduct.category}
                      onChange={(e) => setNewProduct({ ...newProduct, category: e.target.value })}
                      className="w-full h-12 px-4 bg-[var(--card)] border border-[var(--border)] rounded-xl focus:outline-none focus:ring-2 focus:ring-[var(--primary)]"
                    >
                      {productCategories.map(cat => (
                        <option key={cat} value={cat}>{cat}</option>
                      ))}
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">SKU</label>
                    <Input
                      placeholder="SKU-001"
                      value={newProduct.sku}
                      onChange={(e) => setNewProduct({ ...newProduct, sku: e.target.value })}
                    />
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium mb-2">Cost Price (RM)</label>
                    <Input
                      type="number"
                      placeholder="0"
                      value={newProduct.cost_price || ""}
                      onChange={(e) => setNewProduct({ ...newProduct, cost_price: Number(e.target.value) })}
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">Sell Price (RM) *</label>
                    <Input
                      type="number"
                      placeholder="0"
                      value={newProduct.sell_price || ""}
                      onChange={(e) => setNewProduct({ ...newProduct, sell_price: Number(e.target.value) })}
                    />
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium mb-2">Initial Stock</label>
                    <Input
                      type="number"
                      placeholder="0"
                      value={newProduct.stock_quantity || ""}
                      onChange={(e) => setNewProduct({ ...newProduct, stock_quantity: Number(e.target.value) })}
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">Low Stock Alert</label>
                    <Input
                      type="number"
                      value={newProduct.low_stock_threshold}
                      onChange={(e) => setNewProduct({ ...newProduct, low_stock_threshold: Number(e.target.value) })}
                    />
                  </div>
                </div>
              </div>

              <div className="flex gap-3 mt-6">
                <Button
                  variant="outline"
                  className="flex-1"
                  onClick={() => setShowAddModal(false)}
                >
                  Cancel
                </Button>
                <Button
                  className="flex-1"
                  onClick={handleAddProduct}
                  disabled={savingProduct}
                >
                  {savingProduct ? (
                    <>
                      <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                      Saving...
                    </>
                  ) : (
                    "Add Product"
                  )}
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}
    </div >
  );
}

