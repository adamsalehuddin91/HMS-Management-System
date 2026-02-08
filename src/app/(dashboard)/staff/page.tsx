"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import {
  Search,
  Plus,
  Users,
  DollarSign,
  Star,
  Loader2,
  X,
  TrendingUp,
  TrendingDown,
  Minus
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent, Input, Avatar, Badge, StatCard } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { formatCurrency } from "@/lib/utils";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import type { Staff } from "@/types";

interface StaffWithMetrics extends Staff {
  totalSales: number;
  commission: number;
  servicesCount: number;
  rating: number;
}

export default function StaffPage() {
  const { user } = useAuthStore();
  const [staffMembers, setStaffMembers] = useState<StaffWithMetrics[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedStaff, setSelectedStaff] = useState<StaffWithMetrics | null>(null);
  const [searchQuery, setSearchQuery] = useState("");

  // Modal States
  const [showAddModal, setShowAddModal] = useState(false);
  const [showEditModal, setShowEditModal] = useState(false);
  const [showCommissionModal, setShowCommissionModal] = useState(false);
  const [savingStaff, setSavingStaff] = useState(false);
  const [savingCommission, setSavingCommission] = useState(false);
  const [newStaff, setNewStaff] = useState({
    name: "",
    phone: "",
    email: "",
    role: "Stylist"
  });
  const [editStaff, setEditStaff] = useState({
    name: "",
    phone: "",
    email: "",
    role: ""
  });
  const [commissionAdjustment, setCommissionAdjustment] = useState({
    type: "bonus" as "bonus" | "deduction",
    amount: 0,
    reason: "Performance Bonus"
  });
  const [commissionHistory, setCommissionHistory] = useState<any[]>([]);

  const isAdmin = user?.role === "admin";

  useEffect(() => {
    const fetchStaff = async () => {
      setLoading(true);
      const supabase = createClient();

      // Get current month for filtering
      const currentMonth = new Date().toISOString().slice(0, 7); // YYYY-MM

      // Fetch staff
      const { data: staffData, error: staffError } = await supabase
        .from('staff')
        .select('*')
        .order('name');

      if (staffError) {
        console.error("Error fetching staff:", staffError);
        setLoading(false);
        return;
      }

      if (!staffData) {
        setLoading(false);
        return;
      }

      // Fetch commission aggregates for current month
      const { data: commissionData } = await supabase
        .from('commissions')
        .select('staff_id, amount, sale_amount')
        .eq('month', currentMonth);

      // Fetch service counts from sale_items for current month
      const startOfMonth = new Date(new Date().getFullYear(), new Date().getMonth(), 1).toISOString();
      const { data: saleItemsData } = await supabase
        .from('sale_items')
        .select('stylist_id, quantity')
        .eq('item_type', 'service')
        .gte('created_at', startOfMonth);

      // Aggregate data by staff_id
      const commissionsByStaff: Record<string, { totalCommission: number; totalSales: number }> = {};
      const servicesByStaff: Record<string, number> = {};

      commissionData?.forEach(c => {
        if (!commissionsByStaff[c.staff_id]) {
          commissionsByStaff[c.staff_id] = { totalCommission: 0, totalSales: 0 };
        }
        commissionsByStaff[c.staff_id].totalCommission += c.amount || 0;
        commissionsByStaff[c.staff_id].totalSales += c.sale_amount || 0;
      });

      saleItemsData?.forEach(s => {
        if (s.stylist_id) {
          servicesByStaff[s.stylist_id] = (servicesByStaff[s.stylist_id] || 0) + (s.quantity || 1);
        }
      });

      // Map staff with real metrics
      const mappedStaff: StaffWithMetrics[] = staffData.map((s: any) => ({
        ...s,
        totalSales: commissionsByStaff[s.id]?.totalSales || 0,
        commission: commissionsByStaff[s.id]?.totalCommission || 0,
        servicesCount: servicesByStaff[s.id] || 0,
        rating: 0, // Would need a reviews table to calculate
      }));

      setStaffMembers(mappedStaff);
      if (mappedStaff.length > 0) {
        setSelectedStaff(mappedStaff[0]);
      }
      setLoading(false);
    };

    fetchStaff();
  }, []);

  const totalStaff = staffMembers.length;
  const activeStaff = staffMembers.filter((s) => s.is_active).length;
  const totalCommission = staffMembers.reduce((sum, s) => sum + s.commission, 0);

  const filteredStaff = staffMembers.filter(s =>
    s.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    s.role?.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const handleAddStaff = async () => {
    if (!newStaff.name || !newStaff.phone) {
      toast.error("Please fill in name and phone number.");
      return;
    }

    setSavingStaff(true);
    const supabase = createClient();

    try {
      const { data, error } = await supabase
        .from('staff')
        .insert({
          name: newStaff.name,
          phone: newStaff.phone,
          email: newStaff.email || null,
          role: newStaff.role as Staff['role'],
          is_active: true,
          created_at: new Date().toISOString()
        })
        .select()
        .single();

      if (error) throw error;

      const mappedStaff: StaffWithMetrics = {
        ...data,
        totalSales: 0,
        commission: 0,
        servicesCount: 0,
        rating: 0
      };

      setStaffMembers(prev => [mappedStaff, ...prev]);
      setSelectedStaff(mappedStaff);
      setNewStaff({ name: "", phone: "", email: "", role: "Stylist" });
      setShowAddModal(false);
      toast.success("Staff added successfully!");

    } catch (error) {
      console.error("Error adding staff:", error);
      toast.error("Failed to add staff. Please try again.");
    } finally {
      setSavingStaff(false);
    }
  };

  const handleEditStaff = async () => {
    if (!selectedStaff || !editStaff.name || !editStaff.phone) {
      toast.error("Please fill in required fields.");
      return;
    }

    setSavingStaff(true);
    const supabase = createClient();

    try {
      const { error } = await supabase
        .from('staff')
        .update({
          name: editStaff.name,
          phone: editStaff.phone,
          email: editStaff.email || null,
          role: editStaff.role as Staff['role'],
          updated_at: new Date().toISOString()
        })
        .eq('id', selectedStaff.id);

      if (error) throw error;

      const updatedStaff = { ...selectedStaff, ...editStaff, role: editStaff.role as Staff['role'] };
      setStaffMembers(prev => prev.map(s => s.id === selectedStaff.id ? updatedStaff : s));
      setSelectedStaff(updatedStaff);
      setShowEditModal(false);
      toast.success("Staff updated successfully!");

    } catch (error) {
      console.error("Error updating staff:", error);
      toast.error("Failed to update staff. Please try again.");
    } finally {
      setSavingStaff(false);
    }
  };

  const openEditModal = () => {
    if (selectedStaff) {
      setEditStaff({
        name: selectedStaff.name,
        phone: selectedStaff.phone,
        email: selectedStaff.email || "",
        role: selectedStaff.role || ""
      });
      setShowEditModal(true);
    }
  };

  const openCommissionModal = async () => {
    if (!selectedStaff) return;
    setCommissionAdjustment({ type: "bonus", amount: 0, reason: "Performance Bonus" });
    setShowCommissionModal(true);

    // Fetch commission history for this staff
    const supabase = createClient();
    const { data } = await supabase
      .from('commissions')
      .select('*')
      .eq('staff_id', selectedStaff.id)
      .order('created_at', { ascending: false })
      .limit(10);

    if (data) setCommissionHistory(data);
  };

  const handleCommissionAdjustment = async () => {
    if (!selectedStaff || commissionAdjustment.amount <= 0) {
      toast.error("Please enter a valid amount.");
      return;
    }

    setSavingCommission(true);
    const supabase = createClient();

    const adjustedAmount = commissionAdjustment.type === "deduction"
      ? -commissionAdjustment.amount
      : commissionAdjustment.amount;

    try {
      // Insert commission record
      const { error } = await supabase
        .from('commissions')
        .insert({
          staff_id: selectedStaff.id,
          sale_id: null, // Manual adjustment
          sale_item_id: null,
          service_name: `Manual ${commissionAdjustment.type === "bonus" ? "Bonus" : "Deduction"}`,
          sale_amount: 0,
          commission_rate: 0,
          commission_amount: adjustedAmount,
          month: new Date().toISOString().slice(0, 7), // YYYY-MM format
          is_paid: false,
          created_at: new Date().toISOString()
        });

      if (error) throw error;

      // Update local state
      const newCommission = selectedStaff.commission + adjustedAmount;
      const updatedStaff = { ...selectedStaff, commission: newCommission };
      setStaffMembers(prev => prev.map(s => s.id === selectedStaff.id ? updatedStaff : s));
      setSelectedStaff(updatedStaff);

      setShowCommissionModal(false);
      toast.success(`Commission ${commissionAdjustment.type} of RM${commissionAdjustment.amount} applied successfully!`);

    } catch (error) {
      console.error("Error adjusting commission:", error);
      toast.error("Failed to adjust commission. Please try again.");
    } finally {
      setSavingCommission(false);
    }
  };

  return (
    <div className="min-h-screen">
      <Header title="Staff Performance Dashboard" subtitle="Monitor and manage your team" user={user!} />

      <div className="p-6 space-y-6">
        {/* Stats */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          <StatCard
            title="Total Staff"
            value={totalStaff}
            icon={Users}
          />
          <StatCard
            title="Active Staff"
            value={activeStaff}
            change={0}
            icon={Users}
          />
          <StatCard
            title="Total Commission (MTD)"
            value={formatCurrency(totalCommission)}
            change={0} // No historical data yet
            changeLabel="vs last month"
            icon={DollarSign}
          />
          <StatCard
            title="Avg. Rating"
            value="-"
            icon={Star}
          />
        </div>

        <div className="flex flex-col lg:flex-row gap-6">
          {/* Staff List */}
          <Card className="flex-1">
            <CardContent className="p-6">
              {/* Header */}
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-lg font-bold">Staff Members</h2>
                {isAdmin && (
                  <Button onClick={() => setShowAddModal(true)}>
                    <Plus className="h-4 w-4 mr-2" />
                    Add Staff
                  </Button>
                )}
              </div>

              {/* Search */}
              <div className="mb-6">
                <Input
                  placeholder="Search staff..."
                  icon={<Search className="h-4 w-4" />}
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                />
              </div>

              {/* Staff Table */}
              <div className="space-y-3">
                {loading ? (
                  <p className="text-center text-[var(--muted)] py-4">
                    <Loader2 className="h-6 w-6 animate-spin mx-auto mb-2" /> Preparing staff list...
                  </p>
                ) : filteredStaff.length === 0 ? (
                  <p className="text-center text-[var(--muted)] py-4">No staff found.</p>
                ) : (
                  filteredStaff.map((staff) => (
                    <div
                      key={staff.id}
                      onClick={() => setSelectedStaff(staff)}
                      className={`flex items-center gap-4 p-4 rounded-xl cursor-pointer transition-colors ${selectedStaff?.id === staff.id
                        ? "bg-[var(--primary-light)]"
                        : "hover:bg-[var(--secondary)]"
                        }`}
                    >
                      <Avatar name={staff.name} src={staff.avatar_url} size="lg" />
                      <div className="flex-1">
                        <div className="flex items-center gap-2">
                          <p className="font-medium">{staff.name}</p>
                          <Badge variant={staff.is_active ? "success" : "default"}>
                            {staff.is_active ? "Active" : "Inactive"}
                          </Badge>
                        </div>
                        <p className="text-sm text-[var(--muted)]">{staff.role}</p>
                      </div>
                      <div className="text-right">
                        <p className="font-bold text-[var(--primary)]">{formatCurrency(staff.commission)}</p>
                        <p className="text-xs text-[var(--muted)]">Commission MTD</p>
                      </div>
                      {staff.rating > 0 && (
                        <div className="flex items-center gap-1 text-yellow-500">
                          <Star className="h-4 w-4 fill-current" />
                          <span className="font-medium">{staff.rating}</span>
                        </div>
                      )}
                    </div>
                  ))
                )}
              </div>
            </CardContent>
          </Card>

          {/* Staff Details */}
          {selectedStaff && (
            <Card className="w-full lg:w-96 shrink-0 order-first lg:order-last">
              <CardContent className="p-6">
                <div className="text-center mb-6">
                  <Avatar name={selectedStaff.name} src={selectedStaff.avatar_url} size="xl" className="mx-auto mb-4" />
                  <h3 className="text-xl font-bold">{selectedStaff.name}</h3>
                  <p className="text-[var(--muted)]">{selectedStaff.role}</p>
                  <Badge variant={selectedStaff.is_active ? "success" : "default"} className="mt-2">
                    {selectedStaff.is_active ? "Active" : "Inactive"}
                  </Badge>
                </div>

                <div className="space-y-4 mb-6">
                  <div className="flex items-center justify-between py-2 border-b border-[var(--border)]">
                    <span className="text-sm text-[var(--muted)]">Phone</span>
                    <span className="font-medium">{selectedStaff.phone}</span>
                  </div>
                  <div className="flex items-center justify-between py-2 border-b border-[var(--border)]">
                    <span className="text-sm text-[var(--muted)]">Email</span>
                    <span className="font-medium">{selectedStaff.email || "-"}</span>
                  </div>
                </div>

                <h4 className="font-bold mb-4">Performance This Month</h4>
                <div className="grid grid-cols-2 gap-4">
                  <div className="p-4 bg-[var(--secondary)] rounded-xl text-center">
                    <p className="text-2xl font-bold text-[var(--primary)]">{selectedStaff.servicesCount}</p>
                    <p className="text-xs text-[var(--muted)]">Services</p>
                  </div>
                  <div className="p-4 bg-[var(--secondary)] rounded-xl text-center">
                    <p className="text-2xl font-bold">{formatCurrency(selectedStaff.totalSales)}</p>
                    <p className="text-xs text-[var(--muted)]">Total Sales</p>
                  </div>
                  <div className="p-4 bg-[var(--secondary)] rounded-xl text-center">
                    <p className="text-2xl font-bold text-[var(--success)]">{formatCurrency(selectedStaff.commission)}</p>
                    <p className="text-xs text-[var(--muted)]">Commission</p>
                  </div>
                  <div className="p-4 bg-[var(--secondary)] rounded-xl text-center">
                    <div className="flex items-center justify-center gap-1 text-yellow-500">
                      <Star className="h-5 w-5 fill-current" />
                      <span className="text-2xl font-bold">{selectedStaff.rating || "-"}</span>
                    </div>
                    <p className="text-xs text-[var(--muted)]">Rating</p>
                  </div>
                </div>

                {isAdmin && (
                  <div className="space-y-2 mt-6">
                    <Button className="w-full" onClick={openCommissionModal}>
                      <DollarSign className="h-4 w-4 mr-2" />
                      Adjust Commission
                    </Button>
                    <div className="flex gap-2">
                      <Button variant="outline" className="flex-1" onClick={openEditModal}>Edit Profile</Button>
                      <Link href="/appointments" className="flex-1">
                        <Button variant="outline" className="w-full">View Schedule</Button>
                      </Link>
                    </div>
                  </div>
                )}
              </CardContent>
            </Card>
          )}
        </div>
      </div>

      {/* Add Staff Modal */}
      {showAddModal && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <Card className="w-full max-w-md mx-4">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-xl font-bold">Add New Staff</h3>
                <button
                  onClick={() => setShowAddModal(false)}
                  className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>

              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium mb-2">Full Name *</label>
                  <Input
                    placeholder="Enter staff name"
                    value={newStaff.name}
                    onChange={(e) => setNewStaff({ ...newStaff, name: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Phone Number *</label>
                  <Input
                    placeholder="+60 12-345 6789"
                    value={newStaff.phone}
                    onChange={(e) => setNewStaff({ ...newStaff, phone: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Email (Optional)</label>
                  <Input
                    type="email"
                    placeholder="staff@email.com"
                    value={newStaff.email}
                    onChange={(e) => setNewStaff({ ...newStaff, email: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Role</label>
                  <select
                    value={newStaff.role}
                    onChange={(e) => setNewStaff({ ...newStaff, role: e.target.value })}
                    className="w-full h-12 px-4 bg-[var(--card)] border border-[var(--border)] rounded-xl focus:outline-none focus:ring-2 focus:ring-[var(--primary)]"
                  >
                    <option>Stylist</option>
                    <option>Senior Stylist</option>
                    <option>Therapist</option>
                    <option>Receptionist</option>
                    <option>Manager</option>
                  </select>
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
                  onClick={handleAddStaff}
                  disabled={savingStaff}
                >
                  {savingStaff ? (
                    <>
                      <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                      Saving...
                    </>
                  ) : (
                    "Add Staff"
                  )}
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}

      {/* Edit Staff Modal */}
      {showEditModal && selectedStaff && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <Card className="w-full max-w-md mx-4">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-xl font-bold">Edit Staff Profile</h3>
                <button
                  onClick={() => setShowEditModal(false)}
                  className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>

              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium mb-2">Full Name *</label>
                  <Input
                    placeholder="Enter staff name"
                    value={editStaff.name}
                    onChange={(e) => setEditStaff({ ...editStaff, name: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Phone Number *</label>
                  <Input
                    placeholder="+60 12-345 6789"
                    value={editStaff.phone}
                    onChange={(e) => setEditStaff({ ...editStaff, phone: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Email</label>
                  <Input
                    type="email"
                    placeholder="staff@email.com"
                    value={editStaff.email}
                    onChange={(e) => setEditStaff({ ...editStaff, email: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Role</label>
                  <select
                    value={editStaff.role}
                    onChange={(e) => setEditStaff({ ...editStaff, role: e.target.value })}
                    className="w-full h-12 px-4 bg-[var(--card)] border border-[var(--border)] rounded-xl focus:outline-none focus:ring-2 focus:ring-[var(--primary)]"
                  >
                    <option>Stylist</option>
                    <option>Senior Stylist</option>
                    <option>Therapist</option>
                    <option>Receptionist</option>
                    <option>Manager</option>
                  </select>
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
                  onClick={handleEditStaff}
                  disabled={savingStaff}
                >
                  {savingStaff ? (
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

      {/* Commission Adjustment Modal */}
      {showCommissionModal && selectedStaff && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <Card className="w-full max-w-md mx-4">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <div>
                  <h3 className="text-xl font-bold">Adjust Commission</h3>
                  <p className="text-sm text-[var(--muted)]">{selectedStaff.name}</p>
                </div>
                <button
                  onClick={() => setShowCommissionModal(false)}
                  className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>

              {/* Current Balance */}
              <div className="p-4 bg-[var(--secondary)] rounded-xl mb-6 text-center">
                <p className="text-sm text-[var(--muted)]">Current Commission (MTD)</p>
                <p className="text-3xl font-bold text-[var(--primary)]">{formatCurrency(selectedStaff.commission)}</p>
              </div>

              {/* Adjustment Type */}
              <div className="mb-4">
                <label className="block text-sm font-medium mb-2">Adjustment Type</label>
                <div className="flex gap-2">
                  <button
                    onClick={() => setCommissionAdjustment({ ...commissionAdjustment, type: "bonus" })}
                    className={`flex-1 flex items-center justify-center gap-2 p-3 rounded-xl border-2 transition-colors ${commissionAdjustment.type === "bonus"
                      ? "border-[var(--success)] bg-green-50 text-[var(--success)]"
                      : "border-[var(--border)] hover:bg-[var(--secondary)]"
                      }`}
                  >
                    <TrendingUp className="h-5 w-5" />
                    <span className="font-medium">Bonus</span>
                  </button>
                  <button
                    onClick={() => setCommissionAdjustment({ ...commissionAdjustment, type: "deduction" })}
                    className={`flex-1 flex items-center justify-center gap-2 p-3 rounded-xl border-2 transition-colors ${commissionAdjustment.type === "deduction"
                      ? "border-[var(--error)] bg-red-50 text-[var(--error)]"
                      : "border-[var(--border)] hover:bg-[var(--secondary)]"
                      }`}
                  >
                    <TrendingDown className="h-5 w-5" />
                    <span className="font-medium">Deduction</span>
                  </button>
                </div>
              </div>

              {/* Amount */}
              <div className="mb-4">
                <label className="block text-sm font-medium mb-2">Amount (RM)</label>
                <div className="flex items-center gap-3">
                  <button
                    onClick={() => setCommissionAdjustment({ ...commissionAdjustment, amount: Math.max(0, commissionAdjustment.amount - 10) })}
                    className="h-12 w-12 rounded-full border border-[var(--border)] flex items-center justify-center hover:bg-[var(--secondary)]"
                  >
                    <Minus className="h-4 w-4" />
                  </button>
                  <input
                    type="number"
                    value={commissionAdjustment.amount || ""}
                    onChange={(e) => setCommissionAdjustment({ ...commissionAdjustment, amount: Number(e.target.value) })}
                    className="flex-1 h-14 text-center text-2xl font-bold bg-transparent border-b-2 border-[var(--border)] focus:border-[var(--primary)] outline-none"
                    placeholder="0"
                  />
                  <button
                    onClick={() => setCommissionAdjustment({ ...commissionAdjustment, amount: commissionAdjustment.amount + 10 })}
                    className="h-12 w-12 rounded-full border border-[var(--border)] flex items-center justify-center hover:bg-[var(--secondary)]"
                  >
                    <Plus className="h-4 w-4" />
                  </button>
                </div>
              </div>

              {/* Reason */}
              <div className="mb-6">
                <label className="block text-sm font-medium mb-2">Reason</label>
                <select
                  value={commissionAdjustment.reason}
                  onChange={(e) => setCommissionAdjustment({ ...commissionAdjustment, reason: e.target.value })}
                  className="w-full h-12 px-4 bg-[var(--card)] border border-[var(--border)] rounded-xl focus:outline-none focus:ring-2 focus:ring-[var(--primary)]"
                >
                  <option>Performance Bonus</option>
                  <option>Customer Compliment</option>
                  <option>Overtime Work</option>
                  <option>Training Completion</option>
                  <option>Sales Target Achieved</option>
                  <option>Late Attendance</option>
                  <option>Customer Complaint</option>
                  <option>Correction/Adjustment</option>
                  <option>Other</option>
                </select>
              </div>

              {/* Preview */}
              <div className="p-4 bg-[var(--primary-light)] rounded-xl mb-6">
                <div className="flex items-center justify-between">
                  <span className="text-sm">New Balance After Adjustment:</span>
                  <span className="text-xl font-bold text-[var(--primary-dark)]">
                    {formatCurrency(
                      selectedStaff.commission + (commissionAdjustment.type === "deduction" ? -commissionAdjustment.amount : commissionAdjustment.amount)
                    )}
                  </span>
                </div>
              </div>

              <div className="flex gap-3">
                <Button
                  variant="outline"
                  className="flex-1"
                  onClick={() => setShowCommissionModal(false)}
                >
                  Cancel
                </Button>
                <Button
                  className="flex-1"
                  onClick={handleCommissionAdjustment}
                  disabled={savingCommission || commissionAdjustment.amount <= 0}
                >
                  {savingCommission ? (
                    <>
                      <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                      Applying...
                    </>
                  ) : (
                    `Apply ${commissionAdjustment.type === "bonus" ? "Bonus" : "Deduction"}`
                  )}
                </Button>
              </div>

              {/* Recent History */}
              {commissionHistory.length > 0 && (
                <div className="mt-6 pt-6 border-t border-[var(--border)]">
                  <h4 className="font-medium mb-3">Recent Commission History</h4>
                  <div className="space-y-2 max-h-32 overflow-y-auto">
                    {commissionHistory.slice(0, 5).map((item, idx) => (
                      <div key={idx} className="flex items-center justify-between text-sm p-2 bg-[var(--secondary)] rounded-lg">
                        <span className="text-[var(--muted)]">{item.service_name}</span>
                        <span className={item.commission_amount >= 0 ? "text-[var(--success)]" : "text-[var(--error)]"}>
                          {item.commission_amount >= 0 ? "+" : ""}{formatCurrency(item.commission_amount)}
                        </span>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  );
}
