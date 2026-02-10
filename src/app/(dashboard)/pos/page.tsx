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
import { usePOS } from "./hooks/use-pos";

type PaymentMethod = "cash" | "qr" | "card" | "bank";

export default function POSPage() {
  const { user } = useAuthStore();
  const router = useRouter();
  const searchParams = useSearchParams();
  const bookingId = searchParams.get('booking');

  const {
    loading,
    services,
    products,
    staff,
    activeTab,
    setActiveTab,
    selectedCategory,
    setSelectedCategory,
    selectedCustomer,
    setSelectedCustomer,
    cart,
    addToCart,
    addProductToCart,
    updateQuantity,
    removeFromCart,
    updateStaff,
    clearCart,
    pointsToRedeem,
    setPointsToRedeem,
    paymentMethod,
    setPaymentMethod,
    subtotal,
    total,
    pointsEarned,
    actualPointsToRedeem,
    pointsDiscount,
    actualDepositDeduction,
    maxRedeemable,
    completeSale,
    currentBookingId,
    depositPaid,
    depositAmount,
    businessInfo,
  } = usePOS(bookingId, user);

  // Remaining UI-only states
  const [searchService, setSearchService] = useState("");
  const [searchCustomer, setSearchCustomer] = useState("");
  const [showCustomerDropdown, setShowCustomerDropdown] = useState(false);
  const [showPaymentModal, setShowPaymentModal] = useState(false);
  const [showSuccessModal, setShowSuccessModal] = useState(false);
  const [lastSaleId, setLastSaleId] = useState<string | null>(null);
  const [searchingCustomers, setSearchingCustomers] = useState(false);
  const [customers, setCustomers] = useState<any[]>([]);

  // Add Customer Modal
  const [showAddCustomerModal, setShowAddCustomerModal] = useState(false);
  const [newCustomerName, setNewCustomerName] = useState("");
  const [newCustomerPhone, setNewCustomerPhone] = useState("");
  const [savingCustomer, setSavingCustomer] = useState(false);
  const [savingSale, setSavingSale] = useState(false);

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
  const categories = ["All", ...Array.from(new Set(services.map((s: any) => s.category).filter(Boolean)))];

  // Filter services by category and search
  const filteredServices = services.filter((service: any) => {
    const matchesCategory = selectedCategory === "All" || service.category === selectedCategory;
    const matchesSearch = service.name.toLowerCase().includes(searchService.toLowerCase());
    return matchesCategory && matchesSearch;
  });

  const filteredCustomers = customers;

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

      const newCustomer = {
        id: data.id,
        name: data.name,
        phone: data.phone,
        points_balance: 0,
        is_member: false
      };
      setCustomers(prev => [...prev, newCustomer]);
      setSelectedCustomer(newCustomer);

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

  const handleCompleteSale = async () => {
    setSavingSale(true);
    try {
      const saleId = await completeSale();
      setLastSaleId(saleId);
      setShowPaymentModal(false);
      setShowSuccessModal(true);
    } catch (error: any) {
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
            updateStaff={updateStaff}
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
            handleProceedToPayment={() => setShowPaymentModal(true)}
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
            handleNewSale={clearCart}
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
