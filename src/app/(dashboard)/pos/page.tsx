"use client";

import { useState, useEffect } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import {
  Search,
  X,
  Plus,
  Minus,
  Tag,
  CreditCard,
  Banknote,
  QrCode,
  Check,
  Loader2,
} from "lucide-react";
import { Header } from "@/components/layout/header";
import { Button, Card, CardContent, Input, Avatar, Badge } from "@/components/ui";
import { useAuthStore } from "@/lib/store/auth-store";
import { formatCurrency } from "@/lib/utils";
import { createClient } from "@/lib/supabase/client";

// Commission rates based on sharing
const COMMISSION_RATES = {
  // Hairstylist
  hairstylist_alone: 15,           // Working alone
  hairstylist_with_hairstylist: 8, // Sharing with another hairstylist
  hairstylist_with_assistant: 10,  // Sharing with assistant
  // Assistant
  assistant_alone: 10,             // Working alone
  assistant_with_hairstylist: 5,   // Sharing with hairstylist
};

// Category-based stock images
const CATEGORY_IMAGES: Record<string, string> = {
  "Haircut": "https://images.unsplash.com/photo-1595476108010-b4d1f102b1b1?q=80&w=400&auto=format&fit=crop",
  "Hair Spa": "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?q=80&w=400&auto=format&fit=crop",
  "Facial": "https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?q=80&w=400&auto=format&fit=crop",
  "Henna": "https://images.unsplash.com/photo-1552698621-3e3e29853874?q=80&w=400&auto=format&fit=crop",
  "Treatment": "https://images.unsplash.com/photo-1522335208411-dc5a1a639c4d?q=80&w=400&auto=format&fit=crop",
  "Massage": "https://images.unsplash.com/photo-1519823551278-64ac92734fb1?q=80&w=400&auto=format&fit=crop",
  "Manicure": "https://images.unsplash.com/photo-1632345031435-8727f6897d53?q=80&w=400&auto=format&fit=crop",
  "Pedicure": "https://images.unsplash.com/photo-1519014816548-bf5fe059e98b?q=80&w=400&auto=format&fit=crop",
  "Makeup": "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?q=80&w=400&auto=format&fit=crop",
  "Waxing": "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=400&auto=format&fit=crop",
};

const DEFAULT_IMAGE = "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?q=80&w=200&auto=format&fit=crop";

// Types for Supabase data
interface ServiceData {
  id: string;
  name: string;
  category: string;
  price: number;
  member_price: number;
  commission_rate: number;
  is_active: boolean;
  image_url?: string;
}

interface StaffData {
  id: string;
  name: string;
  role: string;
  is_active: boolean;
}

interface CustomerData {
  id: string;
  name: string;
  phone: string;
  points_balance: number;
  is_member: boolean;
}

interface StaffMember {
  id: string;
  name: string;
  role: string;
  isAssistant: boolean;
}

interface CartItem {
  id: string;
  name: string;
  price: number;
  quantity: number;
  primaryStaffId: string;
  secondaryStaffId: string | null; // Optional sharing staff
}

interface CommissionBreakdown {
  staffId: string;
  staffName: string;
  role: string;
  rate: number;
  amount: number;
  serviceNames: string[];
}

type PaymentMethod = "cash" | "qr" | "card" | "bank";

