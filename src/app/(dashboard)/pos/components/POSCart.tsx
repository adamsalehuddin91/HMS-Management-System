"use client";

import { motion, AnimatePresence } from "framer-motion";
import { Search, X, Plus, Minus, Tag, Package, User, Scissors } from "lucide-react";
import { Button, Card, CardContent, Input, Avatar } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { CartItem as CartItemType, StaffMember, calculateItemCommission } from "@/lib/utils/pos-calculations";

interface POSCustomer {
    id: string;
    name: string;
    phone: string;
    points_balance: number;
    is_member: boolean;
}

interface POSCartProps {
    selectedCustomer: POSCustomer | null;
    setSelectedCustomer: (c: POSCustomer | null) => void;
    searchCustomer: string;
    setSearchCustomer: (val: string) => void;
    showCustomerDropdown: boolean;
    setShowCustomerDropdown: (show: boolean) => void;
    filteredCustomers: POSCustomer[];
    isSearchingCustomers: boolean;
    setShowAddCustomerModal: (show: boolean) => void;
    setNewCustomerName: (name: string) => void;
    cart: CartItemType[];
    staff: StaffMember[];
    updateQuantity: (id: string, delta: number, itemType: 'service' | 'product') => void;
    removeFromCart: (id: string, itemType: 'service' | 'product') => void;
    updateStaff: (id: string, staffId: string, type: 'primary' | 'secondary', itemType: 'service' | 'product') => void;
    pointsToRedeem: number;
    setPointsToRedeem: (pts: number) => void;
    maxRedeemable: number;
    actualPointsToRedeem: number;
    pointsDiscount: number;
    currentBookingId: string | null;
    depositPaid: boolean;
    depositAmount: number;
    actualDepositDeduction: number;
    subtotal: number;
    total: number;
    clearCart: () => void;
    handleProceedToPayment: () => void;
}

