"use client";

import { useState, useEffect, useMemo } from "react";
import { useRouter } from "next/navigation";
import {
  ArrowLeft,
  User,
  Scissors,
  Calendar as CalendarIcon,
  Check,
  Loader2
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { createClient } from "@/lib/supabase/client";
import { format } from "date-fns";
import { motion, AnimatePresence } from "framer-motion";

// Utilities & Components
import {
  Service,
  Staff,
  Customer,
  isCustomerMember
} from "@/lib/utils/appointment-utils";
import { ALL_TIME_SLOTS } from "@/lib/utils/booking-utils";

import { CustomerSelectionStep } from "./components/CustomerSelectionStep";
import { ServiceStaffStep } from "./components/ServiceStaffStep";
import { DateTimeStep } from "./components/DateTimeStep";
import { BookingSummaryStep } from "./components/BookingSummaryStep";
import { BookingCompleteView } from "./components/BookingCompleteView";

type Step = "customer" | "service" | "datetime" | "confirm" | "complete";

export default function NewBookingPage() {
  const router = useRouter();
  const { user } = useAuthStore();

  // Data state
  const [services, setServices] = useState<Service[]>([]);
  const [staff, setStaff] = useState<Staff[]>([]);
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchingCustomers, setSearchingCustomers] = useState(false);
  const [saving, setSaving] = useState(false);

  // Step state
  const [step, setStep] = useState<Step>("customer");

  // Form state
  const [searchCustomer, setSearchCustomer] = useState("");
  const [selectedCustomer, setSelectedCustomer] = useState<Customer | null>(null);
  const [isWalkIn, setIsWalkIn] = useState(false);
  const [walkInName, setWalkInName] = useState("");
  const [walkInPhone, setWalkInPhone] = useState("");

  const [selectedService, setSelectedService] = useState<Service | null>(null);
  const [selectedStaff, setSelectedStaff] = useState<Staff | null>(null);

  const [selectedDate, setSelectedDate] = useState<Date | null>(null);
  const [selectedTime, setSelectedTime] = useState<string | null>(null);
  const [searchService, setSearchService] = useState("");
  const [currentMonth, setCurrentMonth] = useState(new Date());

  const [notes, setNotes] = useState("");
  const [requireDeposit, setRequireDeposit] = useState(true);

  // Fetch data
  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      const supabase = createClient();

      const [servicesRes, staffRes] = await Promise.all([
        supabase.from('services').select('*').eq('is_active', true).order('name'),
        supabase.from('staff').select('*').eq('is_active', true).order('name'),
      ]);

      if (servicesRes.data) setServices(servicesRes.data);
      if (staffRes.data) setStaff(staffRes.data);

      setLoading(false);
    };

    fetchData();
  }, []);

  // Debounced customer search
  useEffect(() => {
    const searchCustomers = async () => {
      setSearchingCustomers(true);
      const supabase = createClient();
      try {
        let query = supabase.from('customers').select('*');
        if (searchCustomer.trim()) {
          query = query.or(`name.ilike.%${searchCustomer}%,phone.ilike.%${searchCustomer}%`);
        }
        const { data, error } = await query.order('name').limit(50);
        if (!error && data) {
          setCustomers(data);
        }
      } catch (err) {
        console.error("Search error:", err);
      } finally {
        setSearchingCustomers(false);
      }
    };

    const timer = setTimeout(() => {
      searchCustomers();
    }, 500);

    return () => clearTimeout(timer);
  }, [searchCustomer]);

  // No longer need client-side filtering useMemo, use the state directly
  const filteredCustomers = customers;

  const isMember = isCustomerMember(selectedCustomer || undefined);

  const filteredServices = useMemo(() => {
    return services.filter(s =>
      s.name.toLowerCase().includes(searchService.toLowerCase()) ||
      s.category?.toLowerCase().includes(searchService.toLowerCase())
    );
  }, [services, searchService]);

  const servicePrice = useMemo(() => {
    if (!selectedService) return 0;
    return isMember && selectedService.member_price ? selectedService.member_price : selectedService.price;
  }, [selectedService, isMember]);

  const depositAmount = Math.ceil(servicePrice * 0.25);

  // Navigation
  const steps: Step[] = ["customer", "service", "datetime", "confirm", "complete"];
  const currentIndex = steps.indexOf(step);

  const canProceed = () => {
    switch (step) {
      case "customer": return !!selectedCustomer || (isWalkIn && !!walkInName && !!walkInPhone);
      case "service": return !!selectedService && !!selectedStaff;
      case "datetime": return !!selectedDate && !!selectedTime;
      default: return true;
    }
  };

  const handleNext = () => currentIndex < steps.length - 1 && setStep(steps[currentIndex + 1]);
  const handleBack = () => currentIndex > 0 && setStep(steps[currentIndex - 1]);

  const handleConfirmBooking = async () => {
    if (!selectedService || !selectedDate || !selectedTime) return;
    setSaving(true);
    const supabase = createClient();

    try {
      let customerId = selectedCustomer?.id || null;

      if (isWalkIn && walkInName && walkInPhone) {
        const { data: newCustomer, error: customerError } = await supabase
          .from('customers')
          .insert({
            name: walkInName,
            phone: walkInPhone,
            tier: 'Normal',
            points_balance: 0,
            total_spent: 0,
          })
          .select()
          .single();

        if (customerError) throw customerError;
        customerId = newCustomer.id;
      }

      const bookingDate = format(selectedDate, 'yyyy-MM-dd');
      const { error: bookingError } = await supabase
        .from('bookings')
        .insert({
          customer_id: customerId,
          service_id: selectedService.id,
          staff_id: selectedStaff?.id || null,
          booking_date: bookingDate,
          start_time: selectedTime,
          booking_time: selectedTime,
          status: 'pending',
          deposit_amount: requireDeposit ? depositAmount : 0,
          deposit_paid: false,
          notes: notes || null,
        });

      if (bookingError) throw bookingError;
      setStep("complete");
    } catch (error) {
      console.error(error);
      alert("Failed to create booking");
    } finally {
      setSaving(false);
    }
  };

  const handleReset = () => {
    setStep("customer");
    setSelectedCustomer(null);
    setSelectedService(null);
    setSelectedStaff(null);
    setSelectedDate(null);
    setSelectedTime(null);
    setNotes("");
    setIsWalkIn(false);
    setWalkInName("");
    setWalkInPhone("");
  };

  if (step === "complete") {
    return (
      <div className="min-h-screen bg-[#f8fcf9]">
        <Header title="Tempahan Selesai" user={user!} />
        <div className="p-6">
          <BookingCompleteView
            selectedCustomer={selectedCustomer}
            walkInName={walkInName}
            selectedService={selectedService}
            selectedStaff={selectedStaff}
            selectedDate={selectedDate}
            selectedTime={selectedTime}
            depositAmount={depositAmount}
            requireDeposit={requireDeposit}
            onReset={handleReset}
            onGoToCalendar={() => router.push("/appointments")}
          />
        </div>
      </div>
    );
  }

  const navigationItems = [
    { id: "customer", label: "Pelanggan", icon: User },
    { id: "service", label: "Servis", icon: Scissors },
    { id: "datetime", label: "Waktu", icon: CalendarIcon },
    { id: "confirm", label: "Sahkan", icon: Check },
  ];

  return (
    <div className="min-h-screen bg-[#f8fcf9]">
      <Header title="Tempahan Baru" subtitle="Dashboard / New Booking" user={user!} />

      <div className="max-w-4xl mx-auto p-4 md:p-8 space-y-8">
        {/* Header Actions */}
        <div className="flex items-center justify-between">
          <Button
            variant="ghost"
            onClick={() => router.push("/appointments")}
            className="rounded-xl font-bold text-gray-400 hover:text-gray-600 hover:bg-gray-100 transition-all border border-transparent hover:border-gray-200 px-4"
          >
            <ArrowLeft className="h-4 w-4 mr-2" />
            Balik ke Kalendar
          </Button>
        </div>

        {/* Vertical Progress Steps */}
        <div className="flex flex-wrap items-center justify-center gap-2 md:gap-4 px-2">
          {navigationItems.map((item, index) => {
            const stepIndex = steps.indexOf(item.id as Step);
            const isActive = step === item.id;
            const isCompleted = currentIndex > stepIndex;

            return (
              <div key={item.id} className="flex items-center">
                <div className={`flex items-center gap-2.5 px-5 py-3 rounded-2xl transition-all duration-300 ${isActive
                  ? "bg-[#2e7d32] text-white shadow-lg shadow-green-900/10 scale-105"
                  : isCompleted
                    ? "bg-green-100/50 text-[#2e7d32]"
                    : "bg-white text-gray-300 border border-gray-100"
                  }`}>
                  <item.icon className={`h-4 w-4 ${isActive ? "animate-pulse" : ""}`} />
                  <span className="text-xs font-black uppercase tracking-widest hidden sm:block">{item.label}</span>
                  {isCompleted && <Check className="h-3 w-3 stroke-[4px]" />}
                </div>
                {index < navigationItems.length - 1 && (
                  <div className={`w-4 md:w-8 h-0.5 rounded-full transition-colors duration-500 ${isCompleted ? "bg-[#2e7d32]" : "bg-gray-100"
                    }`} />
                )}
              </div>
            );
          })}
        </div>

        {/* Step Content Card */}
        <Card className="border-none shadow-2xl bg-white/70 backdrop-blur-xl rounded-[2.5rem] overflow-hidden relative">
          <div className="absolute top-0 left-0 w-full h-1 bg-gray-100">
            <motion.div
              className="h-full bg-[#2e7d32]"
              initial={{ width: "0%" }}
              animate={{ width: `${(currentIndex / (navigationItems.length - 1)) * 100}%` }}
              transition={{ duration: 0.5, ease: "circOut" }}
            />
          </div>
          <CardContent className="p-8 md:p-12">
            <AnimatePresence mode="wait">
              <motion.div
                key={step}
                initial={{ opacity: 0, x: 20 }}
                animate={{ opacity: 1, x: 0 }}
                exit={{ opacity: 0, x: -20 }}
                transition={{ duration: 0.3, ease: "easeOut" }}
              >
                {step === "customer" && (
                  <CustomerSelectionStep
                    isWalkIn={isWalkIn}
                    setIsWalkIn={setIsWalkIn}
                    searchCustomer={searchCustomer}
                    setSearchCustomer={setSearchCustomer}
                    selectedCustomer={selectedCustomer}
                    setSelectedCustomer={setSelectedCustomer}
                    walkInName={walkInName}
                    setWalkInName={setWalkInName}
                    walkInPhone={walkInPhone}
                    setWalkInPhone={setWalkInPhone}
                    filteredCustomers={filteredCustomers}
                    loading={loading || searchingCustomers}
                  />
                )}
                {step === "service" && (
                  <ServiceStaffStep
                    services={filteredServices}
                    searchService={searchService}
                    setSearchService={setSearchService}
                    staff={staff}
                    selectedService={selectedService}
                    setSelectedService={setSelectedService}
                    selectedStaff={selectedStaff}
                    setSelectedStaff={setSelectedStaff}
                    isMember={isMember}
                    loading={loading}
                  />
                )}
                {step === "datetime" && (
                  <DateTimeStep
                    currentMonth={currentMonth}
                    setCurrentMonth={setCurrentMonth}
                    selectedDate={selectedDate}
                    setSelectedDate={setSelectedDate}
                    selectedTime={selectedTime}
                    setSelectedTime={setSelectedTime}
                    timeSlots={ALL_TIME_SLOTS}
                  />
                )}
                {step === "confirm" && (
                  <BookingSummaryStep
                    selectedCustomer={selectedCustomer}
                    walkInName={walkInName}
                    walkInPhone={walkInPhone}
                    selectedService={selectedService}
                    selectedStaff={selectedStaff}
                    selectedDate={selectedDate}
                    selectedTime={selectedTime}
                    notes={notes}
                    setNotes={setNotes}
                    requireDeposit={requireDeposit}
                    setRequireDeposit={setRequireDeposit}
                    servicePrice={servicePrice}
                    depositAmount={depositAmount}
                  />
                )}
              </motion.div>
            </AnimatePresence>

            {/* Navigation Footer */}
            <div className="flex gap-4 mt-12 pt-10 border-t border-gray-100">
              {currentIndex > 0 && (
                <Button
                  variant="ghost"
                  onClick={handleBack}
                  className="h-16 px-8 rounded-2xl font-black text-xs uppercase tracking-[0.2em] text-gray-400 hover:text-gray-600 hover:bg-gray-50 transition-all border-2 border-transparent hover:border-gray-100"
                  disabled={saving}
                >
                  Back
                </Button>
              )}
              {step === "confirm" ? (
                <Button
                  onClick={handleConfirmBooking}
                  className="flex-1 h-16 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] text-white font-black text-xs uppercase tracking-[0.3em] shadow-xl shadow-green-900/10 transition-all active:scale-[0.98] group"
                  disabled={saving}
                >
                  {saving ? (
                    <Loader2 className="h-5 w-5 animate-spin mx-auto" />
                  ) : (
                    <span className="flex items-center justify-center gap-2">
                      Confirm Appointment
                      <Check className="h-4 w-4 group-hover:scale-125 transition-transform" />
                    </span>
                  )}
                </Button>
              ) : (
                <Button
                  onClick={handleNext}
                  disabled={!canProceed()}
                  className="flex-1 h-16 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] text-white font-black text-xs uppercase tracking-[0.3em] shadow-xl shadow-green-900/10 transition-all active:scale-[0.98] disabled:bg-gray-100 disabled:text-gray-300 disabled:shadow-none"
                >
                  Continue
                </Button>
              )}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
