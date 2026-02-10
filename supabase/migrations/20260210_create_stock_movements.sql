-- HMS Salon - Create Stock Movements Table
-- Run this in Supabase Dashboard > SQL Editor

CREATE TABLE IF NOT EXISTS public.stock_movements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID NOT NULL REFERENCES public.products(id) ON DELETE CASCADE,
    type VARCHAR(20) NOT NULL CHECK (type IN ('in', 'out', 'adjust')),
    quantity INTEGER NOT NULL, -- The change amount (e.g., +10 for in, -2 for out)
    balance_before INTEGER NOT NULL,
    balance_after INTEGER NOT NULL,
    reason TEXT,
    reference_id UUID, -- Links to sale_id or other reference
    performed_by UUID, -- Links to user profile
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for performance
CREATE INDEX IF NOT EXISTS idx_stock_movements_product ON public.stock_movements(product_id);
CREATE INDEX IF NOT EXISTS idx_stock_movements_created_at ON public.stock_movements(created_at);

-- Enable RLS
ALTER TABLE public.stock_movements ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users to read/write
CREATE POLICY "Allow authenticated access to stock_movements" ON public.stock_movements
    FOR ALL USING (auth.role() = 'authenticated');

-- Verify table created
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_name = 'stock_movements';
