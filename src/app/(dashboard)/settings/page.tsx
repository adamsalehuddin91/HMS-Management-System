"use client";

import { useState, useEffect } from "react";
import {
  Building2,
  Clock,
  Gift,
  Bell,
  Shield,
  Users,
  Check,
  Loader2
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent, Input } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";

interface BusinessInfo {
  name: string;
  phone: string;
  email: string;
  whatsapp: string;
  address: string;
}

interface LoyaltySettings {
  pointsPerRM: number;
  memberMultiplier: number;
  pointsPerDiscount: number;
  maxRedemption: number;
  expiryMonths: number;
  expiryEnabled: boolean;
}

interface OperatingHour {
  day: string;
  open: string;
  close: string;
  isOpen: boolean;
}

export default function SettingsPage() {
  const { user } = useAuthStore();
  const [activeTab, setActiveTab] = useState("business");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [showSaved, setShowSaved] = useState(false);

  // Business Info State
  const [businessInfo, setBusinessInfo] = useState<BusinessInfo>({
    name: "HMS Salon",
    phone: "+60 12-345 6789",
    email: "hello@hmssalon.com",
    whatsapp: "+60 12-345 6789",
    address: "123 Jalan Bukit Bintang, 55100 Kuala Lumpur"
  });

  // Loyalty Settings State
  const [loyaltySettings, setLoyaltySettings] = useState<LoyaltySettings>({
    pointsPerRM: 1,
    memberMultiplier: 2,
    pointsPerDiscount: 100,
    maxRedemption: 20,
    expiryMonths: 6,
    expiryEnabled: true
  });

  // Operating Hours State
  const [operatingHours, setOperatingHours] = useState<OperatingHour[]>([
    { day: "Monday", open: "09:00", close: "21:00", isOpen: true },
    { day: "Tuesday", open: "09:00", close: "21:00", isOpen: true },
    { day: "Wednesday", open: "09:00", close: "21:00", isOpen: true },
    { day: "Thursday", open: "09:00", close: "21:00", isOpen: true },
    { day: "Friday", open: "09:00", close: "21:00", isOpen: true },
    { day: "Saturday", open: "09:00", close: "21:00", isOpen: true },
    { day: "Sunday", open: "09:00", close: "21:00", isOpen: false }
  ]);

  // Fetch settings from Supabase
  useEffect(() => {
    const fetchSettings = async () => {
      setLoading(true);
      const supabase = createClient();

      const { data, error } = await supabase
        .from('business_settings')
        .select('*');

      if (error) {
        console.error('Error fetching settings:', error);
      } else if (data) {
        data.forEach(setting => {
          if (setting.setting_key === 'business_info') {
            setBusinessInfo(setting.setting_value as BusinessInfo);
          } else if (setting.setting_key === 'loyalty_settings') {
            setLoyaltySettings(setting.setting_value as LoyaltySettings);
          } else if (setting.setting_key === 'operating_hours') {
            setOperatingHours(setting.setting_value as OperatingHour[]);
          }
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
      // Determine which setting to save based on active tab
      let settingKey = '';
      let settingValue: any = null;

      if (activeTab === 'business') {
        settingKey = 'business_info';
        settingValue = businessInfo;
      } else if (activeTab === 'loyalty') {
        settingKey = 'loyalty_settings';
        settingValue = loyaltySettings;
      } else if (activeTab === 'hours') {
        settingKey = 'operating_hours';
        settingValue = operatingHours;
      }

      if (settingKey) {
        const { error } = await supabase
          .from('business_settings')
          .upsert({
            setting_key: settingKey,
            setting_value: settingValue,
            updated_at: new Date().toISOString(),
            updated_by: user?.id || null
          }, { onConflict: 'setting_key' });

        if (error) throw error;
      }

      setShowSaved(true);
      setTimeout(() => setShowSaved(false), 3000);
    } catch (error) {
      console.error('Error saving settings:', error);
      alert('Failed to save settings. Please try again.');
    } finally {
      setSaving(false);
    }
  };

  const tabs = [
    { id: "business", label: "Business Info", icon: Building2 },
    { id: "hours", label: "Operating Hours", icon: Clock },
    { id: "loyalty", label: "Loyalty Program", icon: Gift },
    { id: "notifications", label: "Notifications", icon: Bell },
    { id: "roles", label: "User Roles", icon: Users },
    { id: "security", label: "Security", icon: Shield },
  ];

  return (
    <div className="min-h-screen">
      <Header title="Settings" user={user!} />

      <div className="p-6">
        <div className="flex gap-6">
          {/* Sidebar */}
          <Card className="w-64 h-fit">
            <CardContent className="p-2">
              {tabs.map((tab) => (
                <button
                  key={tab.id}
                  onClick={() => setActiveTab(tab.id)}
                  className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium transition-colors ${
                    activeTab === tab.id
                      ? "bg-[var(--primary-light)] text-[var(--primary-dark)]"
                      : "text-[var(--muted)] hover:bg-[var(--secondary)]"
                  }`}
                >
                  <tab.icon className="h-5 w-5" />
                  {tab.label}
                </button>
              ))}
            </CardContent>
          </Card>

          {/* Content */}
          <Card className="flex-1">
            <CardContent className="p-6">
              {loading ? (
                <div className="flex items-center justify-center h-64">
                  <Loader2 className="h-8 w-8 animate-spin text-[var(--muted)]" />
                </div>
              ) : (
                <>
              {activeTab === "business" && (
                <div className="space-y-6">
                  <div>
                    <h2 className="text-xl font-bold mb-2">Business Information</h2>
                    <p className="text-[var(--muted)]">Update your salon details</p>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <label className="block text-sm font-medium mb-2">Business Name</label>
                      <Input
                        value={businessInfo.name}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, name: e.target.value })}
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium mb-2">Phone Number</label>
                      <Input
                        value={businessInfo.phone}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, phone: e.target.value })}
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium mb-2">Email</label>
                      <Input
                        value={businessInfo.email}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, email: e.target.value })}
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium mb-2">WhatsApp</label>
                      <Input
                        value={businessInfo.whatsapp}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, whatsapp: e.target.value })}
                      />
                    </div>
                    <div className="col-span-2">
                      <label className="block text-sm font-medium mb-2">Address</label>
                      <Input
                        value={businessInfo.address}
                        onChange={(e) => setBusinessInfo({ ...businessInfo, address: e.target.value })}
                      />
                    </div>
                  </div>

                  <div className="flex justify-end">
                    <Button onClick={handleSave} disabled={saving}>
                      {saving ? (
                        <>
                          <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                          Saving...
                        </>
                      ) : showSaved ? (
                        <>
                          <Check className="h-4 w-4 mr-2" />
                          Saved!
                        </>
                      ) : (
                        "Save Changes"
                      )}
                    </Button>
                  </div>
                </div>
              )}

              {activeTab === "loyalty" && (
                <div className="space-y-6">
                  <div>
                    <h2 className="text-xl font-bold mb-2">Loyalty Program Settings</h2>
                    <p className="text-[var(--muted)]">Configure points earning and redemption rules</p>
                  </div>

                  <div className="grid grid-cols-2 gap-6">
                    <div className="p-4 border border-[var(--border)] rounded-xl">
                      <h3 className="font-medium mb-4">Points Earning</h3>
                      <div className="space-y-4">
                        <div>
                          <label className="block text-sm text-[var(--muted)] mb-2">Points per RM spent</label>
                          <Input
                            type="number"
                            value={loyaltySettings.pointsPerRM}
                            onChange={(e) => setLoyaltySettings({ ...loyaltySettings, pointsPerRM: Number(e.target.value) })}
                          />
                        </div>
                        <div>
                          <label className="block text-sm text-[var(--muted)] mb-2">Member bonus multiplier</label>
                          <Input
                            type="number"
                            value={loyaltySettings.memberMultiplier}
                            onChange={(e) => setLoyaltySettings({ ...loyaltySettings, memberMultiplier: Number(e.target.value) })}
                          />
                        </div>
                      </div>
                    </div>

                    <div className="p-4 border border-[var(--border)] rounded-xl">
                      <h3 className="font-medium mb-4">Points Redemption</h3>
                      <div className="space-y-4">
                        <div>
                          <label className="block text-sm text-[var(--muted)] mb-2">Points per RM discount</label>
                          <Input
                            type="number"
                            value={loyaltySettings.pointsPerDiscount}
                            onChange={(e) => setLoyaltySettings({ ...loyaltySettings, pointsPerDiscount: Number(e.target.value) })}
                          />
                        </div>
                        <div>
                          <label className="block text-sm text-[var(--muted)] mb-2">Max redemption % per bill</label>
                          <Input
                            type="number"
                            value={loyaltySettings.maxRedemption}
                            onChange={(e) => setLoyaltySettings({ ...loyaltySettings, maxRedemption: Number(e.target.value) })}
                          />
                        </div>
                      </div>
                    </div>

                    <div className="p-4 border border-[var(--border)] rounded-xl col-span-2">
                      <h3 className="font-medium mb-4">Points Expiry</h3>
                      <div className="flex items-center gap-4">
                        <div className="flex-1">
                          <label className="block text-sm text-[var(--muted)] mb-2">Expiry period (months)</label>
                          <Input
                            type="number"
                            value={loyaltySettings.expiryMonths}
                            onChange={(e) => setLoyaltySettings({ ...loyaltySettings, expiryMonths: Number(e.target.value) })}
                          />
                        </div>
                        <div className="flex items-center gap-2">
                          <input
                            type="checkbox"
                            id="expiry-enabled"
                            checked={loyaltySettings.expiryEnabled}
                            onChange={(e) => setLoyaltySettings({ ...loyaltySettings, expiryEnabled: e.target.checked })}
                          />
                          <label htmlFor="expiry-enabled" className="text-sm">Enable expiry</label>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div className="flex justify-end">
                    <Button onClick={handleSave} disabled={saving}>
                      {saving ? (
                        <>
                          <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                          Saving...
                        </>
                      ) : showSaved ? (
                        <>
                          <Check className="h-4 w-4 mr-2" />
                          Saved!
                        </>
                      ) : (
                        "Save Changes"
                      )}
                    </Button>
                  </div>
                </div>
              )}

              {activeTab === "hours" && (
                <div className="space-y-6">
                  <div>
                    <h2 className="text-xl font-bold mb-2">Operating Hours</h2>
                    <p className="text-[var(--muted)]">Set your salon's working hours</p>
                  </div>

                  <div className="space-y-4">
                    {operatingHours.map((schedule, index) => (
                      <div key={schedule.day} className="flex items-center gap-4 p-4 bg-[var(--secondary)] rounded-xl">
                        <span className="w-28 font-medium">{schedule.day}</span>
                        <Input
                          type="time"
                          value={schedule.open}
                          className="w-32"
                          onChange={(e) => {
                            const updated = [...operatingHours];
                            updated[index].open = e.target.value;
                            setOperatingHours(updated);
                          }}
                        />
                        <span className="text-[var(--muted)]">to</span>
                        <Input
                          type="time"
                          value={schedule.close}
                          className="w-32"
                          onChange={(e) => {
                            const updated = [...operatingHours];
                            updated[index].close = e.target.value;
                            setOperatingHours(updated);
                          }}
                        />
                        <div className="flex-1" />
                        <label className="flex items-center gap-2">
                          <input
                            type="checkbox"
                            checked={schedule.isOpen}
                            onChange={(e) => {
                              const updated = [...operatingHours];
                              updated[index].isOpen = e.target.checked;
                              setOperatingHours(updated);
                            }}
                          />
                          <span className="text-sm">Open</span>
                        </label>
                      </div>
                    ))}
                  </div>

                  <div className="flex justify-end">
                    <Button onClick={handleSave} disabled={saving}>
                      {saving ? (
                        <>
                          <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                          Saving...
                        </>
                      ) : showSaved ? (
                        <>
                          <Check className="h-4 w-4 mr-2" />
                          Saved!
                        </>
                      ) : (
                        "Save Changes"
                      )}
                    </Button>
                  </div>
                </div>
              )}

              {activeTab === "roles" && (
                <div className="space-y-6">
                  <div>
                    <h2 className="text-xl font-bold mb-2">User Roles & Permissions</h2>
                    <p className="text-[var(--muted)]">Manage access levels for different user types</p>
                  </div>

                  <div className="space-y-4">
                    <div className="p-4 border border-[var(--border)] rounded-xl">
                      <div className="flex items-center justify-between mb-4">
                        <div>
                          <h3 className="font-medium">Admin</h3>
                          <p className="text-sm text-[var(--muted)]">Full system access</p>
                        </div>
                        <Button variant="outline" size="sm">Edit Permissions</Button>
                      </div>
                      <div className="flex flex-wrap gap-2">
                        {["Dashboard", "POS", "Bookings", "Customers", "Staff", "Inventory", "Reports", "Settings"].map((p) => (
                          <span key={p} className="px-3 py-1 bg-[var(--primary-light)] text-[var(--primary-dark)] rounded-full text-xs">
                            {p}
                          </span>
                        ))}
                      </div>
                    </div>

                    <div className="p-4 border border-[var(--border)] rounded-xl">
                      <div className="flex items-center justify-between mb-4">
                        <div>
                          <h3 className="font-medium">Staff</h3>
                          <p className="text-sm text-[var(--muted)]">Limited operational access</p>
                        </div>
                        <Button variant="outline" size="sm">Edit Permissions</Button>
                      </div>
                      <div className="flex flex-wrap gap-2">
                        {["Dashboard", "POS", "Bookings", "Customers (View)"].map((p) => (
                          <span key={p} className="px-3 py-1 bg-[var(--secondary)] rounded-full text-xs">
                            {p}
                          </span>
                        ))}
                      </div>
                    </div>
                  </div>
                </div>
              )}

              {(activeTab === "notifications" || activeTab === "security") && (
                <div className="flex items-center justify-center h-64 text-[var(--muted)]">
                  Coming soon...
                </div>
              )}
                </>
              )}
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
}
