"use client";

import { useState, useEffect } from "react";
import {
  Calendar,
  Download,
  TrendingUp,
  DollarSign,
  Users,
  ShoppingCart,
  Gift,
  X,
  Loader2,
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent, StatCard, Badge } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { formatCurrency } from "@/lib/utils";
import { format, startOfDay, endOfDay, startOfWeek, startOfMonth, endOfMonth, subDays } from "date-fns";
import { createClient } from "@/lib/supabase/client";

interface SalesData {
  daily: number;
  weekly: number;
  monthly: number;
}

interface TopService {
  name: string;
  count: number;
  revenue: number;
}

interface StaffPerformance {
  id: string;
  name: string;
  services: number;
  revenue: number;
  commission: number;
}

interface RecentTransaction {
  id: string;
  customer: string;
  amount: number;
  date: string;
  status: string;
}

export default function ReportsPage() {
  const { user } = useAuthStore();
  const [dateRange, setDateRange] = useState("This Month");
  const [showFullReport, setShowFullReport] = useState(false);
  const [loading, setLoading] = useState(true);
  const [salesData, setSalesData] = useState<SalesData>({ daily: 0, weekly: 0, monthly: 0 });
  const [topServices, setTopServices] = useState<TopService[]>([]);
  const [staffPerformance, setStaffPerformance] = useState<StaffPerformance[]>([]);
  const [recentTransactions, setRecentTransactions] = useState<RecentTransaction[]>([]);
  const [totalTransactions, setTotalTransactions] = useState(0);
  const [activeCustomers, setActiveCustomers] = useState(0);
  const [pointsIssued, setPointsIssued] = useState(0);

  useEffect(() => {
    const fetchReportData = async () => {
      setLoading(true);
      const supabase = createClient();
      const today = new Date();
      const monthStart = startOfMonth(today);
      const monthEnd = endOfMonth(today);
      const weekStart = startOfWeek(today, { weekStartsOn: 1 });

      try {
        // Fetch daily sales
        const { data: dailySalesData } = await supabase
          .from('sales')
          .select('total')
          .gte('created_at', startOfDay(today).toISOString())
          .lte('created_at', endOfDay(today).toISOString())
          .eq('status', 'completed');

        const daily = dailySalesData?.reduce((sum, s) => sum + (s.total || 0), 0) || 0;

        // Fetch weekly sales
        const { data: weeklySalesData } = await supabase
          .from('sales')
          .select('total')
          .gte('created_at', weekStart.toISOString())
          .eq('status', 'completed');

        const weekly = weeklySalesData?.reduce((sum, s) => sum + (s.total || 0), 0) || 0;

        // Fetch monthly sales
        const { data: monthlySalesData } = await supabase
          .from('sales')
          .select('total')
          .gte('created_at', monthStart.toISOString())
          .lte('created_at', monthEnd.toISOString())
          .eq('status', 'completed');

        const monthly = monthlySalesData?.reduce((sum, s) => sum + (s.total || 0), 0) || 0;
        setSalesData({ daily, weekly, monthly });

        // Fetch total transactions count this month
        const { count: txnCount } = await supabase
          .from('sales')
          .select('*', { count: 'exact', head: true })
          .gte('created_at', monthStart.toISOString())
          .eq('status', 'completed');

        setTotalTransactions(txnCount || 0);

        // Fetch active customers (who made purchases this month)
        const { data: activeCustomerData } = await supabase
          .from('sales')
          .select('customer_id')
          .gte('created_at', monthStart.toISOString())
          .eq('status', 'completed')
          .not('customer_id', 'is', null);

        const uniqueCustomers = new Set(activeCustomerData?.map(s => s.customer_id));
        setActiveCustomers(uniqueCustomers.size);

        // Fetch points issued this month
        const { data: pointsData } = await supabase
          .from('points_transactions')
          .select('points')
          .eq('type', 'earned')
          .gte('created_at', monthStart.toISOString());

        const points = pointsData?.reduce((sum, p) => sum + (p.points || 0), 0) || 0;
        setPointsIssued(points);

        // Fetch top services from sale_items
        const { data: topServicesData } = await supabase
          .from('sale_items')
          .select('item_name, total')
          .eq('item_type', 'service')
          .gte('created_at', monthStart.toISOString());

        if (topServicesData) {
          const serviceStats: { [key: string]: { count: number; revenue: number } } = {};
          topServicesData.forEach(item => {
            if (!serviceStats[item.item_name]) {
              serviceStats[item.item_name] = { count: 0, revenue: 0 };
            }
            serviceStats[item.item_name].count++;
            serviceStats[item.item_name].revenue += item.total || 0;
          });

          const sorted = Object.entries(serviceStats)
            .map(([name, data]) => ({ name, count: data.count, revenue: data.revenue }))
            .sort((a, b) => b.revenue - a.revenue)
            .slice(0, 5);

          setTopServices(sorted);
        }

        // Fetch staff performance from commissions
        const currentMonth = format(today, 'yyyy-MM');
        const { data: commissionData } = await supabase
          .from('commissions')
          .select(`
            staff_id,
            commission_amount,
            sale_amount,
            staff:staff(id, name)
          `)
          .eq('month', currentMonth);

        if (commissionData) {
          const staffStats: { [key: string]: { name: string; services: number; revenue: number; commission: number } } = {};
          commissionData.forEach((c: any) => {
            const staffId = c.staff_id;
            const staffName = c.staff?.name || 'Unknown';
            if (!staffStats[staffId]) {
              staffStats[staffId] = { name: staffName, services: 0, revenue: 0, commission: 0 };
            }
            staffStats[staffId].services++;
            staffStats[staffId].revenue += c.sale_amount || 0;
            staffStats[staffId].commission += c.commission_amount || 0;
          });

          const sorted = Object.entries(staffStats)
            .map(([id, data]) => ({ id, ...data }))
            .sort((a, b) => b.revenue - a.revenue);

          setStaffPerformance(sorted);
        }

        // Fetch recent transactions
        const { data: recentTxns } = await supabase
          .from('sales')
          .select(`
            id,
            total,
            status,
            created_at,
            customer:customers(name)
          `)
          .order('created_at', { ascending: false })
          .limit(10);

        if (recentTxns) {
          const transactions = recentTxns.map((txn: any) => {
            const txnDate = new Date(txn.created_at);
            const isToday = format(txnDate, 'yyyy-MM-dd') === format(today, 'yyyy-MM-dd');

            return {
              id: txn.id.slice(0, 8).toUpperCase(),
              customer: txn.customer?.name || 'Walk-in',
              amount: txn.total,
              date: isToday
                ? `Today, ${format(txnDate, 'h:mm a')}`
                : format(txnDate, 'MMM d, h:mm a'),
              status: txn.status,
            };
          });
          setRecentTransactions(transactions);
        }

      } catch (error) {
        console.error("Error fetching report data:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchReportData();
  }, [dateRange]);

  const handleExportReport = () => {
    // Generate CSV content for the sales report
    const csvContent = [
      "HMS Salon Financial Report",
      `Generated: ${format(new Date(), 'yyyy-MM-dd HH:mm')}`,
      "",
      "Metric,Value",
      `"Total Revenue (Monthly)","${formatCurrency(salesData.monthly)}"`,
      `"Total Transactions","${totalTransactions}"`,
      `"Active Customers","${activeCustomers}"`,
      `"Points Issued","${pointsIssued} pts"`,
      "",
      "Top Services,Bookings,Revenue",
      ...topServices.map(s => `"${s.name}",${s.count},"${formatCurrency(s.revenue)}"`),
      "",
      "Staff Performance,Services,Revenue,Commission",
      ...staffPerformance.map(s => `"${s.name}",${s.services},"${formatCurrency(s.revenue)}","${formatCurrency(s.commission)}"`)
    ].join("\n");

    // Create and download file
    const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
    const link = document.createElement("a");
    const url = URL.createObjectURL(blob);
    link.setAttribute("href", url);
    link.setAttribute("download", `financial-report-${format(new Date(), 'yyyy-MM-dd')}.csv`);
    link.style.visibility = 'hidden';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  return (
    <div className="min-h-screen">
      <Header title="Financial Reports Overview" user={user!} />

      <div className="p-6 space-y-6">
        {/* Date Filter */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Calendar className="h-5 w-5 text-[var(--muted)]" />
            <select
              value={dateRange}
              onChange={(e) => setDateRange(e.target.value)}
              className="bg-[var(--card)] border border-[var(--border)] rounded-lg px-4 py-2"
            >
              <option>Today</option>
              <option>This Week</option>
              <option>This Month</option>
              <option>Last Month</option>
              <option>Custom Range</option>
            </select>
          </div>
          <Button variant="outline" onClick={handleExportReport}>
            <Download className="h-4 w-4 mr-2" />
            Export Report
          </Button>
        </div>

        {/* Stats Row */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          <StatCard
            title="Total Revenue"
            value={loading ? "..." : formatCurrency(salesData.monthly)}
            change={0}
            changeLabel="this month"
            icon={DollarSign}
          />
          <StatCard
            title="Total Transactions"
            value={loading ? "..." : totalTransactions.toLocaleString()}
            change={0}
            changeLabel="this month"
            icon={ShoppingCart}
          />
          <StatCard
            title="Active Customers"
            value={loading ? "..." : activeCustomers.toLocaleString()}
            change={0}
            changeLabel="this month"
            icon={Users}
          />
          <StatCard
            title="Points Issued"
            value={loading ? "..." : `${pointsIssued.toLocaleString()} pts`}
            change={0}
            changeLabel="this month"
            icon={Gift}
          />
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {/* Sales Chart */}
          <Card>
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="font-bold text-lg">Sales Overview</h3>
              </div>
              {loading ? (
                <div className="py-12 flex items-center justify-center">
                  <Loader2 className="h-6 w-6 animate-spin text-[var(--muted)]" />
                </div>
              ) : (
                <div className="space-y-4">
                  <div className="flex items-center justify-between p-4 bg-[var(--secondary)] rounded-xl">
                    <div>
                      <p className="text-sm text-[var(--muted)]">Today</p>
                      <p className="text-2xl font-bold">{formatCurrency(salesData.daily)}</p>
                    </div>
                    <div className="flex items-center gap-1 text-[var(--muted)]">
                      <TrendingUp className="h-4 w-4" />
                      <span className="text-sm">Daily</span>
                    </div>
                  </div>
                  <div className="flex items-center justify-between p-4 bg-[var(--secondary)] rounded-xl">
                    <div>
                      <p className="text-sm text-[var(--muted)]">This Week</p>
                      <p className="text-2xl font-bold">{formatCurrency(salesData.weekly)}</p>
                    </div>
                    <div className="flex items-center gap-1 text-[var(--muted)]">
                      <TrendingUp className="h-4 w-4" />
                      <span className="text-sm">Weekly</span>
                    </div>
                  </div>
                  <div className="flex items-center justify-between p-4 bg-[var(--primary-light)] rounded-xl">
                    <div>
                      <p className="text-sm text-[var(--primary-dark)]">This Month</p>
                      <p className="text-2xl font-bold text-[var(--primary-dark)]">{formatCurrency(salesData.monthly)}</p>
                    </div>
                    <div className="flex items-center gap-1 text-[var(--primary-dark)]">
                      <TrendingUp className="h-4 w-4" />
                      <span className="text-sm">Monthly</span>
                    </div>
                  </div>
                </div>
              )}
            </CardContent>
          </Card>

          {/* Top Services */}
          <Card>
            <CardContent className="p-6">
              <h3 className="font-bold text-lg mb-6">Top Performing Services</h3>
              {loading ? (
                <div className="py-12 flex items-center justify-center">
                  <Loader2 className="h-6 w-6 animate-spin text-[var(--muted)]" />
                </div>
              ) : topServices.length === 0 ? (
                <div className="py-12 text-center text-[var(--muted)]">
                  No service data yet
                </div>
              ) : (
                <div className="space-y-4">
                  {topServices.map((service, idx) => (
                    <div key={service.name} className="flex items-center gap-4">
                      <span className="text-lg font-bold text-[var(--muted)] w-6">#{idx + 1}</span>
                      <div className="flex-1">
                        <p className="font-medium">{service.name}</p>
                        <p className="text-sm text-[var(--muted)]">{service.count} sales</p>
                      </div>
                      <p className="font-bold text-[var(--primary)]">{formatCurrency(service.revenue)}</p>
                    </div>
                  ))}
                </div>
              )}
            </CardContent>
          </Card>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {/* Staff Commission */}
          <Card>
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="font-bold text-lg">Staff Commission Summary</h3>
                <Button variant="outline" size="sm" onClick={() => setShowFullReport(true)}>View Full Report</Button>
              </div>
              {loading ? (
                <div className="py-12 flex items-center justify-center">
                  <Loader2 className="h-6 w-6 animate-spin text-[var(--muted)]" />
                </div>
              ) : staffPerformance.length === 0 ? (
                <div className="py-12 text-center text-[var(--muted)]">
                  No commission data yet
                </div>
              ) : (
                <div className="overflow-x-auto">
                  <table className="w-full">
                    <thead>
                      <tr className="border-b border-[var(--border)]">
                        <th className="text-left py-2 text-xs font-medium text-[var(--muted)] uppercase">Staff</th>
                        <th className="text-left py-2 text-xs font-medium text-[var(--muted)] uppercase">Services</th>
                        <th className="text-left py-2 text-xs font-medium text-[var(--muted)] uppercase">Revenue</th>
                        <th className="text-left py-2 text-xs font-medium text-[var(--muted)] uppercase">Commission</th>
                      </tr>
                    </thead>
                    <tbody>
                      {staffPerformance.map((staff) => (
                        <tr key={staff.id} className="border-b border-[var(--border)]">
                          <td className="py-3 font-medium">{staff.name}</td>
                          <td className="py-3">{staff.services}</td>
                          <td className="py-3">{formatCurrency(staff.revenue)}</td>
                          <td className="py-3 font-bold text-[var(--success)]">{formatCurrency(staff.commission)}</td>
                        </tr>
                      ))}
                    </tbody>
                    <tfoot>
                      <tr className="font-bold">
                        <td className="py-3">Total</td>
                        <td className="py-3">{staffPerformance.reduce((s, p) => s + p.services, 0)}</td>
                        <td className="py-3">{formatCurrency(staffPerformance.reduce((s, p) => s + p.revenue, 0))}</td>
                        <td className="py-3 text-[var(--success)]">{formatCurrency(staffPerformance.reduce((s, p) => s + p.commission, 0))}</td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              )}
            </CardContent>
          </Card>

          {/* Recent Transactions */}
          <Card>
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="font-bold text-lg">Recent Transactions</h3>
              </div>
              {loading ? (
                <div className="py-12 flex items-center justify-center">
                  <Loader2 className="h-6 w-6 animate-spin text-[var(--muted)]" />
                </div>
              ) : recentTransactions.length === 0 ? (
                <div className="py-12 text-center text-[var(--muted)]">
                  No transactions yet
                </div>
              ) : (
                <div className="space-y-3">
                  {recentTransactions.map((txn) => (
                    <div key={txn.id} className="flex items-center justify-between p-3 bg-[var(--secondary)] rounded-xl">
                      <div>
                        <p className="font-medium">{txn.customer}</p>
                        <p className="text-xs text-[var(--muted)]">{txn.id} • {txn.date}</p>
                      </div>
                      <div className="text-right">
                        <p className={`font-bold ${txn.status === "voided" ? "text-[var(--error)]" : ""}`}>
                          {txn.status === "voided" ? "-" : ""}{formatCurrency(txn.amount)}
                        </p>
                        <Badge variant={txn.status === "completed" ? "success" : "error"}>
                          {txn.status}
                        </Badge>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </CardContent>
          </Card>
        </div>
      </div>

      {/* Full Report Modal */}
      {showFullReport && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4">
          <Card className="w-full max-w-4xl max-h-[90vh] overflow-auto">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-xl font-bold">Full Staff Commission Report</h3>
                <button
                  onClick={() => setShowFullReport(false)}
                  className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>

              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b border-[var(--border)]">
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase">Staff Name</th>
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase">Services Count</th>
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase">Total Revenue</th>
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase">Commission Rate</th>
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase">Commission Earned</th>
                      <th className="text-left py-3 px-4 text-xs font-medium text-[var(--muted)] uppercase">Avg per Service</th>
                    </tr>
                  </thead>
                  <tbody>
                    {staffPerformance.map((staff) => (
                      <tr key={staff.name} className="border-b border-[var(--border)] hover:bg-[var(--secondary)]">
                        <td className="py-4 px-4 font-medium">{staff.name}</td>
                        <td className="py-4 px-4">{staff.services}</td>
                        <td className="py-4 px-4">{formatCurrency(staff.revenue)}</td>
                        <td className="py-4 px-4">15%</td>
                        <td className="py-4 px-4 font-bold text-[var(--success)]">{formatCurrency(staff.commission)}</td>
                        <td className="py-4 px-4">{formatCurrency(staff.revenue / staff.services)}</td>
                      </tr>
                    ))}
                  </tbody>
                  <tfoot className="bg-[var(--secondary)]">
                    <tr className="font-bold">
                      <td className="py-4 px-4">Total</td>
                      <td className="py-4 px-4">{staffPerformance.reduce((s, p) => s + p.services, 0)}</td>
                      <td className="py-4 px-4">{formatCurrency(staffPerformance.reduce((s, p) => s + p.revenue, 0))}</td>
                      <td className="py-4 px-4">-</td>
                      <td className="py-4 px-4 text-[var(--success)]">{formatCurrency(staffPerformance.reduce((s, p) => s + p.commission, 0))}</td>
                      <td className="py-4 px-4">-</td>
                    </tr>
                  </tfoot>
                </table>
              </div>

              <div className="flex justify-end gap-3 mt-6">
                <Button variant="outline" onClick={() => setShowFullReport(false)}>Close</Button>
                <Button onClick={handleExportReport}>
                  <Download className="h-4 w-4 mr-2" />
                  Export as CSV
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  );
}