export function POSCart({
    selectedCustomer,
    setSelectedCustomer,
    searchCustomer,
    setSearchCustomer,
    showCustomerDropdown,
    setShowCustomerDropdown,
    filteredCustomers,
    isSearchingCustomers,
    setShowAddCustomerModal,
    setNewCustomerName,
    cart,
    staff,
    updateQuantity,
    removeFromCart,
    updateStaff,
    pointsToRedeem,
    setPointsToRedeem,
    maxRedeemable,
    actualPointsToRedeem,
    pointsDiscount,
    currentBookingId,
    depositPaid,
    depositAmount,
    actualDepositDeduction,
    subtotal,
    total,
    clearCart,
    handleProceedToPayment
}: POSCartProps) {
    return (
        <Card className="w-full xl:w-[360px] 2xl:w-[400px] shrink-0 border-none shadow-xl bg-white flex flex-col xl:h-[calc(100vh-140px)] xl:sticky xl:top-6">
            <CardContent className="p-0 flex flex-col h-full">
                {/* Cart Header */}
                <div className="p-4 border-b border-gray-100">
                    <div className="flex items-center justify-between mb-4">
                        <h3 className="text-lg font-black text-gray-800 tracking-tight">Current Sale</h3>
                        <Badge variant="outline" className="bg-[#2e7d32]/5 text-[#2e7d32] border-none font-bold px-2 py-0.5 text-[10px]">
                            {cart.reduce((sum, item) => sum + item.quantity, 0)} Items
                        </Badge>
                    </div>

                    {/* Customer Selection */}
                    <div className="relative">
                        <label className="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3">
                            Customer Details
                        </label>
                        {selectedCustomer ? (
                            <motion.div
                                initial={{ opacity: 0, scale: 0.95 }}
                                animate={{ opacity: 1, scale: 1 }}
                                className="p-3 bg-[#2e7d32]/5 border border-[#2e7d32]/10 rounded-xl flex items-center gap-3 group"
                            >
                                <Avatar name={selectedCustomer.name} className="h-10 w-10 border-2 border-white shadow-sm" />
                                <div className="flex-1">
                                    <p className="font-bold text-gray-800 text-sm leading-tight">{selectedCustomer.name}</p>
                                    <p className="text-xs text-[#2e7d32] font-semibold">{selectedCustomer.points_balance} Points Available</p>
                                </div>
                                <button
                                    onClick={() => setSelectedCustomer(null)}
                                    className="p-2 hover:bg-white rounded-xl text-gray-400 hover:text-red-500 transition-all opacity-0 group-hover:opacity-100"
                                >
                                    <X className="h-4 w-4" />
                                </button>
                            </motion.div>
                        ) : (
                            <>
                                <div className="relative group">
                                    <Input
                                        placeholder="Identify customer..."
                                        className="h-10 pl-10 bg-gray-50 border-none rounded-xl focus-visible:ring-1 focus-visible:ring-[#2e7d32]/20 transition-all text-sm"
                                        value={searchCustomer}
                                        onChange={(e) => {
                                            setSearchCustomer(e.target.value);
                                            setShowCustomerDropdown(true);
                                        }}
                                        onFocus={() => setShowCustomerDropdown(true)}
                                    />
                                    <User className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-300 group-focus-within:text-[#2e7d32] transition-colors" />
                                    {isSearchingCustomers && (
                                        <div className="absolute right-4 top-1/2 -translate-y-1/2">
                                            <motion.div
                                                animate={{ rotate: 360 }}
                                                transition={{ duration: 1, repeat: Infinity, ease: "linear" }}
                                            >
                                                <div className="h-4 w-4 border-2 border-[#2e7d32]/30 border-t-[#2e7d32] rounded-full" />
                                            </motion.div>
                                        </div>
                                    )}
                                </div>

                                <AnimatePresence>
                                    {showCustomerDropdown && searchCustomer && (
                                        <motion.div
                                            initial={{ opacity: 0, y: 10 }}
                                            animate={{ opacity: 1, y: 0 }}
                                            exit={{ opacity: 0, scale: 0.95 }}
                                            className="absolute top-full left-0 right-0 mt-2 bg-white border border-gray-100 rounded-2xl shadow-2xl z-20 max-h-64 overflow-auto custom-scrollbar"
                                        >
                                            {filteredCustomers.map((customer) => (
                                                <button
                                                    key={customer.id}
                                                    className="w-full p-4 flex items-center gap-4 hover:bg-gray-50 text-left transition-colors border-b border-gray-50 last:border-0"
                                                    onClick={() => {
                                                        setSelectedCustomer(customer);
                                                        setShowCustomerDropdown(false);
                                                        setSearchCustomer("");
                                                    }}
                                                >
                                                    <Avatar name={customer.name} size="sm" className="h-8 w-8" />
                                                    <div>
                                                        <p className="font-bold text-gray-800 text-sm leading-none mb-1">{customer.name}</p>
                                                        <p className="text-[10px] text-gray-400 font-bold uppercase tracking-widest">{customer.phone}</p>
                                                    </div>
                                                </button>
                                            ))}
                                            {filteredCustomers.length === 0 && (
                                                <div className="p-6 text-center">
                                                    <p className="text-sm text-gray-400 mb-4 font-medium">New member detected</p>
                                                    <Button
                                                        size="sm"
                                                        className="w-full rounded-xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-md shadow-[#2e7d32]/20 font-bold"
                                                        onClick={() => {
                                                            setNewCustomerName(searchCustomer);
                                                            setShowAddCustomerModal(true);
                                                            setShowCustomerDropdown(false);
                                                        }}
                                                    >
                                                        <Plus className="h-4 w-4 mr-2" />
                                                        Enroll "{searchCustomer}"
                                                    </Button>
                                                </div>
                                            )}
                                        </motion.div>
                                    )}
                                </AnimatePresence>
                            </>
                        )}
                    </div>
                </div>

                {/* Cart Items List */}
                <div className="flex-1 overflow-y-auto p-4 space-y-3 custom-scrollbar">
                    <AnimatePresence initial={false}>
                        {cart.length === 0 ? (
                            <motion.div
                                initial={{ opacity: 0 }}
                                animate={{ opacity: 1 }}
                                className="h-full flex flex-col items-center justify-center text-center py-12"
                            >
                                <div className="h-16 w-16 bg-gray-50 rounded-full flex items-center justify-center mb-4">
                                    <Package className="h-8 w-8 text-gray-200" />
                                </div>
                                <p className="text-gray-400 font-bold">Your cart is empty</p>
                                <p className="text-[10px] text-gray-300 uppercase font-black tracking-widest mt-1">Add items to begin checkout</p>
                            </motion.div>
                        ) : (
                            cart.map((item) => (
                                <CartItem
                                    key={`${item.itemType}-${item.id}`}
                                    item={item}
                                    staff={staff}
                                    updateQuantity={updateQuantity}
                                    removeFromCart={removeFromCart}
                                    updateStaff={updateStaff}
                                />
                            ))
                        )}
                    </AnimatePresence>
                </div>

                {/* Cart Footer / Summary */}
                <div className="p-4 bg-gray-50/50 space-y-3">
                    {/* Points Redemption */}
                    {selectedCustomer && selectedCustomer.points_balance > 0 && cart.length > 0 && (
                        <div className="p-4 bg-white rounded-2xl border border-gray-100 shadow-sm">
                            <div className="flex items-center justify-between mb-3">
                                <span className="text-xs font-black text-gray-500 uppercase tracking-widest flex items-center gap-2">
                                    <Tag className="h-3.5 w-3.5 text-[#2e7d32]" />
                                    Loyalty Points
                                </span>
                                <span className="text-[10px] bg-[#2e7d32]/10 text-[#2e7d32] px-2 py-0.5 rounded-full font-bold">
                                    {selectedCustomer.points_balance} pts
                                </span>
                            </div>
                            <div className="flex items-center gap-3">
                                <Input
                                    type="number"
                                    value={pointsToRedeem}
                                    onChange={(e) => setPointsToRedeem(Math.max(0, parseInt(e.target.value) || 0))}
                                    className="h-10 text-center font-bold bg-gray-50 border-none rounded-xl"
                                />
                                <Button
                                    variant="outline"
                                    size="sm"
                                    className="h-10 rounded-xl px-4 border-gray-100 font-bold hover:bg-[#2e7d32] hover:text-white transition-all"
                                    onClick={() => setPointsToRedeem(Math.min(selectedCustomer.points_balance, maxRedeemable))}
                                >
                                    Max
                                </Button>
                            </div>
                        </div>
                    )}

                    {/* Booking Indicator */}
                    {currentBookingId && (
                        <div className="p-3 bg-[#2e7d32]/10 border border-[#2e7d32]/20 rounded-xl flex items-center gap-3">
                            <div className="h-2 w-2 rounded-full bg-[#2e7d32] animate-pulse" />
                            <div className="flex-1">
                                <p className="text-[10px] font-black text-[#2e7d32] uppercase tracking-widest">Linked Appointment</p>
                                {depositPaid && <p className="text-xs text-gray-500 font-medium">Deposit of {formatCurrency(depositAmount)} deducted</p>}
                            </div>
                        </div>
                    )}

                    {/* Totals */}
                    {cart.length > 0 && (
                        <div className="space-y-2 border-t border-gray-200 pt-4">
                            <div className="flex justify-between text-xs font-bold text-gray-400 uppercase tracking-widest">
                                <span>Subtotal</span>
                                <span>{formatCurrency(subtotal)}</span>
                            </div>
                            {actualPointsToRedeem > 0 && (
                                <div className="flex justify-between text-xs font-bold text-[#2e7d32]">
                                    <span>Loyalty Discount</span>
                                    <span>-{formatCurrency(pointsDiscount)}</span>
                                </div>
                            )}
                            {actualDepositDeduction > 0 && (
                                <div className="flex justify-between text-xs font-bold text-blue-500">
                                    <span>Downpayment</span>
                                    <span>-{formatCurrency(actualDepositDeduction)}</span>
                                </div>
                            )}
                            <div className="flex justify-between pt-1">
                                <span className="text-lg font-black text-gray-800">Total</span>
                                <span className="text-2xl font-black text-[#2e7d32]">{formatCurrency(total)}</span>
                            </div>
                        </div>
                    )}

                    {/* Actions */}
                    <div className="grid grid-cols-2 gap-3 mt-2">
                        <Button
                            variant="outline"
                            className="h-11 rounded-2xl border-none bg-gray-200/50 text-gray-400 font-bold hover:bg-gray-200 transition-all text-xs"
                            onClick={clearCart}
                            disabled={cart.length === 0}
                        >
                            Reset
                        </Button>
                        <Button
                            className="h-11 rounded-2xl bg-[#2e7d32] hover:bg-[#1b5e20] shadow-lg shadow-[#2e7d32]/20 font-black tracking-wide disabled:opacity-50 transition-all text-xs"
                            onClick={handleProceedToPayment}
                            disabled={cart.length === 0}
                        >
                            Pay Now
                        </Button>
                    </div>
                </div>
            </CardContent>
        </Card>
    );
}

function CartItem({
    item,
    staff,
    updateQuantity,
    removeFromCart,
    updateStaff
}: {
    item: CartItemType;
    staff: StaffMember[];
    updateQuantity: (id: string, delta: number, itemType: 'service' | 'product') => void;
    removeFromCart: (id: string, itemType: 'service' | 'product') => void;
    updateStaff: (id: string, staffId: string, type: 'primary' | 'secondary', itemType: 'service' | 'product') => void;
}) {
    const primaryStaff = staff.find(s => s.id === item.primaryStaffId);
    const secondaryStaff = item.secondaryStaffId ? staff.find(s => s.id === item.secondaryStaffId) : null;
    const isProduct = item.itemType === 'product';

    const commission = primaryStaff
        ? calculateItemCommission(item.price, item.quantity, primaryStaff, secondaryStaff || null, item.itemType)
        : null;

    return (
        <motion.div
            layout
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -20 }}
            className="group bg-white p-4 rounded-2xl border border-gray-50 hover:border-[#2e7d32]/20 hover:shadow-md transition-all"
        >
            <div className="flex items-start gap-4 mb-4">
                <div className="h-12 w-12 rounded-xl bg-gray-50 flex items-center justify-center overflow-hidden shrink-0 border border-gray-100">
                    {isProduct ? <Package className="h-6 w-6 text-gray-300" /> : <Scissors className="h-6 w-6 text-gray-300" />}
                </div>
                <div className="flex-1 min-w-0">
                    <p className="font-bold text-gray-800 text-sm truncate">{item.name}</p>
                    <p className="text-[10px] text-gray-400 font-bold uppercase tracking-widest">
                        {formatCurrency(item.price)} × {item.quantity}
                    </p>
                </div>
                <button
                    onClick={() => removeFromCart(item.id, item.itemType)}
                    className="p-1.5 hover:bg-red-50 text-gray-300 hover:text-red-500 rounded-lg transition-colors"
                >
                    <X className="h-4 w-4" />
                </button>
            </div>

            <div className="flex items-center justify-between mb-4">
                <div className="flex items-center gap-1 bg-gray-50 p-1 rounded-xl">
                    <button
                        onClick={() => updateQuantity(item.id, -1, item.itemType)}
                        className="h-8 w-8 rounded-lg flex items-center justify-center hover:bg-white hover:shadow-sm text-gray-400 transition-all font-bold"
                    >
                        <Minus className="h-3 w-3" />
                    </button>
                    <span className="w-10 text-center font-black text-gray-700 text-sm">{item.quantity}</span>
                    <button
                        onClick={() => updateQuantity(item.id, 1, item.itemType)}
                        className="h-8 w-8 rounded-lg flex items-center justify-center hover:bg-white hover:shadow-sm text-[#2e7d32] transition-all font-bold"
                    >
                        <Plus className="h-3 w-3" />
                    </button>
                </div>
                <p className="font-black text-[#2e7d32]">{formatCurrency(item.price * item.quantity)}</p>
            </div>

            <div className="space-y-2 border-t border-gray-50 pt-3">
                {/* Primary Staff Selection */}
                <div className="flex items-center gap-3">
                    <span className="text-[10px] font-black text-gray-300 uppercase tracking-widest w-12 shrink-0">
                        {isProduct ? 'Sold by' : 'Lead'}
                    </span>
                    <select
                        value={item.primaryStaffId}
                        onChange={(e) => updateStaff(item.id, e.target.value, 'primary', item.itemType)}
                        className="flex-1 text-[11px] font-bold h-8 px-2 bg-gray-50 border-none rounded-lg focus:ring-1 focus:ring-[#2e7d32]/20 appearance-none text-gray-600 outline-none"
                    >
                        {staff.map((s) => (
                            <option key={s.id} value={s.id}>{s.name} ({s.role.split(' ')[0]})</option>
                        ))}
                    </select>
                </div>

                {/* Secondary Staff (Sharing) - Services only */}
                {!isProduct && (
                    <div className="flex items-center gap-3">
                        <span className="text-[10px] font-black text-gray-300 uppercase tracking-widest w-12 shrink-0">Share</span>
                        <select
                            value={item.secondaryStaffId || ""}
                            onChange={(e) => updateStaff(item.id, e.target.value || '', 'secondary', item.itemType)}
                            className="flex-1 text-[11px] font-bold h-8 px-2 bg-gray-50 border-none rounded-lg focus:ring-1 focus:ring-[#2e7d32]/20 appearance-none text-gray-600 outline-none"
                        >
                            <option value="">No Sharing</option>
                            {staff.filter(s => s.id !== item.primaryStaffId).map((s) => (
                                <option key={s.id} value={s.id}>{s.name}</option>
                            ))}
                        </select>
                    </div>
                )}

                {/* Commission Info */}
                {commission && (
                    <motion.div
                        initial={{ opacity: 0, height: 0 }}
                        animate={{ opacity: 1, height: 'auto' }}
                        className="mt-3 p-3 bg-gray-50 rounded-xl space-y-1.5 overflow-hidden"
                    >
                        <div className="flex justify-between items-center text-[10px] gap-2">
                            <span className="text-gray-400 font-bold uppercase tracking-widest truncate">{primaryStaff?.name}</span>
                            <span className="text-[#2e7d32] font-black shrink-0">{formatCurrency(commission.primary)} <span className="text-[9px] text-gray-300">({commission.primaryRate}%)</span></span>
                        </div>
                        {!isProduct && secondaryStaff && commission.secondary > 1 && (
                            <div className="flex justify-between items-center text-[10px] pt-1 border-t border-gray-100 gap-2">
                                <span className="text-gray-400 font-bold uppercase tracking-widest truncate">{secondaryStaff.name}</span>
                                <span className="text-[#2e7d32] font-black shrink-0">{formatCurrency(commission.secondary)} <span className="text-[9px] text-gray-300">({commission.secondaryRate}%)</span></span>
                            </div>
                        )}
                    </motion.div>
                )}
            </div>
        </motion.div>
    );
}

function Badge({ children, variant, className }: { children: React.ReactNode, variant?: string, className?: string }) {
    return (
        <span className={`inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 ${className}`}>
            {children}
        </span>
    );
}
