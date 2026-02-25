"use client";

import { useState, useEffect } from "react";
import { format, startOfDay, endOfDay, startOfWeek, endOfWeek, startOfMonth, subDays } from "date-fns";
import { useAuthStore } from "@/lib/store/auth-store";
import { Header } from "@/components/layout/header";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui";
import { logError } from "@/lib/utils/error-logger";

// Sub-components
import { StatCardsHeader } from "./components/StatCardsHeader";
import { SalesPerformanceChart } from "./components/SalesPerformanceChart";
import { TopServicesList } from "./components/TopServicesList";
import { UpcomingAppointmentsList } from "./components/UpcomingAppointmentsList";
import { StaffMyDayView } from "./components/StaffMyDayView";

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
  const [selectedPeriod, setSelectedPeriod] = useState("Minggu Ini");
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
        const fetchSales = async (date: Date, userId?: string) => {
          let query = supabase
            .from('sales')
            .select('total')
            .gte('created_at', startOfDay(date).toISOString())
            .lte('created_at', endOfDay(date).toISOString())
            .neq('status', 'voided');

          if (userId) query = query.eq('created_by', userId);
          const { data } = await query;
          return data?.reduce((sum, s) => sum + (s.total || 0), 0) || 0;
        };

        const salesToday = await fetchSales(today, user?.role === "staff" ? user.id : undefined);
        const salesYesterday = await fetchSales(yesterday, user?.role === "staff" ? user.id : undefined);

        // Fetch bookings
        let bookingsQuery = supabase
          .from('bookings')
          .select('*', { count: 'exact', head: true })
          .eq('booking_date', format(today, 'yyyy-MM-dd'));

        if (user?.role === "staff" && staffId) {
          bookingsQuery = bookingsQuery.eq('staff_id', staffId);
        }

        const { count: bookingsToday } = await bookingsQuery;

        // Fetch commissions
        const currentMonth = format(today, 'yyyy-MM');
        let commissionQuery = supabase
          .from('commissions')
          .select('amount')
          .eq('month', currentMonth)
          .neq('status', 'voided');

        if (user?.role === "staff" && staffId) {
          commissionQuery = commissionQuery.eq('staff_id', staffId);
        }

        const { data: monthlyCommissions } = await commissionQuery;
        const monthlyCommission = monthlyCommissions?.reduce((sum, c) => sum + (c.amount || 0), 0) || 0;

        // Fetch points
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
          bookingsAvg: 10,
          monthlyCommission,
          lastMonthCommission: 0,
          pointsIssued,
          lastMonthPoints: 0,
        });

        // Fetch weekly sales
        const weekStart = startOfWeek(today, { weekStartsOn: 1 });
        const weekEnd = endOfWeek(today, { weekStartsOn: 1 });
        let weeklySalesQuery = supabase
          .from('sales')
          .select('total, created_at')
          .gte('created_at', weekStart.toISOString())
          .lte('created_at', weekEnd.toISOString())
          .neq('status', 'voided');

        if (user?.role === "staff") {
          weeklySalesQuery = weeklySalesQuery.eq('created_by', user.id);
        }

        const { data: weeklySalesData } = await weeklySalesQuery;
        const days = ['Isnin', 'Selasa', 'Rabu', 'Khamis', 'Jumaat', 'Sabtu', 'Ahad'];
        const weeklyStats: WeeklyData[] = days.map((day, index) => {
          const dayDate = new Date(weekStart);
          dayDate.setDate(dayDate.getDate() + index);
          const dayStr = format(dayDate, 'yyyy-MM-dd');
          const dayTotal = weeklySalesData?.filter(s => format(new Date(s.created_at), 'yyyy-MM-dd') === dayStr)
            .reduce((sum, s) => sum + (s.total || 0), 0) || 0;
          return { day, value: dayTotal };
        });
        setWeeklyData(weeklyStats);

        // Fetch top services
        const { data: topServicesData } = await supabase
          .from('sale_items')
          .select('item_name, sales!inner(status)')
          .eq('item_type', 'service')
          .neq('sales.status', 'voided')
          .gte('created_at', startOfCurrentMonth.toISOString());

        if (topServicesData) {
          const serviceCounts: { [key: string]: number } = {};
          topServicesData.forEach(item => { serviceCounts[item.item_name] = (serviceCounts[item.item_name] || 0) + 1; });
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
            id, booking_date, start_time, booking_time, status,
            customer:customers(name), service:services(name)
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
          const todayStr = format(today, 'yyyy-MM-dd');
          const tomorrowStr = format(subDays(today, -1), 'yyyy-MM-dd');
          const appointments = upcomingData.map((apt: any) => {
            const dateStr = apt.booking_date;
            const timeStr = (apt.start_time || apt.booking_time || '00:00').slice(0, 5);
            const isToday = dateStr === todayStr;
            const isTomorrow = dateStr === tomorrowStr;
            return {
              id: apt.id,
              customer: apt.customer?.name || 'Customer',
              service: apt.service?.name || 'Service',
              time: isToday ? `Hari Ini, ${timeStr}` :
                isTomorrow ? `Esok, ${timeStr}` :
                  `${format(new Date(dateStr + 'T00:00:00'), 'MMM d')}, ${timeStr}`,
              status: apt.status,
            };
          });
          setUpcomingAppointments(appointments);
        }

      } catch (error) {
        logError('Dashboard Page', error);
      } finally {
        setLoading(false);
      }
    };

    fetchDashboardData();
  }, [user]);

  const maxValue = Math.max(...weeklyData.map((d) => d.value), 1);
  const salesChange = stats.salesYesterday > 0 ? ((stats.salesToday - stats.salesYesterday) / stats.salesYesterday) * 100 : 0;
  const bookingsChange = stats.bookingsAvg > 0 ? ((stats.bookingsToday - stats.bookingsAvg) / stats.bookingsAvg) * 100 : 0;

  if (user?.role === "staff") {
    return <StaffMyDayView user={user} loading={loading} stats={stats} upcomingAppointments={upcomingAppointments} />;
  }

  return (
    <div className="min-h-screen bg-gray-50/50">
      <Header title="Ringkasan Dashboard" user={user!} />

      <div className="p-4 md:p-8 space-y-8 max-w-[1600px] mx-auto">
        <StatCardsHeader
          loading={loading}
          stats={stats}
          salesChange={salesChange}
          bookingsChange={bookingsChange}
        />

        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-2xl font-black text-gray-900 tracking-tight">Wawasan Perniagaan</h2>
            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-1">Metrik prestasi semasa</p>
          </div>
          <div className="flex items-center gap-3">
            <Button variant="outline" className="h-10 px-4 rounded-xl border-gray-200 text-xs font-black uppercase tracking-widest hover:bg-white">{selectedPeriod}</Button>
            <Button variant="outline" className="h-10 px-4 rounded-xl border-gray-200 text-xs font-black uppercase tracking-widest hover:bg-white">Status</Button>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <SalesPerformanceChart loading={loading} weeklyData={weeklyData} maxValue={maxValue} />
          <TopServicesList loading={loading} topServices={topServices} />
        </div>

        <UpcomingAppointmentsList loading={loading} upcomingAppointments={upcomingAppointments} />
      </div>
    </div>
  );
}
