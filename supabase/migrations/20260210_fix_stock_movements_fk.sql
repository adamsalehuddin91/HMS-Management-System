-- Fix stock_movements foreign key to allow joining with public.users
-- Run this in Supabase Dashboard > SQL Editor

-- 1. Drop the existing foreign key constraint (if strictly named or we find it)
-- Note: The name might vary if it was auto-generated, but usually it follows a pattern.
-- We will try to drop the constraint on 'performed_by'. 

ALTER TABLE public.stock_movements
DROP CONSTRAINT IF EXISTS stock_movements_performed_by_fkey;

-- 2. Add the correct foreign key referencing public.users
-- This allows PostgREST to detect the relationship "performer:users"
ALTER TABLE public.stock_movements
ADD CONSTRAINT stock_movements_performed_by_fkey
FOREIGN KEY (performed_by)
REFERENCES public.users(id);
