"use client";

import { motion, AnimatePresence } from "framer-motion";
import { Search, Scissors, Package, Loader2 } from "lucide-react";
import { Button, Card, CardContent, Input } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";

import type { Service, Product } from "@/types";

interface ItemCatalogProps {
    activeTab: 'services' | 'products';
    setActiveTab: (tab: 'services' | 'products') => void;
    categories: string[];
    selectedCategory: string;
    setSelectedCategory: (cat: string) => void;
    searchService: string;
    setSearchService: (val: string) => void;
    loading: boolean;
    filteredServices: Service[];
    products: Product[];
    addToCart: (service: Service) => void;
    addProductToCart: (product: Product) => void;
    isMember: boolean;
}

const CATEGORY_IMAGES: Record<string, string> = {
    "Haircut": "https://images.unsplash.com/photo-1595476108010-b4d1f102b1b1?q=80&w=400&auto=format&fit=crop",
    "Hair Spa": "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?q=80&w=400&auto=format&fit=crop",
    "Facial": "https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?q=80&w=400&auto=format&fit=crop",
    "Henna": "https://images.unsplash.com/photo-1552698621-3e3e29853874?q=80&w=400&auto=format&fit=crop",
    "Treatment": "https://images.unsplash.com/photo-1522335208411-dc5a1a639c4d?q=80&w=400&auto=format&fit=crop",
    "Massage": "https://images.unsplash.com/photo-1519823551278-64ac92734fb1?q=80&w=400&auto=format&fit=crop",
    "Manicure": "https://images.unsplash.com/photo-1632345031435-8727f6897d53?q=80&w=400&auto=format&fit=crop",
    "Pedicure": "https://images.unsplash.com/photo-1519014816548-bf5fe059e98b?q=80&w=400&auto=format&fit=crop",
    "Makeup": "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?q=80&w=400&auto=format&fit=crop",
    "Waxing": "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=400&auto=format&fit=crop",
};

const DEFAULT_IMAGE = "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?q=80&w=200&auto=format&fit=crop";

