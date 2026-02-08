"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import {
  Search,
  ArrowLeft,
  Calendar,
  Clock,
  User,
  Scissors,
  Check,
  ChevronLeft,
  ChevronRight,
  X,
  Loader2,
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent, Input, Avatar, Badge } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { formatCurrency } from "@/lib/utils";
import { createClient } from "@/lib/supabase/client";
import { format } from "date-fns";

// Types
interface Service {
  id: string;
  name: string;
  category: string;
  price: number;
  member_price?: number;
  duration_minutes?: number;
}

interface Staff {
  id: string;
  name: string;
  role: string;
  is_active?: boolean;
}

interface Customer {
  id: string;
  name: string;
  phone: string;
  points_balance: number;
  tier: string;
  is_member?: boolean;
}

// Helper to check if customer is member
const isCustomerMember = (customer?: Customer): boolean => {
  if (!customer) return false;
  return customer.is_member || customer.tier === 'Member' || customer.tier === 'VIP';
};

const timeSlots = [
  "09:00", "09:30", "10:00", "10:30", "11:00", "11:30",
  "12:00", "12:30", "14:00", "14:30", "15:00", "15:30",
  "16:00", "16:30", "17:00", "17:30", "18:00", "18:30",
  "19:00", "19:30", "20:00", "20:30",
];

// Generate calendar days for current month
const generateCalendarDays = (year: number, month: number) => {
  const days = [];
  const firstDay = new Date(year, month, 1);
  const lastDay = new Date(year, month + 1, 0);
  const today = new Date();

  // Add empty days for padding
  for (let i = 0; i < firstDay.getDay(); i++) {
    days.push({ day: null, isToday: false, isPast: false });
  }

  // Add actual days
  for (let i = 1; i <= lastDay.getDate(); i++) {
    const date = new Date(year, month, i);
    days.push({
      day: i,
      isToday: date.toDateString() === today.toDateString(),
      isPast: date < new Date(today.getFullYear(), today.getMonth(), today.getDate()),
    });
  }

  return days;
};

type Step = "customer" | "service" | "datetime" | "confirm" | "complete";

