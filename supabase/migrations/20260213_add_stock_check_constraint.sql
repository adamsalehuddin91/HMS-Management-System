-- Migration: Add CHECK constraint to prevent negative stock
-- This ensures stock_quantity can never go below 0

-- Add CHECK constraint
ALTER TABLE public.products 
ADD CONSTRAINT products_stock_non_negative CHECK (stock_quantity >= 0);

COMMENT ON CONSTRAINT products_stock_non_negative ON public.products IS 'Prevents negative stock quantities';
