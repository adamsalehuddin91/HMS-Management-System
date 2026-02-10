import { formatCurrency } from "@/lib/utils";

export interface Service {
    id: string;
    name: string;
    category: string;
    price: number;
    member_price?: number;
    duration_minutes?: number;
    image_url?: string;
}

export interface Staff {
    id: string;
    name: string;
    role: string;
    is_active?: boolean;
}

export interface Customer {
    id: string;
    name: string;
    phone: string;
    points_balance: number;
    tier: string;
    is_member?: boolean;
}

export interface BookingData {
    id: string;
    customer_id: string;
    service_id: string;
    staff_id: string;
    booking_date: string;
    booking_time?: string;
    start_time?: string;
    end_time?: string;
    status: string;
    deposit?: number;
    deposit_amount?: number;
    deposit_paid?: boolean;
    notes?: string;
    customer?: {
        id: string;
        name: string;
        phone: string;
        is_member?: boolean;
        tier?: string;
    };
    service?: {
        id: string;
        name: string;
        price: number;
        duration?: number;
        duration_minutes?: number;
    };
    staff?: {
        id: string;
        name: string;
    };
}

export const getBookingTime = (booking: BookingData): string => {
    return booking.start_time || booking.booking_time || '00:00';
};

export const getDepositAmount = (booking: BookingData): number => {
    return booking.deposit_amount || booking.deposit || 0;
};

export const isCustomerMember = (customer?: BookingData['customer']): boolean => {
    if (!customer) return false;
    return customer.is_member || customer.tier === 'Member' || customer.tier === 'VIP';
};

export const getServiceDuration = (service?: BookingData['service'] | Service): number => {
    if (!service) return 60;
    return service.duration_minutes || (service as any).duration || 60;
};

export const getStatusColor = (status: string): string => {
    switch (status.toLowerCase()) {
        case 'confirmed': return 'bg-[#2e7d32]';
        case 'pending': return 'bg-amber-500';
        case 'completed': return 'bg-blue-600';
        default: return 'bg-gray-400';
    }
};
