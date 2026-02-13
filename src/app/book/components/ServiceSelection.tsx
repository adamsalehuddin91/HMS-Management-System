"use client";

import { motion } from "framer-motion";
import { Scissors, Clock, Check, User } from "lucide-react";
import { Card, CardContent } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { Service, Staff } from "@/lib/utils/booking-utils";

interface ServiceSelectionProps {
    services: Service[];
    staff: Staff[];
    selectedService: Service | null;
    setSelectedService: (service: Service) => void;
    selectedStaff: Staff | null;
    setSelectedStaff: (staff: Staff | null) => void;
    selectedCategory: string;
    setSelectedCategory: (cat: string) => void;
    categories: string[];
}

export function ServiceSelection({
    services,
    staff,
    selectedService,
    setSelectedService,
    selectedStaff,
    setSelectedStaff,
    selectedCategory,
    setSelectedCategory,
    categories
}: ServiceSelectionProps) {
    const filteredServices = services.filter(s =>
        selectedCategory === "All" || s.category === selectedCategory
    );

    return (
        <motion.div
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -20 }}
            className="space-y-4"
        >
            <h2 className="text-lg font-bold text-gray-800">Pilih Servis</h2>

            {/* Category Filter */}
            <div className="flex gap-2 overflow-x-auto pb-2 scrollbar-hide">
                {categories.map(cat => (
                    <button
                        key={cat}
                        onClick={() => setSelectedCategory(cat)}
                        className={`px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap transition-colors ${selectedCategory === cat
                            ? "bg-[#2e7d32] text-white shadow-md shadow-green-100"
                            : "bg-white text-gray-600 border border-gray-200"
                            }`}
                    >
                        {cat}
                    </button>
                ))}
            </div>

            {/* Services List */}
            <div className="space-y-3">
                {filteredServices.map(service => (
                    <Card
                        key={service.id}
                        className={`cursor-pointer transition-all duration-300 ${selectedService?.id === service.id
                            ? "border-2 border-[#2e7d32] bg-[#f1f8f1] scale-[1.02] shadow-md"
                            : "border border-gray-200 hover:border-[#4caf50] hover:bg-gray-50"
                            }`}
                        onClick={() => setSelectedService(service)}
                    >
                        <CardContent className="p-4">
                            <div className="flex items-center gap-4">
                                <div className="w-16 h-16 bg-white rounded-xl flex items-center justify-center shadow-sm border border-gray-100 overflow-hidden">
                                    {service.image_url ? (
                                        <img src={service.image_url} alt={service.name} className="w-full h-full object-cover" />
                                    ) : (
                                        <Scissors className="h-6 w-6 text-[#2e7d32]" />
                                    )}
                                </div>
                                <div className="flex-1">
                                    <h3 className="font-semibold text-gray-800">{service.name}</h3>
                                    <div className="flex items-center gap-2 mt-0.5">
                                        <span className="text-[10px] uppercase font-bold text-gray-400 tracking-wider font-mono bg-gray-100 px-1.5 py-0.5 rounded">
                                            {service.category}
                                        </span>
                                        <span className="text-xs text-gray-400 flex items-center">
                                            <Clock className="h-3 w-3 mr-1" />
                                            {service.duration || 60} min
                                        </span>
                                    </div>
                                </div>
                                <div className="text-right">
                                    <p className="font-bold text-[#2e7d32]">{formatCurrency(service.price)}</p>
                                    {selectedService?.id === service.id && (
                                        <motion.div initial={{ scale: 0 }} animate={{ scale: 1 }}>
                                            <Check className="h-5 w-5 text-[#2e7d32] ml-auto mt-1" />
                                        </motion.div>
                                    )}
                                </div>
                            </div>
                        </CardContent>
                    </Card>
                ))}
            </div>

            {/* Staff Selection (Optional) */}
            <div className="mt-6">
                <h3 className="text-sm font-bold text-gray-700 mb-3 flex items-center gap-2">
                    <User className="h-4 w-4" />
                    Pilih Stylist (Pilihan)
                </h3>
                <div className="flex gap-3 overflow-x-auto pb-2 scrollbar-hide">
                    <button
                        onClick={() => setSelectedStaff(null)}
                        className={`flex flex-col items-center p-3 rounded-2xl min-w-[85px] transition-all ${!selectedStaff
                            ? "bg-[#2e7d32] text-white shadow-lg shadow-green-100 ring-2 ring-green-100"
                            : "bg-white border border-gray-100 hover:border-gray-300"
                            }`}
                    >
                        <div className={`w-12 h-12 rounded-full flex items-center justify-center mb-1.5 ${!selectedStaff ? "bg-white/20" : "bg-gray-100"}`}>
                            <User className="h-6 w-6" />
                        </div>
                        <span className="text-[11px] font-medium">Sesiapa</span>
                    </button>
                    {staff.map(s => (
                        <button
                            key={s.id}
                            onClick={() => setSelectedStaff(s)}
                            className={`flex flex-col items-center p-3 rounded-2xl min-w-[85px] transition-all ${selectedStaff?.id === s.id
                                ? "bg-[#2e7d32] text-white shadow-lg shadow-green-100 ring-2 ring-green-100"
                                : "bg-white border border-gray-100 hover:border-gray-300"
                                }`}
                        >
                            <div className={`w-12 h-12 rounded-full flex items-center justify-center mb-1.5 ${selectedStaff?.id === s.id ? "bg-white/20" : "bg-gradient-to-br from-gray-100 to-gray-200"}`}>
                                <span className="text-sm font-bold">{s.name.charAt(0)}</span>
                            </div>
                            <span className="text-[11px] font-medium truncate w-full text-center">{s.name.split(' ')[0]}</span>
                        </button>
                    ))}
                </div>
            </div>
        </motion.div>
    );
}
