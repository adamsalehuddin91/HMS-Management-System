-- Seed Services
INSERT INTO public.services (name, category, price, member_price, duration, commission_rate, is_active) VALUES
('Signature Hijab Haircut', 'Haircut', 45.00, 40.00, 45, 15.00, true),
('Premium Hair Spa', 'Hair Spa', 120.00, 100.00, 90, 12.00, true),
('Organic Rose Facial', 'Facial', 85.00, 75.00, 60, 10.00, true),
('Classic Manicure', 'Nails', 50.00, 45.00, 45, 10.00, true);

-- Seed Products
INSERT INTO public.products (name, brand, category, cost_price, sell_price, stock_quantity, low_stock_threshold, is_active) VALUES
('Organic Hijab Shampoo', 'NourishBotanics', 'Hair Care', 15.00, 24.00, 42, 5, true),
('Rosewater Face Mist', 'GlowEssence', 'Skin Care', 10.00, 18.50, 3, 5, true),
('Argan Oil Serum', 'PureSilk', 'Hair Care', 25.00, 45.00, 15, 5, true),
('Moisturizing Conditioner', 'SilkTouch', 'Hair Care', 18.00, 28.00, 20, 5, true),
('Henna Cone', 'NaturalDye', 'Tools', 5.00, 10.00, 50, 10, true);

-- Seed Customers
INSERT INTO public.customers (name, phone, email, tier, points_balance, total_spent) VALUES
('Aisha Khan', '+60 12-345 6789', 'aisha@example.com', 'Gold', 1250, 1500.00),
('Siti Nurhaliza', '+60 17-999 8888', 'siti@example.com', 'Platinum', 2800, 3500.00),
('Fatimah Zahra', '+60 11-222 3333', 'fatimah@example.com', 'Silver', 450, 500.00),
('Nor Azura', '+60 13-555 1234', 'azura@example.com', 'Normal', 100, 150.00);

-- Seed Staff (Directory)
-- Note: These do not automatically create auth users. You must sign up users separately.
INSERT INTO public.staff (name, phone, role, commission_rate, is_active) VALUES
('Sarah Ahmad', '+60 12-111 2222', 'Senior Stylist', 20.00, true),
('Mei Ling', '+60 12-333 4444', 'Stylist', 15.00, true),
('Priya K', '+60 12-555 6666', 'Facialist', 15.00, true),
('Admin', '+60 12-000 0000', 'Manager', 0.00, true);
