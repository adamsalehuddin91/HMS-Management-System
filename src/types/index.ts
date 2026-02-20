// User & Auth Types
export type UserRole = "admin" | "staff";

export interface User {
  id: string;
  email: string;
  name: string;
  phone?: string;
  role: UserRole;
  avatar_url?: string;
  created_at: string;
  updated_at: string;
}

// Customer Types
export type MemberTier = "bronze" | "silver" | "gold" | "platinum";

export interface Customer {
  id: string;
  name: string;
  phone: string;
  phone_canonical: string;
  email?: string;
  is_member: boolean;
  tier: MemberTier;
  points_balance: number;
  total_spent: number;
  visit_count: number;
  notes?: string;
  created_at: string;
  updated_at: string;
}

// Staff Types
export interface Staff {
  id: string;
  user_id?: string;
  name: string;
  phone: string;
  email?: string;
  role: "stylist" | "cashier" | "manager";
  is_active: boolean;
  avatar_url?: string;
  commission_rate?: number;
  created_at: string;
  updated_at: string;
}

// Service Types
export interface Service {
  id: string;
  name: string;
  description?: string;
  category: string;
  price: number;
  member_price?: number;
  duration: number;
  commission_rate: number;
  is_active: boolean;
  is_point_eligible: boolean;   // false = excluded from earning (e.g. Hair Cut)
  image_url?: string;
  created_at: string;
  updated_at: string;
}

// Product/Inventory Types
export interface Product {
  id: string;
  name: string;
  sku?: string;
  brand?: string;
  category: string;
  cost_price: number;
  sell_price: number;
  stock_quantity: number;
  reorder_level: number;
  low_stock_threshold: number;
  is_active: boolean;
  image_url?: string;
  created_at: string;
  updated_at: string;
}

export type StockMovementType = "in" | "out" | "adjust";

export interface StockMovement {
  id: string;
  product_id: string;
  type: StockMovementType;
  quantity: number;
  reason?: string;
  reference_id?: string;
  performed_by: string;
  created_at: string;
}

// Booking Types
export type BookingStatus = "pending" | "confirmed" | "completed" | "cancelled" | "no_show";

export interface Booking {
  id: string;
  customer_id: string;
  customer?: Customer;
  service_id: string;
  service?: Service;
  staff_id: string;
  staff?: Staff;
  booking_date: string;
  start_time: string;
  end_time: string;
  status: BookingStatus;
  deposit_amount: number;
  deposit_paid: boolean;
  notes?: string;
  created_at: string;
  updated_at: string;
}

// Sale Types
export type PaymentMethod = "cash" | "qr" | "transfer" | "card";
export type SaleStatus = "pending" | "completed" | "voided";

export interface Sale {
  id: string;
  customer_id?: string;
  customer?: Customer;
  booking_id?: string;
  subtotal: number;
  discount_amount: number;
  points_redeemed: number;
  points_discount: number;
  deposit_deducted: number;
  total: number;
  payment_method: PaymentMethod;
  status: SaleStatus;
  is_promotional: boolean;      // true = promo txn (redeem blocked)
  promotion_id?: string;
  notes?: string;
  created_by: string;
  created_at: string;
  updated_at: string;
}

export interface SaleItem {
  id: string;
  sale_id: string;
  item_type: "service" | "product";
  item_id: string;
  item_name: string;
  stylist_id?: string;
  stylist?: Staff;
  quantity: number;
  unit_price: number;
  discount: number;
  total: number;
  commission_rate: number;
  commission_amount: number;
  promo_id?: string;
  promo_description?: string;
}

// Points Types
export type PointsTransactionType = "earn" | "redeem" | "adjust" | "expire";

export interface PointsTransaction {
  id: string;
  customer_id: string;
  type: PointsTransactionType;
  points: number;
  balance_after: number;
  reference_id?: string;
  reason?: string;
  expires_at?: string;          // set for 'earn' type — 6 months
  is_expired: boolean;
  performed_by: string;
  created_at: string;
}

// Promotion Types
export interface Promotion {
  id: string;
  name: string;
  description?: string;
  promo_price: number;
  service_id?: string;          // null = cart-wide
  service?: Service;
  start_date: string;           // YYYY-MM-DD
  end_date: string;             // YYYY-MM-DD
  is_active: boolean;
  created_by: string;
  created_at: string;
}

// Commission Types
export interface Commission {
  id: string;
  staff_id: string;
  staff?: Staff;
  sale_id: string;
  sale_item_id: string;
  service_name: string;
  sale_amount: number;
  commission_rate: number;
  amount: number;
  month: string; // YYYY-MM format
  is_paid: boolean;
  created_at: string;
}

// Settings Types
export interface BusinessSettings {
  id: string;
  business_name: string;
  phone: string;
  email?: string;
  address?: string;
  operating_hours?: Record<string, { open: string; close: string; closed?: boolean }>;
  points_earn_rate: number; // Points per RM
  points_redeem_rate: number; // RM per points
  max_points_redeem_percent: number; // Max % of bill that can be paid with points
  deposit_percentage: number;
  whatsapp_number?: string;
  logo_url?: string;
}

// Dashboard Stats
export interface DashboardStats {
  sales_today: number;
  sales_change: number;
  bookings_today: number;
  bookings_change: number;
  monthly_commission: number;
  commission_change: number;
  points_issued: number;
  points_change: number;
}
