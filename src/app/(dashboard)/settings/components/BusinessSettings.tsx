"use client";

import { useState } from "react";
import { Check, Loader2, Upload, ImageIcon, X } from "lucide-react";
import { Button, Card, CardContent, Input } from "@/components/ui";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";

interface BusinessInfo {
    name: string;
    phone: string;
    email: string;
    whatsapp: string;
    address: string;
    booking_url?: string;
    google_review_url?: string;
    logo_url?: string;
}

interface BusinessSettingsProps {
    businessInfo: BusinessInfo;
    setBusinessInfo: (info: BusinessInfo) => void;
    saving: boolean;
    showSaved: boolean;
    handleSave: () => void;
}

export function BusinessSettings({
    businessInfo,
    setBusinessInfo,
    saving,
    showSaved,
    handleSave
}: BusinessSettingsProps) {
    const [uploadingLogo, setUploadingLogo] = useState(false);

    const handleLogoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (!file) return;

        if (!file.type.startsWith("image/")) {
            toast.error("Sila pilih fail imej sahaja.");
            return;
        }
        if (file.size > 2 * 1024 * 1024) {
            toast.error("Saiz logo mestilah kurang dari 2MB.");
            return;
        }

        setUploadingLogo(true);
        try {
            const supabase = createClient();
            const ext = file.name.split(".").pop();
            const filePath = `logo/salon-logo.${ext}`;

            const { error: uploadError } = await supabase.storage
                .from("salon-assets")
                .upload(filePath, file, { upsert: true, contentType: file.type });

            if (uploadError) throw uploadError;

            const { data: { publicUrl } } = supabase.storage
                .from("salon-assets")
                .getPublicUrl(filePath);

            setBusinessInfo({ ...businessInfo, logo_url: publicUrl });
            toast.success("Logo berjaya dimuat naik! Klik Simpan untuk menyimpan.");
        } catch {
            toast.error("Gagal muat naik logo. Cuba lagi.");
        } finally {
            setUploadingLogo(false);
            e.target.value = "";
        }
    };

    return (
        <div className="space-y-10">
            <div>
                <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Profil Kedai</h3>
                <p className="text-3xl font-black text-gray-900 tracking-tighter mt-1">Maklumat Perniagaan</p>
                <p className="text-[11px] font-black text-gray-400 uppercase tracking-widest mt-3">Kemaskini butiran salon anda untuk dipaparkan pada resit dan sistem</p>
            </div>

            {/* Logo Upload */}
            <div className="p-6 bg-gray-50 rounded-3xl space-y-4">
                <div>
                    <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32]">Logo Salon</h3>
                    <p className="text-[11px] font-black text-gray-400 uppercase tracking-widest mt-1">Dipaparkan pada resit PDF dan sistem</p>
                </div>
                <div className="flex items-center gap-6">
                    <div className="h-24 w-24 rounded-2xl bg-white border border-gray-200 flex items-center justify-center overflow-hidden flex-shrink-0">
                        {businessInfo.logo_url ? (
                            <img
                                src={businessInfo.logo_url}
                                alt="Logo Salon"
                                className="h-full w-full object-contain p-2"
                            />
                        ) : (
                            <ImageIcon className="h-8 w-8 text-gray-300" />
                        )}
                    </div>
                    <div className="space-y-2">
                        <label
                            className={`h-12 px-6 rounded-xl font-black text-[10px] uppercase tracking-widest cursor-pointer inline-flex items-center gap-2 transition-all select-none ${
                                uploadingLogo
                                    ? "bg-gray-100 text-gray-400 cursor-not-allowed"
                                    : "bg-[#2e7d32]/10 text-[#2e7d32] hover:bg-[#2e7d32]/20"
                            }`}
                        >
                            {uploadingLogo ? (
                                <><Loader2 className="h-4 w-4 animate-spin" />Memuat naik...</>
                            ) : (
                                <><Upload className="h-4 w-4" />Muat Naik Logo</>
                            )}
                            <input
                                type="file"
                                accept="image/*"
                                className="hidden"
                                onChange={handleLogoUpload}
                                disabled={uploadingLogo}
                            />
                        </label>
                        <p className="text-[10px] text-gray-400 font-medium ml-1">PNG, JPG, SVG · Maks 2MB</p>
                        {businessInfo.logo_url && (
                            <button
                                onClick={() => setBusinessInfo({ ...businessInfo, logo_url: undefined })}
                                className="text-[10px] font-black text-red-400 hover:text-red-600 uppercase tracking-widest ml-1 flex items-center gap-1 transition-colors"
                            >
                                <X className="h-3 w-3" /> Padam Logo
                            </button>
                        )}
                    </div>
                </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div className="space-y-4">
                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Nama Perniagaan</label>
                    <Input
                        value={businessInfo.name}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, name: e.target.value })}
                        className="h-14 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
                    />
                </div>
                <div className="space-y-4">
                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Nombor Telefon</label>
                    <Input
                        value={businessInfo.phone}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, phone: e.target.value })}
                        className="h-14 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold tabular-nums"
                    />
                </div>
                <div className="space-y-4">
                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Alamat Emel</label>
                    <Input
                        value={businessInfo.email}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, email: e.target.value })}
                        className="h-14 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
                    />
                </div>
                <div className="space-y-4">
                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">WhatsApp</label>
                    <Input
                        value={businessInfo.whatsapp}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, whatsapp: e.target.value })}
                        className="h-14 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold tabular-nums"
                    />
                </div>
                <div className="col-span-1 md:col-span-2 space-y-4">
                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Alamat Premis</label>
                    <Input
                        value={businessInfo.address}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, address: e.target.value })}
                        className="h-14 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold"
                    />
                </div>
            </div>

            <div className="pt-4">
                <h3 className="text-[10px] font-black uppercase tracking-[0.2em] text-[#2e7d32] mb-1">Pautan Resit</h3>
                <p className="text-[11px] font-black text-gray-400 uppercase tracking-widest mb-6">Pautan ini akan dipaparkan pada resit WhatsApp & PDF</p>

                <div className="grid grid-cols-1 gap-8">
                    <div className="space-y-4">
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Link Tempahan Online (Public Booking)</label>
                        <Input
                            value={businessInfo.booking_url || ""}
                            onChange={(e) => setBusinessInfo({ ...businessInfo, booking_url: e.target.value })}
                            placeholder="https://yourdomain.com/book"
                            className="h-14 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold text-sm"
                        />
                    </div>
                    <div className="space-y-4">
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest ml-1">Google Business Review Link</label>
                        <Input
                            value={businessInfo.google_review_url || ""}
                            onChange={(e) => setBusinessInfo({ ...businessInfo, google_review_url: e.target.value })}
                            placeholder="https://g.page/r/your-business/review"
                            className="h-14 bg-gray-50 border-none rounded-2xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 font-bold text-sm"
                        />
                    </div>
                </div>
            </div>

            <div className="flex justify-end pt-6">
                <Button
                    onClick={handleSave}
                    disabled={saving}
                    className={`h-14 px-10 rounded-2xl font-black text-[11px] uppercase tracking-widest transition-all ${showSaved
                            ? "bg-green-500 hover:bg-green-600 text-white"
                            : "bg-[#2e7d32] hover:bg-[#1b5e20] text-white shadow-xl shadow-green-900/10"
                        }`}
                >
                    {saving ? (
                        <>
                            <Loader2 className="h-4 w-4 mr-3 animate-spin" />
                            Menyimpan...
                        </>
                    ) : showSaved ? (
                        <>
                            <Check className="h-4 w-4 mr-3" />
                            Sudah Disimpan!
                        </>
                    ) : (
                        "Simpan Perubahan"
                    )}
                </Button>
            </div>
        </div>
    );
}
