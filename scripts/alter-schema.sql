-- HMS Salon - Schema Updates
-- Run this in Supabase Dashboard > SQL Editor to add missing columns

-- ============================================
-- CUSTOMERS TABLE - Add missing columns
-- ============================================
ALTER TABLE public.customers
ADD COLUMN IF NOT EXISTS is_member boolean DEFAULT false;

ALTER TABLE public.customers
ADD COLUMN IF NOT EXISTS visit_count integer DEFAULT 0;

ALTER TABLE public.customers
ADD COLUMN IF NOT EXISTS phone_canonical text;

-- Update is_member based on tier
UPDATE public.customers SET is_member = true WHERE tier IN ('Member', 'VIP');

-- ============================================
-- BOOKINGS TABLE - Add time columns
-- ============================================
ALTER TABLE public.bookings
ADD COLUMN IF NOT EXISTS start_time time;

ALTER TABLE public.bookings
ADD COLUMN IF NOT EXISTS end_time time;

ALTER TABLE public.bookings
ADD COLUMN IF NOT EXISTS deposit_amount decimal(10,2) DEFAULT 0;

ALTER TABLE public.bookings
ADD COLUMN IF NOT EXISTS deposit_paid boolean DEFAULT false;

-- Migrate existing booking_time to start_time
UPDATE public.bookings SET start_time = booking_time WHERE start_time IS NULL AND booking_time IS NOT NULL;

-- ============================================
-- SALE_ITEMS TABLE - Add missing columns
-- ============================================
ALTER TABLE public.sale_items
ADD COLUMN IF NOT EXISTS item_name text;

ALTER TABLE public.sale_items
ADD COLUMN IF NOT EXISTS unit_price decimal(10,2);

ALTER TABLE public.sale_items
ADD COLUMN IF NOT EXISTS discount decimal(10,2) DEFAULT 0;

ALTER TABLE public.sale_items
ADD COLUMN IF NOT EXISTS total decimal(10,2);

ALTER TABLE public.sale_items
ADD COLUMN IF NOT EXISTS commission_rate decimal(5,2) DEFAULT 0;

-- Migrate existing price to unit_price
UPDATE public.sale_items SET unit_price = price WHERE unit_price IS NULL;
UPDATE public.sale_items SET total = price * quantity WHERE total IS NULL;

-- ============================================
-- COMMISSIONS TABLE - Add missing columns
-- ============================================
ALTER TABLE public.commissions
ADD COLUMN IF NOT EXISTS service_name text;

ALTER TABLE public.commissions
ADD COLUMN IF NOT EXISTS sale_amount decimal(10,2);

ALTER TABLE public.commissions
ADD COLUMN IF NOT EXISTS commission_rate decimal(5,2);

ALTER TABLE public.commissions
ADD COLUMN IF NOT EXISTS month varchar(7); -- YYYY-MM format

-- Migrate existing date to month format
UPDATE public.commissions SET month = TO_CHAR(date, 'YYYY-MM') WHERE month IS NULL AND date IS NOT NULL;

-- ============================================
-- SALES TABLE - Add missing columns
-- ============================================
ALTER TABLE public.sales
ADD COLUMN IF NOT EXISTS discount_amount decimal(10,2) DEFAULT 0;

ALTER TABLE public.sales
ADD COLUMN IF NOT EXISTS points_discount decimal(10,2) DEFAULT 0;

ALTER TABLE public.sales
ADD COLUMN IF NOT EXISTS deposit_deducted decimal(10,2) DEFAULT 0;

ALTER TABLE public.sales
ADD COLUMN IF NOT EXISTS created_by uuid;

ALTER TABLE public.sales
ADD COLUMN IF NOT EXISTS updated_at timestamp with time zone DEFAULT now();

ALTER TABLE public.sales
ADD COLUMN IF NOT EXISTS notes text;

-- Migrate existing discount to discount_amount
UPDATE public.sales SET discount_amount = discount WHERE discount_amount IS NULL OR discount_amount = 0;
UPDATE public.sales SET points_discount = points_value WHERE points_discount IS NULL OR points_discount = 0;

-- ============================================
-- POINTS_TRANSACTIONS TABLE - Add missing column
-- ============================================
ALTER TABLE public.points_transactions
ADD COLUMN IF NOT EXISTS performed_by uuid;

ALTER TABLE public.points_transactions
ADD COLUMN IF NOT EXISTS reference_id uuid;

-- Migrate sale_id to reference_id
UPDATE public.points_transactions SET reference_id = sale_id WHERE reference_id IS NULL;

