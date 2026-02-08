"use client";

import { useState, useEffect } from "react";
import {
  Search,
  Plus,
  MoreVertical,
  Scissors,
  Clock,
  Percent,
  Loader2,
  X
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent, Input, Badge } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { formatCurrency } from "@/lib/utils";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import type { Service } from "@/types";

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

  // Modal States
  const [showAddModal, setShowAddModal] = useState(false);
  const [showEditModal, setShowEditModal] = useState(false);
  const [savingService, setSavingService] = useState(false);
  const [selectedService, setSelectedService] = useState<ServiceWithUI | null>(null);
  const [newService, setNewService] = useState({
    name: "",
    category: "Haircut",
    price: 0,
    member_price: 0,
    duration_minutes: 30,
    commission_rate: 10
  });
  const [editService, setEditService] = useState({
    name: "",
    category: "",
    price: 0,
    member_price: 0,
    duration_minutes: 30,
    commission_rate: 10
  });

  const isAdmin = user?.role === "admin";

  useEffect(() => {
    const fetchServices = async () => {
      setLoading(true);
      const supabase = createClient();
      const { data, error } = await supabase
        .from('services')
        .select('*')
        .order('name');

      if (error) {
        console.error("Error fetching services:", error);
      } else if (data) {
        // Map DB fields to UI fields (snake_case to camelCase)
        const mappedServices: ServiceWithUI[] = data.map((s: any) => ({
          ...s,
          commissionRate: s.commission_rate || 0,
          memberPrice: s.member_price || s.price,
          isActive: s.is_active,
          image: s.image_url || CATEGORY_IMAGES[s.category] || DEFAULT_IMAGE
        }));
        setServices(mappedServices);
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
      toast.error("Please fill in name and price.");
      return;
    }

    setSavingService(true);
    const supabase = createClient();

    try {
      const { data, error } = await supabase
        .from('services')
        .insert({
          name: newService.name,
          category: newService.category,
          price: newService.price,
          member_price: newService.member_price || newService.price,
          duration_minutes: newService.duration_minutes,
          commission_rate: newService.commission_rate,
          is_active: true,
          created_at: new Date().toISOString()
        })
        .select()
        .single();

      if (error) throw error;

      const mappedService: ServiceWithUI = {
        ...data,
        commissionRate: data.commission_rate || 0,
        memberPrice: data.member_price || data.price,
        isActive: data.is_active,
        image: data.image_url || CATEGORY_IMAGES[data.category] || DEFAULT_IMAGE
      };

      setServices(prev => [mappedService, ...prev]);
      setNewService({ name: "", category: "Haircut", price: 0, member_price: 0, duration_minutes: 30, commission_rate: 10 });
      setShowAddModal(false);
      toast.success("Service added successfully!");

    } catch (error) {
      console.error("Error adding service:", error);
      toast.error("Failed to add service. Please try again.");
    } finally {
      setSavingService(false);
    }
  };

  const handleEditService = async () => {
    if (!selectedService || !editService.name || editService.price <= 0) {
      toast.error("Please fill in required fields.");
      return;
    }

    setSavingService(true);
    const supabase = createClient();

    try {
      const { error } = await supabase
        .from('services')
        .update({
          name: editService.name,
          category: editService.category,
          price: editService.price,
          member_price: editService.member_price,
          duration_minutes: editService.duration_minutes,
          commission_rate: editService.commission_rate,
          updated_at: new Date().toISOString()
        })
        .eq('id', selectedService.id);

      if (error) throw error;

      const updatedService = {
        ...selectedService,
        ...editService,
        commissionRate: editService.commission_rate,
        memberPrice: editService.member_price
      };
      setServices(prev => prev.map(s => s.id === selectedService.id ? updatedService : s));
      setShowEditModal(false);
      toast.success("Service updated successfully!");

    } catch (error) {
      console.error("Error updating service:", error);
      toast.error("Failed to update service. Please try again.");
    } finally {
      setSavingService(false);
    }
  };

  const handleToggleActive = async (service: ServiceWithUI) => {
    const supabase = createClient();
    const newStatus = !service.isActive;

    try {
      const { error } = await supabase
        .from('services')
        .update({
          is_active: newStatus,
          updated_at: new Date().toISOString()
        })
        .eq('id', service.id);

      if (error) throw error;

      setServices(prev => prev.map(s =>
        s.id === service.id ? { ...s, isActive: newStatus, is_active: newStatus } : s
      ));
      toast.success(`Service ${newStatus ? 'activated' : 'deactivated'} successfully!`);

    } catch (error) {
      console.error("Error toggling service:", error);
      toast.error("Failed to update service status.");
    }
  };

  const openEditModal = (service: ServiceWithUI) => {
    setSelectedService(service);
    setEditService({
      name: service.name,
      category: service.category || "",
      price: service.price,
      member_price: service.memberPrice,
      duration_minutes: service.duration_minutes,
      commission_rate: service.commissionRate
    });
    setShowEditModal(true);
  };

  return (
    <div className="min-h-screen">
      <Header title="Service & Commission Settings" subtitle="Manage services, pricing and commission rates" user={user!} />

      <div className="p-6 space-y-6">
        {/* Tabs */}
        <div className="flex items-center gap-4 border-b border-[var(--border)]">
          <button
            onClick={() => setShowCommissionTab(false)}
            className={`flex items-center gap-2 px-4 py-3 border-b-2 transition-colors ${!showCommissionTab
              ? "border-[var(--primary)] text-[var(--primary)]"
              : "border-transparent text-[var(--muted)] hover:text-[var(--foreground)]"
              }`}
          >
            <Scissors className="h-4 w-4" />
            Services
          </button>
          <button
            onClick={() => setShowCommissionTab(true)}
            className={`flex items-center gap-2 px-4 py-3 border-b-2 transition-colors ${showCommissionTab
              ? "border-[var(--primary)] text-[var(--primary)]"
              : "border-transparent text-[var(--muted)] hover:text-[var(--foreground)]"
              }`}
          >
            <Percent className="h-4 w-4" />
            Commission Rates
          </button>
        </div>

        {/* Filters */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            {categories.map((cat) => (
              <button
                key={cat}
                onClick={() => setActiveCategory(cat)}
                className={`px-4 py-2 rounded-full text-sm font-medium transition-colors ${activeCategory === cat
                  ? "bg-[var(--primary)] text-white"
                  : "bg-[var(--secondary)] hover:bg-[var(--secondary-hover)]"
                  }`}
              >
                {cat}
              </button>
            ))}
          </div>
          <div className="flex items-center gap-3">
            <Input
              placeholder="Search services..."
              icon={<Search className="h-4 w-4" />}
              className="w-64"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
            {isAdmin && (
              <Button onClick={() => setShowAddModal(true)}>
                <Plus className="h-4 w-4 mr-2" />
                Add Service
              </Button>
            )}
          </div>
        </div>

        {/* Services Grid */}
        {!showCommissionTab ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {loading ? (
              <div className="col-span-full py-12 text-center text-[var(--muted)]">
                <Loader2 className="h-8 w-8 animate-spin mx-auto mb-2" />
                Loading services...
              </div>
            ) : filteredServices.length === 0 ? (
              <div className="col-span-full py-12 text-center text-[var(--muted)]">
                No services found.
              </div>
            ) : (
              filteredServices.map((service) => (
                <Card key={service.id} className={!service.isActive ? "opacity-60" : ""}>
                  <CardContent className="p-6">
                    <div className="flex items-start justify-between mb-4">
                      <img
                        src={service.image}
                        alt={service.name}
                        className="h-14 w-14 rounded-xl object-cover"
                      />
                      <div className="flex items-center gap-2">
                        <Badge variant={service.isActive ? "success" : "default"}>
                          {service.isActive ? "Active" : "Inactive"}
                        </Badge>
                        <button className="p-1 hover:bg-[var(--secondary)] rounded">
                          <MoreVertical className="h-4 w-4 text-[var(--muted)]" />
                        </button>
                      </div>
                    </div>

                    <h3 className="font-bold text-lg mb-1">{service.name}</h3>
                    <p className="text-sm text-[var(--muted)] mb-4">{service.category}</p>

                    <div className="space-y-3">
                      <div className="flex items-center justify-between">
                        <span className="text-sm text-[var(--muted)]">Regular Price</span>
                        <span className="font-bold text-lg">{formatCurrency(service.price)}</span>
                      </div>
                      <div className="flex items-center justify-between">
                        <span className="text-sm text-[var(--muted)]">Member Price</span>
                        <span className="font-medium text-[var(--primary)]">{formatCurrency(service.memberPrice)}</span>
                      </div>
                      <div className="flex items-center justify-between pt-3 border-t border-[var(--border)]">
                        <div className="flex items-center gap-1 text-sm text-[var(--muted)]">
                          <Clock className="h-4 w-4" />
                          {service.duration_minutes} mins
                        </div>
                        <div className="flex items-center gap-1 text-sm text-[var(--muted)]">
                          <Percent className="h-4 w-4" />
                          {service.commissionRate}% commission
                        </div>
                      </div>
                    </div>

                    {isAdmin && (
                      <div className="flex gap-2 mt-4 pt-4 border-t border-[var(--border)]">
                        <Button variant="outline" size="sm" className="flex-1" onClick={() => openEditModal(service)}>Edit</Button>
                        <Button
                          variant="ghost"
                          size="sm"
                          className={service.isActive ? "text-[var(--error)]" : "text-[var(--success)]"}
                          onClick={() => handleToggleActive(service)}
                        >
                          {service.isActive ? "Deactivate" : "Activate"}
                        </Button>
                      </div>
                    )}
                  </CardContent>
                </Card>
              ))
            )}
          </div>
        ) : (
          /* Commission Table */
          <Card>
            <CardContent className="p-0">
              <div className="hidden md:block overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b border-[var(--border)]">
                      <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase">Service</th>
                      <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase">Category</th>
                      <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase">Price</th>
                      <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase">Commission Rate</th>
                      <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase">Commission Amount</th>
                      {isAdmin && <th className="text-left py-4 px-6 text-xs font-medium text-[var(--muted)] uppercase">Action</th>}
                    </tr>
                  </thead>
                  <tbody>
                    {loading ? (
                      <tr>
                        <td colSpan={6} className="py-8 text-center text-[var(--muted)]">
                          <Loader2 className="h-6 w-6 animate-spin mx-auto mb-2" />
                          Loading rates...
                        </td>
                      </tr>
                    ) : (
                      filteredServices.map((service) => (
                        <tr key={service.id} className="border-b border-[var(--border)] hover:bg-[var(--secondary)]">
                          <td className="py-4 px-6">
                            <div className="flex items-center gap-3">
                              <img
                                src={service.image}
                                alt={service.name}
                                className="h-10 w-10 rounded-lg object-cover"
                              />
                              <span className="font-medium">{service.name}</span>
                            </div>
                          </td>
                          <td className="py-4 px-6">
                            <Badge>{service.category}</Badge>
                          </td>
                          <td className="py-4 px-6 font-medium">{formatCurrency(service.price)}</td>
                          <td className="py-4 px-6">
                            <div className="flex items-center gap-2">
                              <div className="w-16 h-2 bg-[var(--primary-light)] rounded-full overflow-hidden">
                                <div
                                  className="h-full bg-[var(--primary)] rounded-full"
                                  style={{ width: `${service.commissionRate * 5}%` }}
                                />
                              </div>
                              <span className="font-medium">{service.commissionRate}%</span>
                            </div>
                          </td>
                          <td className="py-4 px-6 font-bold text-[var(--primary)]">
                            {formatCurrency(service.price * service.commissionRate / 100)}
                          </td>
                          {isAdmin && (
                            <td className="py-4 px-6">
                              <Button variant="outline" size="sm" onClick={() => openEditModal(service)}>Edit Rate</Button>
                            </td>
                          )}
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
                    Loading rates...
                  </div>
                ) : filteredServices.length === 0 ? (
                  <div className="text-center text-[var(--muted)] py-8">No services found.</div>
                ) : (
                  filteredServices.map((service) => (
                    <div key={service.id} className="bg-[var(--background)] p-4 rounded-xl border border-[var(--border)]">
                      <div className="flex items-center gap-3 mb-3">
                        <img
                          src={service.image}
                          alt={service.name}
                          className="h-12 w-12 rounded-lg object-cover"
                        />
                        <div>
                          <h4 className="font-bold">{service.name}</h4>
                          <Badge variant="default" className="mt-1">{service.category}</Badge>
                        </div>
                      </div>

                      <div className="space-y-3">
                        <div className="flex justify-between items-center text-sm">
                          <span className="text-[var(--muted)]">Price</span>
                          <span className="font-medium">{formatCurrency(service.price)}</span>
                        </div>
                        <div className="flex justify-between items-center text-sm">
                          <span className="text-[var(--muted)]">Commission ({service.commissionRate}%)</span>
                          <span className="font-bold text-[var(--primary)]">
                            {formatCurrency(service.price * service.commissionRate / 100)}
                          </span>
                        </div>
                        <div className="w-full h-1.5 bg-[var(--primary-light)] rounded-full overflow-hidden">
                          <div
                            className="h-full bg-[var(--primary)] rounded-full"
                            style={{ width: `${service.commissionRate * 5}%` }}
                          />
                        </div>
                      </div>

                      {isAdmin && (
                        <Button
                          variant="outline"
                          size="sm"
                          className="w-full mt-4"
                          onClick={() => openEditModal(service)}
                        >
                          Edit Rate
                        </Button>
                      )}
                    </div>
                  ))
                )}
              </div>
            </CardContent>
          </Card>
        )}
      </div>

      {/* Add Service Modal */}
      {showAddModal && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <Card className="w-full max-w-md mx-4">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-xl font-bold">Add New Service</h3>
                <button
                  onClick={() => setShowAddModal(false)}
                  className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>

              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium mb-2">Service Name *</label>
                  <Input
                    placeholder="Enter service name"
                    value={newService.name}
                    onChange={(e) => setNewService({ ...newService, name: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Category</label>
                  <select
                    value={newService.category}
                    onChange={(e) => setNewService({ ...newService, category: e.target.value })}
                    className="w-full h-12 px-4 bg-[var(--card)] border border-[var(--border)] rounded-xl focus:outline-none focus:ring-2 focus:ring-[var(--primary)]"
                  >
                    {categories.filter(c => c !== "All").map(cat => (
                      <option key={cat} value={cat}>{cat}</option>
                    ))}
                  </select>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium mb-2">Price (RM) *</label>
                    <Input
                      type="number"
                      placeholder="0"
                      value={newService.price || ""}
                      onChange={(e) => setNewService({ ...newService, price: Number(e.target.value) })}
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">Member Price</label>
                    <Input
                      type="number"
                      placeholder="0"
                      value={newService.member_price || ""}
                      onChange={(e) => setNewService({ ...newService, member_price: Number(e.target.value) })}
                    />
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium mb-2">Duration (mins)</label>
                    <Input
                      type="number"
                      value={newService.duration_minutes}
                      onChange={(e) => setNewService({ ...newService, duration_minutes: Number(e.target.value) })}
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">Commission %</label>
                    <Input
                      type="number"
                      value={newService.commission_rate}
                      onChange={(e) => setNewService({ ...newService, commission_rate: Number(e.target.value) })}
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
                  onClick={handleAddService}
                  disabled={savingService}
                >
                  {savingService ? (
                    <>
                      <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                      Saving...
                    </>
                  ) : (
                    "Add Service"
                  )}
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}

      {/* Edit Service Modal */}
      {showEditModal && selectedService && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <Card className="w-full max-w-md mx-4">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-xl font-bold">Edit Service</h3>
                <button
                  onClick={() => setShowEditModal(false)}
                  className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>

              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium mb-2">Service Name *</label>
                  <Input
                    placeholder="Enter service name"
                    value={editService.name}
                    onChange={(e) => setEditService({ ...editService, name: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Category</label>
                  <select
                    value={editService.category}
                    onChange={(e) => setEditService({ ...editService, category: e.target.value })}
                    className="w-full h-12 px-4 bg-[var(--card)] border border-[var(--border)] rounded-xl focus:outline-none focus:ring-2 focus:ring-[var(--primary)]"
                  >
                    {categories.filter(c => c !== "All").map(cat => (
                      <option key={cat} value={cat}>{cat}</option>
                    ))}
                  </select>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium mb-2">Price (RM) *</label>
                    <Input
                      type="number"
                      value={editService.price || ""}
                      onChange={(e) => setEditService({ ...editService, price: Number(e.target.value) })}
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">Member Price</label>
                    <Input
                      type="number"
                      value={editService.member_price || ""}
                      onChange={(e) => setEditService({ ...editService, member_price: Number(e.target.value) })}
                    />
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium mb-2">Duration (mins)</label>
                    <Input
                      type="number"
                      value={editService.duration_minutes}
                      onChange={(e) => setEditService({ ...editService, duration_minutes: Number(e.target.value) })}
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">Commission %</label>
                    <Input
                      type="number"
                      value={editService.commission_rate}
                      onChange={(e) => setEditService({ ...editService, commission_rate: Number(e.target.value) })}
                    />
                  </div>
                </div>
              </div>

              <div className="flex gap-3 mt-6">
                <Button
                  variant="outline"
                  className="flex-1"
                  onClick={() => setShowEditModal(false)}
                >
                  Cancel
                </Button>
                <Button
                  className="flex-1"
                  onClick={handleEditService}
                  disabled={savingService}
                >
                  {savingService ? (
                    <>
                      <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                      Saving...
                    </>
                  ) : (
                    "Save Changes"
                  )}
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  );
}
