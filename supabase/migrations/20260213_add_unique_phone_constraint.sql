-- Migration: Add UNIQUE constraint on customers.phone
-- This prevents duplicate customers with the same phone number

-- First, identify and report any existing duplicates
DO $$
DECLARE
    duplicate_count INTEGER;
    rec RECORD;
BEGIN
    SELECT COUNT(*) INTO duplicate_count
    FROM (
        SELECT phone, COUNT(*) as cnt
        FROM public.customers
        WHERE phone IS NOT NULL AND phone != ''
        GROUP BY phone
        HAVING COUNT(*) > 1
    ) duplicates;
    
    IF duplicate_count > 0 THEN
        RAISE NOTICE 'Found % phone numbers with duplicates', duplicate_count;
        RAISE NOTICE 'Duplicate phone numbers:';
        
        -- Log the duplicate phone numbers
        FOR rec IN (
            SELECT phone, COUNT(*) as cnt
            FROM public.customers
            WHERE phone IS NOT NULL AND phone != ''
            GROUP BY phone
            HAVING COUNT(*) > 1
            ORDER BY cnt DESC
        ) LOOP
            RAISE NOTICE '  Phone: %, Count: %', rec.phone, rec.cnt;
        END LOOP;
        
        RAISE EXCEPTION 'Cannot add UNIQUE constraint - duplicates exist. Please clean up duplicates first.';
    END IF;
END $$;

-- Add UNIQUE constraint on phone (allows NULL)
ALTER TABLE public.customers 
ADD CONSTRAINT customers_phone_unique UNIQUE (phone);

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS idx_customers_phone ON public.customers(phone) WHERE phone IS NOT NULL;

COMMENT ON CONSTRAINT customers_phone_unique ON public.customers IS 'Ensures each phone number is unique to prevent duplicate customer records';
