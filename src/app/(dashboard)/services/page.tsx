"use client";

import { useState, useEffect } from "react";
import { Search, Plus, Scissors, Percent } from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Input } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import type { Service } from "@/types";
import { logError } from "@/lib/utils/error-logger";

// Sub-components
import { ServiceCategoryTabs } from "./components/ServiceCategoryTabs";
import { ServiceGrid } from "./components/ServiceGrid";
import { CommissionTable } from "./components/CommissionTable";
import { ServiceModals, ServiceFormData } from "./components/ServiceModals";

const categories = ["All", "Haircut", "Hair Spa", "Facial", "Henna", "Treatment", "Massage"];

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

interface ServiceWithUI extends Service {
  commissionRate: number;
  memberPrice: number;
  isActive: boolean;
  image: string;
  // Promo fields
  promo_id?: string;
  promo_price?: number;
  promo_description?: string;
  promo_start_date?: string;
  promo_end_date?: string;
  promo_active?: boolean;
}

export default function ServicesPage() {
  const { user } = useAuthStore();
  const [services, setServices] = useState<ServiceWithUI[]>([]);
  const [loading, setLoading] = useState(true);
  const [activeCategory, setActiveCategory] = useState("All");
  const [showCommissionTab, setShowCommissionTab] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");

  const [showAddModal, setShowAddModal] = useState(false);
  const [showEditModal, setShowEditModal] = useState(false);
  const [savingService, setSavingService] = useState(false);
  const [selectedService, setSelectedService] = useState<ServiceWithUI | null>(null);

  const [newService, setNewService] = useState<ServiceFormData>({
    name: "", category: "Haircut", price: 0, member_price: 0, duration: 30, commission_rate: 10,
    has_promo: false, promo_id: "", promo_price: 0, promo_description: "", promo_start_date: "", promo_end_date: "", promo_active: true
  });
  const [editService, setEditService] = useState<ServiceFormData>({
    name: "", category: "", price: 0, member_price: 0, duration: 30, commission_rate: 10,
    has_promo: false, promo_id: "", promo_price: 0, promo_description: "", promo_start_date: "", promo_end_date: "", promo_active: true
  });

  const isAdmin = user?.role === "admin";

  useEffect(() => {
    const fetchServices = async () => {
      setLoading(true);
      const supabase = createClient();
      const { data, error } = await supabase
        .from('services')
        .select('*, promotions(*)')
        .order('name');

      if (error) {
        logError('Services Page', error);
      } else if (data) {
        // Deduplicate by name+category — prefer entry with active promo
        const seen = new Map<string, any>();
        for (const s of data) {
          const key = `${s.name.toLowerCase().trim()}|${(s.category || '').toLowerCase().trim()}`;
          const hasPromo = s.promotions?.some((p: any) => p.is_active);
          const existing = seen.get(key);
          if (!existing || hasPromo) {
            seen.set(key, s);
          }
        }
        const dedupedData = Array.from(seen.values());

        setServices(dedupedData.map((s: any) => {
          // Find latest ACTIVE promo first, fallback to latest any promo
          const sortedPromos = s.promotions?.sort((a: any, b: any) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime()) || [];
          const promo = sortedPromos.find((p: any) => p.is_active) || sortedPromos[0] || null;

          return {
            ...s,
            commissionRate: s.commission_rate || 0,
            memberPrice: s.member_price || s.price,
            isActive: s.is_active,
            is_point_eligible: s.is_point_eligible ?? true,
            image: s.image_url || CATEGORY_IMAGES[s.category] || DEFAULT_IMAGE,
            // Promo mapping
            promo_id: promo?.id,
            promo_price: promo?.promo_price,
            promo_description: promo?.description || promo?.name || "",
            promo_start_date: promo?.start_date,
            promo_end_date: promo?.end_date,
            promo_active: promo?.is_active
          };
        }));
      }
      setLoading(false);
    };
    fetchServices();
  }, []);

  const filteredServices = services.filter((s) => {
    const matchesCategory = activeCategory === "All" || s.category === activeCategory;
    const matchesSearch = s.name.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesCategory && matchesSearch;
  });

  const handleAddService = async () => {
    if (!newService.name || newService.price <= 0) {
      toast.error("Sila isi nama dan harga.");
      return;
    }
    setSavingService(true);
    const supabase = createClient();
    try {
      const { data, error } = await supabase.from('services').insert({
        name: newService.name, category: newService.category, price: newService.price,
        member_price: newService.member_price || newService.price,
        duration: newService.duration, commission_rate: newService.commission_rate,
        is_active: true, created_at: new Date().toISOString()
      }).select().single();
      if (error) throw error;
      setServices(prev => [{
        ...data, commissionRate: data.commission_rate || 0,
        memberPrice: data.member_price || data.price, isActive: data.is_active,
        image: data.image_url || CATEGORY_IMAGES[data.category] || DEFAULT_IMAGE
      }, ...prev]);
      setNewService({
        name: "", category: "Haircut", price: 0, member_price: 0, duration: 30, commission_rate: 10,
        has_promo: false, promo_id: "", promo_price: 0, promo_description: "", promo_start_date: "", promo_end_date: "", promo_active: true
      });
      setShowAddModal(false);
      toast.success("Servis berjaya ditambahkan!");
    } catch (error) {
      logError('Services Page - Add', error);
      toast.error("Gagal menambah servis.");
    } finally {
      setSavingService(false);
    }
  };

  const handleEditService = async () => {
    if (!selectedService || !editService.name || editService.price <= 0) {
      toast.error("Sila isi maklumat wajib.");
      return;
    }
    setSavingService(true);
    const supabase = createClient();
    try {
      // 1. Update Service
      const { error } = await supabase.from('services').update({
        name: editService.name, category: editService.category, price: editService.price,
        member_price: editService.member_price, duration: editService.duration,
        commission_rate: editService.commission_rate, updated_at: new Date().toISOString()
      }).eq('id', selectedService.id);

      if (error) throw error;

      // 2. Handle Promotion Upsert/Update
      if (editService.has_promo) {
        // Validate required promo fields
        if (!editService.promo_price || editService.promo_price <= 0) {
          toast.error("Sila masukkan harga promosi.");
          setSavingService(false);
          return;
        }
        if (!editService.promo_start_date || !editService.promo_end_date) {
          toast.error("Sila masukkan tarikh mula dan tarikh tamat promosi.");
          setSavingService(false);
          return;
        }

        const promoPayload: Record<string, unknown> = {
          service_id: selectedService.id,
          name: editService.promo_description
            ? `${editService.name} Promo - ${editService.promo_description}`
            : `${editService.name} Promo`,
          promo_price: editService.promo_price,
          start_date: editService.promo_start_date,
          end_date: editService.promo_end_date,
          is_active: editService.promo_active !== false,
        };

        if (editService.promo_id) {
          const { error: promoErr } = await supabase.from('promotions').update(promoPayload).eq('id', editService.promo_id);
          if (promoErr) {
            logError('Services Page - Update Promo', promoErr);
            toast.error(`Promosi gagal dikemaskini: ${promoErr.message || JSON.stringify(promoErr)}`);
          }
        } else {
          // Insert new promo
          const insertResult = await supabase.from('promotions').insert(promoPayload);
          console.log('PROMO INSERT RESULT:', JSON.stringify(insertResult, null, 2));
          console.log('PROMO INSERT status:', insertResult.status, insertResult.statusText);

          if (insertResult.error) {
            const errMsg = insertResult.error?.message
              || insertResult.error?.details
              || insertResult.error?.hint
              || `Status ${insertResult.status}: ${insertResult.statusText || 'Unknown error'}`;
            logError('Services Page - Insert Promo', insertResult.error);
            toast.error(`Promosi gagal ditambah: ${errMsg}`);
          } else {
            // Fetch the newly created promo to get its ID
            const { data: createdPromo } = await supabase
              .from('promotions')
              .select('id')
              .eq('service_id', selectedService.id)
              .eq('is_active', true)
              .order('created_at', { ascending: false })
              .limit(1)
              .single();
            if (createdPromo) editService.promo_id = createdPromo.id;
          }
        }
      } else if (!editService.has_promo && editService.promo_id) {
        // If toggled OFF, deactivate existing promo
        const { error: deactivateErr } = await supabase.from('promotions').update({ is_active: false }).eq('id', editService.promo_id);
        if (deactivateErr) logError('Services Page - Deactivate Promo', deactivateErr);
      }

      setServices(prev => prev.map(s => s.id === selectedService.id ? {
        ...s, ...editService,
        commissionRate: editService.commission_rate,
        memberPrice: editService.member_price,
        // Ensure promo state persists in local view
        promo_id: editService.promo_id,
        promo_price: editService.promo_price,
        promo_description: editService.promo_description,
        promo_start_date: editService.promo_start_date,
        promo_end_date: editService.promo_end_date,
        promo_active: editService.has_promo ? editService.promo_active : false
      } : s));

      setShowEditModal(false);
      toast.success("Servis & promosi berjaya dikemaskini!");
    } catch (error) {
      logError('Services Page - Update', error);
      toast.error("Gagal mengemaskini servis.");
    } finally {
      setSavingService(false);
    }
  };

  const handleToggleActive = async (service: ServiceWithUI) => {
    const supabase = createClient();
    const newStatus = !service.isActive;
    try {
      const { error } = await supabase.from('services').update({ is_active: newStatus, updated_at: new Date().toISOString() }).eq('id', service.id);
      if (error) throw error;
      setServices(prev => prev.map(s => s.id === service.id ? { ...s, isActive: newStatus, is_active: newStatus } : s));
      toast.success(`Servis berjaya ${newStatus ? 'diaktifkan' : 'diarkibkan'}!`);
    } catch (error) {
      logError('Services Page - Toggle', error);
      toast.error("Gagal menukar status servis.");
    }
  };

  return (
    <div className="min-h-screen bg-gray-50/50">
      <Header title="Tetapan Servis & Komisen" subtitle="Urus perkhidmatan, harga dan kadar komisen" user={user!} />

      <div className="p-8 space-y-8 max-w-[1600px] mx-auto">
        {/* Tabs */}
        <div className="flex items-center gap-6 border-b border-gray-100">
          <button
            onClick={() => setShowCommissionTab(false)}
            className={`flex items-center gap-2.5 px-6 py-4 transition-all relative ${!showCommissionTab
              ? "text-[#2e7d32] font-black"
              : "text-gray-400 font-bold hover:text-gray-600"
              }`}
          >
            <Scissors className={`h-4.5 w-4.5 ${!showCommissionTab ? "animate-bounce" : ""}`} />
            <span className="text-sm uppercase tracking-widest">Katalog Servis</span>
            {!showCommissionTab && <div className="absolute bottom-0 left-0 w-full h-1 bg-[#2e7d32] rounded-full" />}
          </button>
          <button
            onClick={() => setShowCommissionTab(true)}
            className={`flex items-center gap-2.5 px-6 py-4 transition-all relative ${showCommissionTab
              ? "text-[#2e7d32] font-black"
              : "text-gray-400 font-bold hover:text-gray-600"
              }`}
          >
            <Percent className="h-4.5 w-4.5" />
            <span className="text-sm uppercase tracking-widest">Kadar Komisen</span>
            {showCommissionTab && <div className="absolute bottom-0 left-0 w-full h-1 bg-[#2e7d32] rounded-full" />}
          </button>
        </div>

        {/* Filters & Search Row */}
        <div className="flex flex-col xl:flex-row xl:items-center justify-between gap-6">
          <ServiceCategoryTabs categories={categories} activeCategory={activeCategory} setActiveCategory={setActiveCategory} />

          <div className="flex flex-wrap items-center gap-4">
            <div className="relative w-full sm:w-80">
              <Input
                placeholder="Cari servis..."
                icon={<Search className="h-4 w-4 text-gray-400" />}
                className="h-12 bg-white border-none rounded-2xl shadow-sm focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 pl-11"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
              />
            </div>
            {isAdmin && (
              <Button
                onClick={() => setShowAddModal(true)}
                className="h-12 px-6 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-xl shadow-green-900/10 font-black uppercase tracking-widest text-[11px]"
              >
                <Plus className="h-4.5 w-4.5 mr-2" />
                Tambah Servis
              </Button>
            )}
          </div>
        </div>

        {/* Dynamic Content */}
        {!showCommissionTab ? (
          <ServiceGrid
            loading={loading}
            services={filteredServices}
            isAdmin={isAdmin}
            openEditModal={(s) => {
              setSelectedService(s);
              setEditService({
                name: s.name, category: s.category || "", price: s.price,
                member_price: s.memberPrice, duration: s.duration, commission_rate: s.commissionRate,
                has_promo: !!s.promo_id && s.promo_active !== false,
                promo_id: s.promo_id || "", promo_price: s.promo_price || 0,
                promo_description: s.promo_description || "",
                promo_start_date: s.promo_start_date || "", promo_end_date: s.promo_end_date || "",
                promo_active: s.promo_active !== false
              });
              setShowEditModal(true);
            }}
            handleToggleActive={handleToggleActive}
          />
        ) : (
          <CommissionTable
            loading={loading}
            services={filteredServices}
            isAdmin={isAdmin}
            openEditModal={(s) => {
              setSelectedService(s);
              setEditService({
                name: s.name, category: s.category || "", price: s.price,
                member_price: s.memberPrice, duration: s.duration, commission_rate: s.commissionRate,
                has_promo: !!s.promo_id && s.promo_active !== false,
                promo_id: s.promo_id || "", promo_price: s.promo_price || 0,
                promo_description: s.promo_description || "",
                promo_start_date: s.promo_start_date || "", promo_end_date: s.promo_end_date || "",
                promo_active: s.promo_active !== false
              });
              setShowEditModal(true);
            }}
          />
        )}
      </div>

      <ServiceModals
        showAddModal={showAddModal}
        setShowAddModal={setShowAddModal}
        newService={newService}
        setNewService={setNewService}
        showEditModal={showEditModal}
        setShowEditModal={setShowEditModal}
        editService={editService}
        setEditService={setEditService}
        savingService={savingService}
        handleAddService={handleAddService}
        handleEditService={handleEditService}
        categories={categories}
      />
    </div>
  );
}
