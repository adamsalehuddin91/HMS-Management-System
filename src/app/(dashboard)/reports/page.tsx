"use client";

import { useState, useEffect } from "react";
import { Header } from "@/components/layout/header";
import { useAuthStore } from "@/lib/store/auth-store";
import { format, startOfDay, endOfDay, startOfWeek, startOfMonth, endOfMonth } from "date-fns";
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

interface SalesData { daily: number; weekly: number; monthly: number; overall: number; }
interface TopService { name: string; count: number; revenue: number; }
interface StaffPerformance { id: string; name: string; services: number; revenue: number; commission: number; }
interface RecentTransaction { id: string; fullId: string; customer: string; customerId: string | null; amount: number; pointsRedeemed: number; pointsEarned: number; date: string; status: string; }

export default function ReportsPage() {
  const { user } = useAuthStore();
  const isAdmin = user?.role === "admin";
  const [selectedMonth, setSelectedMonth] = useState(new Date());
  const [showFullReport, setShowFullReport] = useState(false);
  const [loading, setLoading] = useState(true);
  const [salesData, setSalesData] = useState<SalesData>({ daily: 0, weekly: 0, monthly: 0, overall: 0 });
  const [topServices, setTopServices] = useState<TopService[]>([]);
  const [staffPerformance, setStaffPerformance] = useState<StaffPerformance[]>([]);
  const [recentTransactions, setRecentTransactions] = useState<RecentTransaction[]>([]);
  const [totalTransactions, setTotalTransactions] = useState(0);
  const [activeCustomers, setActiveCustomers] = useState(0);
  const [pointsIssued, setPointsIssued] = useState(0);

  const [showVoidModal, setShowVoidModal] = useState(false);
  const [selectedTransaction, setSelectedTransaction] = useState<RecentTransaction | null>(null);
  const [voidReason, setVoidReason] = useState("Permintaan Pelanggan");
  const [voidingTransaction, setVoidingTransaction] = useState(false);

  const isCurrentMonth = format(selectedMonth, 'yyyy-MM') === format(new Date(), 'yyyy-MM');

  const fetchAll = async <T,>(query: any) => {
    const allData: T[] = [];
    let offset = 0;
    while (true) {
      const { data, error } = await query.range(offset, offset + 999);
      if (error) throw error;
      if (!data || data.length === 0) break;
      allData.push(...data);
      if (data.length < 1000) break;
      offset += 1000;
    }
    return allData;
  };

  useEffect(() => {
    const fetchReportData = async () => {
      setLoading(true);
      const supabase = createClient();
      const today = new Date();
      const monthStart = startOfMonth(selectedMonth);
      const monthEnd = endOfMonth(selectedMonth);

      try {
        const monthlySalesData = await fetchAll(supabase.from('sales').select('total').gte('created_at', monthStart.toISOString()).lte('created_at', monthEnd.toISOString()).neq('status', 'voided'));
        const monthly = monthlySalesData.reduce((sum: number, s: any) => sum + (s.total || 0), 0);

        let daily = 0; let weekly = 0;
        if (isCurrentMonth) {
          const { data: dData } = await supabase.from('sales').select('total').gte('created_at', startOfDay(today).toISOString()).lte('created_at', endOfDay(today).toISOString()).neq('status', 'voided');
          daily = dData?.reduce((s, x) => s + (x.total || 0), 0) || 0;
          const wStart = startOfWeek(today, { weekStartsOn: 1 });
          const { data: wData } = await supabase.from('sales').select('total').gte('created_at', wStart.toISOString()).neq('status', 'voided');
          weekly = wData?.reduce((s, x) => s + (x.total || 0), 0) || 0;
        }

        const overallData = await fetchAll(supabase.from('sales').select('total').neq('status', 'voided'));
        const overall = overallData.reduce((sum: number, s: any) => sum + (s.total || 0), 0);
        setSalesData({ daily, weekly, monthly, overall });

        const { count } = await supabase.from('sales').select('*', { count: 'exact', head: true }).gte('created_at', monthStart.toISOString()).lte('created_at', monthEnd.toISOString()).neq('status', 'voided');
        setTotalTransactions(count || 0);

        const activeCustomerData = await fetchAll(supabase.from('sales').select('customer_id').gte('created_at', monthStart.toISOString()).lte('created_at', monthEnd.toISOString()).neq('status', 'voided').not('customer_id', 'is', null));
        setActiveCustomers(new Set(activeCustomerData.map((s: any) => s.customer_id)).size);

        const { data: pointsData } = await supabase.from('points_transactions').select('points').eq('type', 'earned').gte('created_at', monthStart.toISOString()).lte('created_at', monthEnd.toISOString());
        setPointsIssued(pointsData?.reduce((s, p) => s + (p.points || 0), 0) || 0);

        const topServicesData = await fetchAll(supabase.from('sale_items').select('item_name, total, sales!inner(status)').eq('item_type', 'service').neq('sales.status', 'voided').gte('created_at', monthStart.toISOString()).lte('created_at', monthEnd.toISOString()));
        if (topServicesData.length > 0) {
          const stats: { [key: string]: { count: number; revenue: number } } = {};
          topServicesData.forEach((item: any) => { if (!stats[item.item_name]) stats[item.item_name] = { count: 0, revenue: 0 }; stats[item.item_name].count++; stats[item.item_name].revenue += item.total || 0; });
          setTopServices(Object.entries(stats).map(([name, d]) => ({ name, count: d.count, revenue: d.revenue })).sort((a, b) => b.revenue - a.revenue).slice(0, 5));
        } else setTopServices([]);

        const monthStr = format(selectedMonth, 'yyyy-MM');
        const { data: commData } = await supabase.from('commissions').select('staff_id, amount, sale_amount, staff:staff(name)').eq('month', monthStr).neq('status', 'voided');
        if (commData && commData.length > 0) {
          const sStats: { [key: string]: { name: string; services: number; revenue: number; commission: number } } = {};
          commData.forEach((c: any) => {
            const sid = c.staff_id; const name = c.staff?.name || 'Unknown';
            if (!sStats[sid]) sStats[sid] = { name, services: 0, revenue: 0, commission: 0 };
            sStats[sid].services++; sStats[sid].revenue += c.sale_amount || 0; sStats[sid].commission += c.amount || 0;
          });
          setStaffPerformance(Object.entries(sStats).map(([id, d]) => ({ id, ...d })).sort((a, b) => b.revenue - a.revenue));
        } else setStaffPerformance([]);

        const { data: recentTxns } = await supabase.from('sales').select('id, total, status, created_at, customer_id, points_redeemed, customer:customers(name)').gte('created_at', monthStart.toISOString()).lte('created_at', monthEnd.toISOString()).order('created_at', { ascending: false }).limit(20);
        if (recentTxns) setRecentTransactions(recentTxns.map((txn: any) => ({
          id: txn.id.slice(0, 8).toUpperCase(), fullId: txn.id, customer: txn.customer?.name || 'Walk-in',
          customerId: txn.customer_id, amount: txn.total, pointsRedeemed: txn.points_redeemed || 0,
          pointsEarned: Math.floor(txn.total), date: format(new Date(txn.created_at), 'MMM d, h:mm a'), status: txn.status,
        })));

      } catch (error) { logError('Reports Page', error); } finally { setLoading(false); }
    };
    fetchReportData();
  }, [selectedMonth]);

  const handleVoidTransaction = async () => {
    if (!selectedTransaction || !user) return;
    setVoidingTransaction(true);
    try {
      const { posService } = await import("@/lib/services/pos-service");
      await posService.voidSale({
        saleId: selectedTransaction.fullId,
        voidedBy: user.id,
        voidReason: voidReason
      });

      setRecentTransactions(prev => prev.map(txn => txn.fullId === selectedTransaction.fullId ? { ...txn, status: 'voided' } : txn));
      setShowVoidModal(false);
      toast.success("Transaksi berjaya dibatalkan!");
    } catch (error: unknown) {
      const errorMsg = error instanceof Error ? error.message : "Gagal batalkan transaksi.";
      toast.error(`Ralat: ${errorMsg}`);
    }
    finally { setVoidingTransaction(false); }
  };

  const handleExportReport = () => {
    const csv = ["Laporan Kewangan HMS Salon", `Dijana: ${format(new Date(), 'yyyy-MM-dd HH:mm')}`, "", "Metrik,Nilai", `"Jumlah Jualan (Bulanan)","${formatCurrency(salesData.monthly)}"`, `"Bilangan Transaksi","${totalTransactions}"`, `"Pelanggan Aktif","${activeCustomers}"`, "", "Servis Terlaris,Tempahan,Jualan", ...topServices.map(s => `"${s.name}",${s.count},"${formatCurrency(s.revenue)}"`), "", "Prestasi Kakitangan,Servis,Jualan,Komisen", ...staffPerformance.map(s => `"${s.name}",${s.services},"${formatCurrency(s.revenue)}","${formatCurrency(s.commission)}"`)].join("\n");
    const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
    const link = document.createElement("a"); link.href = URL.createObjectURL(blob); link.setAttribute("download", `laporan-kewangan-${format(selectedMonth, 'yyyy-MM')}.csv`); document.body.appendChild(link); link.click(); document.body.removeChild(link);
  };

  return (
    <div className="min-h-screen bg-[#fcfdfd]">
      <Header title="Laporan & Analitik" subtitle="Pantau prestasi kewangan dan kakitangan anda" user={user!} />

      <div className="p-8 space-y-8 max-w-[1600px] mx-auto">
        <ReportsStatsHeader loading={loading} selectedMonth={selectedMonth} setSelectedMonth={setSelectedMonth} isCurrentMonth={isCurrentMonth} handleExportReport={handleExportReport} salesData={salesData} totalTransactions={totalTransactions} activeCustomers={activeCustomers} pointsIssued={pointsIssued} />

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <FinancialOverview loading={loading} isCurrentMonth={isCurrentMonth} selectedMonth={selectedMonth} salesData={salesData} totalTransactions={totalTransactions} />
          <RecentTransactionsList loading={loading} recentTransactions={recentTransactions} isAdmin={isAdmin} setSelectedTransaction={setSelectedTransaction} setShowVoidModal={setShowVoidModal} />
        </div>

        <ServicePerformance loading={loading} topServices={topServices} staffPerformance={staffPerformance} setShowFullReport={setShowFullReport} />
      </div>

      <ReportsModals
        showFullReport={showFullReport} setShowFullReport={setShowFullReport} staffPerformance={staffPerformance} handleExportReport={handleExportReport}
        showVoidModal={showVoidModal} setShowVoidModal={setShowVoidModal} selectedTransaction={selectedTransaction} voidReason={voidReason} setVoidReason={setVoidReason} voidingTransaction={voidingTransaction} handleVoidTransaction={handleVoidTransaction}
      />
    </div>
  );
}
