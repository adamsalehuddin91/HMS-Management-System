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

export interface StaffMember {
    id: string;
    name: string;
    role: string;
    isAssistant: boolean;
}

export interface CartItem {
    id: string;
    name: string;
    price: number;
    quantity: number;
    primaryStaffId: string;
    secondaryStaffId: string | null;
    itemType: 'service' | 'product';
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
        // Primary is assistant
        primaryRate = COMMISSION_RATES.assistant_with_hairstylist;
        secondaryRate = secondaryStaff.isAssistant
            ? COMMISSION_RATES.assistant_with_assistant
            : COMMISSION_RATES.hairstylist_with_assistant; // This case might need review if assistant leads and hairstylist assists
    } else {
        // Primary is hairstylist
        if (secondaryStaff.isAssistant) {
            primaryRate = COMMISSION_RATES.hairstylist_with_assistant;
            secondaryRate = COMMISSION_RATES.assistant_with_hairstylist;
        } else {
            // Both hairstylists
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

        const commission = calculateItemCommission(
            item.price,
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