export default function NewBookingPage() {
  const router = useRouter();
  const { user } = useAuthStore();

  // Data from Supabase
  const [services, setServices] = useState<Service[]>([]);
  const [staff, setStaff] = useState<Staff[]>([]);
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [loading, setLoading] = useState(true);
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
  const [currentMonth, setCurrentMonth] = useState(new Date());

  const [notes, setNotes] = useState("");
  const [requireDeposit, setRequireDeposit] = useState(true);

  // Fetch data from Supabase
  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      const supabase = createClient();

      // Fetch services
      const { data: servicesData } = await supabase
        .from('services')
        .select('*')
        .eq('is_active', true)
        .order('name');

      if (servicesData) {
        setServices(servicesData);
      }

      // Fetch staff
      const { data: staffData } = await supabase
        .from('staff')
        .select('*')
        .eq('is_active', true)
        .order('name');

      if (staffData) {
        setStaff(staffData);
      }

      // Fetch customers
      const { data: customersData } = await supabase
        .from('customers')
        .select('*')
        .order('name');

      if (customersData) {
        setCustomers(customersData);
      }

      setLoading(false);
    };

    fetchData();
  }, []);

  // Filtered customers
  const filteredCustomers = customers.filter(
    (c) =>
      c.name.toLowerCase().includes(searchCustomer.toLowerCase()) ||
      c.phone?.includes(searchCustomer)
  );

  // Calendar
  const calendarDays = generateCalendarDays(currentMonth.getFullYear(), currentMonth.getMonth());
  const monthName = currentMonth.toLocaleString("default", { month: "long", year: "numeric" });

  const prevMonth = () => {
    setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1));
  };

  const nextMonth = () => {
    setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1));
  };

  // Calculate deposit
  const isMember = isCustomerMember(selectedCustomer || undefined);
  const servicePrice = selectedService
    ? (isMember && selectedService.member_price ? selectedService.member_price : selectedService.price)
    : 0;
  const depositAmount = Math.ceil(servicePrice * 0.25); // 25% deposit

  // Handle step navigation
  const canProceed = () => {
    switch (step) {
      case "customer":
        return selectedCustomer || (isWalkIn && walkInName && walkInPhone);
      case "service":
        return selectedService && selectedStaff;
      case "datetime":
        return selectedDate && selectedTime;
      default:
        return true;
    }
  };

  const handleNext = () => {
    const steps: Step[] = ["customer", "service", "datetime", "confirm", "complete"];
    const currentIndex = steps.indexOf(step);
    if (currentIndex < steps.length - 1) {
      setStep(steps[currentIndex + 1]);
    }
  };

  const handleBack = () => {
    const steps: Step[] = ["customer", "service", "datetime", "confirm", "complete"];
    const currentIndex = steps.indexOf(step);
    if (currentIndex > 0) {
      setStep(steps[currentIndex - 1]);
    }
  };

  const handleConfirmBooking = async () => {
    if (!selectedService || !selectedDate || !selectedTime) return;

    setSaving(true);
    const supabase = createClient();

    try {
      // If walk-in, create customer first
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
            created_at: new Date().toISOString()
          })
          .select()
          .single();

        if (customerError) throw customerError;
        customerId = newCustomer.id;
      }

      // Calculate deposit
      const isMember = isCustomerMember(selectedCustomer || undefined);
      const servicePrice = isMember && selectedService.member_price
        ? selectedService.member_price
        : selectedService.price;
      const depositAmount = requireDeposit ? Math.ceil(servicePrice * 0.25) : 0;

      // Create booking
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
          deposit_amount: depositAmount,
          deposit: depositAmount,
          deposit_paid: false,
          notes: notes || null,
          created_at: new Date().toISOString()
        });

      if (bookingError) throw bookingError;

      setStep("complete");
    } catch (error) {
      console.error("Error creating booking:", error);
      alert("Failed to create booking. Please try again.");
    } finally {
      setSaving(false);
    }
  };

  // Success screen
  if (step === "complete") {
    return (
      <div className="min-h-screen">
        <Header title="Booking Confirmed" user={user!} />
        <div className="p-6 flex items-center justify-center min-h-[calc(100vh-80px)]">
          <Card className="w-full max-w-md text-center">
            <CardContent className="p-8">
              <div className="h-20 w-20 rounded-full bg-[var(--success)] flex items-center justify-center mx-auto mb-6">
                <Check className="h-10 w-10 text-white" />
              </div>
              <h2 className="text-2xl font-bold mb-2">Booking Confirmed!</h2>
              <p className="text-[var(--muted)] mb-6">Appointment has been scheduled successfully</p>

              <div className="bg-[var(--secondary)] rounded-xl p-4 mb-6 text-left space-y-3">
                <div className="flex justify-between">
                  <span className="text-[var(--muted)]">Customer</span>
                  <span className="font-medium">{selectedCustomer?.name || walkInName}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-[var(--muted)]">Service</span>
                  <span className="font-medium">{selectedService?.name}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-[var(--muted)]">Date & Time</span>
                  <span className="font-medium">
                    {selectedDate?.toLocaleDateString("en-MY", { day: "numeric", month: "short" })} at {selectedTime}
                  </span>
                </div>
                <div className="flex justify-between">
                  <span className="text-[var(--muted)]">Staff</span>
                  <span className="font-medium">{selectedStaff?.name}</span>
                </div>
                {requireDeposit && (
                  <div className="flex justify-between pt-2 border-t border-[var(--border)]">
                    <span className="text-[var(--muted)]">Deposit Required</span>
                    <span className="font-bold text-[var(--primary)]">{formatCurrency(depositAmount)}</span>
                  </div>
                )}
              </div>

              <div className="space-y-3">
                <Button className="w-full" size="lg" onClick={() => {
                  setStep("customer");
                  setSelectedCustomer(null);
                  setSelectedService(null);
                  setSelectedStaff(null);
                  setSelectedDate(null);
                  setSelectedTime(null);
                  setNotes("");
                }}>
                  New Booking
                </Button>
                <Button variant="outline" className="w-full" size="lg" onClick={() => router.push("/appointments")}>
                  Back to Calendar
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen">
      <Header title="New Booking" subtitle="Schedule an appointment" user={user!} />

      <div className="p-6">
        {/* Back Button */}
        <Button variant="ghost" className="mb-4" onClick={() => router.push("/appointments")}>
          <ArrowLeft className="h-4 w-4 mr-2" />
          Back to Calendar
        </Button>

        {/* Progress Steps */}
        <div className="flex items-center justify-center gap-2 mb-8">
          {[
            { id: "customer", label: "Customer", icon: User },
            { id: "service", label: "Service", icon: Scissors },
            { id: "datetime", label: "Date & Time", icon: Calendar },
            { id: "confirm", label: "Confirm", icon: Check },
          ].map((s, index) => {
            const steps: Step[] = ["customer", "service", "datetime", "confirm"];
            const currentIndex = steps.indexOf(step);
            const stepIndex = steps.indexOf(s.id as Step);
            const isActive = step === s.id;
            const isCompleted = stepIndex < currentIndex;

            return (
              <div key={s.id} className="flex items-center">
                <div className={`flex items-center gap-2 px-4 py-2 rounded-full transition-all ${
                  isActive
                    ? "bg-[var(--primary)] text-white"
                    : isCompleted
                    ? "bg-[var(--primary-light)] text-[var(--primary)]"
                    : "bg-[var(--secondary)] text-[var(--muted)]"
                }`}>
                  <s.icon className="h-4 w-4" />
                  <span className="text-sm font-medium hidden sm:block">{s.label}</span>
                </div>
                {index < 3 && (
                  <div className={`w-8 h-0.5 mx-1 ${
                    isCompleted ? "bg-[var(--primary)]" : "bg-[var(--border)]"
                  }`} />
                )}
              </div>
            );
          })}
        </div>

        {/* Step Content */}
        <Card className="max-w-2xl mx-auto">
          <CardContent className="p-6">
            {/* Step 1: Customer Selection */}
            {step === "customer" && (
              <div>
                <h3 className="text-lg font-bold mb-4">Select Customer</h3>

                <div className="flex gap-2 mb-4">
                  <Button
                    variant={!isWalkIn ? "primary" : "outline"}
                    onClick={() => setIsWalkIn(false)}
                    className="flex-1"
                  >
                    Existing Customer
                  </Button>
                  <Button
                    variant={isWalkIn ? "primary" : "outline"}
                    onClick={() => {
                      setIsWalkIn(true);
                      setSelectedCustomer(null);
                    }}
                    className="flex-1"
                  >
                    Walk-in
                  </Button>
                </div>

                {!isWalkIn ? (
                  <div>
                    <Input
                      placeholder="Search by name or phone..."
                      icon={<Search className="h-4 w-4" />}
                      value={searchCustomer}
                      onChange={(e) => setSearchCustomer(e.target.value)}
                      className="mb-4"
                    />
                    <div className="space-y-2 max-h-60 overflow-auto">
                      {loading ? (
                        <div className="py-4 text-center text-[var(--muted)]">
                          <Loader2 className="h-5 w-5 animate-spin mx-auto mb-1" />
                          Loading customers...
                        </div>
                      ) : filteredCustomers.map((customer) => (
                        <button
                          key={customer.id}
                          onClick={() => setSelectedCustomer(customer)}
                          className={`w-full p-4 rounded-xl border text-left transition-all flex items-center gap-3 ${
                            selectedCustomer?.id === customer.id
                              ? "border-[var(--primary)] bg-[var(--primary-light)]"
                              : "border-[var(--border)] hover:border-[var(--primary)]"
                          }`}
                        >
                          <Avatar name={customer.name} />
                          <div className="flex-1">
                            <div className="flex items-center gap-2">
                              <span className="font-medium">{customer.name}</span>
                              <Badge variant={customer.tier === 'VIP' ? 'warning' : customer.tier === 'Member' ? 'success' : 'default'}>
                                {customer.tier}
                              </Badge>
                            </div>
                            <p className="text-sm text-[var(--muted)]">{customer.phone}</p>
                          </div>
                          {selectedCustomer?.id === customer.id && (
                            <Check className="h-5 w-5 text-[var(--primary)]" />
                          )}
                        </button>
                      ))}
                    </div>
                  </div>
                ) : (
                  <div className="space-y-4">
                    <Input
                      placeholder="Customer name"
                      value={walkInName}
                      onChange={(e) => setWalkInName(e.target.value)}
                    />
                    <Input
                      placeholder="Phone number (e.g., 012-345 6789)"
                      value={walkInPhone}
                      onChange={(e) => setWalkInPhone(e.target.value)}
                    />
                  </div>
                )}
              </div>
            )}

            {/* Step 2: Service & Staff Selection */}
            {step === "service" && (
              <div>
                <h3 className="text-lg font-bold mb-4">Select Service & Staff</h3>

                <div className="mb-6">
                  <p className="text-sm font-medium text-[var(--muted)] mb-2">Service</p>
                  <div className="grid grid-cols-1 gap-2 max-h-48 overflow-auto">
                    {loading ? (
                      <div className="py-4 text-center text-[var(--muted)]">
                        <Loader2 className="h-5 w-5 animate-spin mx-auto mb-1" />
                        Loading services...
                      </div>
                    ) : services.map((service) => {
                      const showMemberPrice = isMember && service.member_price && service.member_price < service.price;
                      const displayPrice = showMemberPrice ? service.member_price : service.price;
                      return (
                        <button
                          key={service.id}
                          onClick={() => setSelectedService(service)}
                          className={`p-4 rounded-xl border text-left transition-all ${
                            selectedService?.id === service.id
                              ? "border-[var(--primary)] bg-[var(--primary-light)]"
                              : "border-[var(--border)] hover:border-[var(--primary)]"
                          }`}
                        >
                          <div className="flex items-center justify-between">
                            <div>
                              <p className="font-medium">{service.name}</p>
                              <p className="text-sm text-[var(--muted)]">{service.duration_minutes || 60} mins</p>
                            </div>
                            <div className="text-right">
                              <p className="font-bold text-[var(--primary)]">
                                {formatCurrency(displayPrice!)}
                              </p>
                              {showMemberPrice && (
                                <p className="text-xs text-[var(--muted)] line-through">
                                  {formatCurrency(service.price)}
                                </p>
                              )}
                            </div>
                          </div>
                        </button>
                      );
                    })}
                  </div>
                </div>

                <div>
                  <p className="text-sm font-medium text-[var(--muted)] mb-2">Assign Staff</p>
                  <div className="grid grid-cols-2 gap-2">
                    {loading ? (
                      <div className="col-span-2 py-4 text-center text-[var(--muted)]">
                        <Loader2 className="h-5 w-5 animate-spin mx-auto mb-1" />
                        Loading staff...
                      </div>
                    ) : staff.map((s) => (
                      <button
                        key={s.id}
                        onClick={() => setSelectedStaff(s)}
                        className={`p-4 rounded-xl border text-left transition-all ${
                          selectedStaff?.id === s.id
                            ? "border-[var(--primary)] bg-[var(--primary-light)]"
                            : "border-[var(--border)] hover:border-[var(--primary)]"
                        }`}
                      >
                        <div className="flex items-center gap-3">
                          <Avatar name={s.name} size="sm" />
                          <div>
                            <p className="font-medium text-sm">{s.name}</p>
                            <p className="text-xs text-[var(--muted)]">{s.role}</p>
                          </div>
                        </div>
                      </button>
                    ))}
                  </div>
                </div>
              </div>
            )}

            {/* Step 3: Date & Time */}
            {step === "datetime" && (
              <div>
                <h3 className="text-lg font-bold mb-4">Select Date & Time</h3>

                {/* Calendar */}
                <div className="mb-6">
                  <div className="flex items-center justify-between mb-4">
                    <button onClick={prevMonth} className="p-2 hover:bg-[var(--secondary)] rounded-lg">
                      <ChevronLeft className="h-5 w-5" />
                    </button>
                    <span className="font-medium">{monthName}</span>
                    <button onClick={nextMonth} className="p-2 hover:bg-[var(--secondary)] rounded-lg">
                      <ChevronRight className="h-5 w-5" />
                    </button>
                  </div>

                  <div className="grid grid-cols-7 gap-1">
                    {["S", "M", "T", "W", "T", "F", "S"].map((day, i) => (
                      <div key={i} className="p-2 text-center text-xs font-medium text-[var(--muted)]">
                        {day}
                      </div>
                    ))}
                    {calendarDays.map((item, idx) => {
                      const isSelected = selectedDate &&
                        item.day === selectedDate.getDate() &&
                        currentMonth.getMonth() === selectedDate.getMonth() &&
                        currentMonth.getFullYear() === selectedDate.getFullYear();

                      return (
                        <button
                          key={idx}
                          disabled={!item.day || item.isPast}
                          onClick={() => {
                            if (item.day && !item.isPast) {
                              setSelectedDate(new Date(currentMonth.getFullYear(), currentMonth.getMonth(), item.day));
                            }
                          }}
                          className={`p-2 text-center rounded-lg transition-all ${
                            !item.day
                              ? ""
                              : item.isPast
                              ? "text-[var(--muted)] cursor-not-allowed"
                              : isSelected
                              ? "bg-[var(--primary)] text-white"
                              : item.isToday
                              ? "bg-[var(--primary-light)] text-[var(--primary)] font-bold"
                              : "hover:bg-[var(--secondary)]"
                          }`}
                        >
                          {item.day}
                        </button>
                      );
                    })}
                  </div>
                </div>

                {/* Time Slots */}
                {selectedDate && (
                  <div>
                    <p className="text-sm font-medium text-[var(--muted)] mb-2 flex items-center gap-2">
                      <Clock className="h-4 w-4" />
                      Available Times
                    </p>
                    <div className="grid grid-cols-4 gap-2">
                      {timeSlots.map((time) => (
                        <button
                          key={time}
                          onClick={() => setSelectedTime(time)}
                          className={`p-2 text-sm rounded-lg border transition-all ${
                            selectedTime === time
                              ? "border-[var(--primary)] bg-[var(--primary)] text-white"
                              : "border-[var(--border)] hover:border-[var(--primary)]"
                          }`}
                        >
                          {time}
                        </button>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            )}

            {/* Step 4: Confirmation */}
            {step === "confirm" && (
              <div>
                <h3 className="text-lg font-bold mb-4">Confirm Booking</h3>

                <div className="space-y-4 mb-6">
                  <div className="p-4 bg-[var(--secondary)] rounded-xl">
                    <p className="text-xs text-[var(--muted)] uppercase tracking-wide mb-1">Customer</p>
                    <p className="font-medium">{selectedCustomer?.name || walkInName}</p>
                    <p className="text-sm text-[var(--muted)]">{selectedCustomer?.phone || walkInPhone}</p>
                  </div>

                  <div className="p-4 bg-[var(--secondary)] rounded-xl">
                    <p className="text-xs text-[var(--muted)] uppercase tracking-wide mb-1">Service</p>
                    <p className="font-medium">{selectedService?.name}</p>
                    <p className="text-sm text-[var(--muted)]">{selectedService?.duration_minutes || 60} mins</p>
                    <p className="font-bold text-[var(--primary)] mt-1">{formatCurrency(servicePrice)}</p>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <div className="p-4 bg-[var(--secondary)] rounded-xl">
                      <p className="text-xs text-[var(--muted)] uppercase tracking-wide mb-1">Date & Time</p>
                      <p className="font-medium">
                        {selectedDate?.toLocaleDateString("en-MY", {
                          weekday: "short",
                          day: "numeric",
                          month: "short",
                        })}
                      </p>
                      <p className="text-sm">{selectedTime}</p>
                    </div>
                    <div className="p-4 bg-[var(--secondary)] rounded-xl">
                      <p className="text-xs text-[var(--muted)] uppercase tracking-wide mb-1">Staff</p>
                      <p className="font-medium">{selectedStaff?.name}</p>
                      <p className="text-sm text-[var(--muted)]">{selectedStaff?.role}</p>
                    </div>
                  </div>

                  <div>
                    <label className="text-sm font-medium text-[var(--muted)]">Notes (Optional)</label>
                    <textarea
                      value={notes}
                      onChange={(e) => setNotes(e.target.value)}
                      placeholder="Any special requests or notes..."
                      className="w-full mt-1 p-3 border border-[var(--border)] rounded-xl resize-none h-20"
                    />
                  </div>

                  <div className="flex items-center justify-between p-4 border border-[var(--border)] rounded-xl">
                    <div>
                      <p className="font-medium">Require Deposit</p>
                      <p className="text-sm text-[var(--muted)]">25% of service price ({formatCurrency(depositAmount)})</p>
                    </div>
                    <button
                      onClick={() => setRequireDeposit(!requireDeposit)}
                      className={`w-12 h-6 rounded-full transition-colors ${
                        requireDeposit ? "bg-[var(--primary)]" : "bg-[var(--border)]"
                      }`}
                    >
                      <div className={`w-5 h-5 rounded-full bg-white shadow transition-transform ${
                        requireDeposit ? "translate-x-6" : "translate-x-0.5"
                      }`} />
                    </button>
                  </div>
                </div>
              </div>
            )}

            {/* Navigation Buttons */}
            <div className="flex gap-3 mt-6 pt-6 border-t border-[var(--border)]">
              {step !== "customer" && (
                <Button variant="outline" onClick={handleBack} className="flex-1" disabled={saving}>
                  Back
                </Button>
              )}
              {step === "confirm" ? (
                <Button onClick={handleConfirmBooking} className="flex-1" size="lg" disabled={saving}>
                  {saving ? (
                    <>
                      <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                      Creating...
                    </>
                  ) : (
                    "Confirm Booking"
                  )}
                </Button>
              ) : (
                <Button
                  onClick={handleNext}
                  disabled={!canProceed()}
                  className="flex-1"
                  size="lg"
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
