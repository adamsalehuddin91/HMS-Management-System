-- Fix stock_movements table schema
-- Run this in Supabase Dashboard > SQL Editor

-- 1. Add missing columns if they don't exist
ALTER TABLE public.stock_movements 
ADD COLUMN IF NOT EXISTS balance_before INTEGER NOT NULL DEFAULT 0,
ADD COLUMN IF NOT EXISTS balance_after INTEGER NOT NULL DEFAULT 0,
ADD COLUMN IF NOT EXISTS performed_by UUID REFERENCES auth.users(id), -- Linking to auth.users which is public.users.id
ADD COLUMN IF NOT EXISTS reference_id UUID;

-- 2. Update type check constraint to allow 'adjust'
ALTER TABLE public.stock_movements DROP CONSTRAINT IF EXISTS stock_movements_type_check;
ALTER TABLE public.stock_movements ADD CONSTRAINT stock_movements_type_check CHECK (type IN ('in', 'out', 'adjust'));

-- 3. Add index for performance (if not exists)
CREATE INDEX IF NOT EXISTS idx_stock_movements_performed_by ON public.stock_movements(performed_by);