export default function POSPage() {
  const { user } = useAuthStore();
  const router = useRouter();
  const searchParams = useSearchParams();
  const bookingId = searchParams.get('booking');

  // Data states
  const [services, setServices] = useState<ServiceData[]>([]);
  const [staff, setStaff] = useState<StaffMember[]>([]);
  const [customers, setCustomers] = useState<CustomerData[]>([]);
  const [loading, setLoading] = useState(true);
  const [savingSale, setSavingSale] = useState(false);

  // Booking state (when converting from appointment)
  const [currentBookingId, setCurrentBookingId] = useState<string | null>(null);
  const [depositAmount, setDepositAmount] = useState(0);
  const [depositPaid, setDepositPaid] = useState(false);

  // UI states
  const [searchService, setSearchService] = useState("");
  const [searchCustomer, setSearchCustomer] = useState("");
  const [showCustomerDropdown, setShowCustomerDropdown] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState("All");
  const [selectedCustomer, setSelectedCustomer] = useState<CustomerData | null>(null);
  const [cart, setCart] = useState<CartItem[]>([]);
  const [pointsToRedeem, setPointsToRedeem] = useState(0);
  const [paymentMethod, setPaymentMethod] = useState<PaymentMethod>("cash");
  const [showPaymentModal, setShowPaymentModal] = useState(false);
  const [showSuccessModal, setShowSuccessModal] = useState(false);
  const [lastSaleId, setLastSaleId] = useState<string | null>(null);

  // Add Customer Modal
  const [showAddCustomerModal, setShowAddCustomerModal] = useState(false);
  const [newCustomerName, setNewCustomerName] = useState("");
  const [newCustomerPhone, setNewCustomerPhone] = useState("");
  const [savingCustomer, setSavingCustomer] = useState(false);

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
        .order('category', { ascending: true });

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
        // Map staff to include isAssistant flag based on role
        const mappedStaff: StaffMember[] = staffData.map((s: StaffData) => ({
          id: s.id,
          name: s.name,
          role: s.role,
          isAssistant: s.role.toLowerCase().includes('assistant')
        }));
        setStaff(mappedStaff);
      }

      // Fetch customers
      const { data: customersData } = await supabase
        .from('customers')
        .select('id, name, phone, points_balance, is_member')
        .order('name')
        .limit(100);

      if (customersData) {
        setCustomers(customersData);
      }

      setLoading(false);

      // If there's a booking ID, load the booking data
      if (bookingId && servicesData && staffData) {
        const { data: bookingData } = await supabase
          .from('bookings')
          .select(`
            *,
            customer:customers(id, name, phone, points_balance, is_member),
            service:services(id, name, price, member_price, category, image_url),
            staff:staff(id, name, role)
          `)
          .eq('id', bookingId)
          .single();

        if (bookingData) {
          // Set booking reference
          console.log("Loaded booking:", bookingData.id);
          setCurrentBookingId(bookingData.id);
          setDepositAmount(bookingData.deposit_amount || bookingData.deposit || 0);
          setDepositPaid(bookingData.deposit_paid || false);

          // Set customer
          if (bookingData.customer) {
            setSelectedCustomer({
              id: bookingData.customer.id,
              name: bookingData.customer.name,
              phone: bookingData.customer.phone,
              points_balance: bookingData.customer.points_balance || 0,
              is_member: bookingData.customer.is_member || false
            });
          }

          // Add service to cart with assigned staff
          if (bookingData.service && bookingData.staff) {
            const isMember = bookingData.customer?.is_member;
            const price = isMember && bookingData.service.member_price
              ? bookingData.service.member_price
              : bookingData.service.price;

            // Find staff in mapped staff list
            const mappedStaff = staffData.map((s: StaffData) => ({
              id: s.id,
              name: s.name,
              role: s.role,
              isAssistant: s.role.toLowerCase().includes('assistant')
            }));
            const assignedStaff = mappedStaff.find((s: StaffMember) => s.id === bookingData.staff.id);

            setCart([{
              id: bookingData.service.id,
              name: bookingData.service.name,
              price: price,
              quantity: 1,
              primaryStaffId: assignedStaff?.id || mappedStaff[0]?.id || '',
              secondaryStaffId: null
            }]);
          }
        }
      }
    };

    fetchData();
  }, [bookingId]);

  // Dynamic categories from loaded services
  const categories = ["All", ...Array.from(new Set(services.map(s => s.category).filter(Boolean)))];

  // Filter services by category and search
  const filteredServices = services.filter((service) => {
    const matchesCategory = selectedCategory === "All" || service.category === selectedCategory;
    const matchesSearch = service.name.toLowerCase().includes(searchService.toLowerCase());
    return matchesCategory && matchesSearch;
  });

  // Filter customers
  const filteredCustomers = customers.filter(
    (c) =>
      c.name.toLowerCase().includes(searchCustomer.toLowerCase()) ||
      c.phone.includes(searchCustomer)
  );

  // Calculate totals
  const subtotal = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);
  const maxRedeemable = Math.floor(subtotal * 0.2 / 0.03);
  const actualPointsToRedeem = Math.min(pointsToRedeem, selectedCustomer?.points_balance || 0, maxRedeemable);
  const pointsDiscount = actualPointsToRedeem * 0.03;
  const actualDepositDeduction = depositPaid ? depositAmount : 0;
  const total = subtotal - pointsDiscount - actualDepositDeduction;
  const pointsEarned = Math.floor(total > 0 ? total : 0);

  const addToCart = (service: ServiceData) => {
    if (staff.length === 0) {
      alert("No staff available. Please add staff first.");
      return;
    }

    const existing = cart.find((item) => item.id === service.id);
    if (existing) {
      setCart(cart.map((item) =>
        item.id === service.id ? { ...item, quantity: item.quantity + 1 } : item
      ));
    } else {
      // Use member price if customer is a member
      const price = selectedCustomer?.is_member && service.member_price
        ? service.member_price
        : service.price;

      setCart([...cart, {
        id: service.id,
        name: service.name,
        price: price,
        quantity: 1,
        primaryStaffId: staff[0].id,
        secondaryStaffId: null,
      }]);
    }
  };

  // Update primary staff for a cart item
  const updatePrimaryStaff = (id: string, staffId: string) => {
    setCart(cart.map((item) => {
      if (item.id === id) {
        // Clear secondary if same as new primary
        const newSecondary = item.secondaryStaffId === staffId ? null : item.secondaryStaffId;
        return { ...item, primaryStaffId: staffId, secondaryStaffId: newSecondary };
      }
      return item;
    }));
  };

  // Update secondary (sharing) staff for a cart item
  const updateSecondaryStaff = (id: string, staffId: string | null) => {
    setCart(cart.map((item) =>
      item.id === id ? { ...item, secondaryStaffId: staffId } : item
    ));
  };

  // Calculate commission based on staff roles and sharing
  const calculateCommission = (
    servicePrice: number,
    quantity: number,
    primaryStaff: StaffMember,
    secondaryStaff: StaffMember | null
  ): { primary: number; secondary: number; primaryRate: number; secondaryRate: number } => {
    const totalPrice = servicePrice * quantity;

    if (!secondaryStaff) {
      // Working alone
      const rate = primaryStaff.isAssistant
        ? COMMISSION_RATES.assistant_alone
        : COMMISSION_RATES.hairstylist_alone;
      return {
        primary: (totalPrice * rate) / 100,
        secondary: 0,
        primaryRate: rate,
        secondaryRate: 0
      };
    }

    // Sharing scenario
    let primaryRate: number;
    let secondaryRate: number;

    if (primaryStaff.isAssistant) {
      // Primary is assistant
      primaryRate = COMMISSION_RATES.assistant_with_hairstylist; // 5%
      secondaryRate = secondaryStaff.isAssistant
        ? COMMISSION_RATES.assistant_alone // Both assistants: 10% each
        : COMMISSION_RATES.hairstylist_with_assistant; // Hairstylist gets 10%
    } else {
      // Primary is hairstylist
      if (secondaryStaff.isAssistant) {
        primaryRate = COMMISSION_RATES.hairstylist_with_assistant; // 10%
        secondaryRate = COMMISSION_RATES.assistant_with_hairstylist; // 5%
      } else {
        // Both hairstylists
        primaryRate = COMMISSION_RATES.hairstylist_with_hairstylist; // 8%
        secondaryRate = COMMISSION_RATES.hairstylist_with_hairstylist; // 8%
      }
    }

    return {
      primary: (totalPrice * primaryRate) / 100,
      secondary: (totalPrice * secondaryRate) / 100,
      primaryRate,
      secondaryRate
    };
  };

  // Get commission breakdown for all cart items
  const getCommissionBreakdown = (): CommissionBreakdown[] => {
    const breakdown: Map<string, CommissionBreakdown> = new Map();

    cart.forEach(item => {
      const primaryStaff = staff.find(s => s.id === item.primaryStaffId);
      const secondaryStaff = item.secondaryStaffId
        ? staff.find(s => s.id === item.secondaryStaffId)
        : null;

      if (!primaryStaff) return;

      const commission = calculateCommission(
        item.price,
        item.quantity,
        primaryStaff,
        secondaryStaff || null
      );

      // Add primary staff commission
      if (breakdown.has(primaryStaff.id)) {
        const existing = breakdown.get(primaryStaff.id)!;
        existing.amount += commission.primary;
        existing.serviceNames.push(item.name);
      } else {
        breakdown.set(primaryStaff.id, {
          staffId: primaryStaff.id,
          staffName: primaryStaff.name,
          role: primaryStaff.role,
          rate: commission.primaryRate,
          amount: commission.primary,
          serviceNames: [item.name]
        });
      }

      // Add secondary staff commission if sharing
      if (secondaryStaff && commission.secondary > 0) {
        if (breakdown.has(secondaryStaff.id)) {
          const existing = breakdown.get(secondaryStaff.id)!;
          existing.amount += commission.secondary;
          if (!existing.serviceNames.includes(item.name)) {
            existing.serviceNames.push(item.name);
          }
        } else {
          breakdown.set(secondaryStaff.id, {
            staffId: secondaryStaff.id,
            staffName: secondaryStaff.name,
            role: secondaryStaff.role,
            rate: commission.secondaryRate,
            amount: commission.secondary,
            serviceNames: [item.name]
          });
        }
      }
    });

    return Array.from(breakdown.values());
  };

  const updateQuantity = (id: string, delta: number) => {
    setCart(cart.map((item) => {
      if (item.id === id) {
        const newQty = item.quantity + delta;
        return newQty > 0 ? { ...item, quantity: newQty } : item;
      }
      return item;
    }).filter((item) => item.quantity > 0));
  };

  const removeFromCart = (id: string) => {
    setCart(cart.filter((item) => item.id !== id));
  };

  const clearCart = () => {
    setCart([]);
    setSelectedCustomer(null);
    setPointsToRedeem(0);
    // Clear booking state and URL
    setCurrentBookingId(null);
    setDepositAmount(0);
    setDepositPaid(false);
    if (bookingId) {
      router.replace('/pos');
    }
  };

  const handleAddCustomer = async () => {
    if (!newCustomerName.trim() || !newCustomerPhone.trim()) {
      alert("Please enter name and phone number");
      return;
    }

    setSavingCustomer(true);
    const supabase = createClient();

    try {
      const { data, error } = await supabase
        .from('customers')
        .insert({
          name: newCustomerName.trim(),
          phone: newCustomerPhone.trim(),
          tier: 'Normal',
          points_balance: 0,
          is_member: false,
          created_at: new Date().toISOString()
        })
        .select()
        .single();

      if (error) throw error;

      // Add to local customers list
      const newCustomer: CustomerData = {
        id: data.id,
        name: data.name,
        phone: data.phone,
        points_balance: 0,
        is_member: false
      };
      setCustomers(prev => [...prev, newCustomer]);

      // Select the new customer
      setSelectedCustomer(newCustomer);

      // Reset and close modal
      setNewCustomerName("");
      setNewCustomerPhone("");
      setShowAddCustomerModal(false);
      setShowCustomerDropdown(false);
      setSearchCustomer("");
    } catch (error) {
      console.error("Error adding customer:", error);
      alert("Failed to add customer. Please try again.");
    } finally {
      setSavingCustomer(false);
    }
  };

  const handleProceedToPayment = () => {
    if (cart.length === 0) return;
    setShowPaymentModal(true);
  };

  const handleCompleteSale = async () => {
    setSavingSale(true);
    const supabase = createClient();
    console.log("Completing sale with bookingId:", currentBookingId);

    try {
      // 1. Create the sale record
      const { data: saleData, error: saleError } = await supabase
        .from('sales')
        .insert({
          customer_id: selectedCustomer?.id || null,
          booking_id: currentBookingId || null,
          subtotal: subtotal,
          discount_amount: 0,
          points_redeemed: actualPointsToRedeem,
          points_discount: pointsDiscount,
          deposit_deducted: actualDepositDeduction,
          total: total,
          payment_method: paymentMethod,
          status: 'completed',
          created_by: user?.id || null,
          created_at: new Date().toISOString()
        })
        .select()
        .single();

      if (saleError) {
        console.error("Sale insert error:", saleError.message, saleError.details, saleError.hint);
        throw saleError;
      }

      const saleId = saleData.id;
      setLastSaleId(saleId);

      // Update booking status to completed if from booking
      if (currentBookingId) {
        const { error: bookingError } = await supabase
          .from('bookings')
          .update({ status: 'completed' })
          .eq('id', currentBookingId);

        if (bookingError) {
          console.error("Booking status update error:", bookingError.message);
        } else {
          console.log("Booking status updated to completed:", currentBookingId);
        }
      }

      // 2. Create sale items and commissions
      const commissionBreakdown = getCommissionBreakdown();

      for (const item of cart) {
        const service = services.find(s => s.id === item.id);
        const primaryStaff = staff.find(s => s.id === item.primaryStaffId);
        const secondaryStaff = item.secondaryStaffId ? staff.find(s => s.id === item.secondaryStaffId) : null;
        const commission = primaryStaff ? calculateCommission(item.price, item.quantity, primaryStaff, secondaryStaff || null) : null;

        // Insert sale item
        const { data: saleItemData, error: saleItemError } = await supabase
          .from('sale_items')
          .insert({
            sale_id: saleId,
            item_type: 'service',
            item_id: item.id,
            item_name: item.name,
            stylist_id: item.primaryStaffId,
            quantity: item.quantity,
            price: item.price,
            unit_price: item.price,
            discount: 0,
            total: item.price * item.quantity,
            commission_rate: commission?.primaryRate || 0,
            commission_amount: commission?.primary || 0
          })
          .select()
          .single();

        if (saleItemError) console.error("Sale item error:", saleItemError.message, saleItemError.details, saleItemError.hint);

        // Insert primary staff commission
        if (commission && primaryStaff && saleItemData) {
          const currentMonth = new Date().toISOString().slice(0, 7); // YYYY-MM
          await supabase.from('commissions').insert({
            staff_id: primaryStaff.id,
            sale_id: saleId,
            sale_item_id: saleItemData.id,
            service_name: item.name,
            sale_amount: item.price * item.quantity,
            commission_rate: commission.primaryRate,
            amount: commission.primary,
            month: currentMonth,
            is_paid: false,
            created_at: new Date().toISOString()
          });

          // Insert secondary staff commission if sharing
          if (secondaryStaff && commission.secondary > 0) {
            await supabase.from('commissions').insert({
              staff_id: secondaryStaff.id,
              sale_id: saleId,
              sale_item_id: saleItemData.id,
              service_name: item.name,
              sale_amount: item.price * item.quantity,
              commission_rate: commission.secondaryRate,
              amount: commission.secondary,
              month: currentMonth,
              is_paid: false,
              created_at: new Date().toISOString()
            });
          }
        }
      }

      // 3. Update customer points if applicable
      if (selectedCustomer) {
        // Deduct redeemed points
        if (actualPointsToRedeem > 0) {
          await supabase.from('customers')
            .update({
              points_balance: selectedCustomer.points_balance - actualPointsToRedeem,
              updated_at: new Date().toISOString()
            })
            .eq('id', selectedCustomer.id);

          // Record points transaction
          await supabase.from('points_transactions').insert({
            customer_id: selectedCustomer.id,
            type: 'redeemed',
            points: -actualPointsToRedeem,
            balance_after: selectedCustomer.points_balance - actualPointsToRedeem,
            reference_id: saleId,
            reason: 'Redeemed at POS',
            performed_by: user?.id || null,
            created_at: new Date().toISOString()
          });
        }

        // Add earned points
        if (pointsEarned > 0) {
          const newBalance = selectedCustomer.points_balance - actualPointsToRedeem + pointsEarned;
          await supabase.from('customers')
            .update({
              points_balance: newBalance,
              total_spent: (selectedCustomer as any).total_spent + total || total,
              visit_count: ((selectedCustomer as any).visit_count || 0) + 1,
              updated_at: new Date().toISOString()
            })
            .eq('id', selectedCustomer.id);

          // Record points transaction
          await supabase.from('points_transactions').insert({
            customer_id: selectedCustomer.id,
            type: 'earned',
            points: pointsEarned,
            balance_after: newBalance,
            reference_id: saleId,
            reason: 'Earned from purchase',
            performed_by: user?.id || null,
            created_at: new Date().toISOString()
          });
        }
      }

      setShowPaymentModal(false);
      setShowSuccessModal(true);

    } catch (error: any) {
      console.error("Error completing sale:", error?.message || error?.details || error?.hint || JSON.stringify(error));
      alert(`Failed to complete sale: ${error?.message || 'Unknown error'}`);
    } finally {
      setSavingSale(false);
    }
  };

  const handleNewSale = () => {
    clearCart();
    setShowSuccessModal(false);
  };

  return (
    <div className="min-h-screen">
      <Header title="Point of Sale" user={user!} />

      <div className="p-6">
        <div className="flex flex-col lg:flex-row gap-6">
          {/* Services Grid */}
          <div className="flex-1">
            {/* Category Tabs */}
            <div className="flex items-center gap-2 mb-6 overflow-x-auto pb-2">
              {categories.map((cat) => (
                <Button
                  key={cat}
                  variant={selectedCategory === cat ? "primary" : "outline"}
                  size="sm"
                  onClick={() => setSelectedCategory(cat)}
                >
                  {cat}
                </Button>
              ))}
            </div>

            {/* Search */}
            <div className="mb-6">
              <Input
                placeholder="Search services..."
                icon={<Search className="h-4 w-4" />}
                value={searchService}
                onChange={(e) => setSearchService(e.target.value)}
              />
            </div>

            {/* Services Grid */}
            <div className="grid grid-cols-2 lg:grid-cols-3 gap-4">
              {loading ? (
                <div className="col-span-full text-center py-12 text-[var(--muted)]">
                  <Loader2 className="h-8 w-8 animate-spin mx-auto mb-2" />
                  Loading services...
                </div>
              ) : filteredServices.length === 0 ? (
                <div className="col-span-full text-center py-12 text-[var(--muted)]">
                  No services found
                </div>
              ) : (
                filteredServices.map((service) => (
                  <Card
                    key={service.id}
                    className="cursor-pointer hover:border-[var(--primary)] transition-colors"
                    onClick={() => addToCart(service)}
                  >
                    <CardContent className="p-4">
                      <img
                        src={service.image_url || CATEGORY_IMAGES[service.category] || DEFAULT_IMAGE}
                        alt={service.name}
                        className="h-32 w-full object-cover rounded-lg mb-3"
                      />
                      <h3 className="font-medium">{service.name}</h3>
                      <p className="text-sm text-[var(--muted)]">{service.category}</p>
                      <div className="mt-2">
                        <p className="text-lg font-bold text-[var(--primary)]">
                          {formatCurrency(selectedCustomer?.is_member && service.member_price ? service.member_price : service.price)}
                        </p>
                        {selectedCustomer?.is_member && service.member_price && service.member_price < service.price && (
                          <p className="text-xs text-[var(--muted)] line-through">
                            {formatCurrency(service.price)}
                          </p>
                        )}
                      </div>
                    </CardContent>
                  </Card>
                ))
              )}
            </div>
          </div>

          {/* Cart Panel */}
          <Card className="w-full lg:w-96 shrink-0 h-fit">
            <CardContent className="p-6">
              <h3 className="text-lg font-bold mb-4">Current Sale</h3>

              {/* Customer Selection */}
              <div className="mb-6 relative">
                <label className="block text-xs font-medium text-[var(--muted)] uppercase tracking-wide mb-2">
                  Customer Selection
                </label>
                {selectedCustomer ? (
                  <div className="p-3 bg-[var(--secondary)] rounded-xl flex items-center gap-3">
                    <Avatar name={selectedCustomer.name} />
                    <div className="flex-1">
                      <p className="font-medium text-sm">{selectedCustomer.name}</p>
                      <p className="text-xs text-[var(--muted)]">{selectedCustomer.points_balance} points</p>
                    </div>
                    <button onClick={() => setSelectedCustomer(null)}>
                      <X className="h-4 w-4 text-[var(--muted)]" />
                    </button>
                  </div>
                ) : (
                  <>
                    <Input
                      placeholder="Search customer..."
                      icon={<Search className="h-4 w-4" />}
                      value={searchCustomer}
                      onChange={(e) => {
                        setSearchCustomer(e.target.value);
                        setShowCustomerDropdown(true);
                      }}
                      onFocus={() => setShowCustomerDropdown(true)}
                    />
                    {showCustomerDropdown && searchCustomer && (
                      <div className="absolute top-full left-0 right-0 mt-1 bg-white border border-[var(--border)] rounded-xl shadow-lg z-10 max-h-48 overflow-auto">
                        {filteredCustomers.map((customer) => (
                          <button
                            key={customer.id}
                            className="w-full p-3 flex items-center gap-3 hover:bg-[var(--secondary)] text-left"
                            onClick={() => {
                              setSelectedCustomer(customer);
                              setShowCustomerDropdown(false);
                              setSearchCustomer("");
                            }}
                          >
                            <Avatar name={customer.name} size="sm" />
                            <div>
                              <p className="font-medium text-sm">{customer.name}</p>
                              <p className="text-xs text-[var(--muted)]">{customer.phone}</p>
                            </div>
                          </button>
                        ))}
                        {filteredCustomers.length === 0 && (
                          <div className="p-3">
                            <p className="text-sm text-[var(--muted)] mb-2">No customers found</p>
                            <Button
                              size="sm"
                              className="w-full"
                              onClick={() => {
                                setNewCustomerName(searchCustomer);
                                setShowAddCustomerModal(true);
                                setShowCustomerDropdown(false);
                              }}
                            >
                              <Plus className="h-4 w-4 mr-1" />
                              Add "{searchCustomer}" as New Customer
                            </Button>
                          </div>
                        )}
                      </div>
                    )}
                  </>
                )}
              </div>

              {/* Cart Items */}
              <div className="space-y-4 mb-6">
                <label className="block text-xs font-medium text-[var(--muted)] uppercase tracking-wide">
                  Selected Services ({cart.length})
                </label>
                {cart.length === 0 ? (
                  <div className="py-8 text-center text-[var(--muted)]">
                    <p>No items in cart</p>
                    <p className="text-sm">Click on services to add</p>
                  </div>
                ) : (
                  cart.map((item) => {
                    const primaryStaff = staff.find(s => s.id === item.primaryStaffId);
                    const secondaryStaff = item.secondaryStaffId ? staff.find(s => s.id === item.secondaryStaffId) : null;
                    const commission = primaryStaff ? calculateCommission(item.price, item.quantity, primaryStaff, secondaryStaff || null) : null;

                    return (
                      <div key={item.id} className="p-4 border border-[var(--border)] rounded-xl">
                        <div className="flex items-start gap-3">
                          <div className="h-12 w-12 bg-[var(--secondary)] rounded-lg flex items-center justify-center overflow-hidden">
                            <img
                              src={services.find(s => s.id === item.id)?.image_url || CATEGORY_IMAGES[services.find(s => s.id === item.id)?.category || ""] || DEFAULT_IMAGE}
                              alt={item.name}
                              className="h-full w-full object-cover"
                            />
                          </div>
                          <div className="flex-1">
                            <p className="font-medium text-sm">{item.name}</p>
                            <p className="text-xs text-[var(--muted)]">{formatCurrency(item.price)} each</p>
                          </div>
                          <button onClick={() => removeFromCart(item.id)} className="p-1 hover:bg-[var(--secondary)] rounded">
                            <X className="h-4 w-4 text-[var(--muted)]" />
                          </button>
                        </div>
                        <div className="flex items-center justify-between mt-3">
                          <div className="flex items-center gap-2">
                            <button
                              onClick={() => updateQuantity(item.id, -1)}
                              className="h-8 w-8 rounded-full border border-[var(--border)] flex items-center justify-center hover:bg-[var(--secondary)]"
                            >
                              <Minus className="h-3 w-3" />
                            </button>
                            <span className="w-8 text-center font-medium">{item.quantity}</span>
                            <button
                              onClick={() => updateQuantity(item.id, 1)}
                              className="h-8 w-8 rounded-full border border-[var(--border)] flex items-center justify-center hover:bg-[var(--secondary)]"
                            >
                              <Plus className="h-3 w-3" />
                            </button>
                          </div>
                        </div>

                        {/* Staff Assignment Section */}
                        <div className="mt-3 pt-3 border-t border-[var(--border)]">
                          <div className="flex flex-col gap-2">
                            {/* Primary Staff */}
                            <div className="flex items-center gap-2">
                              <span className="text-xs text-[var(--muted)] w-16">Primary:</span>
                              <select
                                value={item.primaryStaffId}
                                onChange={(e) => updatePrimaryStaff(item.id, e.target.value)}
                                className="flex-1 text-sm px-3 py-1 border border-[var(--border)] rounded-lg bg-transparent"
                              >
                                {staff.map((s) => (
                                  <option key={s.id} value={s.id}>
                                    {s.name} ({s.role})
                                  </option>
                                ))}
                              </select>
                            </div>

                            {/* Secondary Staff (Sharing) */}
                            <div className="flex items-center gap-2">
                              <span className="text-xs text-[var(--muted)] w-16">Sharing:</span>
                              <select
                                value={item.secondaryStaffId || ""}
                                onChange={(e) => updateSecondaryStaff(item.id, e.target.value || null)}
                                className="flex-1 text-sm px-3 py-1 border border-[var(--border)] rounded-lg bg-transparent"
                              >
                                <option value="">No sharing (alone)</option>
                                {staff
                                  .filter(s => s.id !== item.primaryStaffId)
                                  .map((s) => (
                                    <option key={s.id} value={s.id}>
                                      {s.name} ({s.role})
                                    </option>
                                  ))}
                              </select>
                            </div>
                          </div>

                          {/* Commission Preview */}
                          {commission && (
                            <div className="mt-2 p-2 bg-[var(--secondary)] rounded-lg text-xs">
                              <div className="flex justify-between">
                                <span>{primaryStaff?.name} ({commission.primaryRate}%)</span>
                                <span className="font-medium text-[var(--primary)]">{formatCurrency(commission.primary)}</span>
                              </div>
                              {secondaryStaff && commission.secondary > 0 && (
                                <div className="flex justify-between mt-1">
                                  <span>{secondaryStaff.name} ({commission.secondaryRate}%)</span>
                                  <span className="font-medium text-[var(--primary)]">{formatCurrency(commission.secondary)}</span>
                                </div>
                              )}
                            </div>
                          )}
                        </div>
                      </div>
                    );
                  })
                )}
              </div>

              {/* Points Redemption */}
              {selectedCustomer && selectedCustomer.points_balance > 0 && cart.length > 0 && (
                <div className="mb-4 p-3 bg-[var(--primary-light)] rounded-xl">
                  <div className="flex items-center justify-between mb-2">
                    <span className="text-sm font-medium flex items-center gap-2">
                      <Tag className="h-4 w-4" />
                      Redeem Points
                    </span>
                    <span className="text-xs text-[var(--muted)]">
                      {selectedCustomer.points_balance} available
                    </span>
                  </div>
                  <div className="flex items-center gap-2">
                    <Input
                      type="number"
                      value={pointsToRedeem}
                      onChange={(e) => setPointsToRedeem(Math.max(0, parseInt(e.target.value) || 0))}
                      className="text-center"
                    />
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => setPointsToRedeem(Math.min(selectedCustomer.points_balance, maxRedeemable))}
                    >
                      Max
                    </Button>
                  </div>
                  {actualPointsToRedeem > 0 && (
                    <p className="text-xs text-[var(--primary)] mt-2">
                      Discount: -{formatCurrency(pointsDiscount)}
                    </p>
                  )}
                </div>
              )}

              {/* Booking Indicator */}
              {currentBookingId && (
                <div className="mb-4 p-3 bg-[var(--success)]/10 border border-[var(--success)]/30 rounded-xl">
                  <p className="text-sm font-medium text-[var(--success)]">From Appointment Booking</p>
                  {depositPaid && depositAmount > 0 && (
                    <p className="text-xs text-[var(--muted)] mt-1">Deposit RM{depositAmount.toFixed(2)} will be deducted</p>
                  )}
                </div>
              )}

              {/* Totals */}
              {cart.length > 0 && (
                <div className="space-y-2 py-4 border-t border-[var(--border)]">
                  <div className="flex justify-between text-sm">
                    <span>Subtotal</span>
                    <span>{formatCurrency(subtotal)}</span>
                  </div>
                  {actualPointsToRedeem > 0 && (
                    <div className="flex justify-between text-sm text-[var(--primary)]">
                      <span className="flex items-center gap-1">
                        <Tag className="h-4 w-4" />
                        Points ({actualPointsToRedeem} pts)
                      </span>
                      <span>-{formatCurrency(pointsDiscount)}</span>
                    </div>
                  )}
                  {actualDepositDeduction > 0 && (
                    <div className="flex justify-between text-sm text-[var(--success)]">
                      <span>Deposit Paid</span>
                      <span>-{formatCurrency(actualDepositDeduction)}</span>
                    </div>
                  )}
                  <div className="flex justify-between font-bold text-2xl pt-2">
                    <span>Total</span>
                    <span>{formatCurrency(total)}</span>
                  </div>
                </div>
              )}

              {/* Actions */}
              <div className="grid grid-cols-2 gap-2 mt-4">
                <Button variant="outline" onClick={clearCart} disabled={cart.length === 0}>
                  Cancel
                </Button>
                <Button onClick={handleProceedToPayment} disabled={cart.length === 0}>
                  Pay {cart.length > 0 && formatCurrency(total)}
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>

      {/* Payment Modal */}
      {showPaymentModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <Card className="w-full max-w-md">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-xl font-bold">Select Payment Method</h2>
                <button onClick={() => setShowPaymentModal(false)} className="p-2 hover:bg-[var(--secondary)] rounded-lg">
                  <X className="h-5 w-5" />
                </button>
              </div>

              <div className="grid grid-cols-2 gap-3 mb-6">
                {[
                  { id: "cash", icon: Banknote, label: "Cash" },
                  { id: "qr", icon: QrCode, label: "QR Pay" },
                  { id: "card", icon: CreditCard, label: "Card" },
                  { id: "bank", icon: CreditCard, label: "Bank Transfer" },
                ].map((method) => (
                  <button
                    key={method.id}
                    onClick={() => setPaymentMethod(method.id as PaymentMethod)}
                    className={`p-4 rounded-xl border text-center transition-all ${paymentMethod === method.id
                      ? "border-[var(--primary)] bg-[var(--primary-light)]"
                      : "border-[var(--border)] hover:border-[var(--primary)]"
                      }`}
                  >
                    <method.icon className={`h-6 w-6 mx-auto mb-2 ${paymentMethod === method.id ? "text-[var(--primary)]" : "text-[var(--muted)]"
                      }`} />
                    <span className="text-sm font-medium">{method.label}</span>
                  </button>
                ))}
              </div>

              <div className="p-4 bg-[var(--secondary)] rounded-xl mb-4">
                <div className="flex justify-between mb-2">
                  <span>Total Amount</span>
                  <span className="text-2xl font-bold">{formatCurrency(total)}</span>
                </div>
                {selectedCustomer && (
                  <p className="text-sm text-[var(--success)]">
                    +{pointsEarned} points will be earned
                  </p>
                )}
              </div>

              {/* Commission Preview */}
              {cart.length > 0 && (
                <div className="p-4 bg-[var(--primary-light)] rounded-xl mb-6 text-left">
                  <h4 className="text-sm font-semibold mb-2 text-[var(--primary)]">Commission Preview</h4>
                  <div className="space-y-1 text-sm">
                    {getCommissionBreakdown().map((item) => (
                      <div key={item.staffId} className="flex justify-between">
                        <span>{item.staffName} ({item.rate}%)</span>
                        <span className="font-medium">{formatCurrency(item.amount)}</span>
                      </div>
                    ))}
                    <div className="flex justify-between pt-2 border-t border-[var(--primary)] font-semibold">
                      <span>Total</span>
                      <span>{formatCurrency(getCommissionBreakdown().reduce((sum, i) => sum + i.amount, 0))}</span>
                    </div>
                  </div>
                </div>
              )}

              <Button className="w-full" size="lg" onClick={handleCompleteSale} disabled={savingSale}>
                {savingSale ? (
                  <>
                    <Loader2 className="h-5 w-5 mr-2 animate-spin" />
                    Processing...
                  </>
                ) : (
                  "Complete Payment"
                )}
              </Button>
            </CardContent>
          </Card>
        </div>
      )}

      {/* Success Modal */}
      {showSuccessModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <Card className="w-full max-w-md text-center max-h-[90vh] overflow-y-auto">
            <CardContent className="p-8">
              <div className="h-20 w-20 rounded-full bg-[var(--success)] flex items-center justify-center mx-auto mb-6">
                <Check className="h-10 w-10 text-white" />
              </div>
              <h2 className="text-2xl font-bold mb-2">Payment Successful!</h2>
              <p className="text-[var(--muted)] mb-6">Transaction completed successfully</p>

              <div className="bg-[var(--secondary)] rounded-xl p-4 mb-4 text-left">
                <div className="flex justify-between mb-2">
                  <span className="text-[var(--muted)]">Amount Paid</span>
                  <span className="font-bold text-xl">{formatCurrency(total)}</span>
                </div>
                <div className="flex justify-between mb-2">
                  <span className="text-[var(--muted)]">Payment Method</span>
                  <span className="capitalize">{paymentMethod}</span>
                </div>
                {selectedCustomer && (
                  <div className="flex justify-between">
                    <span className="text-[var(--muted)]">Points Earned</span>
                    <span className="text-[var(--primary)] font-medium">+{pointsEarned} pts</span>
                  </div>
                )}
              </div>

              {/* Commission Breakdown */}
              {cart.length > 0 && (
                <div className="bg-[var(--primary-light)] rounded-xl p-4 mb-6 text-left">
                  <h4 className="font-semibold text-sm mb-3 text-[var(--primary)]">Staff Commission Breakdown</h4>
                  <div className="space-y-2">
                    {getCommissionBreakdown().map((item) => (
                      <div key={item.staffId} className="flex justify-between items-center py-2 border-b border-[var(--border)] last:border-0">
                        <div>
                          <p className="font-medium text-sm">{item.staffName}</p>
                          <p className="text-xs text-[var(--muted)]">{item.role}</p>
                        </div>
                        <div className="text-right">
                          <p className="font-bold text-[var(--primary)]">{formatCurrency(item.amount)}</p>
                          <p className="text-xs text-[var(--muted)]">{item.rate}% rate</p>
                        </div>
                      </div>
                    ))}
                    <div className="flex justify-between pt-2 border-t border-[var(--primary)]">
                      <span className="font-semibold text-sm">Total Commission</span>
                      <span className="font-bold text-[var(--primary)]">
                        {formatCurrency(getCommissionBreakdown().reduce((sum, i) => sum + i.amount, 0))}
                      </span>
                    </div>
                  </div>
                </div>
              )}

              <div className="space-y-3">
                <Button className="w-full" size="lg" onClick={handleNewSale}>
                  <Plus className="h-5 w-5 mr-2" />
                  New Sale
                </Button>
                <Button variant="outline" className="w-full" size="lg" onClick={() => router.push("/dashboard")}>
                  Back to Dashboard
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}

      {/* Add Customer Modal */}
      {showAddCustomerModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <Card className="w-full max-w-md">
            <CardContent className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-xl font-bold">Add New Customer</h2>
                <button
                  onClick={() => {
                    setShowAddCustomerModal(false);
                    setNewCustomerName("");
                    setNewCustomerPhone("");
                  }}
                  className="p-2 hover:bg-[var(--secondary)] rounded-lg"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>

              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium mb-1">Customer Name *</label>
                  <Input
                    placeholder="Enter customer name"
                    value={newCustomerName}
                    onChange={(e) => setNewCustomerName(e.target.value)}
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium mb-1">Phone Number *</label>
                  <Input
                    placeholder="Enter phone number"
                    value={newCustomerPhone}
                    onChange={(e) => setNewCustomerPhone(e.target.value)}
                  />
                </div>
              </div>

              <div className="flex gap-3 mt-6">
                <Button
                  variant="outline"
                  className="flex-1"
                  onClick={() => {
                    setShowAddCustomerModal(false);
                    setNewCustomerName("");
                    setNewCustomerPhone("");
                  }}
                >
                  Cancel
                </Button>
                <Button
                  className="flex-1"
                  onClick={handleAddCustomer}
                  disabled={savingCustomer || !newCustomerName.trim() || !newCustomerPhone.trim()}
                >
                  {savingCustomer ? (
                    <>
                      <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                      Adding...
                    </>
                  ) : (
                    "Add Customer"
                  )}
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  );
}
