"use client";

import { useState, useEffect } from "react";
import { Search, Plus, Scissors, Percent } from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Input } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import type { Service } from "@/types";

// Sub-components
import { ServiceCategoryTabs } from "./components/ServiceCategoryTabs";
import { ServiceGrid } from "./components/ServiceGrid";
import { CommissionTable } from "./components/CommissionTable";
import { ServiceModals } from "./components/ServiceModals";

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

  const [newService, setNewService] = useState({
    name: "", category: "Haircut", price: 0, member_price: 0, duration_minutes: 30, commission_rate: 10
  });
  const [editService, setEditService] = useState({
    name: "", category: "", price: 0, member_price: 0, duration_minutes: 30, commission_rate: 10
  });

  const isAdmin = user?.role === "admin";

  useEffect(() => {
    const fetchServices = async () => {
      setLoading(true);
      const supabase = createClient();
      const { data, error } = await supabase.from('services').select('*').order('name');
      if (error) {
        console.error("Error fetching services:", error);
      } else if (data) {
        setServices(data.map((s: any) => ({
          ...s,
          commissionRate: s.commission_rate || 0,
          memberPrice: s.member_price || s.price,
          isActive: s.is_active,
          image: s.image_url || CATEGORY_IMAGES[s.category] || DEFAULT_IMAGE
        })));
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
        duration_minutes: newService.duration_minutes, commission_rate: newService.commission_rate,
        is_active: true, created_at: new Date().toISOString()
      }).select().single();
      if (error) throw error;
      setServices(prev => [{
        ...data, commissionRate: data.commission_rate || 0,
        memberPrice: data.member_price || data.price, isActive: data.is_active,
        image: data.image_url || CATEGORY_IMAGES[data.category] || DEFAULT_IMAGE
      }, ...prev]);
      setNewService({ name: "", category: "Haircut", price: 0, member_price: 0, duration_minutes: 30, commission_rate: 10 });
      setShowAddModal(false);
      toast.success("Servis berjaya ditambahkan!");
    } catch (error) {
      console.error("Error adding service:", error);
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
      const { error } = await supabase.from('services').update({
        name: editService.name, category: editService.category, price: editService.price,
        member_price: editService.member_price, duration_minutes: editService.duration_minutes,
        commission_rate: editService.commission_rate, updated_at: new Date().toISOString()
      }).eq('id', selectedService.id);
      if (error) throw error;
      setServices(prev => prev.map(s => s.id === selectedService.id ? { ...s, ...editService, commissionRate: editService.commission_rate, memberPrice: editService.member_price } : s));
      setShowEditModal(false);
      toast.success("Servis berjaya dikemaskini!");
    } catch (error) {
      console.error("Error updating service:", error);
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
      console.error("Error toggling serviceStatus:", error);
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
                member_price: s.memberPrice, duration_minutes: s.duration_minutes, commission_rate: s.commissionRate
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
                member_price: s.memberPrice, duration_minutes: s.duration_minutes, commission_rate: s.commissionRate
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
