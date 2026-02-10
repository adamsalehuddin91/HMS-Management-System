-- Add void-related columns to sales table
-- Run this in Supabase SQL Editor

-- Add voided_at timestamp
ALTER TABLE sales ADD COLUMN IF NOT EXISTS voided_at TIMESTAMPTZ;

-- Add voided_by (ID of user who voided)
-- Explicitly drop existing foreign key if it's there from previous attempts
ALTER TABLE sales DROP CONSTRAINT IF EXISTS sales_voided_by_fkey;
ALTER TABLE sales ADD COLUMN IF NOT EXISTS voided_by UUID;

-- Add void_reason
ALTER TABLE sales ADD COLUMN IF NOT EXISTS void_reason TEXT;

-- Add status column to commissions table for tracking voided commissions
ALTER TABLE commissions ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';

-- Fix status check constraint on sales table to allow 'voided'
-- First drop if it exists (names might vary, but sales_status_check is standard)
ALTER TABLE sales DROP CONSTRAINT IF EXISTS sales_status_check;
ALTER TABLE sales ADD CONSTRAINT sales_status_check CHECK (status IN ('pending', 'completed', 'voided'));

-- Create index for finding voided sales
CREATE INDEX IF NOT EXISTS idx_sales_voided_at ON sales(voided_at) WHERE voided_at IS NOT NULL;
