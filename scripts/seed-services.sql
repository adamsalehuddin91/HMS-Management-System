-- Haida Muslimah Salon - Complete Service List
-- Run this in Supabase Dashboard > SQL Editor

-- First, clear existing services (optional - comment out if you want to keep existing)
DELETE FROM services WHERE id IS NOT NULL;

-- Insert all 39 services from HMS Price List
INSERT INTO services (name, category, price, member_price, commission_rate, is_active) VALUES

-- ============ HAIRCUT (2 services) ============
('Hair Cut (Adult)', 'Haircut', 30, 27, 10, true),
('Hair Cut (Kids under 12)', 'Haircut', 15, 13, 10, true),

-- ============ TREATMENT (3 services) ============
('Hair Treatment', 'Treatment', 150, 135, 15, true),
('Standard Scalp Treatment', 'Treatment', 150, 135, 15, true),
('Premium Scalp Treatment', 'Treatment', 229, 206, 15, true),

-- ============ HAIR WASH (4 services) ============
('Hair Wash (Short)', 'Hair Wash', 40, 36, 10, true),
('Hair Wash (Medium)', 'Hair Wash', 45, 40, 10, true),
('Hair Wash (Long)', 'Hair Wash', 50, 45, 10, true),
('Hair Wash (Kids)', 'Hair Wash', 30, 27, 10, true),

-- ============ REBONDING KOREA (3 services) ============
('Rebonding Korea (Medium)', 'Rebonding', 200, 180, 15, true),
('Rebonding Korea (Long)', 'Rebonding', 260, 234, 15, true),
('Rebonding Korea (Extra Long)', 'Rebonding', 340, 306, 15, true),

-- ============ REBONDING JAPAN (3 services) ============
('Rebonding Japan (Medium)', 'Rebonding', 280, 252, 15, true),
('Rebonding Japan (Long)', 'Rebonding', 380, 342, 15, true),
('Rebonding Japan (Extra Long)', 'Rebonding', 480, 432, 15, true),

-- ============ HAIR COLOR (4 services) ============
('Hair Color (Short)', 'Hair Color', 170, 153, 15, true),
('Hair Color (Medium)', 'Hair Color', 220, 198, 15, true),
('Hair Color (Long)', 'Hair Color', 280, 252, 15, true),
('Hair Color (Extra Long)', 'Hair Color', 350, 315, 15, true),

-- ============ HENNA (4 services) ============
('Henna (Short)', 'Henna', 60, 54, 12, true),
('Henna (Medium)', 'Henna', 70, 63, 12, true),
('Henna (Long)', 'Henna', 80, 72, 12, true),
('Henna (Extra Long)', 'Henna', 100, 90, 12, true),

-- ============ BLEACHING (4 services) ============
('Bleaching (Short)', 'Bleaching', 100, 90, 15, true),
('Bleaching (Medium)', 'Bleaching', 150, 135, 15, true),
('Bleaching (Long)', 'Bleaching', 200, 180, 15, true),
('Bleaching (Extra Long)', 'Bleaching', 250, 225, 15, true),

-- ============ HIGHLIGHT (4 services) ============
('Highlight (Short)', 'Highlight', 150, 135, 15, true),
('Highlight (Medium)', 'Highlight', 200, 180, 15, true),
('Highlight (Long)', 'Highlight', 250, 225, 15, true),
('Highlight (Extra Long)', 'Highlight', 300, 270, 15, true),

-- ============ BODY MASSAGE (4 services) ============
('Full Body Massage (45 min)', 'Massage', 90, 81, 12, true),
('Full Body Massage (1 hour)', 'Massage', 110, 99, 12, true),
('Back Body Massage (30 min)', 'Massage', 69, 62, 12, true),
('Foot Massage (30 min)', 'Massage', 45, 40, 12, true),

-- ============ BODY TREATMENT (4 services) ============
('Full Body Scrub', 'Body Treatment', 80, 72, 12, true),
('Milk Bath', 'Body Treatment', 100, 90, 12, true),
('Flower Bath', 'Body Treatment', 130, 117, 12, true),
('Eyelash Perming', 'Body Treatment', 59, 53, 10, true);

-- Verify insertion
SELECT category, COUNT(*) as count, SUM(price) as total_price
FROM services
GROUP BY category
ORDER BY category;
