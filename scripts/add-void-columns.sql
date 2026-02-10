-- Add void-related columns to sales table
-- Run this in Supabase SQL Editor

-- Add voided_at timestamp
ALTER TABLE sales ADD COLUMN IF NOT EXISTS voided_at TIMESTAMPTZ;

-- Add voided_by (reference to staff who voided)
ALTER TABLE sales ADD COLUMN IF NOT EXISTS voided_by UUID REFERENCES staff(id);

-- Add void_reason
ALTER TABLE sales ADD COLUMN IF NOT EXISTS void_reason TEXT;

-- Add status column to commissions table for tracking voided commissions
ALTER TABLE commissions ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';

-- Create index for finding voided sales
CREATE INDEX IF NOT EXISTS idx_sales_voided_at ON sales(voided_at) WHERE voided_at IS NOT NULL;
