import { formatCurrency } from "@/lib/utils";

// Commission rates based on sharing
export const COMMISSION_RATES = {
    // Hairstylist Services
    hairstylist_alone: 15,
    hairstylist_with_hairstylist: 8,
    hairstylist_with_assistant: 10,
    // Assistant Services
    assistant_alone: 10,
    assistant_with_hairstylist: 5,
    assistant_with_assistant: 10,
    // Product Sales
    product_hairstylist: 15,
    product_assistant: 10,
};

// Loyalty points constants
export const POINTS_EARN_RATE = 1;    // 1 pt per RM1
export const POINTS_REDEEM_RATE = 5;    // RM5 per 100 pts
export const POINTS_REDEEM_UNIT = 100;  // must redeem in multiples of 100
export const MAX_REDEEM_PER_TXN = 300;  // hard cap per transaction (= RM15)
export const MIN_REDEEM_PTS = 100;  // minimum pts to redeem

export interface StaffMember {
    id: string;
    name: string;
    role: string;
    isAssistant: boolean;
}

export interface CartItem {
    id: string;
    name: string;
    price: number;        // effective price (promo_price if promo, else normal)
    originalPrice?: number; // original price before promo (for display)
    quantity: number;
    primaryStaffId: string;
    secondaryStaffId: string | null;
    itemType: 'service' | 'product';
    isPromo?: boolean;              // true if active promo applied
    promoId?: string;               // promo.id if isPromo
    promoDescription?: string;      // description of the validation
    isPointEligible?: boolean;      // false for Hair Cut etc.
}

export interface CommissionBreakdown {
    staffId: string;
    staffName: string;
    role: string;
    rate: number;
    amount: number;
    serviceNames: string[];
}

/**
 * Calculate commission for a single item
 */
export const calculateItemCommission = (
    itemPrice: number,
    quantity: number,
    primaryStaff: StaffMember,
    secondaryStaff: StaffMember | null,
    itemType: 'service' | 'product'
): { primary: number; secondary: number; primaryRate: number; secondaryRate: number } => {
    const totalPrice = itemPrice * quantity;

    // Products
    if (itemType === 'product') {
        const rate = primaryStaff.isAssistant
            ? COMMISSION_RATES.product_assistant
            : COMMISSION_RATES.product_hairstylist;

        return {
            primary: (totalPrice * rate) / 100,
            secondary: 0,
            primaryRate: rate,
            secondaryRate: 0
        };
    }

    // Services use sharing logic
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
        primaryRate = COMMISSION_RATES.assistant_with_hairstylist;
        secondaryRate = secondaryStaff.isAssistant
            ? COMMISSION_RATES.assistant_with_assistant
            : COMMISSION_RATES.hairstylist_with_assistant;
    } else {
        if (secondaryStaff.isAssistant) {
            primaryRate = COMMISSION_RATES.hairstylist_with_assistant;
            secondaryRate = COMMISSION_RATES.assistant_with_hairstylist;
        } else {
            primaryRate = COMMISSION_RATES.hairstylist_with_hairstylist;
            secondaryRate = COMMISSION_RATES.hairstylist_with_hairstylist;
        }
    }

    return {
        primary: (totalPrice * primaryRate) / 100,
        secondary: (totalPrice * secondaryRate) / 100,
        primaryRate,
        secondaryRate
    };
};

/**
 * Get full commission breakdown for all cart items
 */
export const getCommissionBreakdown = (cart: CartItem[], staff: StaffMember[]): CommissionBreakdown[] => {
    const breakdown: Map<string, CommissionBreakdown> = new Map();

    cart.forEach(item => {
        const primaryStaff = staff.find(s => s.id === item.primaryStaffId);
        const secondaryStaff = item.secondaryStaffId
            ? staff.find(s => s.id === item.secondaryStaffId)
            : null;

        if (!primaryStaff) return;

        // Commission always based on original price, not promo price
        const commissionPrice = item.originalPrice || item.price;
        const commission = calculateItemCommission(
            commissionPrice,
            item.quantity,
            primaryStaff,
            secondaryStaff || null,
            item.itemType
        );

        // Add primary staff commission
        if (breakdown.has(primaryStaff.id)) {
            const existing = breakdown.get(primaryStaff.id)!;
            existing.amount += commission.primary;
            if (!existing.serviceNames.includes(item.name)) {
                existing.serviceNames.push(item.name);
            }
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

/**
 * Calculate how many points a cart earns:
 * - Products: never earn
 * - Services with isPointEligible=false: never earn (e.g. Hair Cut)
 * - Promo services: earn on promo_price (item.price already reflects that)
 * - Normal services: earn on item.price * qty
 *
 * Rate: POINTS_EARN_RATE pt per RM1
 */
export const calculateEarnablePoints = (cart: CartItem[]): number => {
    const earnableAmount = cart.reduce((sum, item) => {
        if (item.itemType === 'product') return sum;
        if (item.isPointEligible === false) return sum;
        return sum + item.price * item.quantity;
    }, 0);

    return Math.floor(earnableAmount * POINTS_EARN_RATE);
};

/**
 * Whether any item in the cart has an active promo.
 * If true, redemption is blocked for the entire transaction.
 */
export const cartIsPromotional = (cart: CartItem[]): boolean =>
    cart.some(item => item.isPromo === true);

/**
 * Compute the capped redeemable points:
 * - Max MAX_REDEEM_PER_TXN pts
 * - Must be in steps of POINTS_REDEEM_UNIT
 * - Cannot exceed customer balance
 */
export const computeMaxRedeemable = (customerBalance: number): number => {
    const raw = Math.min(customerBalance, MAX_REDEEM_PER_TXN);
    // Round DOWN to nearest 100
    return Math.floor(raw / POINTS_REDEEM_UNIT) * POINTS_REDEEM_UNIT;
};

/**
 * Convert points to RM value
 */
export const pointsToRm = (points: number): number =>
    (points / POINTS_REDEEM_UNIT) * POINTS_REDEEM_RATE;

// keep default export intact for backwards compat
export { formatCurrency };
