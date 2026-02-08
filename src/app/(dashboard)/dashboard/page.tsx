"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import {
  DollarSign,
  Calendar,
  TrendingUp,
  Gift,
  MoreVertical,
  Loader2,
} from "lucide-react";
import { StatCard, Card, CardContent, CardHeader, CardTitle, Avatar, Badge, Button } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { formatCurrency } from "@/lib/utils";
import { Header } from "@/components/layout/header";
import { createClient } from "@/lib/supabase/client";
import { format, startOfDay, endOfDay, startOfWeek, endOfWeek, startOfMonth, subDays } from "date-fns";

interface DashboardStats {
  salesToday: number;
  salesYesterday: number;
  bookingsToday: number;
  bookingsAvg: number;
  monthlyCommission: number;
  lastMonthCommission: number;
  pointsIssued: number;
  lastMonthPoints: number;
}

interface WeeklyData {
  day: string;
  value: number;
}

interface TopService {
  name: string;
  count: number;
}

interface UpcomingAppointment {
  id: string;
  customer: string;
  service: string;
  time: string;
  status: string;
}

export default function DashboardPage() {
  const { user } = useAuthStore();
  const [selectedPeriod, setSelectedPeriod] = useState("Last 7 Days");
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState<DashboardStats>({
    salesToday: 0,
    salesYesterday: 0,
    bookingsToday: 0,
    bookingsAvg: 0,
    monthlyCommission: 0,
    lastMonthCommission: 0,
    pointsIssued: 0,
    lastMonthPoints: 0,
  });
  const [weeklyData, setWeeklyData] = useState<WeeklyData[]>([]);
  const [topServices, setTopServices] = useState<TopService[]>([]);
  const [upcomingAppointments, setUpcomingAppointments] = useState<UpcomingAppointment[]>([]);

  useEffect(() => {
    const fetchDashboardData = async () => {
      setLoading(true);
      const supabase = createClient();
      const today = new Date();
      const yesterday = subDays(today, 1);
      const startOfCurrentMonth = startOfMonth(today);
      const startOfLastMonth = startOfMonth(subDays(startOfCurrentMonth, 1));

      try {
        let staffId = null;

        // If staff, get their staff ID
        if (user?.role === "staff") {
          const { data: staffData } = await supabase
            .from('staff')
            .select('id')
            .eq('user_id', user.id)
            .single();
          staffId = staffData?.id;
        }

        // Fetch sales (Global for Admin, Personal for Staff)
        let salesQuery = supabase
          .from('sales')
          .select('total')
          .gte('created_at', startOfDay(today).toISOString())
          .lte('created_at', endOfDay(today).toISOString())
          .eq('status', 'completed');

        if (user?.role === "staff") {
          salesQuery = salesQuery.eq('created_by', user.id); // Assuming created_by is user_id
        }

        const { data: todaySales } = await salesQuery;
        const salesToday = todaySales?.reduce((sum, s) => sum + (s.total || 0), 0) || 0;

        // Fetch yesterday's sales (Similar logic)
        let yesterdaySalesQuery = supabase
          .from('sales')
          .select('total')
          .gte('created_at', startOfDay(yesterday).toISOString())
          .lte('created_at', endOfDay(yesterday).toISOString())
          .eq('status', 'completed');

        if (user?.role === "staff") {
          yesterdaySalesQuery = yesterdaySalesQuery.eq('created_by', user.id);
        }

        const { data: yesterdaySales } = await yesterdaySalesQuery;
        const salesYesterday = yesterdaySales?.reduce((sum, s) => sum + (s.total || 0), 0) || 0;

        // Fetch bookings (Global or Staff specific)
        let bookingsQuery = supabase
          .from('bookings')
          .select('*', { count: 'exact', head: true })
          .eq('booking_date', format(today, 'yyyy-MM-dd'));

        if (user?.role === "staff" && staffId) {
          bookingsQuery = bookingsQuery.eq('staff_id', staffId);
        }

        const { count: bookingsToday } = await bookingsQuery;

        // Fetch this month's commissions
        const currentMonth = format(today, 'yyyy-MM');
        let commissionQuery = supabase
          .from('commissions')
          .select('commission_amount')
          .eq('month', currentMonth);

        if (user?.role === "staff" && staffId) {
          commissionQuery = commissionQuery.eq('staff_id', staffId);
        }

        const { data: monthlyCommissions } = await commissionQuery;
        const monthlyCommission = monthlyCommissions?.reduce((sum, c) => sum + (c.commission_amount || 0), 0) || 0;

        // Fetch points (Only relevant for Admin overview really, but Staff might want to see what they issued if we track that)
        // For now, let's keep points global or hide it for staff
        const { data: pointsData } = await supabase
          .from('points_transactions')
          .select('points')
          .eq('type', 'earned')
          .gte('created_at', startOfCurrentMonth.toISOString());

        const pointsIssued = pointsData?.reduce((sum, p) => sum + (p.points || 0), 0) || 0;

        setStats({
          salesToday,
          salesYesterday,
          bookingsToday: bookingsToday || 0,
          bookingsAvg: 10, // Could calculate average from historical data
          monthlyCommission,
          lastMonthCommission: 0, // Could fetch from previous month
          pointsIssued,
          lastMonthPoints: 0, // Could fetch from previous month
        });

        // Fetch weekly sales data
        const weekStart = startOfWeek(today, { weekStartsOn: 1 });
        const weekEnd = endOfWeek(today, { weekStartsOn: 1 });
        let weeklySalesQuery = supabase
          .from('sales')
          .select('total, created_at')
          .gte('created_at', weekStart.toISOString())
          .lte('created_at', weekEnd.toISOString())
          .eq('status', 'completed');

        if (user?.role === "staff") {
          weeklySalesQuery = weeklySalesQuery.eq('created_by', user.id);
        }

        const { data: weeklySalesData } = await weeklySalesQuery;

        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        const weeklyStats: WeeklyData[] = days.map((day, index) => {
          const dayDate = new Date(weekStart);
          dayDate.setDate(dayDate.getDate() + index);
          const dayStr = format(dayDate, 'yyyy-MM-dd');

          const dayTotal = weeklySalesData?.filter(s => {
            const saleDate = format(new Date(s.created_at), 'yyyy-MM-dd');
            return saleDate === dayStr;
          }).reduce((sum, s) => sum + (s.total || 0), 0) || 0;

          return { day, value: dayTotal };
        });

        setWeeklyData(weeklyStats);

        // Fetch top services from sale_items
        // Note: Sale items don't strictly have 'created_by', we link via sale_id -> sale.created_by
        // For simplicity, we might skip precise top service filtering for staff unless we join.
        // Let's just fetch global for now or skip if simple join is hard. 
        // Actually, we can just leave it global or empty for staff if getting complex.
        // Let's try to keep it simple. If staff, maybe we don't show "Top Services" widget in My Day anyway?
        // Correct, "My Day" doesn't show Top Services. So we can leave this as is (it fetches global but won't be used).
        const { data: topServicesData } = await supabase
          .from('sale_items')
          .select('item_name')
          .eq('item_type', 'service')
          .gte('created_at', startOfCurrentMonth.toISOString());

        if (topServicesData) {
          const serviceCounts: { [key: string]: number } = {};
          topServicesData.forEach(item => {
            serviceCounts[item.item_name] = (serviceCounts[item.item_name] || 0) + 1;
          });

          const sorted = Object.entries(serviceCounts)
            .map(([name, count]) => ({ name, count }))
            .sort((a, b) => b.count - a.count)
            .slice(0, 5);

          setTopServices(sorted);
        }

        // Fetch upcoming appointments
        let upcomingQuery = supabase
          .from('bookings')
          .select(`
            id,
            booking_date,
            start_time,
            status,
            customer:customers(name),
            service:services(name)
          `)
          .gte('booking_date', format(today, 'yyyy-MM-dd'))
          .in('status', ['pending', 'confirmed'])
          .order('booking_date', { ascending: true })
          .order('start_time', { ascending: true })
          .limit(5);

        if (user?.role === "staff" && staffId) {
          upcomingQuery = upcomingQuery.eq('staff_id', staffId);
        }

        const { data: upcomingData } = await upcomingQuery;

        if (upcomingData) {
          const appointments = upcomingData.map((apt: any) => {
            const bookingDate = new Date(apt.booking_date);
            const isToday = format(bookingDate, 'yyyy-MM-dd') === format(today, 'yyyy-MM-dd');
            const isTomorrow = format(bookingDate, 'yyyy-MM-dd') === format(subDays(today, -1), 'yyyy-MM-dd');

            return {
              id: apt.id,
              customer: apt.customer?.name || 'Customer',
              service: apt.service?.name || 'Service',
              time: isToday ? `Today, ${apt.start_time.slice(0, 5)}` :
                isTomorrow ? `Tomorrow, ${apt.start_time.slice(0, 5)}` :
                  `${format(bookingDate, 'MMM d')}, ${apt.start_time.slice(0, 5)}`,
              status: apt.status,
            };
          });
          setUpcomingAppointments(appointments);
        }

      } catch (error) {
        console.error("Error fetching dashboard data:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchDashboardData();
  }, []);

  const maxValue = Math.max(...weeklyData.map((d) => d.value), 1);

  const salesChange = stats.salesYesterday > 0
    ? ((stats.salesToday - stats.salesYesterday) / stats.salesYesterday) * 100
    : 0;
  const bookingsChange = stats.bookingsAvg > 0
    ? ((stats.bookingsToday - stats.bookingsAvg) / stats.bookingsAvg) * 100
    : 0;

  // Staff "My Day" View
  if (user?.role === "staff") {
    return (
      <div className="min-h-screen">
        <Header title={`Good ${new Date().getHours() < 12 ? "morning" : "afternoon"}, ${user.name.split(" ")[0]}`} subtitle="Your daily overview" user={user} />

        <div className="p-6 space-y-6">
          {/* Quick Stats */}
          <div className="grid grid-cols-2 gap-4">
            <Card>
              <CardContent className="p-6 flex items-center justify-between">
                <div>
                  <p className="text-sm text-[var(--muted)]">Your Sales</p>
                  <p className="text-2xl font-bold">{formatCurrency(stats.salesToday)}</p>
                </div>
                <div className="h-10 w-10 rounded-full bg-green-100 flex items-center justify-center text-green-600">
                  <DollarSign className="h-5 w-5" />
                </div>
              </CardContent>
            </Card>
            <Card>
              <CardContent className="p-6 flex items-center justify-between">
                <div>
                  <p className="text-sm text-[var(--muted)]">Appointments</p>
                  <p className="text-2xl font-bold">{upcomingAppointments.filter(a => a.time.includes("Today")).length}</p>
                </div>
                <div className="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600">
                  <Calendar className="h-5 w-5" />
                </div>
              </CardContent>
            </Card>
          </div>

          {/* Today's Schedule */}
          <Card className="flex-1">
            <CardHeader>
              <div className="flex items-center justify-between">
                <CardTitle>Today's Schedule</CardTitle>
                <Link href="/appointments">
                  <Button variant="ghost" size="sm" className="text-[var(--primary)]">View Calendar</Button>
                </Link>
              </div>
            </CardHeader>
            <CardContent>
              {loading ? (
                <div className="py-8 text-center text-[var(--muted)]">Loading schedule...</div>
              ) : upcomingAppointments.filter(a => a.time.includes("Today")).length === 0 ? (
                <div className="text-center py-12 text-[var(--muted)]">
                  <p className="mb-2">🎉</p>
                  <p>No appointments scheduled for today.</p>
                </div>
              ) : (
                <div className="space-y-4">
                  {upcomingAppointments.filter(a => a.time.includes("Today")).map((apt) => (
                    <div key={apt.id} className="flex gap-4 items-start p-4 border border-[var(--border)] rounded-xl bg-[var(--background)]">
                      <div className="w-16 text-center">
                        <p className="font-bold text-[var(--primary)]">{apt.time.split(", ")[1]}</p>
                      </div>
                      <div className="flex-1">
                        <h4 className="font-bold">{apt.customer}</h4>
                        <p className="text-sm text-[var(--muted)]">{apt.service}</p>
                      </div>
                      <Badge variant={apt.status === "confirmed" ? "success" : "warning"}>{apt.status}</Badge>
                    </div>
                  ))}
                </div>
              )}
            </CardContent>
          </Card>

          {/* Quick Actions */}
          <div className="grid grid-cols-2 gap-4">
            <Link href="/pos" className="contents">
              <Button size="lg" className="w-full h-14 text-lg">
                Make a Sale
              </Button>
            </Link>
            <Link href="/appointments" className="contents">
              <Button variant="outline" size="lg" className="w-full h-14 text-lg">
                New Booking
              </Button>
            </Link>
          </div>
        </div>
      </div>
    );
  }

  // Admin / Manager View
  return (
    <div className="min-h-screen">
      {/* Header */}
      <Header
        title="Dashboard Overview"
        user={user!}
      />

      <div className="p-6 space-y-6">
        {/* Stats Row */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          <StatCard
            title="Sales Today"
            value={loading ? "..." : formatCurrency(stats.salesToday)}
            change={salesChange}
            changeLabel="vs yesterday"
            icon={DollarSign}
          />
          <StatCard
            title="Bookings Today"
            value={loading ? "..." : stats.bookingsToday}
            change={bookingsChange}
            changeLabel="vs avg"
            icon={Calendar}
          />
          <StatCard
            title="Monthly Commission"
            value={loading ? "..." : formatCurrency(stats.monthlyCommission)}
            change={0}
            changeLabel="this month"
            icon={TrendingUp}
          />
          <StatCard
            title="Points Issued"
            value={loading ? "..." : `${stats.pointsIssued} pts`}
            change={0}
            changeLabel="this month"
            icon={Gift}
          />
        </div>

        {/* Business Insights */}
        <div className="flex items-center justify-between">
          <h2 className="text-xl font-bold">Business Insights</h2>
          <div className="flex items-center gap-2">
            <Button variant="outline" size="sm">{selectedPeriod}</Button>
            <Button variant="outline" size="sm">Filter</Button>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {/* Sales Chart */}
          <Card>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm text-[var(--muted)]">Sales Performance</p>
                  <div className="flex items-baseline gap-2 mt-1">
                    <span className="text-3xl font-bold">
                      {loading ? "..." : formatCurrency(weeklyData.reduce((sum, d) => sum + d.value, 0))}
                    </span>
                    <span className="text-sm text-[var(--muted)]">This Week</span>
                  </div>
                </div>
              </div>
            </CardHeader>
            <CardContent>
              {loading ? (
                <div className="h-40 flex items-center justify-center">
                  <Loader2 className="h-6 w-6 animate-spin text-[var(--muted)]" />
                </div>
              ) : (
                <div className="flex items-end justify-between h-40 gap-2">
                  {weeklyData.map((item) => (
                    <div key={item.day} className="flex-1 flex flex-col items-center gap-2">
                      <div
                        className="w-full bg-[var(--primary-light)] rounded-t-lg transition-all hover:bg-[var(--primary)]"
                        style={{ height: `${maxValue > 0 ? (item.value / maxValue) * 100 : 5}%`, minHeight: '4px' }}
                      />
                      <span className="text-xs text-[var(--muted)]">{item.day}</span>
                    </div>
                  ))}
                </div>
              )}
            </CardContent>
          </Card>

          {/* Top Services */}
          <Card>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm text-[var(--muted)]">Top Performed Services</p>
                  <div className="flex items-baseline gap-2 mt-1">
                    <span className="text-3xl font-bold">
                      {loading ? "..." : `Total ${topServices.reduce((sum, s) => sum + s.count, 0)}`}
                    </span>
                    <span className="text-sm text-[var(--muted)]">This Month</span>
                  </div>
                </div>
              </div>
            </CardHeader>
            <CardContent>
              {loading ? (
                <div className="h-40 flex items-center justify-center">
                  <Loader2 className="h-6 w-6 animate-spin text-[var(--muted)]" />
                </div>
              ) : topServices.length === 0 ? (
                <div className="h-40 flex items-center justify-center text-[var(--muted)]">
                  No services data yet
                </div>
              ) : (
                <div className="space-y-4">
                  {topServices.map((service) => (
                    <div key={service.name} className="flex items-center gap-3">
                      <div className="flex-1">
                        <div className="flex items-center justify-between mb-1">
                          <span className="text-sm font-medium">{service.name}</span>
                          <span className="text-sm text-[var(--muted)]">{service.count}</span>
                        </div>
                        <div className="h-2 bg-[var(--secondary)] rounded-full overflow-hidden">
                          <div
                            className="h-full bg-[var(--primary-light)] rounded-full"
                            style={{ width: `${topServices[0].count > 0 ? (service.count / topServices[0].count) * 100 : 0}%` }}
                          />
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </CardContent>
          </Card>
        </div>

        {/* Upcoming Appointments */}
        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <CardTitle>Upcoming Appointments</CardTitle>
              <Link href="/appointments">
                <Button variant="ghost" className="text-[var(--primary)]">
                  View Schedule
                </Button>
              </Link>
            </div>
          </CardHeader>
          <CardContent>
            {loading ? (
              <div className="py-8 flex items-center justify-center">
                <Loader2 className="h-6 w-6 animate-spin text-[var(--muted)]" />
              </div>
            ) : upcomingAppointments.length === 0 ? (
              <div className="py-8 text-center text-[var(--muted)]">
                No upcoming appointments
              </div>
            ) : (
              <div className="space-y-4">
                {upcomingAppointments.map((apt) => (
                  <div
                    key={apt.id}
                    className="flex items-center justify-between p-4 bg-[var(--secondary)] rounded-xl"
                  >
                    <div className="flex items-center gap-4">
                      <Avatar name={apt.customer} size="lg" />
                      <div>
                        <p className="font-medium">{apt.customer}</p>
                        <p className="text-sm text-[var(--muted)]">{apt.service}</p>
                      </div>
                    </div>
                    <div className="flex items-center gap-4">
                      <div className="text-right">
                        <p className="text-sm font-medium">{apt.time}</p>
                        <Badge variant={apt.status === "confirmed" ? "success" : "warning"}>
                          {apt.status}
                        </Badge>
                      </div>
                      <button className="p-2 hover:bg-[var(--card)] rounded-lg">
                        <MoreVertical className="h-5 w-5 text-[var(--muted)]" />
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
