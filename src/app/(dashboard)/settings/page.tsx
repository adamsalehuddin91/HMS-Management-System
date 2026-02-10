"use client";

import { useState, useEffect } from "react";
import {
  Building2,
  Clock,
  Gift,
  Bell,
  Shield,
  Users,
  Monitor,
  Loader2,
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Card, CardContent } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";

// Sub-components
import { SettingsSidebar } from "./components/SettingsSidebar";
import { BusinessSettings } from "./components/BusinessSettings";
import { OperatingHoursSettings } from "./components/OperatingHoursSettings";
import { LoyaltySettingsView } from "./components/LoyaltySettingsView";
import { RolesSettings } from "./components/RolesSettings";
import { DisplaySettings } from "./components/DisplaySettings";
import { SMSNotificationSettings } from "./components/SMSNotificationSettings";

interface BusinessInfo { name: string; phone: string; email: string; whatsapp: string; address: string; }
interface LoyaltySettings { pointsPerRM: number; memberMultiplier: number; pointsPerDiscount: number; maxRedemption: number; expiryMonths: number; expiryEnabled: boolean; }
interface OperatingHour { day: string; open: string; close: string; isOpen: boolean; }

export default function SettingsPage() {
  const { user } = useAuthStore();
  const [activeTab, setActiveTab] = useState("business");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [showSaved, setShowSaved] = useState(false);

  const [businessInfo, setBusinessInfo] = useState<BusinessInfo>({ name: "HMS Salon", phone: "+60 12-345 6789", email: "hello@hmssalon.com", whatsapp: "+60 12-345 6789", address: "123 Jalan Bukit Bintang, 55100 Kuala Lumpur" });
  const [loyaltySettings, setLoyaltySettings] = useState<LoyaltySettings>({ pointsPerRM: 1, memberMultiplier: 2, pointsPerDiscount: 100, maxRedemption: 20, expiryMonths: 6, expiryEnabled: true });
  const [operatingHours, setOperatingHours] = useState<OperatingHour[]>([
    { day: "Isnin", open: "09:00", close: "21:00", isOpen: true },
    { day: "Selasa", open: "09:00", close: "21:00", isOpen: true },
    { day: "Rabu", open: "09:00", close: "21:00", isOpen: true },
    { day: "Khamis", open: "09:00", close: "21:00", isOpen: true },
    { day: "Jumaat", open: "09:00", close: "21:00", isOpen: true },
    { day: "Sabtu", open: "09:00", close: "21:00", isOpen: true },
    { day: "Ahad", open: "09:00", close: "21:00", isOpen: false }
  ]);

  useEffect(() => {
    const fetchSettings = async () => {
      setLoading(true);
      const supabase = createClient();
      const { data, error } = await supabase.from('business_settings').select('*');
      if (!error && data) {
        data.forEach(setting => {
          if (setting.setting_key === 'business_info') setBusinessInfo(setting.setting_value as BusinessInfo);
          else if (setting.setting_key === 'loyalty_settings') setLoyaltySettings(setting.setting_value as LoyaltySettings);
          else if (setting.setting_key === 'operating_hours') setOperatingHours(setting.setting_value as OperatingHour[]);
        });
      }
      setLoading(false);
    };
    fetchSettings();
  }, []);

  const handleSave = async () => {
    setSaving(true);
    const supabase = createClient();
    try {
      let key = ''; let val: any = null;
      if (activeTab === 'business') { key = 'business_info'; val = businessInfo; }
      else if (activeTab === 'loyalty') { key = 'loyalty_settings'; val = loyaltySettings; }
      else if (activeTab === 'hours') { key = 'operating_hours'; val = operatingHours; }
      if (key) {
        const { error } = await supabase.from('business_settings').upsert({ setting_key: key, setting_value: val, updated_at: new Date().toISOString(), updated_by: user?.id || null }, { onConflict: 'setting_key' });
        if (error) throw error;
      }
      setShowSaved(true);
      setTimeout(() => setShowSaved(false), 3000);
      toast.success("Tetapan berjaya disimpan!");
    } catch (error) { toast.error("Gagal menyimpan tetapan."); }
    finally { setSaving(false); }
  };

  const tabs = [
    { id: "business", label: "Profil Bisnes", icon: Building2 },
    { id: "hours", label: "Waktu Operasi", icon: Clock },
    { id: "loyalty", label: "Program Kesetiaan", icon: Gift },
    { id: "display", label: "Paparan", icon: Monitor },
    { id: "notifications", label: "Notifikasi", icon: Bell },
    { id: "roles", label: "Peranan Pengguna", icon: Users },
    { id: "security", label: "Keselamatan", icon: Shield },
  ];

  return (
    <div className="min-h-screen bg-[#fcfdfd]">
      <Header title="Konfigurasi Sistem" subtitle="Urus tetapan salon dan peraturan perniagaan anda" user={user!} />

      <div className="p-8 max-w-[1600px] mx-auto">
        <div className="flex flex-col xl:flex-row gap-8">
          <SettingsSidebar tabs={tabs} activeTab={activeTab} setActiveTab={setActiveTab} />

          <Card className="flex-1 border-none shadow-xl bg-white rounded-[2.5rem] overflow-hidden">
            <CardContent className="p-10 lg:p-14">
              {loading ? (
                <div className="flex flex-col items-center justify-center h-96 gap-4 text-gray-400">
                  <Loader2 className="h-10 w-10 animate-spin text-[#2e7d32]/20" />
                  <p className="font-black text-[10px] uppercase tracking-widest">Sila Tunggu...</p>
                </div>
              ) : (
                <div className="max-w-4xl">
                  {activeTab === "business" && (
                    <BusinessSettings businessInfo={businessInfo} setBusinessInfo={setBusinessInfo} saving={saving} showSaved={showSaved} handleSave={handleSave} />
                  )}
                  {activeTab === "hours" && (
                    <OperatingHoursSettings operatingHours={operatingHours} setOperatingHours={setOperatingHours} saving={saving} showSaved={showSaved} handleSave={handleSave} />
                  )}
                  {activeTab === "loyalty" && (
                    <LoyaltySettingsView loyaltySettings={loyaltySettings} setLoyaltySettings={setLoyaltySettings} saving={saving} showSaved={showSaved} handleSave={handleSave} />
                  )}
                  {activeTab === "display" && <DisplaySettings />}
                  {activeTab === "notifications" && <SMSNotificationSettings />}
                  {activeTab === "roles" && <RolesSettings />}
                  {activeTab === "security" && (
                    <div className="flex flex-col items-center justify-center h-64 text-gray-300 gap-4">
                      <div className="h-16 w-16 rounded-full bg-gray-50 flex items-center justify-center">
                        <Loader2 className="h-6 w-6 animate-pulse" />
                      </div>
                      <p className="font-black text-[10px] uppercase tracking-widest">Akan Datang...</p>
                    </div>
                  )}
                </div>
              )}
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
}
