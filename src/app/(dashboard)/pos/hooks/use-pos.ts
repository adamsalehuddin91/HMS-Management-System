"use client";

import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";
import {
    CartItem,
    StaffMember,
    cartIsPromotional,
    computeMaxRedeemable,
    pointsToRm,
    POINTS_EARN_RATE,
    MIN_REDEEM_PTS,
    POINTS_REDEEM_UNIT,
} from "@/lib/utils/pos-calculations";
import { posService } from "@/lib/services/pos-service";
import { toast } from "sonner";
import { useRouter } from "next/navigation";
import type { Service, Product, Customer, PaymentMethod, User, Promotion } from "@/types";
import { logError } from "@/lib/utils/error-logger";

export function usePOS(bookingId: string | null, user: User | null) {
    const router = useRouter();

    // Data states
    const [loading, setLoading] = useState(true);
    const [services, setServices] = useState<Service[]>([]);
    const [products, setProducts] = useState<Product[]>([]);
    const [staff, setStaff] = useState<StaffMember[]>([]);
    const [customers, setCustomers] = useState<Customer[]>([]);
    const [activePromotions, setActivePromotions] = useState<Promotion[]>([]);

    // UI states
    const [activeTab, setActiveTab] = useState<'services' | 'products'>('services');
    const [selectedCategory, setSelectedCategory] = useState("All");
    const [selectedCustomer, setSelectedCustomer] = useState<Pick<Customer, 'id' | 'name' | 'phone' | 'points_balance' | 'is_member'> | null>(null);
    const [cart, setCart] = useState<CartItem[]>([]);
    const [pointsToRedeem, setPointsToRedeem] = useState(0);
    const [paymentMethod, setPaymentMethod] = useState<PaymentMethod>("cash");

    // Booking state
    const [currentBookingId, setCurrentBookingId] = useState<string | null>(null);
    const [depositAmount, setDepositAmount] = useState(0);
    const [depositPaid, setDepositPaid] = useState(false);

    // Business info
    const [businessInfo, setBusinessInfo] = useState({
        name: "HMS Salon",
        phone: "-",
        address: "",
        bookingUrl: "https://hms-salon.vercel.app/book",
        googleReviewUrl: "https://www.google.com/search?sca_esv=369040512b9c6d40&si=AL3DRZEsmMGCryMMFSHJ3StBhOdZ2-6yYkXd_doETEE1OR-qOYWAuYTwosPcodcQNf31IJH5f8k2nzY7Xy6SkvkU6n2WcrK9Zdiqa6Asxm3B5PS1HIIl7_ZehMuo9ymcOFqOd7HppJAsBloexqhbYQb4o9UVqhJqNQ%3D%3D&q=HAIDA+MUSLIMAH+SALON+Ulasan",
    });

    const supabase = createClient();

    // ── Helper: resolve promo for a service ──────────────────────────────────
    const resolvePromo = (serviceId: string): Promotion | null => {
        return activePromotions.find(p => p.service_id === serviceId) || null;
    };

    // ── Initial data fetch ────────────────────────────────────────────────────
    useEffect(() => {
        const fetchData = async () => {
            setLoading(true);
            try {
                const today = new Date().toISOString().split('T')[0]; // YYYY-MM-DD

                const [
                    { data: servicesData },
                    { data: productsData },
                    { data: staffData },
                    { data: settingsData },
                    { data: promosData },
                ] = await Promise.all([
                    supabase.from('services').select('*').eq('is_active', true).order('category'),
                    supabase.from('products').select('*').eq('is_active', true).gt('stock_quantity', 0).order('name'),
                    supabase.from('staff').select('*').eq('is_active', true).order('name'),
                    supabase.from('business_settings').select('setting_value').eq('setting_key', 'business_info').single(),
                    supabase.from('promotions')
                        .select('*')
                        .eq('is_active', true)
                        .lte('start_date', today)
                        .gte('end_date', today),
                ]);

                if (servicesData) setServices(servicesData);
                if (productsData) setProducts(productsData);
                if (promosData) setActivePromotions(promosData);
                if (staffData) {
                    setStaff(staffData.map((s: { id: string; name: string; role: string }) => ({
                        id: s.id,
                        name: s.name,
                        role: s.role,
                        isAssistant: s.role.toLowerCase().includes('assistant')
                    })));
                }
                if (settingsData?.setting_value) {
                    const info = settingsData.setting_value;
                    setBusinessInfo({
                        name: info.name || "HMS Salon",
                        phone: info.phone || info.whatsapp || "-",
                        address: info.address || "",
                        bookingUrl: info.booking_url || "https://hms-salon.vercel.app/book",
                        googleReviewUrl: info.google_review_url || "https://www.google.com/search?q=HAIDA+MUSLIMAH+SALON+Ulasan",
                    });
                }

                // Handle booking conversion if ID present
                if (bookingId && servicesData && staffData) {
                    const { data: bookingData } = await supabase
                        .from('bookings')
                        .select(`
              *,
              customer:customers(id, name, phone, points_balance, is_member),
              service:services(id, name, price, member_price, category, image_url, is_point_eligible),
              staff:staff(id, name, role)
            `)
                        .eq('id', bookingId)
                        .single();

                    if (bookingData) {
                        setCurrentBookingId(bookingData.id);
                        setDepositAmount(bookingData.deposit_amount || bookingData.deposit || 0);
                        setDepositPaid(bookingData.deposit_paid || false);

                        if (bookingData.customer) {
                            setSelectedCustomer({
                                id: bookingData.customer.id,
                                name: bookingData.customer.name,
                                phone: bookingData.customer.phone,
                                points_balance: bookingData.customer.points_balance || 0,
                                is_member: bookingData.customer.is_member || false
                            });
                        }

                        if (bookingData.service && bookingData.staff) {
                            const isMember = bookingData.customer?.is_member;
                            const normalPrice = isMember && bookingData.service.member_price
                                ? bookingData.service.member_price
                                : bookingData.service.price;

                            // Check if service has an active promo
                            const promo = promosData?.find((p: Promotion) => p.service_id === bookingData.service.id);
                            const effectivePrice = promo ? promo.promo_price : normalPrice;

                            const assignedStaff = staffData.find((s: { id: string }) => s.id === bookingData.staff.id);

                            setCart([{
                                id: bookingData.service.id,
                                name: bookingData.service.name,
                                price: effectivePrice,
                                originalPrice: normalPrice,
                                quantity: 1,
                                primaryStaffId: assignedStaff?.id || staffData[0]?.id || '',
                                secondaryStaffId: null,
                                itemType: 'service',
                                isPromo: !!promo,
                                promoId: promo?.id,
                                promoDescription: promo?.description || promo?.name,
                                isPointEligible: bookingData.service.is_point_eligible ?? true,
                            }]);
                        }
                    }
                }
            } catch (error) {
                logError('POS Hook - Fetch', error);
                toast.error("Gagal memuatkan data POS.");
            } finally {
                setLoading(false);
            }
        };

        fetchData();
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [bookingId]);

    // ── Cart operations ───────────────────────────────────────────────────────
    const addToCart = (service: Service) => {
        if (staff.length === 0) {
            toast.error("Kakitangan tidak dijumpai. Sila tambah kakitangan terlebih dahulu.");
            return;
        }

        const existing = cart.find((item) => item.id === service.id && item.itemType === 'service');
        if (existing) {
            updateQuantity(service.id, 1, 'service');
        } else {
            const normalPrice = selectedCustomer?.is_member && service.member_price
                ? service.member_price
                : service.price;

            const promo = resolvePromo(service.id);
            const effectivePrice = promo ? promo.promo_price : normalPrice;

            setCart([...cart, {
                id: service.id,
                name: service.name,
                price: effectivePrice,
                originalPrice: normalPrice,
                quantity: 1,
                primaryStaffId: staff[0].id,
                secondaryStaffId: null,
                itemType: 'service',
                isPromo: !!promo,
                promoId: promo?.id,
                promoDescription: promo?.description || promo?.name,
                isPointEligible: service.is_point_eligible ?? true,
            }]);

            if (promo) {
                toast.info(`Harga promosi digunakan: ${service.name} → RM${promo.promo_price.toFixed(2)}`);
            }
        }
    };

    const addProductToCart = (product: Product) => {
        if (staff.length === 0) {
            toast.error("Kakitangan tidak dijumpai.");
            return;
        }

        const existingInCart = cart.find((item) => item.id === product.id && item.itemType === 'product');
        const currentQtyInCart = existingInCart?.quantity || 0;

        if (currentQtyInCart >= product.stock_quantity) {
            toast.error(`Hanya ${product.stock_quantity} unit tersedia.`);
            return;
        }

        if (existingInCart) {
            updateQuantity(product.id, 1, 'product');
        } else {
            setCart([...cart, {
                id: product.id,
                name: product.name,
                price: product.sell_price,
                quantity: 1,
                primaryStaffId: staff[0].id,
                secondaryStaffId: null,
                itemType: 'product',
                isPointEligible: false, // products never earn
            }]);
        }
    };

    const updateQuantity = (id: string, delta: number, itemType: 'service' | 'product') => {
        setCart(prev => prev.map(item => {
            if (item.id === id && item.itemType === itemType) {
                const newQty = item.quantity + delta;
                if (itemType === 'product' && delta > 0) {
                    const product = products.find(p => p.id === id);
                    if (product && newQty > product.stock_quantity) {
                        toast.error(`Had stok dicapai (${product.stock_quantity} unit).`);
                        return item;
                    }
                }
                return newQty > 0 ? { ...item, quantity: newQty } : item;
            }
            return item;
        }).filter(item => item.quantity > 0));
    };

    const removeFromCart = (id: string, itemType: 'service' | 'product') => {
        setCart(prev => prev.filter(item => !(item.id === id && item.itemType === itemType)));
    };

    const updateStaff = (id: string, staffId: string, type: 'primary' | 'secondary', itemType: 'service' | 'product') => {
        setCart(prev => prev.map(item => {
            if (item.id === id && item.itemType === itemType) {
                if (type === 'primary') {
                    const newSecondary = item.secondaryStaffId === staffId ? null : item.secondaryStaffId;
                    return { ...item, primaryStaffId: staffId, secondaryStaffId: newSecondary };
                } else {
                    return { ...item, secondaryStaffId: staffId };
                }
            }
            return item;
        }));
    };

    const clearCart = () => {
        setCart([]);
        setSelectedCustomer(null);
        setPointsToRedeem(0);
        setCurrentBookingId(null);
        setDepositAmount(0);
        setDepositPaid(false);
        if (bookingId) router.replace('/pos');
    };

    // ── Derived totals ────────────────────────────────────────────────────────
    const subtotal = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);
    const isCartPromotional = cartIsPromotional(cart);

    // Redemption: blocked on promo transactions
    const customerBalance = selectedCustomer?.points_balance || 0;
    const maxRedeemable = isCartPromotional ? 0 : computeMaxRedeemable(customerBalance);
    const canRedeem = !isCartPromotional && customerBalance >= MIN_REDEEM_PTS;

    // Clamp user input: must be multiple of 100, within cap
    const actualPointsToRedeem = isCartPromotional
        ? 0
        : Math.min(
            Math.floor(pointsToRedeem / POINTS_REDEEM_UNIT) * POINTS_REDEEM_UNIT,
            maxRedeemable
        );
    const pointsDiscount = pointsToRm(actualPointsToRedeem);
    const actualDepositDeduction = depositPaid ? depositAmount : 0;
    const total = Math.max(0, subtotal - pointsDiscount - actualDepositDeduction);

    // Points earned on this transaction (1 pt per RM1 of net total paid)
    const pointsEarned = Math.floor(total * POINTS_EARN_RATE);

    // ── Checkout ──────────────────────────────────────────────────────────────
    const completeSale = async () => {
        try {
            const { saleId } = await posService.completeSale({
                user,
                selectedCustomer,
                currentBookingId,
                subtotal,
                pointsDiscount,
                pointsEarned,
                actualPointsToRedeem,
                actualDepositDeduction,
                total,
                paymentMethod,
                cart,
                staff,
                products,
                isPromotional: isCartPromotional,
            });
            return saleId;
        } catch (error) {
            logError('POS Hook - Sale', error);
            throw error;
        }
    };

    return {
        loading,
        services,
        products,
        staff,
        activePromotions,
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
        canRedeem,
        isCartPromotional,
        completeSale,
        currentBookingId,
        depositPaid,
        depositAmount,
        businessInfo,
    };
}
