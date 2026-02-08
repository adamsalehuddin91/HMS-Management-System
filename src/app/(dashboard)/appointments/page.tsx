"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import {
  ChevronLeft,
  ChevronRight,
  Plus,
  MessageSquare,
  Calendar as CalendarIcon,
  Loader2,
  X,
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent, Avatar, Badge } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { formatCurrency } from "@/lib/utils";
import { createClient } from "@/lib/supabase/client";
import { format } from "date-fns";

// Types for bookings data
interface BookingData {
  id: string;
  customer_id: string;
  service_id: string;
  staff_id: string;
  booking_date: string;
  booking_time?: string;  // Original schema column
  start_time?: string;    // Added column
  end_time?: string;
  status: string;
  deposit?: number;       // Original schema column
  deposit_amount?: number; // Added column
  deposit_paid?: boolean;
  notes?: string;
  customer?: {
    id: string;
    name: string;
    phone: string;
    is_member?: boolean;
    tier?: string;
  };
  service?: {
    id: string;
    name: string;
    price: number;
    duration?: number;
    duration_minutes?: number;
  };
  staff?: {
    id: string;
    name: string;
  };
}

// Helper to get booking time (handles both column names)
const getBookingTime = (booking: BookingData): string => {
  return booking.start_time || booking.booking_time || '00:00';
};

// Helper to get deposit amount
const getDepositAmount = (booking: BookingData): number => {
  return booking.deposit_amount || booking.deposit || 0;
};

// Helper to check if customer is member
const isCustomerMember = (customer?: BookingData['customer']): boolean => {
  if (!customer) return false;
  return customer.is_member || customer.tier === 'Member' || customer.tier === 'VIP';
};

// Helper to get service duration
const getServiceDuration = (service?: BookingData['service']): number => {
  if (!service) return 60;
  return service.duration_minutes || service.duration || 60;
};

