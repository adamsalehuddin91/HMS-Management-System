"use client";

interface ServiceCategoryTabsProps {
    categories: string[];
    activeCategory: string;
    setActiveCategory: (category: string) => void;
}

export function ServiceCategoryTabs({
    categories,
    activeCategory,
    setActiveCategory
}: ServiceCategoryTabsProps) {
    return (
        <div className="flex items-center gap-2 overflow-x-auto pb-2 custom-scrollbar no-scrollbar">
            {categories.map((cat) => (
                <button
                    key={cat}
                    onClick={() => setActiveCategory(cat)}
                    className={`px-6 py-2.5 rounded-2xl text-[10px] font-black uppercase tracking-widest transition-all whitespace-nowrap border-2 ${activeCategory === cat
                        ? "bg-[#2e7d32] text-white border-[#2e7d32] shadow-lg shadow-green-900/10"
                        : "bg-white text-gray-400 border-gray-100 hover:border-gray-200"
                        }`}
                >
                    {cat}
                </button>
            ))}
        </div>
    );
}