-- ============================================
-- SERVICES TABLE - Add missing columns
-- ============================================
ALTER TABLE public.services
ADD COLUMN IF NOT EXISTS duration_minutes integer;

ALTER TABLE public.services
ADD COLUMN IF NOT EXISTS image_url text;

ALTER TABLE public.services
ADD COLUMN IF NOT EXISTS updated_at timestamp with time zone DEFAULT now();

-- Migrate duration to duration_minutes
UPDATE public.services SET duration_minutes = duration WHERE duration_minutes IS NULL;

-- ============================================
-- PRODUCTS TABLE - Add missing columns
-- ============================================
ALTER TABLE public.products
ADD COLUMN IF NOT EXISTS image_url text;

ALTER TABLE public.products
ADD COLUMN IF NOT EXISTS reorder_level integer DEFAULT 5;

ALTER TABLE public.products
ADD COLUMN IF NOT EXISTS updated_at timestamp with time zone DEFAULT now();

-- ============================================
-- STAFF TABLE - Add missing columns
-- ============================================
ALTER TABLE public.staff
ADD COLUMN IF NOT EXISTS email text;

ALTER TABLE public.staff
ADD COLUMN IF NOT EXISTS updated_at timestamp with time zone DEFAULT now();

-- ============================================
-- ADD RLS POLICIES FOR INSERT/UPDATE/DELETE
-- ============================================

-- Sales policies
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'sales' AND policyname = 'Allow authenticated insert') THEN
    CREATE POLICY "Allow authenticated insert" ON public.sales FOR INSERT WITH CHECK (auth.role() = 'authenticated');
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'sales' AND policyname = 'Allow authenticated update') THEN
    CREATE POLICY "Allow authenticated update" ON public.sales FOR UPDATE USING (auth.role() = 'authenticated');
  END IF;
END $$;

-- Sale items policies
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'sale_items' AND policyname = 'Allow authenticated insert') THEN
    CREATE POLICY "Allow authenticated insert" ON public.sale_items FOR INSERT WITH CHECK (auth.role() = 'authenticated');
  END IF;
END $$;

-- Commissions policies
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'commissions' AND policyname = 'Allow authenticated insert') THEN
    CREATE POLICY "Allow authenticated insert" ON public.commissions FOR INSERT WITH CHECK (auth.role() = 'authenticated');
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'commissions' AND policyname = 'Allow authenticated update') THEN
    CREATE POLICY "Allow authenticated update" ON public.commissions FOR UPDATE USING (auth.role() = 'authenticated');
  END IF;
END $$;

-- Points transactions policies
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'points_transactions' AND policyname = 'Allow authenticated insert') THEN
    CREATE POLICY "Allow authenticated insert" ON public.points_transactions FOR INSERT WITH CHECK (auth.role() = 'authenticated');
  END IF;
END $$;

-- Staff policies
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'staff' AND policyname = 'Allow authenticated insert') THEN
    CREATE POLICY "Allow authenticated insert" ON public.staff FOR INSERT WITH CHECK (auth.role() = 'authenticated');
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'staff' AND policyname = 'Allow authenticated update') THEN
    CREATE POLICY "Allow authenticated update" ON public.staff FOR UPDATE USING (auth.role() = 'authenticated');
  END IF;
END $$;

-- Services policies
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'services' AND policyname = 'Allow authenticated insert') THEN
    CREATE POLICY "Allow authenticated insert" ON public.services FOR INSERT WITH CHECK (auth.role() = 'authenticated');
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'services' AND policyname = 'Allow authenticated update') THEN
    CREATE POLICY "Allow authenticated update" ON public.services FOR UPDATE USING (auth.role() = 'authenticated');
  END IF;
END $$;

-- Products policies
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'products' AND policyname = 'Allow authenticated insert') THEN
    CREATE POLICY "Allow authenticated insert" ON public.products FOR INSERT WITH CHECK (auth.role() = 'authenticated');
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'products' AND policyname = 'Allow authenticated update') THEN
    CREATE POLICY "Allow authenticated update" ON public.products FOR UPDATE USING (auth.role() = 'authenticated');
  END IF;
END $$;

-- ============================================
-- VERIFY COLUMNS ADDED
-- ============================================
SELECT
  table_name,
  column_name,
  data_type
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name IN ('customers', 'bookings', 'sale_items', 'commissions', 'sales', 'points_transactions')
ORDER BY table_name, ordinal_position;
