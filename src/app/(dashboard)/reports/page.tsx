"use client";

import { useState, useEffect, useRef } from "react";
import { Header } from "@/components/layout/header";
import { useAuthStore } from "@/lib/store/auth-store";
import {
  format,
  startOfDay, endOfDay,
  startOfWeek, startOfMonth, endOfMonth,
  subMonths,
} from "date-fns";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import { formatCurrency } from "@/lib/utils";
import { logError } from "@/lib/utils/error-logger";

// Sub-components
import { ReportsStatsHeader } from "./components/ReportsStatsHeader";
import { FinancialOverview } from "./components/FinancialOverview";
import { ServicePerformance } from "./components/ServicePerformance";
import { RecentTransactionsList } from "./components/RecentTransactionsList";
import { ReportsModals } from "./components/ReportsModals";
import { PointsRedemptionPanel } from "./components/PointsRedemptionPanel";
import { StaffSalesTrend, type StaffMonthlyRow } from "./components/StaffSalesTrend";
import { SalonOwnerDashboard } from "./components/SalonOwnerDashboard";
import { StaffMyPerformance } from "./components/StaffMyPerformance";
import { ReportsTabBar, type ReportTab } from "./components/ReportsTabBar";

interface SalesData { daily: number; weekly: number; monthly: number; overall: number; }
interface TopService { name: string; count: number; revenue: number; }
interface StaffPerformance { id: string; name: string; services: number; revenue: number; commission: number; }
interface RecentTransaction { id: string; fullId: string; customer: string; customerId: string | null; amount: number; pointsRedeemed: number; pointsEarned: number; date: string; status: string; }
interface TopRedeemer { customerId: string; name: string; pointsRedeemed: number; rmValue: number; count: number; }
interface StaffSaleItem { serviceName: string; amount: number; date: string; customer: string; }

