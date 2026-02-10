"use client";

import { motion } from "framer-motion";
import { Type, Check, Info } from "lucide-react";
import { Card, CardContent, Button } from "@/components/ui";
import { useUIStore, FontSize } from "@/lib/store/ui-store";

export function DisplaySettings() {
    const { fontSize, setFontSize } = useUIStore();

    const sizes: { id: FontSize; label: string; desc: string; preview: string }[] = [
        {
            id: "small",
            label: "Kecil",
            desc: "Sesuai untuk skrin kecil atau untuk melihat lebih banyak maklumat.",
            preview: "Abc 123"
        },
        {
            id: "medium",
            label: "Sederhana",
            desc: "Saiz standard yang disyorkan untuk kebanyakan pengguna.",
            preview: "Abc 123"
        },
        {
            id: "large",
            label: "Besar",
            desc: "Lebih mudah dibaca dengan teks yang lebih besar dan jelas.",
            preview: "Abc 123"
        }
    ];

    return (
        <div className="space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
            <div>
                <h3 className="text-xl font-black text-gray-900 mb-2">Tetapan Paparan</h3>
                <p className="text-sm text-gray-500 font-medium">Urus cara sistem dipaparkan pada peranti anda.</p>
            </div>

            <div className="space-y-6">
                <div className="flex items-center gap-3">
                    <div className="p-2 bg-green-50 rounded-lg">
                        <Type className="h-5 w-5 text-[#2e7d32]" />
                    </div>
                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Saiz Tulisan (Font Size)</label>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                    {sizes.map((size) => (
                        <button
                            key={size.id}
                            onClick={() => setFontSize(size.id)}
                            className={`p-6 rounded-[2rem] border-2 text-left transition-all relative overflow-hidden group ${fontSize === size.id
                                    ? "border-[#2e7d32] bg-[#2e7d32]/5 shadow-lg shadow-green-900/5"
                                    : "border-gray-100 bg-white hover:border-gray-200 hover:bg-gray-50"
                                }`}
                        >
                            <div className="flex justify-between items-start mb-4">
                                <div className={`p-2 rounded-xl ${fontSize === size.id ? "bg-[#2e7d32] text-white" : "bg-gray-100 text-gray-400"
                                    }`}>
                                    <Type className="h-4 w-4" />
                                </div>
                                {fontSize === size.id && (
                                    <div className="h-6 w-6 bg-[#2e7d32] rounded-full flex items-center justify-center">
                                        <Check className="h-3 w-3 text-white stroke-[4px]" />
                                    </div>
                                )}
                            </div>

                            <h4 className="font-black text-gray-900 mb-1">{size.label}</h4>
                            <p className="text-[10px] font-bold text-gray-400 leading-relaxed mb-4">{size.desc}</p>

                            <div className="mt-auto border-t border-gray-100 pt-4 flex items-center justify-center bg-gray-50/50 rounded-xl py-4">
                                <span className={`font-black text-gray-800 ${size.id === 'small' ? 'text-xs' : size.id === 'medium' ? 'text-sm' : 'text-base'
                                    }`}>
                                    {size.preview}
                                </span>
                            </div>
                        </button>
                    ))}
                </div>

                <Card className="bg-blue-50/50 border-none shadow-none rounded-[1.5rem]">
                    <CardContent className="p-4 flex gap-3">
                        <Info className="h-5 w-5 text-blue-500 shrink-0 mt-0.5" />
                        <p className="text-[10px] font-bold text-blue-600/80 leading-relaxed">
                            Nota: Penukaran saiz tulisan akan menjejaskan semua halaman dalam sistem ini.
                            Jika paparan kelihatan pelik, cuba saiz "Sederhana" (Medium).
                        </p>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
