"use client";

import { useState, useEffect } from "react";
import { Header } from "@/components/layout/header";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import type { Customer } from "@/types";
import { format } from "date-fns";

// Sub-components
import { CustomerMasterList } from "./components/CustomerMasterList";
import { CustomerDetailView } from "./components/CustomerDetailView";
import { CustomerModals, CustomerFormData } from "./components/CustomerModals";

type CustomerTier = 'Normal' | 'Member' | 'VIP';

const tierColors: Record<string, "default" | "success" | "warning"> = {
  Normal: "default",
  Member: "success",
  VIP: "warning",
};

export default function CustomersPage() {
  const { user } = useAuthStore();
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedCustomer, setSelectedCustomer] = useState<Customer | null>(null);
  const [activityLog, setActivityLog] = useState<any[]>([]);
  const [loadingLog, setLoadingLog] = useState(false);
  const [showAllLogs, setShowAllLogs] = useState(false);

  const [adjustmentAmount, setAdjustmentAmount] = useState(100);
  const [adjustmentReason, setAdjustmentReason] = useState("Referral Bonus");
  const [searchQuery, setSearchQuery] = useState("");

  const [showNewCustomerModal, setShowNewCustomerModal] = useState(false);
  const [newCustomer, setNewCustomer] = useState({
    name: "", phone: "", email: "", tier: "Normal" as CustomerTier, birthday: "", notes: ""
  });
  const [savingCustomer, setSavingCustomer] = useState(false);

  const [showEditCustomerModal, setShowEditCustomerModal] = useState(false);
  const [editCustomer, setEditCustomer] = useState<CustomerFormData>({
    id: "", name: "", phone: "", email: "", tier: "Normal" as CustomerTier, birthday: "", notes: ""
  });
  const [savingEdit, setSavingEdit] = useState(false);

  const isAdmin = user?.role === "admin";

  const isBirthdayToday = (birthday: string | null) => {
    if (!birthday) return false;
    const today = new Date();
    const bday = new Date(birthday);
    return bday.getDate() === today.getDate() && bday.getMonth() === today.getMonth();
  };

  useEffect(() => {
    const fetchCustomers = async () => {
      setLoading(true);
      const supabase = createClient();
      const allData: Customer[] = [];
      let offset = 0;
      // eslint-disable-next-line no-constant-condition
      while (true) {
        const { data, error } = await supabase
          .from('customers')
          .select('*')
          .order('created_at', { ascending: false })
          .range(offset, offset + 999);

        if (error) {
          console.error('Error fetching customers:', error);
          break;
        }
        if (!data || data.length === 0) break;
        allData.push(...(data as Customer[]));
        if (data.length < 1000) break;
        offset += 1000;
      }

      setCustomers(allData);
      if (allData.length > 0 && !selectedCustomer) {
        setSelectedCustomer(allData[0]);
      }
      setLoading(false);
    };
    fetchCustomers();
  }, []);

  useEffect(() => {
    if (!selectedCustomer) return;
    setShowAllLogs(false);
    const fetchLog = async () => {
      setLoadingLog(true);
      const supabase = createClient();
      const { data: pointsData, error } = await supabase
        .from('points_transactions')
        .select('*')
        .eq('customer_id', selectedCustomer.id)
        .order('created_at', { ascending: false })
        .limit(50);

      if (error) {
        console.error('Error fetching log:', error.message);
        setActivityLog([]);
      } else {
        const enhancedData = await Promise.all(
          (pointsData || []).map(async (item) => {
            if (item.reference_id && (item.type === 'earned' || item.type === 'redeemed')) {
              const { data: saleItems } = await supabase
                .from('sale_items')
                .select(`item_name, total, staff:staff(name)`)
                .eq('sale_id', item.reference_id);

              if (saleItems) {
                return {
                  ...item,
                  services: saleItems.map((si: any) => ({
                    name: si.item_name, amount: si.total, stylist: si.staff?.name || 'Unknown'
                  }))
                };
              }
            }
            return item;
          })
        );
        setActivityLog(enhancedData);
      }
      setLoadingLog(false);
    };
    fetchLog();
  }, [selectedCustomer?.id]);

  const handleUpdateBalance = async () => {
    if (!selectedCustomer || adjustmentAmount === 0) return;
    const supabase = createClient();
    const newBalance = selectedCustomer.points_balance + adjustmentAmount;

    try {
      const { error: txError } = await supabase
        .from('points_transactions')
        .insert({
          customer_id: selectedCustomer.id,
          type: 'adjusted',
          points: adjustmentAmount,
          balance_after: newBalance,
          reason: adjustmentReason,
          performed_by: user?.id || null,
          created_at: new Date().toISOString()
        });
      if (txError) throw txError;

      const { error: updateError } = await supabase
        .from('customers')
        .update({ points_balance: newBalance, updated_at: new Date().toISOString() })
        .eq('id', selectedCustomer.id);
      if (updateError) throw updateError;

      const updatedCustomer = { ...selectedCustomer, points_balance: newBalance };
      setCustomers(prev => prev.map(c => c.id === selectedCustomer.id ? updatedCustomer : c));
      setSelectedCustomer(updatedCustomer);
      setAdjustmentAmount(100);
      setAdjustmentReason("Referral Bonus");
    } catch (error) {
      console.error("Error updating balance:", error);
      toast.error("Gagal mengemaskini baki mata.");
    }
  };

  const handleAddCustomer = async () => {
    if (!newCustomer.name || !newCustomer.phone) {
      toast.error("Sila isi nama dan nombor telefon.");
      return;
    }
    setSavingCustomer(true);
    const supabase = createClient();
    try {
      const { data, error } = await supabase
        .from('customers')
        .insert({
          name: newCustomer.name, phone: newCustomer.phone, email: newCustomer.email || null,
          tier: newCustomer.tier, birthday: newCustomer.birthday || null, notes: newCustomer.notes || null,
          points_balance: 0, total_spent: 0, created_at: new Date().toISOString()
        })
        .select().single();
      if (error) throw error;
      setCustomers(prev => [data as Customer, ...prev]);
      setSelectedCustomer(data as Customer);
      setNewCustomer({ name: "", phone: "", email: "", tier: "Normal", birthday: "", notes: "" });
      setShowNewCustomerModal(false);
    } catch (error) {
      console.error("Error adding customer:", error);
      toast.error("Gagal menambah pelanggan.");
    } finally {
      setSavingCustomer(false);
    }
  };

  const handleEditCustomer = async () => {
    if (!editCustomer.name || !editCustomer.phone) {
      toast.error("Sila isi nama dan nombor telefon.");
      return;
    }
    setSavingEdit(true);
    const supabase = createClient();
    try {
      const { data, error } = await supabase
        .from('customers')
        .update({
          name: editCustomer.name, phone: editCustomer.phone, email: editCustomer.email || null,
          tier: editCustomer.tier, birthday: editCustomer.birthday || null, notes: editCustomer.notes || null,
          updated_at: new Date().toISOString()
        })
        .eq('id', editCustomer.id).select().single();
      if (error) throw error;
      setCustomers(prev => prev.map(c => c.id === editCustomer.id ? data as Customer : c));
      setSelectedCustomer(data as Customer);
      setShowEditCustomerModal(false);
    } catch (error) {
      console.error("Error updating customer:", error);
      toast.error("Gagal mengemaskini pelanggan.");
    } finally {
      setSavingEdit(false);
    }
  };

  const handleExportReport = () => {
    const headers = ["Name", "Phone", "Email", "Tier", "Points Balance", "Total Visits", "Total Spent"];
    const csvContent = [
      headers.join(","),
      ...customers.map(c => [`"${c.name}"`, `"${c.phone || ''}"`, `"${c.email || ''}"`, c.tier, c.points_balance, c.visit_count || 0, c.total_spent || 0].join(","))
    ].join("\n");
    const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
    const link = document.createElement("a");
    const url = URL.createObjectURL(blob);
    link.setAttribute("href", url);
    link.setAttribute("download", `customers-report-${format(new Date(), 'yyyy-MM-dd')}.csv`);
    link.click();
  };

  return (
    <div className="h-screen flex flex-col bg-[#f8fcf9]">
      <Header title="Pengurusan Pelanggan" subtitle="Profil & Kesetiaan Pelanggan" user={user!} />

      <div className="flex-1 overflow-y-auto lg:overflow-hidden p-4 md:p-8">
        <div className="flex flex-col lg:flex-row gap-8 h-full">
          <CustomerMasterList
            customers={customers}
            loading={loading}
            selectedCustomerId={selectedCustomer?.id || null}
            setSelectedCustomer={setSelectedCustomer}
            searchQuery={searchQuery}
            setSearchQuery={setSearchQuery}
            setShowNewCustomerModal={setShowNewCustomerModal}
            handleExportReport={handleExportReport}
            isBirthdayToday={isBirthdayToday}
            tierColors={tierColors}
          />

          <CustomerDetailView
            customer={selectedCustomer}
            loadingLog={loadingLog}
            activityLog={activityLog}
            showAllLogs={showAllLogs}
            setShowAllLogs={setShowAllLogs}
            isAdmin={isAdmin}
            adjustmentAmount={adjustmentAmount}
            setAdjustmentAmount={setAdjustmentAmount}
            adjustmentReason={adjustmentReason}
            setAdjustmentReason={setAdjustmentReason}
            handleUpdateBalance={handleUpdateBalance}
            openEditModal={(c) => {
              setEditCustomer({
                id: c.id, name: c.name, phone: c.phone || "", email: c.email || "",
                tier: (c.tier as CustomerTier) || "Normal", birthday: (c as any).birthday || "", notes: (c as any).notes || ""
              });
              setShowEditCustomerModal(true);
            }}
            isBirthdayToday={isBirthdayToday}
            tierColors={tierColors}
          />
        </div>
      </div>

      <CustomerModals
        showNewModal={showNewCustomerModal}
        setShowNewModal={setShowNewCustomerModal}
        newCustomer={newCustomer}
        setNewCustomer={setNewCustomer}
        savingNew={savingCustomer}
        handleAddCustomer={handleAddCustomer}
        showEditModal={showEditCustomerModal}
        setShowEditModal={setShowEditCustomerModal}
        editCustomer={editCustomer}
        setEditCustomer={setEditCustomer}
        savingEdit={savingEdit}
        handleEditCustomer={handleEditCustomer}
      />
    </div>
  );
}
