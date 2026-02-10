-- RLS Policies for Public Online Booking
-- Run this in Supabase SQL Editor if you don't want to use service_role key

-- Allow public to insert customers (for new customers booking online)
CREATE POLICY "Allow public customer creation for online booking"
ON customers FOR INSERT
TO anon
WITH CHECK (true);

-- Allow public to read customers by phone (to check if exists)
CREATE POLICY "Allow public to check customer by phone"
ON customers FOR SELECT
TO anon
USING (true);

-- Allow public to insert bookings
CREATE POLICY "Allow public booking creation"
ON bookings FOR INSERT
TO anon
WITH CHECK (true);

-- Allow public to read services (to display in booking page)
CREATE POLICY "Allow public to view services"
ON services FOR SELECT
TO anon
USING (is_active = true);

-- Allow public to read staff (to display in booking page)
CREATE POLICY "Allow public to view active staff"
ON staff FOR SELECT
TO anon
USING (is_active = true);

-- Allow public to read bookings (to check slot availability)
CREATE POLICY "Allow public to check booking slots"
ON bookings FOR SELECT
TO anon
USING (true);

-- Allow public to read business settings (for salon info)
CREATE POLICY "Allow public to view business settings"
ON business_settings FOR SELECT
TO anon
USING (true);
