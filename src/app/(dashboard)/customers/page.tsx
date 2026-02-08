"use client";

import { useState, useEffect } from "react";
import {
  Search,
  Plus,
  Download,
  ChevronLeft,
  ChevronRight,
  Minus,
  Loader2,
  X
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent, Input, Avatar, Badge } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import type { Customer } from "@/types";
import { format } from "date-fns";

// Tier values matching Supabase schema: 'Normal', 'Member', 'VIP'
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

  // New Customer Modal State
  const [showNewCustomerModal, setShowNewCustomerModal] = useState(false);
  const [newCustomer, setNewCustomer] = useState({
    name: "",
    phone: "",
    email: "",
    tier: "Normal" as CustomerTier
  });
  const [savingCustomer, setSavingCustomer] = useState(false);

  const isAdmin = user?.role === "admin";

  // Fetch Customers
  useEffect(() => {
    const fetchCustomers = async () => {
      setLoading(true);
      const supabase = createClient();
      const { data, error } = await supabase
        .from('customers')
        .select('*')
        .order('created_at', { ascending: false });

      if (error) {
        console.error('Error fetching customers:', error);
      } else {
        setCustomers(data as Customer[]);
        if (data.length > 0 && !selectedCustomer) {
          setSelectedCustomer(data[0] as Customer);
        }
      }
      setLoading(false);
    };

    fetchCustomers();
  }, []);

  // Fetch Activity Log for Selected Customer (with service & stylist details)
  useEffect(() => {
    if (!selectedCustomer) return;

    setShowAllLogs(false); // Reset when customer changes

    const fetchLog = async () => {
      setLoadingLog(true);
      const supabase = createClient();

      // First get points transactions
      const { data: pointsData, error } = await supabase
        .from('points_transactions')
        .select('*')
        .eq('customer_id', selectedCustomer.id)
        .order('created_at', { ascending: false })
        .limit(50);

      if (error) {
        console.error('Error fetching log:', error.message, error.details);
        setActivityLog([]);
        setLoadingLog(false);
        return;
      }

      // For transactions with reference_id (from sales), fetch sale details
      const enhancedData = await Promise.all(
        (pointsData || []).map(async (item) => {
          if (item.reference_id && (item.type === 'earned' || item.type === 'redeemed')) {
            // Fetch sale items with stylist info for this sale
            const { data: saleItems } = await supabase
              .from('sale_items')
              .select(`
                item_name,
                total,
                stylist_id,
                staff:staff(id, name)
              `)
              .eq('sale_id', item.reference_id);

            if (saleItems && saleItems.length > 0) {
              return {
                ...item,
                services: saleItems.map(si => ({
                  name: si.item_name,
                  amount: si.total,
                  stylist: si.staff?.name || 'Unknown'
                }))
              };
            }
          }
          return item;
        })
      );

      setActivityLog(enhancedData);
      setLoadingLog(false);
    };

    fetchLog();
  }, [selectedCustomer?.id]);

  const handleUpdateBalance = async () => {
    if (!selectedCustomer || adjustmentAmount === 0) return;

    const supabase = createClient();
    const newBalance = selectedCustomer.points_balance + adjustmentAmount;

    try {
      // 1. Create Transaction Record
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

      if (txError) {
        console.error("Transaction insert error:", txError);
        throw txError;
      }

      // 2. Update Customer Balance
      const { error: updateError } = await supabase
        .from('customers')
        .update({
          points_balance: newBalance,
          updated_at: new Date().toISOString()
        })
        .eq('id', selectedCustomer.id);

      if (updateError) throw updateError;

      // Update Local State
      const updatedCustomer = { ...selectedCustomer, points_balance: newBalance };
      setCustomers(prev => prev.map(c => c.id === selectedCustomer.id ? updatedCustomer : c));
      setSelectedCustomer(updatedCustomer);

      // Refresh log
      const { data: newLog } = await supabase
        .from('points_transactions')
        .select('*')
        .eq('customer_id', selectedCustomer.id)
        .order('created_at', { ascending: false });

      if (newLog) setActivityLog(newLog);

      // Reset form
      setAdjustmentAmount(100);
      setAdjustmentReason("Referral Bonus");

    } catch (error) {
      console.error("Error updating balance:", error);
      alert("Failed to update balance. Please try again.");
    }
  };

  const handleAddCustomer = async () => {
    if (!newCustomer.name || !newCustomer.phone) {
      alert("Please fill in name and phone number.");
      return;
    }

    setSavingCustomer(true);
    const supabase = createClient();

    try {
      const { data, error } = await supabase
        .from('customers')
        .insert({
          name: newCustomer.name,
          phone: newCustomer.phone,
          email: newCustomer.email || null,
          tier: newCustomer.tier,
          points_balance: 0,
          total_spent: 0,
          created_at: new Date().toISOString()
        })
        .select()
        .single();

      if (error) throw error;

      // Add to local state
      setCustomers(prev => [data as Customer, ...prev]);
      setSelectedCustomer(data as Customer);

      // Reset and close modal
      setNewCustomer({ name: "", phone: "", email: "", tier: "Normal" });
      setShowNewCustomerModal(false);
      alert("Customer added successfully!");

    } catch (error) {
      console.error("Error adding customer:", error);
      alert("Failed to add customer. Please try again.");
    } finally {
      setSavingCustomer(false);
    }
  };

  const handleExportReport = () => {
    // Generate CSV content
    const headers = ["Name", "Phone", "Email", "Tier", "Points Balance", "Total Visits", "Total Spent"];
    const csvContent = [
      headers.join(","),
      ...customers.map(c => [
        `"${c.name}"`,
        `"${c.phone || ''}"`,
        `"${c.email || ''}"`,
        c.tier,
        c.points_balance,
        c.visit_count || 0,
        c.total_spent || 0
      ].join(","))
    ].join("\n");

    // Create and download file
    const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
    const link = document.createElement("a");
    const url = URL.createObjectURL(blob);
    link.setAttribute("href", url);
    link.setAttribute("download", `customers-report-${format(new Date(), 'yyyy-MM-dd')}.csv`);
    link.style.visibility = 'hidden';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const filteredCustomers = customers.filter(c =>
    c.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    c.phone?.includes(searchQuery) ||
    c.email?.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <div className="min-h-screen">
      <Header title="Customer Points Management" subtitle="Home / Loyalty / Points Management" user={user!} />

      <div className="p-4 md:p-6">
        <div className="flex flex-col lg:flex-row gap-6">
          {/* Customer List */}
          <Card className="flex-1">
            <CardContent className="p-6">
              {/* Header */}
              <div className="flex items-center justify-between mb-6">
                <p className="text-sm text-[var(--muted)]">
                  Adjust loyalty balances and review member transaction history.
                </p>
                <div className="flex items-center gap-2">
                  <Button variant="outline" size="sm" onClick={handleExportReport}>
                    <Download className="h-4 w-4 mr-2" />
                    Export Report
                  </Button>
                  <Button size="sm" onClick={() => setShowNewCustomerModal(true)}>
                    <Plus className="h-4 w-4 mr-2" />
                    New Customer
                  </Button>
                </div>
              </div>

              {/* Search */}
              <div className="mb-6">
                <Input
                  placeholder="Search customers..."
                  icon={<Search className="h-4 w-4" />}
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                />
              </div>

              {/* Customer Table */}
              <div className="hidden md:block overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b border-[var(--border)]">
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                        Customer
                      </th>
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                        Contact
                      </th>
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                        Balance
                      </th>
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                        Tier
                      </th>
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                        Actions
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {loading ? (
                      <tr>
                        <td colSpan={5} className="py-8 text-center text-[var(--muted)]">
                          <Loader2 className="h-6 w-6 animate-spin mx-auto mb-2" />
                          Loading customers...
                        </td>
                      </tr>
                    ) : filteredCustomers.length === 0 ? (
                      <tr>
                        <td colSpan={5} className="py-8 text-center text-[var(--muted)]">
                          No customers found.
                        </td>
                      </tr>
                    ) : (
                      filteredCustomers.map((customer) => (
                        <tr
                          key={customer.id}
                          onClick={() => setSelectedCustomer(customer)}
                          className={`border-b border-[var(--border)] cursor-pointer transition-colors ${selectedCustomer?.id === customer.id
                            ? "bg-[var(--primary-light)]"
                            : "hover:bg-[var(--secondary)]"
                            }`}
                        >
                          <td className="py-4 px-4">
                            <div className="flex items-center gap-3">
                              <Avatar name={customer.name} />
                              <span className="font-medium">{customer.name}</span>
                            </div>
                          </td>
                          <td className="py-4 px-4 text-sm text-[var(--muted)]">{customer.phone}</td>
                          <td className="py-4 px-4 font-bold">{customer.points_balance.toLocaleString()}</td>
                          <td className="py-4 px-4">
                            <Badge variant={tierColors[customer.tier] || "default"}>{customer.tier}</Badge>
                          </td>
                          <td className="py-4 px-4">
                            <Button variant="ghost" size="sm" className="text-[var(--primary)]">
                              View Log
                            </Button>
                          </td>
                        </tr>
                      ))
                    )}
                  </tbody>
                </table>
              </div>

              {/* Mobile View */}
              <div className="md:hidden space-y-4">
                {loading ? (
                  <div className="text-center text-[var(--muted)] py-8">
                    <Loader2 className="h-6 w-6 animate-spin mx-auto mb-2" />
                    Loading customers...
                  </div>
                ) : filteredCustomers.length === 0 ? (
                  <div className="text-center text-[var(--muted)] py-8">No customers found.</div>
                ) : (
                  filteredCustomers.map((customer) => (
                    <div
                      key={customer.id}
                      onClick={() => setSelectedCustomer(customer)}
                      className={`p-4 rounded-xl border border-[var(--border)] cursor-pointer transition-colors ${selectedCustomer?.id === customer.id ? "bg-[var(--primary-light)] border-[var(--primary)]" : "bg-[var(--background)] hover:bg-[var(--secondary)]"
                        }`}
                    >
                      <div className="flex items-center justify-between mb-3">
                        <div className="flex items-center gap-3">
                          <Avatar name={customer.name} />
                          <div>
                            <h4 className="font-bold">{customer.name}</h4>
                            <p className="text-xs text-[var(--muted)]">{customer.phone}</p>
                          </div>
                        </div>
                        <Badge variant={tierColors[customer.tier] || "default"}>{customer.tier}</Badge>
                      </div>

                      <div className="flex justify-between items-center px-2 py-2 bg-[var(--secondary)] rounded-lg">
                        <div className="text-center flex-1 border-r border-[var(--border)]">
                          <p className="text-xs text-[var(--muted)]">Points</p>
                          <p className="font-bold text-[var(--primary)]">{customer.points_balance.toLocaleString()}</p>
                        </div>
                        <div className="text-center flex-1">
                          <Button variant="ghost" size="sm" className="text-xs h-6">View Log</Button>
                        </div>
                      </div>
                    </div>
                  ))
                )}
              </div>

              {/* Pagination (Hidden for now/Simplification) */}
              {/* <div className="flex items-center justify-between mt-4">...</div> */}

              {/* Activity Log */}
              {selectedCustomer && (
                <div className="mt-8 pt-6 border-t border-[var(--border)]">
                  <div className="flex items-center justify-between mb-4">
                    <div className="flex items-center gap-2">
                      <div className="h-6 w-6 rounded-full bg-[var(--secondary)] flex items-center justify-center">
                        <span className="text-xs">🕐</span>
                      </div>
                      <h3 className="font-medium">Activity Log: {selectedCustomer.name}</h3>
                    </div>
                    <Button
                      variant="ghost"
                      size="sm"
                      className="text-[var(--primary)]"
                      onClick={() => setShowAllLogs(!showAllLogs)}
                    >
                      {showAllLogs ? "Show Less" : `View All (${activityLog.length})`}
                    </Button>
                  </div>
                  <div className={`space-y-3 ${showAllLogs ? 'max-h-96 overflow-y-auto' : ''}`}>
                    {loadingLog ? (
                      <p className="text-center text-sm text-[var(--muted)]">Loading history...</p>
                    ) : activityLog.length === 0 ? (
                      <p className="text-center text-sm text-[var(--muted)]">No activity recorded.</p>
                    ) : (
                      (showAllLogs ? activityLog : activityLog.slice(0, 5)).map((item) => (
                        <div key={item.id} className="p-3 bg-[var(--secondary)] rounded-xl">
                          <div className="flex items-center gap-4">
                            <div className={`h-8 w-8 rounded-full flex items-center justify-center shrink-0 ${item.type === "earned" ? "bg-green-100" :
                              item.type === "redeemed" ? "bg-red-100" : "bg-blue-100"
                              }`}>
                              {item.type === "earned" ? "+" : item.type === "redeemed" ? "-" : "✎"}
                            </div>
                            <div className="flex-1 min-w-0">
                              <p className={`font-medium ${item.points > 0 ? "text-[var(--success)]" : "text-[var(--error)]"
                                }`}>
                                {item.points > 0 ? "+" : ""}{item.points} Points
                              </p>
                              <p className="text-sm text-[var(--muted)]">{item.reason}</p>
                            </div>
                            <div className="text-right text-sm text-[var(--muted)] shrink-0">
                              <p>{format(new Date(item.created_at), 'd MMM yyyy')}</p>
                            </div>
                          </div>
                          {/* Service & Stylist Details */}
                          {item.services && item.services.length > 0 && (
                            <div className="mt-3 pt-3 border-t border-[var(--border)]">
                              <p className="text-xs font-medium text-[var(--muted)] uppercase tracking-wide mb-2">Services</p>
                              <div className="space-y-2">
                                {item.services.map((service: any, idx: number) => (
                                  <div key={idx} className="flex items-center justify-between text-sm">
                                    <div className="flex items-center gap-2">
                                      <span className="text-[var(--foreground)]">{service.name}</span>
                                      <span className="text-xs px-2 py-0.5 bg-[var(--primary-light)] text-[var(--primary)] rounded-full">
                                        by {service.stylist}
                                      </span>
                                    </div>
                                    <span className="font-medium">RM {service.amount?.toFixed(2)}</span>
                                  </div>
                                ))}
                              </div>
                            </div>
                          )}
                        </div>
                      ))
                    )}
                  </div>
                </div>
              )}
            </CardContent>
          </Card>

          {/* Admin Control Panel */}
          {isAdmin && selectedCustomer && (
            <Card className="w-full lg:w-80 shrink-0">
              <CardContent className="p-6">
                <div className="flex items-center gap-2 mb-4">
                  <span className="text-[var(--primary)]">🛡️</span>
                  <p className="text-xs font-medium text-[var(--primary)] uppercase tracking-wide">
                    Admin Control Panel
                  </p>
                </div>

                <h3 className="text-xl font-bold mb-1">Adjust Points</h3>
                <p className="text-sm text-[var(--muted)] mb-6">
                  Modifying balance for <span className="font-medium text-[var(--foreground)]">{selectedCustomer.name}</span>
                </p>

                {/* Adjustment Amount */}
                <div className="mb-6">
                  <label className="block text-xs font-medium text-[var(--muted)] uppercase tracking-wide mb-2">
                    Adjustment Amount
                  </label>
                  <div className="flex items-center gap-3">
                    <button
                      onClick={() => setAdjustmentAmount(adjustmentAmount - 10)}
                      className="h-10 w-10 rounded-full border border-[var(--border)] flex items-center justify-center hover:bg-[var(--secondary)]"
                    >
                      <Minus className="h-4 w-4" />
                    </button>
                    <input
                      type="number"
                      value={adjustmentAmount}
                      onChange={(e) => setAdjustmentAmount(Number(e.target.value))}
                      className="flex-1 h-12 text-center text-2xl font-bold bg-transparent border-b-2 border-[var(--border)] focus:border-[var(--primary)] outline-none"
                    />
                    <button
                      onClick={() => setAdjustmentAmount(adjustmentAmount + 10)}
                      className="h-10 w-10 rounded-full border border-[var(--border)] flex items-center justify-center hover:bg-[var(--secondary)]"
                    >
                      <Plus className="h-4 w-4" />
                    </button>
                  </div>
                  <p className="text-xs text-[var(--muted)] text-center mt-2">
                    Use positive for bonus, negative for deduction
                  </p>
                </div>

                {/* Reason */}
                <div className="mb-6">
                  <label className="block text-xs font-medium text-[var(--muted)] uppercase tracking-wide mb-2">
                    Reason for Adjustment
                  </label>
                  <select
                    value={adjustmentReason}
                    onChange={(e) => setAdjustmentReason(e.target.value)}
                    className="w-full h-12 px-4 bg-[var(--card)] border border-[var(--border)] rounded-xl focus:outline-none focus:ring-2 focus:ring-[var(--primary)]"
                  >
                    <option>Referral Bonus</option>
                    <option>Birthday Bonus</option>
                    <option>Correction</option>
                    <option>Promotion</option>
                    <option>Other</option>
                  </select>
                </div>

                {/* Actions */}
                <Button className="w-full" size="lg" onClick={handleUpdateBalance}>
                  ✓ Update Balance
                </Button>
                <button
                  className="w-full mt-2 py-2 text-sm text-[var(--error)] hover:underline"
                  onClick={() => {
                    setAdjustmentAmount(100);
                    setAdjustmentReason("Referral Bonus");
                  }}
                >
                  Reset Form
                </button>

                <p className="text-xs text-[var(--muted)] text-center mt-4">
                  ⓘ All adjustments are logged and visible to supervisors.
                </p>
              </CardContent>
            </Card>
          )}
        </div>
      </div>

      {/* New Customer Modal */}
      {showNewCustomerModal && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <Card className="w-full max-w-md mx-4">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-xl font-bold">New Customer</h3>
                <button
                  onClick={() => setShowNewCustomerModal(false)}
                  className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>

              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium mb-2">Full Name *</label>
                  <Input
                    placeholder="Enter customer name"
                    value={newCustomer.name}
                    onChange={(e) => setNewCustomer({ ...newCustomer, name: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Phone Number *</label>
                  <Input
                    placeholder="+60 12-345 6789"
                    value={newCustomer.phone}
                    onChange={(e) => setNewCustomer({ ...newCustomer, phone: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Email (Optional)</label>
                  <Input
                    type="email"
                    placeholder="customer@email.com"
                    value={newCustomer.email}
                    onChange={(e) => setNewCustomer({ ...newCustomer, email: e.target.value })}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-2">Membership Tier</label>
                  <select
                    value={newCustomer.tier}
                    onChange={(e) => setNewCustomer({ ...newCustomer, tier: e.target.value as CustomerTier })}
                    className="w-full h-12 px-4 bg-[var(--card)] border border-[var(--border)] rounded-xl focus:outline-none focus:ring-2 focus:ring-[var(--primary)]"
                  >
                    <option value="Normal">Normal</option>
                    <option value="Member">Member</option>
                    <option value="VIP">VIP</option>
                  </select>
                </div>
              </div>

              <div className="flex gap-3 mt-6">
                <Button
                  variant="outline"
                  className="flex-1"
                  onClick={() => setShowNewCustomerModal(false)}
                >
                  Cancel
                </Button>
                <Button
                  className="flex-1"
                  onClick={handleAddCustomer}
                  disabled={savingCustomer}
                >
                  {savingCustomer ? (
                    <>
                      <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                      Saving...
                    </>
                  ) : (
                    "Add Customer"
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