export default function AppointmentsPage() {
  const { user } = useAuthStore();
  const [view, setView] = useState<"month" | "week" | "day">("month");
  const [currentMonth, setCurrentMonth] = useState(new Date());
  const [bookings, setBookings] = useState<BookingData[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedBooking, setSelectedBooking] = useState<BookingData | null>(null);

  // Fetch bookings from Supabase
  useEffect(() => {
    const fetchBookings = async () => {
      setLoading(true);
      const supabase = createClient();

      // Get first and last day of current month for filtering
      const firstDay = new Date(currentMonth.getFullYear(), currentMonth.getMonth(), 1);
      const lastDay = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 0);

      const { data, error } = await supabase
        .from('bookings')
        .select(`
          *,
          customer:customers(id, name, phone, is_member, tier),
          service:services(id, name, price, duration, duration_minutes),
          staff:staff(id, name)
        `)
        .gte('booking_date', firstDay.toISOString().split('T')[0])
        .lte('booking_date', lastDay.toISOString().split('T')[0])
        .order('booking_date', { ascending: true })
        .order('start_time', { ascending: true });

      if (error) {
        console.error("Error fetching bookings:", error);
      } else if (data) {
        setBookings(data);
        // Select first booking by default if available
        if (data.length > 0 && !selectedBooking) {
          setSelectedBooking(data[0]);
        }
      }
      setLoading(false);
    };

    fetchBookings();
  }, [currentMonth]);

  // Generate calendar days based on currentMonth with real bookings
  const generateCalendarDaysForMonth = (date: Date) => {
    const days = [];
    const today = new Date();
    const firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);

    // Add empty days for padding
    for (let i = 0; i < firstDay.getDay(); i++) {
      days.push({ day: null, appointments: [] as { time: string; name: string; color: string; booking: BookingData }[] });
    }

    // Add actual days
    for (let i = 1; i <= lastDay.getDate(); i++) {
      const dateStr = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(i).padStart(2, '0')}`;

      // Find bookings for this day
      const dayBookings = bookings.filter(b => b.booking_date === dateStr);

      const appointments = dayBookings.map(b => ({
        time: getBookingTime(b).slice(0, 5),
        name: b.customer?.name?.split(' ')[0] || 'Customer',
        color: b.status === 'confirmed' ? 'bg-[var(--primary)]' :
               b.status === 'pending' ? 'bg-[var(--warning)]' :
               b.status === 'completed' ? 'bg-[var(--success)]' : 'bg-[var(--muted)]',
        booking: b
      }));

      const isToday = i === today.getDate() &&
        date.getMonth() === today.getMonth() &&
        date.getFullYear() === today.getFullYear();

      days.push({ day: i, appointments, isToday });
    }

    return days;
  };

  const calendarDays = generateCalendarDaysForMonth(currentMonth);
  const monthName = currentMonth.toLocaleString("default", { month: "long", year: "numeric" });

  const goToPreviousMonth = () => {
    setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1, 1));
  };

  const goToNextMonth = () => {
    setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 1));
  };

  const goToToday = () => {
    setCurrentMonth(new Date());
  };

  return (
    <div className="min-h-screen">
      <Header title="Appointment Schedule" subtitle="Dashboard / Booking Calendar" user={user!} />

      <div className="p-4 md:p-6">
        <div className="flex flex-col lg:flex-row gap-6">
          {/* Calendar */}
          <Card className="flex-1 min-w-0">
            <CardContent className="p-6">
              {/* Calendar Header */}
              <div className="flex items-center justify-between mb-6">
                <div className="flex items-center gap-4">
                  <h2 className="text-xl font-bold">{monthName}</h2>
                  <div className="flex items-center gap-1">
                    <button className="p-2 hover:bg-[var(--secondary)] rounded-lg" onClick={goToPreviousMonth}>
                      <ChevronLeft className="h-5 w-5" />
                    </button>
                    <button className="p-2 hover:bg-[var(--secondary)] rounded-lg" onClick={goToNextMonth}>
                      <ChevronRight className="h-5 w-5" />
                    </button>
                  </div>
                  <Button variant="outline" size="sm" onClick={goToToday}>Today</Button>
                </div>
                <div className="flex items-center gap-2">
                  {["Month", "Week", "Day"].map((v) => (
                    <button
                      key={v}
                      onClick={() => setView(v.toLowerCase() as typeof view)}
                      className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${view === v.toLowerCase()
                        ? "bg-[var(--card)] shadow-sm"
                        : "hover:bg-[var(--secondary)]"
                        }`}
                    >
                      {v}
                    </button>
                  ))}
                </div>
              </div>

              {/* Calendar Grid */}
              <div className="grid grid-cols-7 gap-1">
                {["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"].map((day) => (
                  <div key={day} className="p-2 text-center text-xs font-medium text-[var(--muted)]">
                    {day}
                  </div>
                ))}
                {calendarDays.map((item, idx) => (
                  <div
                    key={idx}
                    className={`min-h-24 p-2 border border-[var(--border)] rounded-lg ${item.isToday ? "bg-[var(--primary-light)] border-[var(--primary)]" : ""
                      } ${item.day ? "hover:bg-[var(--secondary)] cursor-pointer" : ""}`}
                  >
                    {item.day && (
                      <>
                        <span className={`text-sm ${item.isToday ? "font-bold text-[var(--primary)]" : ""}`}>
                          {item.day}
                        </span>
                        <div className="mt-1 space-y-1">
                          {item.appointments.map((apt: any, i: number) => (
                            <div
                              key={i}
                              onClick={(e) => {
                                e.stopPropagation();
                                if (apt.booking) setSelectedBooking(apt.booking);
                              }}
                              className={`text-xs px-2 py-1 rounded text-white cursor-pointer hover:opacity-80 ${apt.color}`}
                            >
                              {apt.time} - {apt.name}
                            </div>
                          ))}
                        </div>
                      </>
                    )}
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* Booking Details Panel */}
          <Card className="w-full lg:w-96 shrink-0 order-first lg:order-last">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-lg font-bold">Booking Details</h3>
                {selectedBooking && (
                  <button
                    onClick={() => setSelectedBooking(null)}
                    className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                  >
                    <X className="h-4 w-4 text-[var(--muted)]" />
                  </button>
                )}
              </div>

              {loading ? (
                <div className="py-12 text-center text-[var(--muted)]">
                  <Loader2 className="h-8 w-8 animate-spin mx-auto mb-2" />
                  Loading bookings...
                </div>
              ) : !selectedBooking ? (
                <div className="py-12 text-center text-[var(--muted)]">
                  <CalendarIcon className="h-12 w-12 mx-auto mb-3 opacity-50" />
                  <p className="font-medium">No Booking Selected</p>
                  <p className="text-sm mt-1">Click on an appointment in the calendar to view details</p>
                  {bookings.length === 0 && (
                    <p className="text-sm mt-4">No bookings found for this month</p>
                  )}
                </div>
              ) : (
                <>
                  {/* Customer Info */}
                  <div className="flex items-center gap-3 mb-6">
                    <Avatar name={selectedBooking.customer?.name || 'Customer'} size="lg" />
                    <div className="flex-1">
                      <div className="flex items-center gap-2">
                        <p className="font-medium">{selectedBooking.customer?.name || 'Walk-in Customer'}</p>
                        {isCustomerMember(selectedBooking.customer) && (
                          <Badge variant="success">Member</Badge>
                        )}
                      </div>
                      <p className="text-sm text-[var(--muted)]">{selectedBooking.customer?.phone || '-'}</p>
                    </div>
                    <button className="p-2 hover:bg-[var(--secondary)] rounded-lg">
                      <MessageSquare className="h-5 w-5 text-[var(--muted)]" />
                    </button>
                  </div>

                  {/* Service Info */}
                  <div className="space-y-4 mb-6">
                    <div>
                      <p className="text-xs text-[var(--muted)] uppercase tracking-wide">Service</p>
                      <div className="flex items-center justify-between mt-1">
                        <div>
                          <p className="font-medium">{selectedBooking.service?.name || 'Service'}</p>
                          <p className="text-sm text-[var(--muted)]">
                            Duration: {getServiceDuration(selectedBooking.service)} mins
                          </p>
                        </div>
                        <p className="font-bold">{formatCurrency(selectedBooking.service?.price || 0)}</p>
                      </div>
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                      <div>
                        <p className="text-xs text-[var(--muted)] uppercase tracking-wide">Date & Time</p>
                        <div className="flex items-center gap-2 mt-1">
                          <CalendarIcon className="h-4 w-4 text-[var(--primary)]" />
                          <p className="text-sm">
                            {format(new Date(selectedBooking.booking_date), 'MMM d, yyyy')} at {getBookingTime(selectedBooking).slice(0, 5)}
                          </p>
                        </div>
                      </div>
                      <div>
                        <p className="text-xs text-[var(--muted)] uppercase tracking-wide">Assigned Staff</p>
                        <div className="flex items-center gap-2 mt-1">
                          <Avatar name={selectedBooking.staff?.name || 'Staff'} size="sm" />
                          <p className="text-sm">{selectedBooking.staff?.name || 'Unassigned'}</p>
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* Status */}
                  <div className="flex items-center justify-between py-3 border-t border-[var(--border)]">
                    <p className="text-sm">Status</p>
                    <Badge variant={
                      selectedBooking.status === 'confirmed' ? 'success' :
                      selectedBooking.status === 'pending' ? 'warning' :
                      selectedBooking.status === 'completed' ? 'default' : 'error'
                    }>
                      {selectedBooking.status.toUpperCase()}
                    </Badge>
                  </div>

                  {/* Deposit Status */}
                  <div className="flex items-center justify-between py-3 border-t border-[var(--border)]">
                    <p className="text-sm">Deposit Status</p>
                    <Badge variant={selectedBooking.deposit_paid ? "success" : "warning"}>
                      {selectedBooking.deposit_paid ? 'PAID' : 'UNPAID'}
                    </Badge>
                  </div>

                  {/* Totals */}
                  <div className="space-y-2 py-3 border-t border-[var(--border)]">
                    <div className="flex justify-between text-sm">
                      <span>Service Total</span>
                      <span>{formatCurrency(selectedBooking.service?.price || 0)}</span>
                    </div>
                    {selectedBooking.deposit_paid && getDepositAmount(selectedBooking) > 0 && (
                      <div className="flex justify-between text-sm text-[var(--primary)]">
                        <span>Deposit Paid</span>
                        <span>-{formatCurrency(getDepositAmount(selectedBooking))}</span>
                      </div>
                    )}
                    <div className="flex justify-between font-bold text-lg pt-2">
                      <span>Remaining Balance</span>
                      <span>
                        {formatCurrency(
                          (selectedBooking.service?.price || 0) -
                          (selectedBooking.deposit_paid ? getDepositAmount(selectedBooking) : 0)
                        )}
                      </span>
                    </div>
                  </div>

                  {/* Actions */}
                  {selectedBooking.status !== 'completed' && selectedBooking.status !== 'cancelled' && (
                    <div className="space-y-2 mt-6">
                      <Link href={`/pos?booking=${selectedBooking.id}`}>
                        <Button className="w-full" size="lg">
                          Convert to Sale
                        </Button>
                      </Link>
                      {selectedBooking.deposit_paid && (
                        <p className="text-xs text-center text-[var(--muted)]">Deposit will be auto-deducted</p>
                      )}
                      <div className="grid grid-cols-2 gap-2">
                        <Button variant="outline">Reschedule</Button>
                        <Button variant="outline" className="text-[var(--error)] border-[var(--error)]">
                          Cancel
                        </Button>
                      </div>
                    </div>
                  )}
                </>
              )}
            </CardContent>
          </Card>
        </div>
      </div>

      {/* Floating Action Button */}
      <Link href="/appointments/new">
        <Button
          className="fixed bottom-6 right-6 shadow-lg"
          size="lg"
        >
          <Plus className="h-5 w-5 mr-2" />
          New Booking
        </Button>
      </Link>
    </div>
  );
}