export function ItemCatalog({
    activeTab,
    setActiveTab,
    categories,
    selectedCategory,
    setSelectedCategory,
    searchService,
    setSearchService,
    loading,
    filteredServices,
    products,
    addToCart,
    addProductToCart,
    isMember
}: ItemCatalogProps) {
    return (
        <div className="flex-1 min-w-0">
            {/* Services/Products Toggle */}
            <div className="flex items-center gap-2 mb-4 bg-gray-100/50 p-1.5 rounded-2xl w-fit">
                <button
                    onClick={() => setActiveTab('services')}
                    className={`flex items-center gap-2 px-6 py-2.5 rounded-xl font-bold transition-all duration-300 ${activeTab === 'services'
                        ? 'bg-white text-[#2e7d32] shadow-sm'
                        : 'text-gray-500 hover:text-gray-700'
                        }`}
                >
                    <Scissors className="h-4 w-4" />
                    Services
                </button>
                <button
                    onClick={() => setActiveTab('products')}
                    className={`flex items-center gap-2 px-6 py-2.5 rounded-xl font-bold transition-all duration-300 ${activeTab === 'products'
                        ? 'bg-white text-[#2e7d32] shadow-sm'
                        : 'text-gray-500 hover:text-gray-700'
                        }`}
                >
                    <Package className="h-4 w-4" />
                    Products ({products.length})
                </button>
            </div>

            {/* Category Tabs (Services only) */}
            <AnimatePresence mode="wait">
                {activeTab === 'services' && (
                    <motion.div
                        initial={{ opacity: 0, y: -10 }}
                        animate={{ opacity: 1, y: 0 }}
                        exit={{ opacity: 0, y: -10 }}
                        className="flex items-center gap-2 mb-6 overflow-x-auto pb-2 no-scrollbar"
                    >
                        {categories.map((cat) => (
                            <Button
                                key={cat}
                                variant={selectedCategory === cat ? "primary" : "outline"}
                                size="sm"
                                onClick={() => setSelectedCategory(cat)}
                                className={`rounded-full px-5 font-bold border-none transition-all ${selectedCategory === cat
                                    ? 'bg-[#2e7d32] text-white shadow-md shadow-[#2e7d32]/20'
                                    : 'bg-white text-gray-400 hover:bg-gray-50 shadow-sm'
                                    }`}
                            >
                                {cat}
                            </Button>
                        ))}
                    </motion.div>
                )}
            </AnimatePresence>

            {/* Search */}
            <div className="mb-6">
                <div className="relative group">
                    <Input
                        placeholder={activeTab === 'services' ? "Search services..." : "Search products..."}
                        className="h-12 pl-12 bg-white border-none shadow-sm rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 transition-all"
                        value={searchService}
                        onChange={(e) => setSearchService(e.target.value)}
                    />
                    <Search className="absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-gray-300 group-focus-within:text-[#2e7d32] transition-colors" />
                </div>
            </div>

            {/* Services/Products Grid */}
            <div className="grid grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-4">
                {loading ? (
                    <div className="col-span-full text-center py-20 text-gray-400">
                        <Loader2 className="h-10 w-10 animate-spin mx-auto mb-4 text-[#2e7d32]" />
                        <p className="font-bold">Loading {activeTab} catalogue...</p>
                    </div>
                ) : activeTab === 'services' ? (
                    // Services Grid
                    <AnimatePresence mode="popLayout">
                        {filteredServices.length === 0 ? (
                            <motion.div
                                initial={{ opacity: 0 }}
                                animate={{ opacity: 1 }}
                                className="col-span-full text-center py-12 text-gray-400 font-medium"
                            >
                                No services match your search
                            </motion.div>
                        ) : (
                            filteredServices.map((service, index) => (
                                <motion.div
                                    layout
                                    key={service.id}
                                    initial={{ opacity: 0, scale: 0.9 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{ delay: index * 0.05 }}
                                    whileHover={{ scale: 1.02, y: -4 }}
                                    whileTap={{ scale: 0.98 }}
                                >
                                    <Card
                                        className="cursor-pointer border-none shadow-sm bg-white hover:shadow-xl hover:shadow-[#2e7d32]/5 transition-all group overflow-hidden"
                                        onClick={() => addToCart(service)}
                                    >
                                        <CardContent className="p-0">
                                            <div className="relative h-32 overflow-hidden">
                                                <img
                                                    src={service.image_url || CATEGORY_IMAGES[service.category] || DEFAULT_IMAGE}
                                                    alt={service.name}
                                                    className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-110"
                                                />
                                                <div className="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
                                                <div className="absolute top-2 right-2 translate-y-2 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all">
                                                    <Button size="icon" className="h-8 w-8 rounded-full bg-white/90 backdrop-blur text-[#2e7d32] hover:bg-white shadow-lg">
                                                        <Scissors className="h-4 w-4" />
                                                    </Button>
                                                </div>
                                            </div>
                                            <div className="p-4">
                                                <h3 className="font-bold text-gray-700 truncate">{service.name}</h3>
                                                <p className="text-[10px] text-gray-400 uppercase font-bold tracking-widest mb-2">{service.category}</p>
                                                <div className="flex items-center justify-between mt-auto">
                                                    <div>
                                                        <p className="text-lg font-black text-[#2e7d32]">
                                                            {formatCurrency(isMember && service.member_price ? service.member_price : service.price)}
                                                        </p>
                                                        {isMember && service.member_price && service.member_price < service.price && (
                                                            <p className="text-[10px] text-gray-400 line-through font-bold">
                                                                {formatCurrency(service.price)}
                                                            </p>
                                                        )}
                                                    </div>
                                                </div>
                                            </div>
                                        </CardContent>
                                    </Card>
                                </motion.div>
                            ))
                        )}
                    </AnimatePresence>
                ) : (
                    // Products Grid
                    <AnimatePresence mode="popLayout">
                        {products.filter(p =>
                            p.name.toLowerCase().includes(searchService.toLowerCase()) ||
                            p.brand?.toLowerCase().includes(searchService.toLowerCase())
                        ).length === 0 ? (
                            <motion.div
                                initial={{ opacity: 0 }}
                                animate={{ opacity: 1 }}
                                className="col-span-full text-center py-12 text-gray-400 font-medium"
                            >
                                No products match your search
                            </motion.div>
                        ) : (
                            products.filter(p =>
                                p.name.toLowerCase().includes(searchService.toLowerCase()) ||
                                p.brand?.toLowerCase().includes(searchService.toLowerCase())
                            ).map((product, index) => (
                                <motion.div
                                    layout
                                    key={product.id}
                                    initial={{ opacity: 0, scale: 0.9 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{ delay: index * 0.05 }}
                                    whileHover={{ scale: 1.02, y: -4 }}
                                    whileTap={{ scale: 0.98 }}
                                >
                                    <Card
                                        className="cursor-pointer border-none shadow-sm bg-white hover:shadow-xl hover:shadow-[#2e7d32]/5 transition-all group overflow-hidden"
                                        onClick={() => addProductToCart(product)}
                                    >
                                        <CardContent className="p-0">
                                            <div className="relative h-32 overflow-hidden">
                                                <img
                                                    src={product.image_url || "https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?q=80&w=200&auto=format&fit=crop"}
                                                    alt={product.name}
                                                    className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-110"
                                                />
                                                <div className="absolute top-2 right-2">
                                                    <span className={`text-[10px] font-black px-2 py-1 rounded-full uppercase tracking-widest ${product.stock_quantity <= 5
                                                        ? 'bg-orange-500 text-white'
                                                        : 'bg-white/90 backdrop-blur text-[#2e7d32] border border-[#2e7d32]/10'
                                                        }`}>
                                                        {product.stock_quantity} left
                                                    </span>
                                                </div>
                                            </div>
                                            <div className="p-4">
                                                <h3 className="font-bold text-gray-700 truncate">{product.name}</h3>
                                                <p className="text-[10px] text-gray-400 uppercase font-bold tracking-widest mb-2">{product.brand || product.category}</p>
                                                <p className="text-lg font-black text-[#2e7d32]">
                                                    {formatCurrency(product.sell_price)}
                                                </p>
                                            </div>
                                        </CardContent>
                                    </Card>
                                </motion.div>
                            ))
                        )}
                    </AnimatePresence>
                )}
            </div>
        </div>
    );
}
