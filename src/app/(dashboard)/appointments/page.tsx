"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { toast } from "sonner";
import { Plus } from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { format } from "date-fns";
import { logError } from "@/lib/utils/error-logger";

// Utilities & Components
import {
  BookingData,
  getBookingTime,
  getServiceDuration
} from "@/lib/utils/appointment-utils";

import { AppointmentCalendar } from "./components/AppointmentCalendar";
import { AppointmentDetails } from "./components/AppointmentDetails";
import { RescheduleModal } from "./components/RescheduleModal";
import { CancelModal } from "./components/CancelModal";

export default function AppointmentsPage() {
  const { user } = useAuthStore();
  const [view, setView] = useState<"month" | "week" | "day">("month");
  const [currentMonth, setCurrentMonth] = useState(new Date());
  const [bookings, setBookings] = useState<BookingData[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedBooking, setSelectedBooking] = useState<BookingData | null>(null);

  // Modal states
  const [showRescheduleModal, setShowRescheduleModal] = useState(false);
  const [rescheduleDate, setRescheduleDate] = useState("");
  const [rescheduleTime, setRescheduleTime] = useState("");
  const [rescheduling, setRescheduling] = useState(false);

  const [showCancelModal, setShowCancelModal] = useState(false);
  const [cancelReason, setCancelReason] = useState("Customer request");
  const [cancelling, setCancelling] = useState(false);

  // Fetch bookings
  useEffect(() => {
    const fetchBookings = async () => {
      setLoading(true);
      const supabase = createClient();

      const firstDay = new Date(currentMonth.getFullYear(), currentMonth.getMonth(), 1);
      const lastDay = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 0);

      const { data, error } = await supabase
        .from('bookings')
        .select(`
                    *,
                    customer:customers(id, name, phone, is_member, tier),
                    service:services(id, name, price, duration),
                    staff:staff(id, name)
                `)
        .gte('booking_date', firstDay.toISOString().split('T')[0])
        .lte('booking_date', lastDay.toISOString().split('T')[0])
        .order('booking_date', { ascending: true })
        .order('start_time', { ascending: true });

      if (error) {
        logError('Appointments Page', error);
      } else if (data) {
        setBookings(data);
        if (data.length > 0 && !selectedBooking) {
          setSelectedBooking(data[0]);
        }
      }
      setLoading(false);
    };

    fetchBookings();
  }, [currentMonth]);

  // Calendar generation logic
  const calendarDays = (() => {
    const days = [];
    const today = new Date();
    const firstDay = new Date(currentMonth.getFullYear(), currentMonth.getMonth(), 1);
    const lastDay = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 0);

    for (let i = 0; i < firstDay.getDay(); i++) {
      days.push({ day: null, appointments: [] });
    }

    for (let i = 1; i <= lastDay.getDate(); i++) {
      const dateStr = `${currentMonth.getFullYear()}-${String(currentMonth.getMonth() + 1).padStart(2, '0')}-${String(i).padStart(2, '0')}`;
      const dayBookings = bookings.filter(b => b.booking_date === dateStr);

      const appointments = dayBookings.map(b => ({
        time: getBookingTime(b).slice(0, 5),
        name: b.customer?.name?.split(' ')[0] || 'Customer',
        booking: b
      }));

      const isToday = i === today.getDate() &&
        currentMonth.getMonth() === today.getMonth() &&
        currentMonth.getFullYear() === today.getFullYear();

      days.push({ day: i, appointments, isToday });
    }
    return days;
  })();

  const monthName = currentMonth.toLocaleString("default", { month: "long", year: "numeric" });

  // Time slots for reschedule
  const timeSlots = Array.from({ length: 24 }, (_, i) => {
    const hour = Math.floor(i / 2) + 9;
    const minute = (i % 2) * 30;
    if (hour > 20) return null;
    return `${String(hour).padStart(2, '0')}:${String(minute).padStart(2, '0')}`;
  }).filter(Boolean) as string[];

  // Handlers
  const handleReschedule = async () => {
    if (!selectedBooking || !rescheduleDate || !rescheduleTime) return;
    setRescheduling(true);
    const supabase = createClient();

    try {
      const duration = getServiceDuration(selectedBooking.service);
      const [hours, mins] = rescheduleTime.split(':').map(Number);
      const totalMins = hours * 60 + mins + duration;
      const endHours = Math.floor(totalMins / 60);
      const endMins = totalMins % 60;
      const endTime = `${String(endHours).padStart(2, '0')}:${String(endMins).padStart(2, '0')}`;

      const { error } = await supabase
        .from('bookings')
        .update({
          booking_date: rescheduleDate,
          booking_time: rescheduleTime,
          start_time: rescheduleTime,
          end_time: endTime,
          status: 'pending',
        })
        .eq('id', selectedBooking.id);

      if (error) throw error;

      setBookings(prev => prev.map(b =>
        b.id === selectedBooking.id
          ? { ...b, booking_date: rescheduleDate, start_time: rescheduleTime, end_time: endTime, status: 'pending' }
          : b
      ));
      setSelectedBooking(prev => prev ? { ...prev, booking_date: rescheduleDate, start_time: rescheduleTime, end_time: endTime, status: 'pending' } : null);
      setShowRescheduleModal(false);
    } catch (err) {
      console.error(err);
      toast.error("Gagal menjadualkan semula.");
    } finally {
      setRescheduling(false);
    }
  };

  const handleCancelBooking = async () => {
    if (!selectedBooking) return;
    setCancelling(true);
    const supabase = createClient();

    try {
      const { error } = await supabase
        .from('bookings')
        .update({
          status: 'cancelled',
          notes: `${selectedBooking.notes || ''}\n[Cancelled: ${cancelReason}]`.trim()
        })
        .eq('id', selectedBooking.id);

      if (error) throw error;

      setBookings(prev => prev.map(b => b.id === selectedBooking.id ? { ...b, status: 'cancelled' } : b));
      setSelectedBooking(prev => prev ? { ...prev, status: 'cancelled' } : null);
      setShowCancelModal(false);
    } catch (err) {
      console.error(err);
      toast.error("Gagal membatalkan temujanji.");
    } finally {
      setCancelling(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#f8fcf9]">
      <Header title="Appointment Schedule" subtitle="Dashboard / Booking Calendar" user={user!} />

      <div className="p-4 md:p-8">
        <div className="flex flex-col xl:flex-row gap-8 items-start">
          <AppointmentCalendar
            monthName={monthName}
            calendarDays={calendarDays}
            view={view}
            setView={setView}
            goToPreviousMonth={() => setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1, 1))}
            goToNextMonth={() => setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 1))}
            goToToday={() => setCurrentMonth(new Date())}
            onSelectBooking={setSelectedBooking}
          />

          <AppointmentDetails
            booking={selectedBooking}
            loading={loading}
            onClose={() => setSelectedBooking(null)}
            onReschedule={() => {
              if (selectedBooking) {
                setRescheduleDate(selectedBooking.booking_date);
                setRescheduleTime(getBookingTime(selectedBooking));
                setShowRescheduleModal(true);
              }
            }}
            onCancel={() => setShowCancelModal(true)}
          />
        </div>
      </div>

      <Link href="/appointments/new">
        <Button
          className="fixed bottom-8 left-8 md:left-72 shadow-2xl bg-[#2e7d32] hover:bg-[#1b5e20] h-16 px-8 rounded-2xl text-base font-black uppercase tracking-widest transition-all active:scale-95 group"
          size="lg"
        >
          <Plus className="h-5 w-5 mr-3 group-hover:rotate-90 transition-transform duration-300" />
          New Booking
        </Button>
      </Link>

      {showRescheduleModal && selectedBooking && (
        <RescheduleModal
          booking={selectedBooking}
          rescheduleDate={rescheduleDate}
          setRescheduleDate={setRescheduleDate}
          rescheduleTime={rescheduleTime}
          setRescheduleTime={setRescheduleTime}
          timeSlots={timeSlots}
          rescheduling={rescheduling}
          onClose={() => setShowRescheduleModal(false)}
          onConfirm={handleReschedule}
        />
      )}

      {showCancelModal && selectedBooking && (
        <CancelModal
          booking={selectedBooking}
          cancelReason={cancelReason}
          setCancelReason={setCancelReason}
          cancelling={cancelling}
          onClose={() => setShowCancelModal(false)}
          onConfirm={handleCancelBooking}
        />
      )}
    </div>
  );
}