export default function ReportsPage() {
  const { user } = useAuthStore();

  // ── Stable role: capture ONCE when user first loads, never flip on token refresh ──
  const isAdminRef = useRef<boolean | null>(null);
  const [authResolved, setAuthResolved] = useState(false);

  useEffect(() => {
    if (user && !authResolved) {
      isAdminRef.current = user.role === "admin";
      setAuthResolved(true);
    }
  }, [user, authResolved]);

  const isAdmin = isAdminRef.current ?? false;

  // ── Shared state ──────────────────────────────────────────────────────────
  const [selectedMonth, setSelectedMonth] = useState(new Date());
  const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState<ReportTab>("ringkasan");

  // ── Admin states ──────────────────────────────────────────────────────────
  const [salesData, setSalesData] = useState<SalesData>({ daily: 0, weekly: 0, monthly: 0, overall: 0 });
  const [topServices, setTopServices] = useState<TopService[]>([]);
  const [staffPerformance, setStaffPerformance] = useState<StaffPerformance[]>([]);
  const [recentTransactions, setRecentTransactions] = useState<RecentTransaction[]>([]);
  const [totalTransactions, setTotalTransactions] = useState(0);
  const [activeCustomers, setActiveCustomers] = useState(0);
  const [pointsIssued, setPointsIssued] = useState(0);
  const [showFullReport, setShowFullReport] = useState(false);

  // Void modal
  const [showVoidModal, setShowVoidModal] = useState(false);
  const [selectedTransaction, setSelectedTransaction] = useState<RecentTransaction | null>(null);
  const [voidReason, setVoidReason] = useState("Permintaan Pelanggan");
  const [voidingTransaction, setVoidingTransaction] = useState(false);

  // Points redemption
  const [totalPointsRedeemed, setTotalPointsRedeemed] = useState(0);
  const [redeemRmValue, setRedeemRmValue] = useState(0);
  const [redeemTransactions, setRedeemTransactions] = useState(0);
  const [topRedeemers, setTopRedeemers] = useState<TopRedeemer[]>([]);

  // Yearly staff trend
  const [staffYearlySales, setStaffYearlySales] = useState<StaffMonthlyRow[]>([]);

  // Owner dashboard extras
  const [monthlySalesChart, setMonthlySalesChart] = useState<number[]>(Array(12).fill(0));
  const [totalCustomers, setTotalCustomers] = useState(0);
  const [activeStaffCount, setActiveStaffCount] = useState(0);
  const [pointsInCirculation, setPointsInCirculation] = useState(0);
  const [growthPercent, setGrowthPercent] = useState<number | null>(null);

  // ── Staff states ──────────────────────────────────────────────────────────
  const [staffSalesToday, setStaffSalesToday] = useState(0);
  const [staffSalesMonth, setStaffSalesMonth] = useState(0);
  const [staffCommToday, setStaffCommToday] = useState(0);
  const [staffCommMonth, setStaffCommMonth] = useState(0);
  const [staffServicesMonth, setStaffServicesMonth] = useState(0);
  const [staffRecentSales, setStaffRecentSales] = useState<StaffSaleItem[]>([]);
  const [staffMemberId, setStaffMemberId] = useState<string | null>(null);

  const isCurrentMonth = format(selectedMonth, "yyyy-MM") === format(new Date(), "yyyy-MM");

  // helper: paginated fetch
  const fetchAll = async <T,>(query: any): Promise<T[]> => {
    const PAGE_SIZE = 1000;
    const allData: T[] = [];
    let offset = 0;
    while (true) {
      const { data, error } = await query.range(offset, offset + PAGE_SIZE - 1);
      if (error) throw error;
      if (!data || data.length === 0) break;
      allData.push(...data);
      if (data.length < PAGE_SIZE) break;
      offset += PAGE_SIZE;
    }
    return allData;
  };

  // ── Staff member ID lookup (maps user.id → staff.id) ─────────────────────
  useEffect(() => {
    if (isAdmin || !user) return;
    const lookupStaff = async () => {
      const supabase = createClient();
      // staff rows link to users via `user_id` or email match
      const { data } = await supabase
        .from("staff")
        .select("id")
        .eq("is_active", true)
        .or(`user_id.eq.${user.id},email.eq.${user.email}`)
        .single();
      if (data) setStaffMemberId(data.id);
    };
    lookupStaff();
  }, [user, isAdmin, authResolved]);

  // ── Staff performance fetch ───────────────────────────────────────────────
  useEffect(() => {
    if (isAdmin || !staffMemberId) return;

    const fetchStaffData = async () => {
      setLoading(true);
      const supabase = createClient();
      const today = new Date();
      const monthStart = startOfMonth(selectedMonth);
      const monthEnd = endOfMonth(selectedMonth);
      const monthStr = format(selectedMonth, "yyyy-MM");

      try {
        // Commissions today
        const { data: commToday } = await supabase
          .from("commissions")
          .select("amount, sale_amount")
          .eq("staff_id", staffMemberId)
          .gte("created_at", startOfDay(today).toISOString())
          .lte("created_at", endOfDay(today).toISOString())
          .neq("status", "voided");

        const salesToday = commToday?.reduce((s, c: any) => s + (c.sale_amount || 0), 0) || 0;
        const cToday = commToday?.reduce((s, c: any) => s + (c.amount || 0), 0) || 0;
        setStaffSalesToday(salesToday);
        setStaffCommToday(cToday);

        // Commissions this month
        const { data: commMonth } = await supabase
          .from("commissions")
          .select("amount, sale_amount")
          .eq("staff_id", staffMemberId)
          .eq("month", monthStr)
          .neq("status", "voided");

        const salesMonth = commMonth?.reduce((s, c: any) => s + (c.sale_amount || 0), 0) || 0;
        const cMonth = commMonth?.reduce((s, c: any) => s + (c.amount || 0), 0) || 0;
        setStaffSalesMonth(salesMonth);
        setStaffCommMonth(cMonth);
        setStaffServicesMonth(commMonth?.length || 0);

        // Recent sale items this staff handled
        const { data: saleItems } = await supabase
          .from("sale_items")
          .select("item_name, total, created_at, sales!inner(status, customer_id, customers(name))")
          .eq("stylist_id", staffMemberId)
          .neq("sales.status", "voided")
          .gte("created_at", monthStart.toISOString())
          .lte("created_at", monthEnd.toISOString())
          .order("created_at", { ascending: false })
          .limit(20);

        if (saleItems) {
          setStaffRecentSales(
            saleItems.map((item: any) => ({
              serviceName: item.item_name,
              amount: item.total || 0,
              date: format(new Date(item.created_at), "d MMM, h:mm a"),
              customer: (item.sales as any)?.customers?.name || "Walk-in",
            }))
          );
        }
      } catch (err) {
        logError("Staff Reports", err);
      } finally {
        setLoading(false);
      }
    };

    fetchStaffData();
  }, [isAdmin, staffMemberId, selectedMonth]);

  // ── Admin data fetch ──────────────────────────────────────────────────────
  useEffect(() => {
    if (!isAdmin) return;

    const fetchReportData = async () => {
      setLoading(true);
      const supabase = createClient();
      const today = new Date();
      const monthStart = startOfMonth(selectedMonth);
      const monthEnd = endOfMonth(selectedMonth);

      try {
        // ── Sales totals
        const monthlySalesData = await fetchAll(
          supabase.from("sales").select("total")
            .gte("created_at", monthStart.toISOString())
            .lte("created_at", monthEnd.toISOString())
            .neq("status", "voided")
        );
        const monthly = monthlySalesData.reduce((s: number, x: any) => s + (x.total || 0), 0);

        let daily = 0, weekly = 0;
        if (isCurrentMonth) {
          const { data: dData } = await supabase.from("sales").select("total")
            .gte("created_at", startOfDay(today).toISOString())
            .lte("created_at", endOfDay(today).toISOString())
            .neq("status", "voided");
          daily = dData?.reduce((s, x) => s + (x.total || 0), 0) || 0;
          const wStart = startOfWeek(today, { weekStartsOn: 1 });
          const { data: wData } = await supabase.from("sales").select("total")
            .gte("created_at", wStart.toISOString()).neq("status", "voided");
          weekly = wData?.reduce((s, x) => s + (x.total || 0), 0) || 0;
        }

        const overallData = await fetchAll(
          supabase.from("sales").select("total").neq("status", "voided")
        );
        const overall = overallData.reduce((s: number, x: any) => s + (x.total || 0), 0);
        setSalesData({ daily, weekly, monthly, overall });

        // Growth vs prev month
        const prevMonth = subMonths(selectedMonth, 1);
        const { data: prevData } = await supabase.from("sales").select("total")
          .gte("created_at", startOfMonth(prevMonth).toISOString())
          .lte("created_at", endOfMonth(prevMonth).toISOString())
          .neq("status", "voided");
        const prevTotal = prevData?.reduce((s, x) => s + (x.total || 0), 0) || 0;
        if (prevTotal > 0) {
          setGrowthPercent(((monthly - prevTotal) / prevTotal) * 100);
        } else {
          setGrowthPercent(null);
        }

        // ── Transaction count
        const { count } = await supabase.from("sales")
          .select("*", { count: "exact", head: true })
          .gte("created_at", monthStart.toISOString())
          .lte("created_at", monthEnd.toISOString())
          .neq("status", "voided");
        setTotalTransactions(count || 0);

        // ── Active customers this month
        const activeCustomerData = await fetchAll(
          supabase.from("sales").select("customer_id")
            .gte("created_at", monthStart.toISOString())
            .lte("created_at", monthEnd.toISOString())
            .neq("status", "voided")
            .not("customer_id", "is", null)
        );
        setActiveCustomers(new Set(activeCustomerData.map((s: any) => s.customer_id)).size);

        // ── Points issued this month
        const { data: pointsData } = await supabase.from("points_transactions")
          .select("points")
          .eq("type", "earned")
          .gte("created_at", monthStart.toISOString())
          .lte("created_at", monthEnd.toISOString());
        setPointsIssued(pointsData?.reduce((s, p) => s + (p.points || 0), 0) || 0);

        // ── Top services
        const topServicesData = await fetchAll(
          supabase.from("sale_items").select("item_name, total, sales!inner(status)")
            .eq("item_type", "service")
            .neq("sales.status", "voided")
            .gte("created_at", monthStart.toISOString())
            .lte("created_at", monthEnd.toISOString())
        );
        if (topServicesData.length > 0) {
          const stats: { [key: string]: { count: number; revenue: number } } = {};
          topServicesData.forEach((item: any) => {
            if (!stats[item.item_name]) stats[item.item_name] = { count: 0, revenue: 0 };
            stats[item.item_name].count++;
            stats[item.item_name].revenue += item.total || 0;
          });
          setTopServices(
            Object.entries(stats)
              .map(([name, d]) => ({ name, count: d.count, revenue: d.revenue }))
              .sort((a, b) => b.revenue - a.revenue)
              .slice(0, 5)
          );
        } else setTopServices([]);

        // ── Staff performance (monthly)
        const monthStr = format(selectedMonth, "yyyy-MM");
        const { data: commData } = await supabase.from("commissions")
          .select("staff_id, amount, sale_amount, staff:staff(name)")
          .eq("month", monthStr)
          .neq("status", "voided");

        if (commData && commData.length > 0) {
          const sStats: { [key: string]: { name: string; services: number; revenue: number; commission: number } } = {};
          commData.forEach((c: any) => {
            const sid = c.staff_id; const name = c.staff?.name || "Unknown";
            if (!sStats[sid]) sStats[sid] = { name, services: 0, revenue: 0, commission: 0 };
            sStats[sid].services++;
            sStats[sid].revenue += c.sale_amount || 0;
            sStats[sid].commission += c.amount || 0;
          });
          const perf = Object.entries(sStats)
            .map(([id, d]) => ({ id, ...d }))
            .sort((a, b) => b.revenue - a.revenue);
          setStaffPerformance(perf);
        } else setStaffPerformance([]);

        // ── Recent transactions
        const { data: recentTxns } = await supabase.from("sales")
          .select("id, total, status, created_at, customer_id, points_redeemed, customer:customers(name)")
          .gte("created_at", monthStart.toISOString())
          .lte("created_at", monthEnd.toISOString())
          .order("created_at", { ascending: false })
          .limit(20);
        if (recentTxns)
          setRecentTransactions(
            recentTxns.map((txn: any) => ({
              id: txn.id.slice(0, 8).toUpperCase(), fullId: txn.id,
              customer: txn.customer?.name || "Walk-in",
              customerId: txn.customer_id, amount: txn.total,
              pointsRedeemed: txn.points_redeemed || 0,
              pointsEarned: Math.floor(txn.total),
              date: format(new Date(txn.created_at), "MMM d, h:mm a"),
              status: txn.status,
            }))
          );

        // ── Points redemption
        const { data: redeemData } = await supabase.from("points_transactions")
          .select("points, customer_id, customers(name)")
          .eq("type", "redeemed")
          .gte("created_at", monthStart.toISOString())
          .lte("created_at", monthEnd.toISOString());

        if (redeemData && redeemData.length > 0) {
          const totalPts = redeemData.reduce((s, r) => s + Math.abs(r.points || 0), 0);
          setTotalPointsRedeemed(totalPts);
          setRedeemRmValue((totalPts / 100) * 5);
          setRedeemTransactions(redeemData.length);

          // group by customer
          const byCustomer: Record<string, { name: string; pts: number; count: number }> = {};
          redeemData.forEach((r: any) => {
            const cid = r.customer_id || "anon";
            const name = r.customers?.name || "Walk-in";
            if (!byCustomer[cid]) byCustomer[cid] = { name, pts: 0, count: 0 };
            byCustomer[cid].pts += Math.abs(r.points || 0);
            byCustomer[cid].count++;
          });
          setTopRedeemers(
            Object.entries(byCustomer)
              .map(([customerId, d]) => ({
                customerId,
                name: d.name,
                pointsRedeemed: d.pts,
                rmValue: (d.pts / 100) * 5,
                count: d.count,
              }))
              .sort((a, b) => b.pointsRedeemed - a.pointsRedeemed)
              .slice(0, 5)
          );
        } else {
          setTotalPointsRedeemed(0);
          setRedeemRmValue(0);
          setRedeemTransactions(0);
          setTopRedeemers([]);
        }

        // ── Points in circulation (overall active)
        const { data: circData } = await supabase.from("customers").select("points_balance");
        setPointsInCirculation(circData?.reduce((s, c) => s + (c.points_balance || 0), 0) || 0);

        // ── Total customers
        const { count: custCount } = await supabase.from("customers")
          .select("*", { count: "exact", head: true });
        setTotalCustomers(custCount || 0);

        // ── Active staff count
        const { count: staffCount } = await supabase.from("staff")
          .select("*", { count: "exact", head: true })
          .eq("is_active", true);
        setActiveStaffCount(staffCount || 0);

      } catch (error) {
        logError("Reports Page", error);
      } finally {
        setLoading(false);
      }
    };

    fetchReportData();
  }, [isAdmin, selectedMonth, authResolved]);

  // ── Yearly sales trend fetch (fires when year changes) ────────────────────
  useEffect(() => {
    if (!isAdmin) return;

    const fetchYearlySales = async () => {
      const supabase = createClient();
      const yearStart = new Date(selectedYear, 0, 1).toISOString();
      const yearEnd = new Date(selectedYear + 1, 0, 1).toISOString(); // exclusive upper bound

      try {
        // ── Chart: query SALES table directly (covers all transactions, even without stylist)
        const { data: salesRows } = await supabase
          .from("sales")
          .select("total, created_at")
          .gte("created_at", yearStart)
          .lt("created_at", yearEnd)
          .neq("status", "voided");

        const monthlyTotals = Array(12).fill(0);
        if (salesRows) {
          salesRows.forEach((s: any) => {
            const monthIdx = new Date(s.created_at).getMonth(); // 0-11
            monthlyTotals[monthIdx] += s.total || 0;
          });
        }
        setMonthlySalesChart(monthlyTotals);

        // ── Staff breakdown: still use commissions (only rows with assigned stylist)
        const { data: commRows } = await supabase
          .from("commissions")
          .select("staff_id, sale_amount, month, staff:staff(name)")
          .gte("created_at", yearStart)
          .lt("created_at", yearEnd)
          .neq("status", "voided");

        if (!commRows || commRows.length === 0) {
          setStaffYearlySales([]);
          return;
        }

        const staffMap: Record<string, { name: string; monthly: number[] }> = {};
        commRows.forEach((c: any) => {
          const sid = c.staff_id;
          const name = c.staff?.name || "Unknown";
          const monthIdx = parseInt((c.month || "").split("-")[1] || "1") - 1;
          const amt = c.sale_amount || 0;
          if (!staffMap[sid]) staffMap[sid] = { name, monthly: Array(12).fill(0) };
          if (monthIdx >= 0 && monthIdx < 12) staffMap[sid].monthly[monthIdx] += amt;
        });

        setStaffYearlySales(
          Object.entries(staffMap).map(([id, d]) => ({
            id,
            name: d.name,
            monthlyRevenue: d.monthly,
          }))
        );
      } catch (err) {
        logError("Yearly Sales Trend", err);
      }
    };

    fetchYearlySales();
  }, [isAdmin, selectedYear, authResolved]);

  // ── Void handler ──────────────────────────────────────────────────────────
  const handleVoidTransaction = async () => {
    if (!selectedTransaction || !user) return;
    setVoidingTransaction(true);
    try {
      const { posService } = await import("@/lib/services/pos-service");
      await posService.voidSale({
        saleId: selectedTransaction.fullId,
        voidedBy: user.id,
        voidReason: voidReason,
      });
      setRecentTransactions((prev) =>
        prev.map((txn) =>
          txn.fullId === selectedTransaction.fullId ? { ...txn, status: "voided" } : txn
        )
      );
      setShowVoidModal(false);
      toast.success("Transaksi berjaya dibatalkan!");
    } catch (error: unknown) {
      const errorMsg = error instanceof Error ? error.message : "Gagal batalkan transaksi.";
      toast.error(`Ralat: ${errorMsg}`);
    } finally {
      setVoidingTransaction(false);
    }
  };

  const handleExportReport = () => {
    const csv = [
      "Laporan Kewangan HMS Salon",
      `Dijana: ${format(new Date(), "yyyy-MM-dd HH:mm")}`,
      "",
      "Metrik,Nilai",
      `"Jualan (Bulanan)","${formatCurrency(salesData.monthly)}"`,
      `"Bilangan Transaksi","${totalTransactions}"`,
      `"Pelanggan Aktif","${activeCustomers}"`,
      `"Mata Ditebus","${totalPointsRedeemed} pts"`,
      `"Diskaun Diberikan","${formatCurrency(redeemRmValue)}"`,
      "",
      "Servis Terlaris,Tempahan,Jualan",
      ...topServices.map((s) => `"${s.name}",${s.count},"${formatCurrency(s.revenue)}"`),
      "",
      "Prestasi Kakitangan,Servis,Jualan (RM),Komisen",
      ...staffPerformance.map((s) => `"${s.name}",${s.services},"${formatCurrency(s.revenue)}","${formatCurrency(s.commission)}"`),
    ].join("\n");

    const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
    const link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.setAttribute("download", `laporan-hms-${format(selectedMonth, "yyyy-MM")}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const bestStaff = staffPerformance.length > 0
    ? { name: staffPerformance[0].name, revenue: staffPerformance[0].revenue }
    : null;
  const bestService = topServices.length > 0 ? topServices[0] : null;

  // ── Auth loading guard ────────────────────────────────────────────────────
  if (!authResolved) {
    return (
      <div className="min-h-screen bg-[#fcfdfd] flex items-center justify-center">
        <div className="text-center">
          <div className="h-10 w-10 rounded-full border-4 border-[#2e7d32]/20 border-t-[#2e7d32] animate-spin mx-auto mb-4" />
          <p className="text-[10px] font-black uppercase tracking-widest text-gray-400">Memuatkan...</p>
        </div>
      </div>
    );
  }

  // ── Render ────────────────────────────────────────────────────────────────
  return (
    <div className="min-h-screen bg-[#fcfdfd]">
      <Header
        title={isAdmin ? "Laporan & Analitik" : "Prestasi Saya"}
        subtitle={isAdmin ? "Pantau prestasi kewangan salon dan kakitangan" : "Jualan dan komisen anda"}
        user={user!}
      />

      <div className="p-4 md:p-8 max-w-[1600px] mx-auto">

        {/* ── ADMIN VIEW ──────────────────────────────────────────────────── */}
        {isAdmin && (
          <div className="space-y-8">

            {/* Month nav + Export — always visible */}
            <ReportsStatsHeader
              loading={loading}
              selectedMonth={selectedMonth}
              setSelectedMonth={setSelectedMonth}
              isCurrentMonth={isCurrentMonth}
              handleExportReport={handleExportReport}
              salesData={salesData}
              totalTransactions={totalTransactions}
              activeCustomers={activeCustomers}
              pointsIssued={pointsIssued}
              totalPointsRedeemed={totalPointsRedeemed}
            />

            {/* Tab bar */}
            <ReportsTabBar activeTab={activeTab} setActiveTab={setActiveTab} />

            {/* ── TAB: RINGKASAN ─────────────────────────────────────────── */}
            {activeTab === "ringkasan" && (
              <div className="space-y-8">
                <SalonOwnerDashboard
                  loading={loading}
                  selectedMonth={selectedMonth}
                  monthlySales={monthlySalesChart}
                  selectedYear={selectedYear}
                  totalCustomers={totalCustomers}
                  activeStaffCount={activeStaffCount}
                  pointsInCirculation={pointsInCirculation}
                  bestStaff={bestStaff}
                  bestService={bestService}
                  monthlySalesThisMonth={salesData.monthly}
                  growthPercent={growthPercent}
                />
                <FinancialOverview
                  loading={loading}
                  isCurrentMonth={isCurrentMonth}
                  selectedMonth={selectedMonth}
                  salesData={salesData}
                  totalTransactions={totalTransactions}
                />
              </div>
            )}

            {/* ── TAB: KAKITANGAN ────────────────────────────────────────── */}
            {activeTab === "kakitangan" && (
              <div className="space-y-8">
                <ServicePerformance
                  loading={loading}
                  topServices={topServices}
                  staffPerformance={staffPerformance}
                  setShowFullReport={setShowFullReport}
                />
                <StaffSalesTrend
                  loading={loading}
                  staffYearlySales={staffYearlySales}
                  selectedYear={selectedYear}
                  setSelectedYear={setSelectedYear}
                />
              </div>
            )}

            {/* ── TAB: TRANSAKSI ─────────────────────────────────────────── */}
            {activeTab === "transaksi" && (
              <RecentTransactionsList
                loading={loading}
                recentTransactions={recentTransactions}
                isAdmin={isAdmin}
                setSelectedTransaction={setSelectedTransaction}
                setShowVoidModal={setShowVoidModal}
              />
            )}

            {/* ── TAB: MATA GANJARAN ─────────────────────────────────────── */}
            {activeTab === "mata" && (
              <PointsRedemptionPanel
                loading={loading}
                totalPointsRedeemed={totalPointsRedeemed}
                redeemRmValue={redeemRmValue}
                redeemTransactions={redeemTransactions}
                topRedeemers={topRedeemers}
              />
            )}

            {/* Modals — always mounted */}
            <ReportsModals
              showFullReport={showFullReport}
              setShowFullReport={setShowFullReport}
              staffPerformance={staffPerformance}
              handleExportReport={handleExportReport}
              showVoidModal={showVoidModal}
              setShowVoidModal={setShowVoidModal}
              selectedTransaction={selectedTransaction}
              voidReason={voidReason}
              setVoidReason={setVoidReason}
              voidingTransaction={voidingTransaction}
              handleVoidTransaction={handleVoidTransaction}
            />
          </div>
        )}

        {/* ── STAFF VIEW ──────────────────────────────────────────────────── */}
        {!isAdmin && (
          <div className="space-y-8 mt-2">
            {/* Month navigator */}
            <div className="flex items-center gap-4">
              <button
                onClick={() => setSelectedMonth((prev) => {
                  const d = new Date(prev);
                  d.setMonth(d.getMonth() - 1);
                  return d;
                })}
                className="h-10 w-10 flex items-center justify-center rounded-xl bg-white shadow-sm border border-gray-100 text-gray-400 hover:text-[#2e7d32] transition-all"
              >
                ‹
              </button>
              <div className="h-10 px-6 bg-white border border-gray-100 rounded-xl shadow-sm flex items-center">
                <span className="font-black text-xs uppercase tracking-widest text-gray-700">
                  {format(selectedMonth, "MMMM yyyy")}
                </span>
              </div>
              <button
                onClick={() => {
                  const next = new Date(selectedMonth);
                  next.setMonth(next.getMonth() + 1);
                  if (next <= new Date()) setSelectedMonth(next);
                }}
                disabled={isCurrentMonth}
                className={`h-10 w-10 flex items-center justify-center rounded-xl transition-all ${isCurrentMonth
                    ? "bg-gray-50 text-gray-200 cursor-not-allowed"
                    : "bg-white shadow-sm border border-gray-100 text-gray-400 hover:text-[#2e7d32]"
                  }`}
              >
                ›
              </button>
            </div>

            <StaffMyPerformance
              loading={loading}
              staffName={user?.name || user?.email || "Kakitangan"}
              salesToday={staffSalesToday}
              salesThisMonth={staffSalesMonth}
              commissionToday={staffCommToday}
              commissionThisMonth={staffCommMonth}
              servicesThisMonth={staffServicesMonth}
              recentSales={staffRecentSales}
              selectedMonth={selectedMonth}
            />
          </div>
        )}
      </div>
    </div>
  );
}
