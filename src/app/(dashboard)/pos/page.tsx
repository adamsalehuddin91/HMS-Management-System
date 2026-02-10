"use client";

import { useState, useEffect } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { Header } from "@/components/layout/header";
import { createClient } from "@/lib/supabase/client";
import { useAuthStore } from "@/lib/store/auth-store";
import { motion, AnimatePresence } from "framer-motion";
import {
  CartItem,
  StaffMember,
  getCommissionBreakdown,
  calculateItemCommission,
  CommissionBreakdown
} from "@/lib/utils/pos-calculations";

// Components
import { ItemCatalog } from "./components/ItemCatalog";
import { POSCart } from "./components/POSCart";
import { PaymentModal } from "./components/PaymentModal";
import { SuccessModal } from "./components/SuccessModal";
import { AddCustomerModal } from "./components/AddCustomerModal";

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

interface ProductData {
  id: string;
  name: string;
  brand: string;
  category: string;
  sell_price: number;
  stock_quantity: number;
  image_url?: string;
  is_active: boolean;
}

interface CustomerData {
  id: string;
  name: string;
  phone: string;
  points_balance: number;
  is_member: boolean;
}

type PaymentMethod = "cash" | "qr" | "card" | "bank";

export default function POSPage() {
  const { user } = useAuthStore();
  const router = useRouter();
  const searchParams = useSearchParams();
  const bookingId = searchParams.get('booking');

  // Data states
  const [services, setServices] = useState<ServiceData[]>([]);
  const [products, setProducts] = useState<ProductData[]>([]);
  const [staff, setStaff] = useState<StaffMember[]>([]);
  const [customers, setCustomers] = useState<CustomerData[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchingCustomers, setSearchingCustomers] = useState(false);
  const [savingSale, setSavingSale] = useState(false);

  // Tab state: services or products
  const [activeTab, setActiveTab] = useState<'services' | 'products'>('services');

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

  // Business Info for receipt
  const [businessInfo, setBusinessInfo] = useState({
    name: "HMS Salon",
    phone: "-",
    address: ""
  });

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

      // Fetch products
      const { data: productsData } = await supabase
        .from('products')
        .select('*')
        .eq('is_active', true)
        .gt('stock_quantity', 0)
        .order('name');

      if (productsData) {
        setProducts(productsData);
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

      // Fetch business settings for receipt
      const { data: settingsData } = await supabase
        .from('business_settings')
        .select('setting_value')
        .eq('setting_key', 'business_info')
        .single();

      if (settingsData?.setting_value) {
        const info = settingsData.setting_value;
        setBusinessInfo({
          name: info.name || "HMS Salon",
          phone: info.phone || info.whatsapp || "-",
          address: info.address || ""
        });
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
              secondaryStaffId: null,
              itemType: 'service'
            }]);
          }
        }
      }
    };

    fetchData();
  }, [bookingId]);

  // Handle customer search with debounce
  useEffect(() => {
    const searchTimer = setTimeout(async () => {
      const supabase = createClient();
      setSearchingCustomers(true);

      let query = supabase
        .from('customers')
        .select('id, name, phone, points_balance, is_member')
        .order('name')
        .limit(20);

      if (searchCustomer) {
        query = query.or(`name.ilike.%${searchCustomer}%,phone.ilike.%${searchCustomer}%`);
      }

      const { data, error } = await query;

      if (!error && data) {
        setCustomers(data);
      }
      setSearchingCustomers(false);
    }, 400); // 400ms debounce

    return () => clearTimeout(searchTimer);
  }, [searchCustomer]);

  // Dynamic categories from loaded services
  const categories = ["All", ...Array.from(new Set(services.map(s => s.category).filter(Boolean)))];

  // Filter services by category and search
  const filteredServices = services.filter((service) => {
    const matchesCategory = selectedCategory === "All" || service.category === selectedCategory;
    const matchesSearch = service.name.toLowerCase().includes(searchService.toLowerCase());
    return matchesCategory && matchesSearch;
  });

  // Filter customers - already filtered by Supabase, but keeping this for safety/immediate feedback
  const filteredCustomers = customers;

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

    const existing = cart.find((item) => item.id === service.id && item.itemType === 'service');
    if (existing) {
      setCart(cart.map((item) =>
        item.id === service.id && item.itemType === 'service' ? { ...item, quantity: item.quantity + 1 } : item
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
        itemType: 'service',
      }]);
    }
  };

  const addProductToCart = (product: ProductData) => {
    if (staff.length === 0) {
      alert("No staff available. Please add staff first.");
      return;
    }

    // Check stock availability
    const existingInCart = cart.find((item) => item.id === product.id && item.itemType === 'product');
    const currentQtyInCart = existingInCart?.quantity || 0;

    if (currentQtyInCart >= product.stock_quantity) {
      alert(`Only ${product.stock_quantity} units available in stock.`);
      return;
    }

    if (existingInCart) {
      setCart(cart.map((item) =>
        item.id === product.id && item.itemType === 'product'
          ? { ...item, quantity: item.quantity + 1 }
          : item
      ));
    } else {
      setCart([...cart, {
        id: product.id,
        name: product.name,
        price: product.sell_price,
        quantity: 1,
        primaryStaffId: staff[0].id,
        secondaryStaffId: null,
        itemType: 'product',
      }]);
    }
  };

  // Update primary staff for a cart item
  const updatePrimaryStaff = (id: string, staffId: string, itemType: 'service' | 'product') => {
    setCart(cart.map((item) => {
      if (item.id === id && item.itemType === itemType) {
        // Clear secondary if same as new primary
        const newSecondary = item.secondaryStaffId === staffId ? null : item.secondaryStaffId;
        return { ...item, primaryStaffId: staffId, secondaryStaffId: newSecondary };
      }
      return item;
    }));
  };

  // Update secondary (sharing) staff for a cart item
  const updateSecondaryStaff = (id: string, staffId: string | null, itemType: 'service' | 'product') => {
    setCart(cart.map((item) =>
      item.id === id && item.itemType === itemType ? { ...item, secondaryStaffId: staffId } : item
    ));
  };


  const updateQuantity = (id: string, delta: number, itemType: 'service' | 'product') => {
    setCart(cart.map((item) => {
      if (item.id === id && item.itemType === itemType) {
        const newQty = item.quantity + delta;

        // Check stock for products
        if (itemType === 'product' && delta > 0) {
          const product = products.find(p => p.id === id);
          if (product && newQty > product.stock_quantity) {
            alert(`Only ${product.stock_quantity} units available in stock.`);
            return item;
          }
        }

        return newQty > 0 ? { ...item, quantity: newQty } : item;
      }
      return item;
    }).filter((item) => item.quantity > 0));
  };

  const removeFromCart = (id: string, itemType: 'service' | 'product') => {
    setCart(cart.filter((item) => !(item.id === id && item.itemType === itemType)));
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
      const commissionBreakdownForSale = getCommissionBreakdown(cart, staff);

      for (const item of cart) {
        const isProduct = item.itemType === 'product';
        const primaryStaff = staff.find(s => s.id === item.primaryStaffId);
        const secondaryStaff = item.secondaryStaffId ? staff.find(s => s.id === item.secondaryStaffId) : null;

        // Products have 5% commission, services use calculated commission
        const commission = primaryStaff
          ? calculateItemCommission(item.price, item.quantity, primaryStaff, secondaryStaff || null, item.itemType)
          : null;

        // Insert sale item
        const { data: saleItemData, error: saleItemError } = await supabase
          .from('sale_items')
          .insert({
            sale_id: saleId,
            item_type: item.itemType,
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

        // Deduct stock for products
        if (isProduct) {
          const product = products.find(p => p.id === item.id);
          if (product) {
            const newStock = Math.max(0, product.stock_quantity - item.quantity);
            await supabase
              .from('products')
              .update({ stock_quantity: newStock })
              .eq('id', item.id);
          }
        }

        // Insert primary staff commission
        if (commission && commission.primary > 0 && primaryStaff && saleItemData) {
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

          // Insert secondary staff commission if sharing (services only)
          if (!isProduct && secondaryStaff && commission.secondary > 0) {
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
    <div className="min-h-screen bg-[#f8fcf9]">
      <Header title="Point of Sale" user={user!} />

      <main className="p-4 md:p-6">
        <div className="flex flex-col xl:flex-row gap-6 xl:h-full">
          {/* LEFT: Item Catalog */}
          <ItemCatalog
            activeTab={activeTab}
            setActiveTab={setActiveTab}
            categories={categories}
            selectedCategory={selectedCategory}
            setSelectedCategory={setSelectedCategory}
            searchService={searchService}
            setSearchService={setSearchService}
            loading={loading}
            filteredServices={filteredServices}
            products={products}
            addToCart={addToCart}
            addProductToCart={addProductToCart}
            isMember={selectedCustomer?.is_member || false}
          />

          {/* RIGHT: Cart Panel */}
          <POSCart
            selectedCustomer={selectedCustomer}
            setSelectedCustomer={setSelectedCustomer}
            searchCustomer={searchCustomer}
            setSearchCustomer={setSearchCustomer}
            showCustomerDropdown={showCustomerDropdown}
            setShowCustomerDropdown={setShowCustomerDropdown}
            filteredCustomers={filteredCustomers}
            isSearchingCustomers={searchingCustomers}
            setShowAddCustomerModal={setShowAddCustomerModal}
            setNewCustomerName={setNewCustomerName}
            cart={cart}
            staff={staff}
            updateQuantity={updateQuantity}
            removeFromCart={removeFromCart}
            updatePrimaryStaff={updatePrimaryStaff}
            updateSecondaryStaff={updateSecondaryStaff}
            pointsToRedeem={pointsToRedeem}
            setPointsToRedeem={setPointsToRedeem}
            maxRedeemable={maxRedeemable}
            actualPointsToRedeem={actualPointsToRedeem}
            pointsDiscount={pointsDiscount}
            currentBookingId={currentBookingId}
            depositPaid={depositPaid}
            depositAmount={depositAmount}
            actualDepositDeduction={actualDepositDeduction}
            subtotal={subtotal}
            total={total}
            clearCart={clearCart}
            handleProceedToPayment={handleProceedToPayment}
          />
        </div>
      </main>

      {/* Modals */}
      <AnimatePresence>
        {showPaymentModal && (
          <PaymentModal
            total={total}
            paymentMethod={paymentMethod}
            setPaymentMethod={setPaymentMethod}
            savingSale={savingSale}
            handleCompleteSale={handleCompleteSale}
            setShowPaymentModal={setShowPaymentModal}
            selectedCustomer={selectedCustomer}
            pointsEarned={pointsEarned}
            cart={cart}
            staff={staff}
          />
        )}

        {showSuccessModal && lastSaleId && (
          <SuccessModal
            total={total}
            subtotal={subtotal}
            pointsRedeemed={actualPointsToRedeem}
            pointsDiscount={pointsDiscount}
            depositDeducted={actualDepositDeduction}
            paymentMethod={paymentMethod}
            selectedCustomer={selectedCustomer}
            pointsEarned={pointsEarned}
            cart={cart}
            staff={staff}
            saleId={lastSaleId}
            businessInfo={businessInfo}
            handleNewSale={handleNewSale}
            router={router}
          />
        )}

        {showAddCustomerModal && (
          <AddCustomerModal
            newCustomerName={newCustomerName}
            setNewCustomerName={setNewCustomerName}
            newCustomerPhone={newCustomerPhone}
            setNewCustomerPhone={setNewCustomerPhone}
            savingCustomer={savingCustomer}
            handleAddCustomer={handleAddCustomer}
            setShowAddCustomerModal={setShowAddCustomerModal}
          />
        )}
      </AnimatePresence>
    </div>
  );
}
