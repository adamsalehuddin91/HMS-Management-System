-- Add secondary_stylist_id to sale_items to support commission sharing
-- Run this in Supabase Dashboard > SQL Editor

ALTER TABLE public.sale_items
ADD COLUMN secondary_stylist_id uuid REFERENCES public.staff(id);
