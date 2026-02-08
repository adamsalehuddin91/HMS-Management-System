-- HMS Salon - Business Settings Table
-- Run this in Supabase Dashboard > SQL Editor

-- ============================================
-- BUSINESS SETTINGS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS business_settings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  setting_key VARCHAR(50) NOT NULL UNIQUE,
  setting_value JSONB NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  updated_by UUID
);

-- Insert default settings
INSERT INTO business_settings (setting_key, setting_value) VALUES
  ('business_info', '{
    "name": "HMS Salon",
    "phone": "+60 12-345 6789",
    "email": "hello@hmssalon.com",
    "whatsapp": "+60 12-345 6789",
    "address": "123 Jalan Bukit Bintang, 55100 Kuala Lumpur"
  }'::jsonb),
  ('loyalty_settings', '{
    "pointsPerRM": 1,
    "memberMultiplier": 2,
    "pointsPerDiscount": 100,
    "maxRedemption": 20,
    "expiryMonths": 6,
    "expiryEnabled": true
  }'::jsonb),
  ('operating_hours', '[
    {"day": "Monday", "open": "09:00", "close": "21:00", "isOpen": true},
    {"day": "Tuesday", "open": "09:00", "close": "21:00", "isOpen": true},
    {"day": "Wednesday", "open": "09:00", "close": "21:00", "isOpen": true},
    {"day": "Thursday", "open": "09:00", "close": "21:00", "isOpen": true},
    {"day": "Friday", "open": "09:00", "close": "21:00", "isOpen": true},
    {"day": "Saturday", "open": "09:00", "close": "21:00", "isOpen": true},
    {"day": "Sunday", "open": "09:00", "close": "21:00", "isOpen": false}
  ]'::jsonb)
ON CONFLICT (setting_key) DO NOTHING;

-- Enable RLS
ALTER TABLE business_settings ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users to read/write
CREATE POLICY "Allow authenticated access to business_settings" ON business_settings
  FOR ALL USING (auth.role() = 'authenticated');

-- Index for fast lookups
CREATE INDEX IF NOT EXISTS idx_business_settings_key ON business_settings(setting_key);
