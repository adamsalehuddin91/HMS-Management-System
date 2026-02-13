-- Migration: Add status column to commissions table
-- This allows tracking voided commissions to prevent payment on voided sales

-- Add status column with default 'active' (only if it doesn't exist)
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'commissions' 
        AND column_name = 'status'
    ) THEN
        ALTER TABLE public.commissions 
        ADD COLUMN status TEXT DEFAULT 'active' CHECK (status IN ('active', 'voided'));
        
        RAISE NOTICE 'Added status column to commissions table';
    ELSE
        RAISE NOTICE 'Status column already exists, skipping';
    END IF;
END $$;

-- Update existing commissions to 'active' status (safe to run multiple times)
UPDATE public.commissions 
SET status = 'active' 
WHERE status IS NULL;

-- Create index for filtering by status
CREATE INDEX IF NOT EXISTS idx_commissions_status ON public.commissions(status);

-- Create index for unpaid active commissions (common query)
CREATE INDEX IF NOT EXISTS idx_commissions_unpaid_active 
ON public.commissions(staff_id, is_paid, status) 
WHERE is_paid = false AND status = 'active';

-- Add comment (safe to run multiple times)
COMMENT ON COLUMN public.commissions.status IS 'Commission status: active or voided (voided commissions should not be paid)';
