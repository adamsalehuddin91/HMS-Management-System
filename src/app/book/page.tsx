"use client";

import { useState, useEffect } from "react";
import {
  Scissors,
  Loader2,
  ArrowLeft,
  ArrowRight,
  Check
} from "lucide-react";
import { Button } from "@/components/ui";
import { createClient } from "@/lib/supabase/client";
import { format } from "date-fns";
import { AnimatePresence } from "framer-motion";

// Utilities & Components
import {
  Service,
  Staff,
  BookingSlot,
  BusinessInfo,
  generateCalendarDays,
  getWhatsAppLink,
  ALL_TIME_SLOTS
} from "@/lib/utils/booking-utils";

import { BookingSteps } from "./components/BookingSteps";
import { ServiceSelection } from "./components/ServiceSelection";
import { DateTimeSelection } from "./components/DateTimeSelection";
import { CustomerInfoForm } from "./components/CustomerInfoForm";
import { BookingConfirmation } from "./components/BookingConfirmation";
import { BookingSuccess } from "./components/BookingSuccess";

type Step = "service" | "datetime" | "details" | "confirm" | "success";

export default function CustomerBookingPage() {
  // Data states
  const [services, setServices] = useState<Service[]>([]);
  const [staff, setStaff] = useState<Staff[]>([]);
  const [existingBookings, setExistingBookings] = useState<any[]>([]);
  const [businessInfo, setBusinessInfo] = useState<BusinessInfo>({
    name: "HMS Salon",
    phone: "+60 12-345 6789",
    whatsapp: "+60123456789",
    address: "123 Jalan Bukit Bintang, KL"
  });
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);

  // Form states
  const [step, setStep] = useState<Step>("service");
  const [selectedService, setSelectedService] = useState<Service | null>(null);
  const [selectedStaff, setSelectedStaff] = useState<Staff | null>(null);
  const [selectedDate, setSelectedDate] = useState<Date | null>(null);
  const [selectedTime, setSelectedTime] = useState<string | null>(null);
  const [customerName, setCustomerName] = useState("");
  const [customerPhone, setCustomerPhone] = useState("");
  const [customerNotes, setCustomerNotes] = useState("");
  const [bookingId, setBookingId] = useState<string | null>(null);
  const [existingCustomer, setExistingCustomer] = useState<{ id: string, name: string, tier: string } | null>(null);
  const [checkingCustomer, setCheckingCustomer] = useState(false);

  // Calendar state
  const [currentMonth, setCurrentMonth] = useState(new Date());

  // Category filter
  const [selectedCategory, setSelectedCategory] = useState("All");
  const categories = ["All", ...Array.from(new Set(services.map(s => s.category).filter(Boolean)))];

  // Fetch data
  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      const supabase = createClient();

      const { data: servicesData } = await supabase
        .from('services')
        .select('*')
        .eq('is_active', true)
        .order('category', { ascending: true });

      if (servicesData) setServices(servicesData);

      const { data: staffData } = await supabase
        .from('staff')
        .select('*')
        .eq('is_active', true)
        .order('name');

      if (staffData) setStaff(staffData);

      const { data: settingsData } = await supabase
        .from('business_settings')
        .select('*')
        .eq('setting_key', 'business_info')
        .single();

      if (settingsData?.setting_value) {
        setBusinessInfo(settingsData.setting_value);
      }

      setLoading(false);
    };

    fetchData();
  }, []);

  // Fetch bookings for selected date
  useEffect(() => {
    if (!selectedDate) return;

    const fetchBookings = async () => {
      const supabase = createClient();
      const dateStr = format(selectedDate, 'yyyy-MM-dd');

      const { data } = await supabase
        .from('bookings')
        .select('start_time, end_time, staff_id')
        .eq('booking_date', dateStr)
        .in('status', ['pending', 'confirmed']);

      if (data) setExistingBookings(data);
    };

    fetchBookings();
  }, [selectedDate]);

  // Check if customer exists by phone
  useEffect(() => {
    const checkCustomer = async () => {
      if (customerPhone.length < 10) {
        setExistingCustomer(null);
        return;
      }

      setCheckingCustomer(true);
      const supabase = createClient();

      const { data } = await supabase
        .from('customers')
        .select('id, name, tier')
        .eq('phone', customerPhone)
        .single();

      if (data) {
        setExistingCustomer(data);
        setCustomerName(data.name);
      } else {
        setExistingCustomer(null);
      }
      setCheckingCustomer(false);
    };

    const debounce = setTimeout(checkCustomer, 500);
    return () => clearTimeout(debounce);
  }, [customerPhone]);

  // Get available slots
  const availableSlots: BookingSlot[] = (() => {
    if (!selectedDate || !selectedService) return [];

    const duration = selectedService.duration_minutes || 60;
    const today = new Date();
    const isToday = selectedDate.toDateString() === today.toDateString();

    return ALL_TIME_SLOTS.map(time => {
      if (isToday) {
        const [hours, mins] = time.split(':').map(Number);
        const slotTime = new Date(selectedDate);
        slotTime.setHours(hours, mins, 0, 0);
        if (slotTime <= today) {
          return { time, available: false };
        }
      }

      const [slotHours, slotMins] = time.split(':').map(Number);
      const slotStart = slotHours * 60 + slotMins;
      const slotEnd = slotStart + duration;

      const hasConflict = existingBookings.some(booking => {
        if (selectedStaff && booking.staff_id !== selectedStaff.id) {
          return false;
        }

        const [bookingHours, bookingMins] = (booking.start_time || '00:00').split(':').map(Number);
        const [endHours, endMins] = (booking.end_time || '01:00').split(':').map(Number);
        const bookingStart = bookingHours * 60 + bookingMins;
        const bookingEnd = endHours * 60 + endMins;

        return (slotStart < bookingEnd && slotEnd > bookingStart);
      });

      return { time, available: !hasConflict };
    });
  })();

  // Handle booking submission
  const handleSubmitBooking = async () => {
    if (!selectedService || !selectedDate || !selectedTime || !customerName || !customerPhone) {
      return;
    }

    setSaving(true);

    try {
      const duration = selectedService.duration_minutes || 60;
      const [hours, mins] = selectedTime.split(':').map(Number);
      const totalMins = hours * 60 + mins + duration;
      const endHours = Math.floor(totalMins / 60);
      const endMins = totalMins % 60;
      const endTime = `${String(endHours).padStart(2, '0')}:${String(endMins).padStart(2, '0')}`;

      const response = await fetch('/api/public/booking', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          customerName,
          customerPhone,
          customerNotes,
          serviceId: selectedService.id,
          staffId: selectedStaff?.id || staff[0]?.id || null,
          bookingDate: format(selectedDate, 'yyyy-MM-dd'),
          startTime: selectedTime,
          endTime: endTime,
        }),
      });

      const result = await response.json();

      if (!response.ok) {
        throw new Error(result.error || 'Failed to create booking');
      }

      setBookingId(result.bookingId.slice(0, 8).toUpperCase());
      setStep("success");

    } catch (error: any) {
      console.error("Booking error:", error);
      alert(`Booking failed: ${error.message || 'Unknown error'}`);
    } finally {
      setSaving(false);
    }
  };

  // Step navigation
  const canProceed = () => {
    switch (step) {
      case "service": return !!selectedService;
      case "datetime": return !!selectedDate && !!selectedTime;
      case "details": return !!customerName && !!customerPhone;
      default: return false;
    }
  };

  const nextStep = () => {
    if (step === "service") setStep("datetime");
    else if (step === "datetime") setStep("details");
    else if (step === "details") setStep("confirm");
  };

  const prevStep = () => {
    if (step === "datetime") setStep("service");
    else if (step === "details") setStep("datetime");
    else if (step === "confirm") setStep("details");
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gradient-to-b from-[#e8f5e9] to-white flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="h-12 w-12 animate-spin text-[#2e7d32] mx-auto mb-4" />
          <p className="text-[#2e7d32] font-medium">Loading...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f8fcf9]">
      {/* Header */}
      <header className="bg-[#2e7d32] text-white p-6 sticky top-0 z-20 shadow-lg shadow-green-900/10 backdrop-blur-md bg-[#2e7d32]/95">
        <div className="max-w-lg mx-auto flex items-center justify-between">
          <div className="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center backdrop-blur-sm border border-white/10">
            <Scissors className="h-5 w-5 text-white" />
          </div>
          <div className="flex-1 text-center px-4">
            <h1 className="text-xl font-black tracking-tight uppercase group cursor-default">
              {businessInfo.name}
            </h1>
            <div className="flex items-center justify-center gap-1.5 mt-0.5 opacity-80">
              <div className="w-1.5 h-1.5 rounded-full bg-green-400 animate-pulse" />
              <p className="text-[10px] font-bold tracking-[0.1em] uppercase">Premium Salon Booking</p>
            </div>
          </div>
          <div className="w-10 h-10" />
        </div>
      </header>

      <BookingSteps step={step} />

      <div className="max-w-lg mx-auto px-4 pb-24">
        <AnimatePresence mode="wait">
          {step === "service" && (
            <ServiceSelection
              services={services}
              staff={staff}
              selectedService={selectedService}
              setSelectedService={setSelectedService}
              selectedStaff={selectedStaff}
              setSelectedStaff={setSelectedStaff}
              selectedCategory={selectedCategory}
              setSelectedCategory={setSelectedCategory}
              categories={categories}
            />
          )}

          {step === "datetime" && (
            <DateTimeSelection
              currentMonth={currentMonth}
              setCurrentMonth={setCurrentMonth}
              selectedDate={selectedDate}
              setSelectedDate={setSelectedDate}
              selectedTime={selectedTime}
              setSelectedTime={setSelectedTime}
              availableSlots={availableSlots}
            />
          )}

          {step === "details" && (
            <CustomerInfoForm
              customerName={customerName}
              setCustomerName={setCustomerName}
              customerPhone={customerPhone}
              setCustomerPhone={setCustomerPhone}
              customerNotes={customerNotes}
              setCustomerNotes={setCustomerNotes}
              existingCustomer={existingCustomer}
              checkingCustomer={checkingCustomer}
            />
          )}

          {step === "confirm" && (
            <BookingConfirmation
              selectedService={selectedService}
              selectedDate={selectedDate}
              selectedTime={selectedTime}
              selectedStaff={selectedStaff}
              customerName={customerName}
              customerPhone={customerPhone}
              customerNotes={customerNotes}
              businessInfo={businessInfo}
              existingCustomer={existingCustomer}
            />
          )}

          {step === "success" && (
            <BookingSuccess
              bookingId={bookingId}
              selectedDate={selectedDate}
              selectedTime={selectedTime}
              selectedService={selectedService}
              getWhatsAppLink={() => getWhatsAppLink(businessInfo, selectedDate, selectedTime, selectedService, customerName, customerPhone, bookingId)}
              businessInfo={businessInfo}
            />
          )}
        </AnimatePresence>
      </div>

      {/* Bottom Navigation */}
      {step !== "success" && (
        <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 p-4 z-20">
          <div className="max-w-lg mx-auto flex gap-3">
            {step !== "service" && (
              <Button variant="outline" className="flex-1" onClick={prevStep}>
                <ArrowLeft className="h-4 w-4 mr-2" />
                Kembali
              </Button>
            )}

            <Button
              className="flex-1 bg-[#2e7d32] hover:bg-[#1b5e20]"
              onClick={step === "confirm" ? handleSubmitBooking : nextStep}
              disabled={saving || (step !== "confirm" && !canProceed())}
            >
              {saving ? (
                <>
                  <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                  Memproses...
                </>
              ) : step === "confirm" ? (
                <>
                  <Check className="h-4 w-4 mr-2" />
                  Sahkan Tempahan
                </>
              ) : (
                <>
                  Seterusnya
                  <ArrowRight className="h-4 w-4 ml-2" />
                </>
              )}
            </Button>
          </div>
        </div>
      )}
    </div>
  );
}
