"use client";

import { useState, useEffect, useRef } from "react";
import { Header } from "@/components/layout/header";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import { format, startOfMonth, endOfMonth, isSameMonth } from "date-fns";
import type { Staff } from "@/types";
import { logError } from "@/lib/utils/error-logger";

// Sub-components
import { StaffStatsHeader } from "./components/StaffStatsHeader";
import { StaffMasterList } from "./components/StaffMasterList";
import { StaffDetailView } from "./components/StaffDetailView";
import { StaffModals } from "./components/StaffModals";

type FilterStatus = "semua" | "aktif" | "arkib";

interface StaffWithMetrics extends Staff {
  totalSales: number;
  commission: number;
  servicesCount: number;
  rating: number;
  is_active: boolean;
}

export default function StaffPage() {
  const { user } = useAuthStore();

  // ── Stable role ref (same pattern as reports page) ──────────────────────────
  const isAdminRef = useRef<boolean | null>(null);
  const [authResolved, setAuthResolved] = useState(false);
  useEffect(() => {
    if (user && !authResolved) {
      isAdminRef.current = user.role === "admin";
      setAuthResolved(true);
    }
  }, [user, authResolved]);
  const isAdmin = isAdminRef.current ?? false;

  // ── State ─────────────────────────────────────────────────────────────────
  const [staffMembers, setStaffMembers] = useState<StaffWithMetrics[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedStaff, setSelectedStaff] = useState<StaffWithMetrics | null>(null);
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedMonth, setSelectedMonth] = useState(new Date());
  const [filterStatus, setFilterStatus] = useState<FilterStatus>("aktif");
  const [togglingActive, setTogglingActive] = useState(false);

  const [showAddModal, setShowAddModal] = useState(false);
  const [showEditModal, setShowEditModal] = useState(false);
  const [showCommissionModal, setShowCommissionModal] = useState(false);
  const [savingStaff, setSavingStaff] = useState(false);
  const [savingCommission, setSavingCommission] = useState(false);

  const [newStaff, setNewStaff] = useState({ name: "", phone: "", email: "", role: "Stylist" });
  const [editStaff, setEditStaff] = useState({ name: "", phone: "", email: "", role: "" });
  const [commissionAdjustment, setCommissionAdjustment] = useState({ type: "bonus" as "bonus" | "deduction", amount: 0, reason: "Performance Bonus" });
  const [commissionHistory, setCommissionHistory] = useState<any[]>([]);

  const isCurrentMonth = isSameMonth(selectedMonth, new Date());

  // ── Fetch staff + month metrics ───────────────────────────────────────────
  useEffect(() => {
    const fetchStaff = async () => {
      setLoading(true);
      const supabase = createClient();
      const monthStr = format(selectedMonth, "yyyy-MM");
      const monthStart = startOfMonth(selectedMonth).toISOString();
      const monthEnd = endOfMonth(selectedMonth).toISOString();

      const { data: staffData, error: staffError } = await supabase
        .from("staff")
        .select("*")
        .order("name");

      if (staffError) {
        logError("Staff Page", staffError);
        setLoading(false);
        return;
      }

      const { data: commissionData } = await supabase
        .from("commissions")
        .select("staff_id, amount, sale_amount")
        .eq("month", monthStr)
        .neq("status", "voided");

      const { data: saleItemsData } = await supabase
        .from("sale_items")
        .select("stylist_id, quantity, sales!inner(status)")
        .eq("item_type", "service")
        .neq("sales.status", "voided")
        .gte("created_at", monthStart)
        .lte("created_at", monthEnd);

      const commissionsByStaff: Record<string, { totalCommission: number; totalSales: number }> = {};
      const servicesByStaff: Record<string, number> = {};

      commissionData?.forEach((c) => {
        if (!commissionsByStaff[c.staff_id]) commissionsByStaff[c.staff_id] = { totalCommission: 0, totalSales: 0 };
        commissionsByStaff[c.staff_id].totalCommission += c.amount || 0;
        commissionsByStaff[c.staff_id].totalSales += c.sale_amount || 0;
      });

      saleItemsData?.forEach((s) => {
        if (s.stylist_id) servicesByStaff[s.stylist_id] = (servicesByStaff[s.stylist_id] || 0) + (s.quantity || 1);
      });

      const mappedStaff: StaffWithMetrics[] = (staffData || []).map((s: any) => ({
        ...s,
        totalSales: commissionsByStaff[s.id]?.totalSales || 0,
        commission: commissionsByStaff[s.id]?.totalCommission || 0,
        servicesCount: servicesByStaff[s.id] || 0,
        rating: 0,
      }));

      setStaffMembers(mappedStaff);
      // Keep selected staff updated with fresh metrics
      if (selectedStaff) {
        const refreshed = mappedStaff.find((m) => m.id === selectedStaff.id);
        if (refreshed) setSelectedStaff(refreshed);
      } else if (mappedStaff.length > 0) {
        setSelectedStaff(mappedStaff[0]);
      }
      setLoading(false);
    };

    fetchStaff();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedMonth]);

  // ── Derived stats ─────────────────────────────────────────────────────────
  const totalStaff = staffMembers.length;
  const activeStaff = staffMembers.filter((s) => s.is_active).length;
  const totalCommission = staffMembers.reduce((sum, s) => sum + s.commission, 0);
  const totalServices = staffMembers.reduce((sum, s) => sum + s.servicesCount, 0);

  // ── Handlers ─────────────────────────────────────────────────────────────
  const handleAddStaff = async () => {
    if (!newStaff.name || !newStaff.phone) {
      toast.error("Sila isi nama dan nombor telefon.");
      return;
    }
    setSavingStaff(true);
    const supabase = createClient();
    try {
      const { data, error } = await supabase
        .from("staff")
        .insert({ name: newStaff.name, phone: newStaff.phone, email: newStaff.email || null, role: newStaff.role as Staff["role"], is_active: true, created_at: new Date().toISOString() })
        .select()
        .single();
      if (error) throw error;
      const mapped: StaffWithMetrics = { ...data, totalSales: 0, commission: 0, servicesCount: 0, rating: 0 };
      setStaffMembers((prev) => [mapped, ...prev]);
      setSelectedStaff(mapped);
      setNewStaff({ name: "", phone: "", email: "", role: "Stylist" });
      setShowAddModal(false);
      toast.success("Kakitangan berjaya ditambah!");
    } catch (error) {
      logError("Staff Page - Add", error);
      toast.error("Gagal menambah kakitangan.");
    } finally {
      setSavingStaff(false);
    }
  };

  const handleEditStaff = async () => {
    if (!selectedStaff || !editStaff.name || !editStaff.phone) {
      toast.error("Sila isi maklumat wajib.");
      return;
    }
    setSavingStaff(true);
    const supabase = createClient();
    try {
      const { error } = await supabase
        .from("staff")
        .update({ name: editStaff.name, phone: editStaff.phone, email: editStaff.email || null, role: editStaff.role as Staff["role"], updated_at: new Date().toISOString() })
        .eq("id", selectedStaff.id);
      if (error) throw error;
      const updated = { ...selectedStaff, ...editStaff, role: editStaff.role as Staff["role"] };
      setStaffMembers((prev) => prev.map((s) => (s.id === selectedStaff.id ? updated : s)));
      setSelectedStaff(updated);
      setShowEditModal(false);
      toast.success("Profil berjaya dikemaskini!");
    } catch (error) {
      logError("Staff Page - Update", error);
      toast.error("Gagal mengemaskini profil.");
    } finally {
      setSavingStaff(false);
    }
  };

  const handleCommissionAdjustment = async () => {
    if (!selectedStaff || commissionAdjustment.amount <= 0) {
      toast.error("Sila masukkan jumlah yang sah.");
      return;
    }
    setSavingCommission(true);
    const supabase = createClient();
    const adjustedAmount = commissionAdjustment.type === "deduction" ? -commissionAdjustment.amount : commissionAdjustment.amount;
    try {
      const { error } = await supabase.from("commissions").insert({
        staff_id: selectedStaff.id, sale_id: null, sale_item_id: null,
        service_name: `Pelarasan Manual (${commissionAdjustment.type === "bonus" ? "Bonus" : "Deduction"})`,
        sale_amount: 0, commission_rate: 0, amount: adjustedAmount,
        month: new Date().toISOString().slice(0, 7), is_paid: false, created_at: new Date().toISOString(),
      });
      if (error) throw error;
      const newCommission = selectedStaff.commission + adjustedAmount;
      const updated = { ...selectedStaff, commission: newCommission };
      setStaffMembers((prev) => prev.map((s) => (s.id === selectedStaff.id ? updated : s)));
      setSelectedStaff(updated);
      setShowCommissionModal(false);
      toast.success(`Komisen berjaya dilaraskan: RM${commissionAdjustment.amount}`);
    } catch (error) {
      logError("Staff Page - Commission", error);
      toast.error("Gagal melaraskan komisen.");
    } finally {
      setSavingCommission(false);
    }
  };

  const handleToggleActive = async () => {
    if (!selectedStaff) return;
    setTogglingActive(true);
    const supabase = createClient();
    const newStatus = !selectedStaff.is_active;
    try {
      const { error } = await supabase
        .from("staff")
        .update({ is_active: newStatus, updated_at: new Date().toISOString() })
        .eq("id", selectedStaff.id);
      if (error) throw error;
      const updated = { ...selectedStaff, is_active: newStatus };
      setStaffMembers((prev) => prev.map((s) => (s.id === selectedStaff.id ? updated : s)));
      setSelectedStaff(updated);
      toast.success(newStatus ? "Staff berjaya diaktifkan semula!" : "Staff berjaya diarkibkan.");
    } catch (error) {
      logError("Staff Page - Toggle Active", error);
      toast.error("Gagal mengubah status staff.");
    } finally {
      setTogglingActive(false);
    }
  };

  // ── Render ────────────────────────────────────────────────────────────────
  return (
    <div className="min-h-screen bg-[#fcfdfd]">
      <Header title="Pasukan & Prestasi" subtitle="Pantau dan urus pasukan pakar anda" user={user!} />

      <div className="p-8 space-y-8 max-w-[1600px] mx-auto">
        <StaffStatsHeader
          totalStaff={totalStaff}
          activeStaff={activeStaff}
          totalCommission={totalCommission}
          totalServices={totalServices}
          selectedMonth={selectedMonth}
          setSelectedMonth={setSelectedMonth}
          isCurrentMonth={isCurrentMonth}
          loading={loading}
        />

        <div className="flex flex-col lg:flex-row gap-8 lg:min-h-[600px]">
          <StaffMasterList
            staffMembers={staffMembers}
            loading={loading}
            selectedStaffId={selectedStaff?.id}
            setSelectedStaff={(s: any) => setSelectedStaff(s)}
            searchQuery={searchQuery}
            setSearchQuery={setSearchQuery}
            isAdmin={isAdmin}
            setShowAddModal={setShowAddModal}
            filterStatus={filterStatus}
            setFilterStatus={setFilterStatus}
          />

          <StaffDetailView
            staff={selectedStaff}
            isAdmin={isAdmin}
            openCommissionModal={async () => {
              if (!selectedStaff) return;
              setCommissionAdjustment({ type: "bonus", amount: 0, reason: "Performance Bonus" });
              setShowCommissionModal(true);
              const supabase = createClient();
              const { data } = await supabase
                .from("commissions")
                .select("*")
                .eq("staff_id", selectedStaff.id)
                .neq("status", "voided")
                .order("created_at", { ascending: false })
                .limit(10);
              if (data) setCommissionHistory(data);
            }}
            openEditModal={() => {
              if (selectedStaff) {
                setEditStaff({ name: selectedStaff.name, phone: selectedStaff.phone, email: selectedStaff.email || "", role: selectedStaff.role || "" });
                setShowEditModal(true);
              }
            }}
            onToggleActive={handleToggleActive}
            togglingActive={togglingActive}
          />
        </div>
      </div>

      <StaffModals
        showAddModal={showAddModal} setShowAddModal={setShowAddModal} newStaff={newStaff} setNewStaff={setNewStaff} savingStaff={savingStaff} handleAddStaff={handleAddStaff}
        showEditModal={showEditModal} setShowEditModal={setShowEditModal} editStaff={editStaff} setEditStaff={setEditStaff} handleEditStaff={handleEditStaff}
        showCommissionModal={showCommissionModal} setShowCommissionModal={setShowCommissionModal} commissionAdjustment={commissionAdjustment} setCommissionAdjustment={setCommissionAdjustment} savingCommission={savingCommission} handleCommissionAdjustment={handleCommissionAdjustment} commissionHistory={commissionHistory} selectedStaff={selectedStaff}
      />
    </div>
  );
}
