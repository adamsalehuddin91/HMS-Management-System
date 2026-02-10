-- ============================================
-- HMS Salon - Sales Import: 10-OCT-2025
-- Receipts: 180 | Items: 306 | Revenue: RM 26,350
-- Generated: 2026-02-09
-- ============================================

-- Run AFTER import-zobaze-data.sql (customers must exist)

-- Batch 1/4
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3308 | ina | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111123198' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'qr', 'completed', 'Zobaze HM-3308', '2025-10-02T04:37:00.000Z', '2025-10-02T04:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-02T04:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-02T04:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-10-02T04:37:00.000Z');

  -- HM-3309 | Nana | RM40
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127910371' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'card', 'completed', 'Zobaze HM-3309', '2025-10-02T04:54:00.000Z', '2025-10-02T04:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-10-02T04:54:00.000Z');

  -- HM-3310 | SALIZA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137431577' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3310', '2025-10-02T06:11:00.000Z', '2025-10-02T06:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-02T06:11:00.000Z');

  -- HM-3311 | NURHAFIZAN HABILLIAS E6381 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60147750874' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3311', '2025-10-02T09:36:00.000Z', '2025-10-02T09:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-02T09:36:00.000Z');

  -- HM-3312 | UMMI HUMAIRA MOHD SHAHLI E4950 | RM40
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127337081' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'cash', 'completed', 'Zobaze HM-3312', '2025-10-03T05:13:00.000Z', '2025-10-03T05:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-10-03T05:13:00.000Z');

  -- HM-3313 | AMIRAH BINTI ROSLI E6741 | RM235
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60104509353' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 235, 0, 235, 'qr', 'completed', 'Zobaze HM-3313', '2025-10-03T06:31:00.000Z', '2025-10-03T06:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-03T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-03T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 155, 155, 155, '2025-10-03T06:31:00.000Z');

  -- HM-3314 | KHADIJAH AIYUB E6742 | RM145
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197719834' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 145, 0, 145, 'qr', 'completed', 'Zobaze HM-3314', '2025-10-03T07:51:00.000Z', '2025-10-03T07:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-03T07:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Medium)' LIMIT 1), gen_random_uuid()), 'Henna (Medium)', 1, 70, 70, 70, '2025-10-03T07:51:00.000Z');

  -- HM-3315 | zy | RM239
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601161144692' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 239, 0, 239, 'cash', 'completed', 'Zobaze HM-3315', '2025-10-03T10:19:00.000Z', '2025-10-03T10:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-03T10:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-10-03T10:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-03T10:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-03T10:19:00.000Z');

  -- HM-3316 | SITI ASIAH KIDAM E5951 | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60146693800' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-3316', '2025-10-04T03:17:00.000Z', '2025-10-04T03:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-10-04T03:17:00.000Z');

  -- HM-3318 | SYARIFAH HASLINA SYED HASSAN E3434 | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127870977' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'card', 'completed', 'Zobaze HM-3318', '2025-10-04T05:04:00.000Z', '2025-10-04T05:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-04T05:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-04T05:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-04T05:04:00.000Z');

  -- HM-3319 | SITI AISYAH ZULKEFLI E6464 | RM350
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133431354' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 350, 80, 350, 'card', 'completed', 'Zobaze HM-3319', '2025-10-04T05:19:00.000Z', '2025-10-04T05:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Long)' LIMIT 1), gen_random_uuid()), 'Color (Long)', 1, 280, 280, 280, '2025-10-04T05:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-04T05:19:00.000Z');

  -- HM-3320 | ILYA HAIRANIS E2353 | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197103019' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'card', 'completed', 'Zobaze HM-3320', '2025-10-04T05:22:00.000Z', '2025-10-04T05:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 2, 45, 45, 90, '2025-10-04T05:22:00.000Z');

  -- HM-3321 | NUR AISHAH IZZATI ZULKIFLI E6539 | RM520
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197717602' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 520, 0, 520, 'card', 'completed', 'Zobaze HM-3321', '2025-10-04T05:24:00.000Z', '2025-10-04T05:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 2, 260, 260, 520, '2025-10-04T05:24:00.000Z');

  -- HM-3322 | ADIBAH AISHAH E2441 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3322', '2025-10-04T06:35:00.000Z', '2025-10-04T06:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 2, 75, 75, 150, '2025-10-04T06:35:00.000Z');

  -- HM-3323 | ADIBAH AISHAH E2441 | RM79
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 79, 0, 79, 'card', 'completed', 'Zobaze HM-3323', '2025-10-04T06:46:00.000Z', '2025-10-04T06:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-04T06:46:00.000Z');

  -- HM-3324 | YUSRA | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110766449' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-3324', '2025-10-04T06:59:00.000Z', '2025-10-04T06:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-10-04T06:59:00.000Z');

  -- HM-3325 | INSYIRAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123069095' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3325', '2025-10-04T08:43:00.000Z', '2025-10-04T08:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-10-04T08:43:00.000Z');

  -- HM-3326 | NURUL JANNAH ALIAS E1963 | RM229
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60139504530' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 229, 0, 229, 'card', 'completed', 'Zobaze HM-3326', '2025-10-04T09:23:00.000Z', '2025-10-04T09:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-10-04T09:23:00.000Z');

  -- HM-3327 | SITI HAJAR | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60166635809' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3327', '2025-10-04T09:24:00.000Z', '2025-10-04T09:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-10-04T09:24:00.000Z');

  -- HM-3328 | NURUL SYAKIRA A RASHID E0746 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137111206' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3328', '2025-10-04T09:29:00.000Z', '2025-10-04T09:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-04T09:29:00.000Z');

  -- HM-3329 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3329', '2025-10-04T10:04:00.000Z', '2025-10-04T10:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-04T10:04:00.000Z');

  -- HM-3330 | WAWA | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137103005' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'card', 'completed', 'Zobaze HM-3330', '2025-10-04T10:08:00.000Z', '2025-10-04T10:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-04T10:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-10-04T10:08:00.000Z');

  -- HM-3331 | NUR BAITI SUHARDI E6743 | RM680
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60179709261' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 680, 0, 680, 'qr', 'completed', 'Zobaze HM-3331', '2025-10-04T10:44:00.000Z', '2025-10-04T10:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 340, 340, 340, '2025-10-04T10:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-04T10:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-10-04T10:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-04T10:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Highlight (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Highlight (Medium)' LIMIT 1), gen_random_uuid()), 'Highlight (Medium)', 1, 200, 200, 200, '2025-10-04T10:44:00.000Z');

  -- HM-3332 | FARAH | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177047707' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'qr', 'completed', 'Zobaze HM-3332', '2025-10-05T04:02:00.000Z', '2025-10-05T04:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-05T04:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-10-05T04:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-10-05T04:02:00.000Z');

  -- HM-3333 | NOORLIZA RAMLI E0285 | RM184
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199195130' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 184, 0, 184, 'qr', 'completed', 'Zobaze HM-3333', '2025-10-05T05:33:00.000Z', '2025-10-05T05:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-05T05:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-05T05:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Wash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Wash Kids' LIMIT 1), gen_random_uuid()), 'Wash Kids', 1, 30, 30, 30, '2025-10-05T05:33:00.000Z');

  -- HM-3334 | NAZIRA E6428 | RM38
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167722583' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 38, 0, 38, 'cash', 'completed', 'Zobaze HM-3334', '2025-10-05T05:34:00.000Z', '2025-10-05T05:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT BANGS' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT BANGS' LIMIT 1), gen_random_uuid()), 'HAIRCUT BANGS', 1, 8, 8, 8, '2025-10-05T05:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-05T05:34:00.000Z');

  -- HM-3335 | NORHAYATI IBRAHIM E5794 | RM310
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601113077231' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 310, 0, 310, 'qr', 'completed', 'Zobaze HM-3335', '2025-10-05T06:23:00.000Z', '2025-10-05T06:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-05T06:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 260, 260, 260, '2025-10-05T06:23:00.000Z');

  -- HM-3336 |  | RM180
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3336', '2025-10-05T06:27:00.000Z', '2025-10-05T06:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-05T06:27:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-05T06:27:00.000Z');

  -- HM-3337 | NABILAH MD NOH E6054 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60105689689' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3337', '2025-10-05T06:29:00.000Z', '2025-10-05T06:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-05T06:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-05T06:29:00.000Z');

  -- HM-3338 | FATHIAH E6744 | RM1059
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6096680489' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 1059, 0, 1059, 'card', 'completed', 'Zobaze HM-3338', '2025-10-05T07:28:00.000Z', '2025-10-05T07:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 370, 370, 370, '2025-10-05T07:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-05T07:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese (Long)' LIMIT 1), gen_random_uuid()), 'Japanese (Long)', 1, 430, 430, 430, '2025-10-05T07:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-10-05T07:28:00.000Z');

  -- HM-3339 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3339', '2025-10-05T07:44:00.000Z', '2025-10-05T07:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-05T07:44:00.000Z');

  -- HM-3340 | SYASYA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137449459' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3340', '2025-10-05T07:50:00.000Z', '2025-10-05T07:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-05T07:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-10-05T07:50:00.000Z');

  -- HM-3341 |  | RM18
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 18, 0, 18, 'cash', 'completed', 'Zobaze HM-3341', '2025-10-05T09:51:00.000Z', '2025-10-05T09:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 18, 18, 18, '2025-10-05T09:51:00.000Z');

  -- HM-3342 | KHADIJAH MOHAMMAD E6746 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60124102093' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3342', '2025-10-05T10:00:00.000Z', '2025-10-05T10:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-05T10:00:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-05T10:00:00.000Z');

  -- HM-3343 | FATIN NADZIRAH BINTI HASHIM E6255 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182316531' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3343', '2025-10-06T03:30:00.000Z', '2025-10-06T03:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-06T03:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 55, 55, 55, '2025-10-06T03:30:00.000Z');

  -- HM-3344 | SITI ESNIFA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127249108' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3344', '2025-10-06T08:12:00.000Z', '2025-10-06T08:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-06T08:12:00.000Z');

  -- HM-3345 | KARTINI YA'AKUB E6158 | RM400
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197908089' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 400, 0, 400, 'card', 'completed', 'Zobaze HM-3345', '2025-10-06T09:20:00.000Z', '2025-10-06T09:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 400, 400, 400, '2025-10-06T09:20:00.000Z');

  -- HM-3346 | YATI | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60179768644' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3346', '2025-10-06T09:22:00.000Z', '2025-10-06T09:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-10-06T09:22:00.000Z');

  -- HM-3347 | SYAKIRA | RM110
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601171102708' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 110, 0, 110, 'qr', 'completed', 'Zobaze HM-3347', '2025-10-07T07:33:00.000Z', '2025-10-07T07:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-10-07T07:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-07T07:33:00.000Z');

  -- HM-3348 | NOOR SYAHIZA MAHIDZIR E6747 | RM430
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187626484' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 430, 0, 430, 'transfer', 'completed', 'Zobaze HM-3348', '2025-10-07T09:05:00.000Z', '2025-10-07T09:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Scalp & Hair Treatment + Haircut', 1, 430, 430, 430, '2025-10-07T09:05:00.000Z');

  -- HM-3349 | SHERY SHALLY E6748 | RM650
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187868518' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 650, 0, 650, 'cash', 'completed', 'Zobaze HM-3349', '2025-10-07T09:18:00.000Z', '2025-10-07T09:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-07T09:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 2, 10, 10, 20, '2025-10-07T09:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-10-07T09:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 2, 260, 260, 520, '2025-10-07T09:18:00.000Z');

  -- HM-3350 | SITI ZAINON | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129183306' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-3350', '2025-10-09T03:14:00.000Z', '2025-10-09T03:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-10-09T03:14:00.000Z');

  -- HM-3351 | SHARIFAH FATINI | RM48
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601165561008' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 48, 0, 48, 'qr', 'completed', 'Zobaze HM-3351', '2025-10-09T07:35:00.000Z', '2025-10-09T07:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), gen_random_uuid()), 'HAIRCUT TEENAGER', 1, 18, 18, 18, '2025-10-09T07:35:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-09T07:35:00.000Z');

  -- HM-3352 | SITI AINI | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127511519' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3352', '2025-10-09T07:43:00.000Z', '2025-10-09T07:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-09T07:43:00.000Z');

  -- HM-3353 | FATHIAH | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60135385375' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'cash', 'completed', 'Zobaze HM-3353', '2025-10-09T09:13:00.000Z', '2025-10-09T09:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-09T09:13:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-09T09:13:00.000Z');

  -- HM-3354 | AZIA NURYASMIN A BUSHNAL AZ E6441 | RM288
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60169070637' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 288, 0, 288, 'qr', 'completed', 'Zobaze HM-3354', '2025-10-09T10:14:00.000Z', '2025-10-09T10:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Eyelash Perming' LIMIT 1), (SELECT id FROM products WHERE name = 'Eyelash Perming' LIMIT 1), gen_random_uuid()), 'Eyelash Perming', 1, 59, 59, 59, '2025-10-09T10:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-10-09T10:14:00.000Z');

  -- HM-3355 | SURIA MD SALLEH E6660 | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127554550' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3355', '2025-10-10T05:35:00.000Z', '2025-10-10T05:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-10T05:35:00.000Z');

  -- HM-3356 | AWIN | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167323204' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3356', '2025-10-10T06:55:00.000Z', '2025-10-10T06:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-10T06:55:00.000Z');

  -- HM-3357 | ALEESYA | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197842461' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-3357', '2025-10-10T09:36:00.000Z', '2025-10-10T09:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-10-10T09:36:00.000Z');

  -- HM-3358 | SALOON USE | RM0
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187715238' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 0, 0, 0, 'cash', 'completed', 'Zobaze HM-3358', '2025-10-10T09:40:00.000Z', '2025-10-10T09:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic (1 X free)' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic (1 X free)' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic (1 X free)', 1, 0, 0, 0, '2025-10-10T09:40:00.000Z');

END $$;

-- Batch 2/4
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3359 | NURUL AKMA NASRI E4888 | RM117
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137282882' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 117, 0, 117, 'qr', 'completed', 'Zobaze HM-3359', '2025-10-10T09:51:00.000Z', '2025-10-10T09:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-10T09:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-10-10T09:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Tonic Trial' LIMIT 1), (SELECT id FROM products WHERE name = 'Tonic Trial' LIMIT 1), gen_random_uuid()), 'Tonic Trial', 1, 22, 22, 22, '2025-10-10T09:51:00.000Z');

  -- HM-3360 | SITI NURRINA MISRAN E6323 | RM299
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137213761' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 299, 0, 299, 'qr', 'completed', 'Zobaze HM-3360', '2025-10-11T04:01:00.000Z', '2025-10-11T04:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-10-11T04:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-10-11T04:01:00.000Z');

  -- HM-3361 | NAJIHAH E6323 | RM378
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142325526' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 378, 0, 378, 'qr', 'completed', 'Zobaze HM-3361', '2025-10-11T04:04:00.000Z', '2025-10-11T04:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-10-11T04:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-11T04:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-10-11T04:04:00.000Z');

  -- HM-3362 | KHAIRINA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197256568' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3362', '2025-10-11T04:24:00.000Z', '2025-10-11T04:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-10-11T04:24:00.000Z');

  -- HM-3363 | NADIA | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189785174' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'cash', 'completed', 'Zobaze HM-3363', '2025-10-11T04:57:00.000Z', '2025-10-11T04:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-10-11T04:57:00.000Z');

  -- HM-3364 | ROSE | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193635762' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3364', '2025-10-11T08:12:00.000Z', '2025-10-11T08:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-10-11T08:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-11T08:12:00.000Z');

  -- HM-3365 | SUHAIL NADIAH MOHAMAD HASSAN E6101 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60102422627' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3365', '2025-10-12T02:56:00.000Z', '2025-10-12T02:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-12T02:56:00.000Z');

  -- HM-3366 | NORSIDAH AHMAD | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193264444' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3366', '2025-10-12T04:23:00.000Z', '2025-10-12T04:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-12T04:23:00.000Z');

  -- HM-3367 | ARTIKAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133545813' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3367', '2025-10-12T04:50:00.000Z', '2025-10-12T04:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-12T04:50:00.000Z');

  -- HM-3368 | NURUL HIDAYAH NAZREE E6749 | RM330
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60192477339' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 330, 80, 330, 'qr', 'completed', 'Zobaze HM-3368', '2025-10-12T05:30:00.000Z', '2025-10-12T05:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-10-12T05:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 1, 260, 260, 260, '2025-10-12T05:30:00.000Z');

  -- HM-3369 | FADHLILAH | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127763436' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3369', '2025-10-12T05:56:00.000Z', '2025-10-12T05:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-12T05:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2025-10-12T05:56:00.000Z');

  -- HM-3370 | MARLINA E3168 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126265850' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3370', '2025-10-12T07:09:00.000Z', '2025-10-12T07:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-12T07:09:00.000Z');

  -- HM-3371 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3371', '2025-10-12T08:14:00.000Z', '2025-10-12T08:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-12T08:14:00.000Z');

  -- HM-3372 | Husna | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601115420502' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3372', '2025-10-12T08:29:00.000Z', '2025-10-12T08:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-12T08:29:00.000Z');

  -- HM-3373 | FARRAH QHAIRUNIZA E6751 | RM350
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172509663' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 350, 0, 350, 'qr', 'completed', 'Zobaze HM-3373', '2025-10-12T08:37:00.000Z', '2025-10-12T08:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 250, 250, 250, '2025-10-12T08:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-10-12T08:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-12T08:37:00.000Z');

  -- HM-3374 | NORAZIZAN MD SAID E2995 | RM140
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196669103' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 140, 0, 140, 'qr', 'completed', 'Zobaze HM-3374', '2025-10-12T09:00:00.000Z', '2025-10-12T09:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-10-12T09:00:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Medium)' LIMIT 1), gen_random_uuid()), 'Henna (Medium)', 1, 70, 70, 70, '2025-10-12T09:00:00.000Z');

  -- HM-3375 | NURFAZRINA MOHD ZAMRI E6433 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60146382010' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-3375', '2025-10-12T09:22:00.000Z', '2025-10-12T09:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-12T09:22:00.000Z');

  -- HM-3376 | JUNI HARISSA ABDUL HAFIZ E3227 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601126739269' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3376', '2025-10-12T09:46:00.000Z', '2025-10-12T09:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-12T09:46:00.000Z');

  -- HM-3377 | AZIA NURYASMIN A BUSHNAL AZ E6441 | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60169070637' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3377', '2025-10-12T10:05:00.000Z', '2025-10-12T10:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-10-12T10:05:00.000Z');

  -- HM-3378 | NOR HAYATI ISMAIL E6750 | RM610
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117507266' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 610, 0, 610, 'card', 'completed', 'Zobaze HM-3378', '2025-10-12T10:17:00.000Z', '2025-10-12T10:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Color + Scalp & Hair Treatment + Haircut', 1, 610, 610, 610, '2025-10-12T10:17:00.000Z');

  -- HM-3379 | SITI NUR ARINA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197140610' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3379', '2025-10-13T03:15:00.000Z', '2025-10-13T03:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-13T03:15:00.000Z');

  -- HM-3380 | NURSHILA E6752 | RM290
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60164610150' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 290, 0, 290, 'cash', 'completed', 'Zobaze HM-3380', '2025-10-13T09:19:00.000Z', '2025-10-13T09:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-13T09:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 1, 260, 260, 260, '2025-10-13T09:19:00.000Z');

  -- HM-3381 | EIZZAH AQILAH E6472 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137780451' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3381', '2025-10-13T09:21:00.000Z', '2025-10-13T09:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-10-13T09:21:00.000Z');

  -- HM-3382 | ST KHOTIMAH E6735 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601169919391' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3382', '2025-10-14T05:17:00.000Z', '2025-10-14T05:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-14T05:17:00.000Z');

  -- HM-3383 | ST KHOTIMAH E6735 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601169919391' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3383', '2025-10-14T05:17:00.000Z', '2025-10-14T05:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-14T05:17:00.000Z');

  -- HM-3384 | MASAYU MOHD NOAH E2526 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126504954' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3384', '2025-10-14T06:43:00.000Z', '2025-10-14T06:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-14T06:43:00.000Z');

  -- HM-3385 | AZIA NURYASMIN A BUSHNAL AZ E6441 | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60169070637' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3385', '2025-10-14T08:24:00.000Z', '2025-10-14T08:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-10-14T08:24:00.000Z');

  -- HM-3386 | NUR AMIRA NAZURAH NOR AZMI E6754 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601123097505' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'cash', 'completed', 'Zobaze HM-3386', '2025-10-16T04:15:00.000Z', '2025-10-16T04:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-16T04:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-16T04:15:00.000Z');

  -- HM-3387 | NOR ZAMIRATUL AZWA E6430 | RM38
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123719065' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 38, 0, 38, 'qr', 'completed', 'Zobaze HM-3387', '2025-10-16T04:42:00.000Z', '2025-10-16T04:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2025-10-16T04:42:00.000Z');

  -- HM-3388 | NURUL ELYANNE E6755 | RM229
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177725157' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 229, 0, 229, 'cash', 'completed', 'Zobaze HM-3388', '2025-10-16T04:52:00.000Z', '2025-10-16T04:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-10-16T04:52:00.000Z');

  -- HM-3389 | NURSHAIDATUL HIDAYAH MOHD NOR E1499 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60179611587' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3389', '2025-10-16T05:44:00.000Z', '2025-10-16T05:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-16T05:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-16T05:44:00.000Z');

  -- HM-3390 | NADIA ADIBAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601116202301' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3390', '2025-10-16T06:44:00.000Z', '2025-10-16T06:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-16T06:44:00.000Z');

  -- HM-3391 | RUHAIDA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137720241' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3391', '2025-10-16T09:04:00.000Z', '2025-10-16T09:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-16T09:04:00.000Z');

  -- HM-3392 | AEMI ABDUL KEYON E0475 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125973261' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3392', '2025-10-17T02:10:00.000Z', '2025-10-17T02:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-17T02:10:00.000Z');

  -- HM-3393 |  | RM50
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3393', '2025-10-17T04:04:00.000Z', '2025-10-17T04:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-10-17T04:04:00.000Z');

  -- HM-3394 |  | RM79
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 79, 0, 79, 'qr', 'completed', 'Zobaze HM-3394', '2025-10-17T06:24:00.000Z', '2025-10-17T06:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-17T06:24:00.000Z');

  -- HM-3395 | RUHAIDAH ABD RAHMAN E2075 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137534357' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3395', '2025-10-17T06:31:00.000Z', '2025-10-17T06:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-17T06:31:00.000Z');

  -- HM-3396 | DURAR HUMAIRA E3005 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196164421' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3396', '2025-10-17T07:04:00.000Z', '2025-10-17T07:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-17T07:04:00.000Z');

  -- HM-3397 | NUR HANINI HAMID E5152 | RM155
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60107050464' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 155, 0, 155, 'qr', 'completed', 'Zobaze HM-3397', '2025-10-17T07:18:00.000Z', '2025-10-17T07:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (1 hour)', 1, 110, 110, 110, '2025-10-17T07:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-10-17T07:18:00.000Z');

  -- HM-3398 | NUR LIYANA AMIR E6396 | RM250
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133677335' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 250, 0, 250, 'qr', 'completed', 'Zobaze HM-3398', '2025-10-17T08:53:00.000Z', '2025-10-17T08:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-10-17T08:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-17T08:53:00.000Z');

  -- HM-3399 | PERA MARSAL | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60149848979' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-3399', '2025-10-17T09:52:00.000Z', '2025-10-17T09:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-10-17T09:52:00.000Z');

  -- HM-3400 | NURUL AKMA NASRI E4888 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137282882' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-3400', '2025-10-17T09:57:00.000Z', '2025-10-17T09:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-10-17T09:57:00.000Z');

  -- HM-3401 | BIHA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132380290' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3401', '2025-10-18T02:43:00.000Z', '2025-10-18T02:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-18T02:43:00.000Z');

  -- HM-3402 | NOR HAYATI ISMAIL E6750 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117507266' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-3402', '2025-10-18T03:20:00.000Z', '2025-10-18T03:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-10-18T03:20:00.000Z');

  -- HM-3403 | AIDA AZMAN E5768 | RM290
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142756804' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 290, 0, 290, 'cash', 'completed', 'Zobaze HM-3403', '2025-10-18T03:39:00.000Z', '2025-10-18T03:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-10-18T03:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 70, 70, 70, '2025-10-18T03:39:00.000Z');

  -- HM-3404 |  | RM45
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3404', '2025-10-18T09:17:00.000Z', '2025-10-18T09:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-10-18T09:17:00.000Z');

  -- HM-3405 | ELLA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193450422' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3405', '2025-10-18T09:47:00.000Z', '2025-10-18T09:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-10-18T09:47:00.000Z');

  -- HM-3406 | NURERDINA | RM370
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167060913' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 370, 0, 370, 'qr', 'completed', 'Zobaze HM-3406', '2025-10-18T10:01:00.000Z', '2025-10-18T10:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Scalp & Hair Treatment + Haircut', 1, 370, 370, 370, '2025-10-18T10:01:00.000Z');

  -- HM-3407 | ANILA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137764551' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3407', '2025-10-18T10:28:00.000Z', '2025-10-18T10:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-10-18T10:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-10-18T10:28:00.000Z');

  -- HM-3408 | RYINA SAFINA E6756 | RM550
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60145618263' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 550, 0, 550, 'qr', 'completed', 'Zobaze HM-3408', '2025-10-18T10:31:00.000Z', '2025-10-18T10:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Color + Scalp & Hair Treatment + Haircut', 1, 550, 550, 550, '2025-10-18T10:31:00.000Z');

END $$;

-- Batch 3/4
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3409 | SALIZA MD SALLEH E6757 | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137992332' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'card', 'completed', 'Zobaze HM-3409', '2025-10-19T03:04:00.000Z', '2025-10-19T03:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-19T03:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-10-19T03:04:00.000Z');

  -- HM-3410 | NORASIKIN E5826 | RM639
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60194880249' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 639, 0, 639, 'card', 'completed', 'Zobaze HM-3410', '2025-10-19T06:40:00.000Z', '2025-10-19T06:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-19T06:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 2, 80, 80, 160, '2025-10-19T06:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-10-19T06:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-19T06:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 2, 150, 150, 300, '2025-10-19T06:40:00.000Z');

  -- HM-3411 | NUR RAIHANA JAMADI E0445 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133076930' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3411', '2025-10-19T07:35:00.000Z', '2025-10-19T07:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-10-19T07:35:00.000Z');

  -- HM-3412 | NURUL FARAH HIDAYAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60146637506' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3412', '2025-10-19T08:29:00.000Z', '2025-10-19T08:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-19T08:29:00.000Z');

  -- HM-3413 | SHIMA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197884720' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3413', '2025-10-19T08:58:00.000Z', '2025-10-19T08:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-19T08:58:00.000Z');

  -- HM-3414 | WAN AISYAH | RM18
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196174458' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 18, 0, 18, 'card', 'completed', 'Zobaze HM-3414', '2025-10-19T09:15:00.000Z', '2025-10-19T09:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), gen_random_uuid()), 'HAIRCUT TEENAGER', 1, 18, 18, 18, '2025-10-19T09:15:00.000Z');

  -- HM-3415 | HAIRUNNISA ALIMUN E6759 | RM429
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137629994' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 429, 0, 429, 'card', 'completed', 'Zobaze HM-3415', '2025-10-19T09:55:00.000Z', '2025-10-19T09:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-19T09:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-19T09:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-19T09:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 260, 260, 260, '2025-10-19T09:55:00.000Z');

  -- HM-3416 | FARHAN AHMAD AFANDI E6758 | RM779
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601114419155' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 779, 0, 779, 'cash', 'completed', 'Zobaze HM-3416', '2025-10-19T10:34:00.000Z', '2025-10-19T10:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-19T10:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-19T10:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Color + Scalp & Hair Treatment + Haircut', 1, 610, 610, 610, '2025-10-19T10:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-19T10:34:00.000Z');

  -- HM-3417 | ADIBAH AISHAH E2441 | RM95
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 95, 0, 95, 'qr', 'completed', 'Zobaze HM-3417', '2025-10-20T04:06:00.000Z', '2025-10-20T04:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2025-10-20T04:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-10-20T04:06:00.000Z');

  -- HM-3418 | ELLA E6761 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193450422' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'card', 'completed', 'Zobaze HM-3418', '2025-10-20T04:55:00.000Z', '2025-10-20T04:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 70, 70, 70, '2025-10-20T04:55:00.000Z');

  -- HM-3419 | Haziqah Saruan | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137868070' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-3419', '2025-10-20T04:56:00.000Z', '2025-10-20T04:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-10-20T04:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-20T04:56:00.000Z');

  -- HM-3420 | SHAHIRAH AZMAN E6760 | RM350
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127032427' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 350, 0, 350, 'transfer', 'completed', 'Zobaze HM-3420', '2025-10-20T05:16:00.000Z', '2025-10-20T05:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-20T05:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-20T05:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 260, 260, 260, '2025-10-20T05:16:00.000Z');

  -- HM-3421 | NORAINI IBRAHIM E0219 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197060642' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3421', '2025-10-20T05:43:00.000Z', '2025-10-20T05:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-20T05:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2025-10-20T05:43:00.000Z');

  -- HM-3422 | Shuhada | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199387079' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3422', '2025-10-20T05:44:00.000Z', '2025-10-20T05:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-20T05:44:00.000Z');

  -- HM-3423 |  | RM80
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3423', '2025-10-20T06:50:00.000Z', '2025-10-20T06:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-10-20T06:50:00.000Z');

  -- HM-3424 | NURUL HAFIZAH SAHID E6214 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127763616' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3424', '2025-10-20T07:50:00.000Z', '2025-10-20T07:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-20T07:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-10-20T07:50:00.000Z');

  -- HM-3425 | NURUL KHAIRIAH E2054 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117528806' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3425', '2025-10-20T09:46:00.000Z', '2025-10-20T09:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-20T09:46:00.000Z');

  -- HM-3426 | HUSNA OSMAN E6469 | RM950
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167828624' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 950, 0, 950, 'card', 'completed', 'Zobaze HM-3426', '2025-10-20T09:52:00.000Z', '2025-10-20T09:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 3, 10, 10, 30, '2025-10-20T09:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-10-20T09:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-10-20T09:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 3, 30, 30, 90, '2025-10-20T09:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Hair / Scalp Treatment + Haircut', 1, 300, 300, 300, '2025-10-20T09:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 2, 150, 150, 300, '2025-10-20T09:52:00.000Z');

  -- HM-3427 | SANIAH | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60135333686' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'cash', 'completed', 'Zobaze HM-3427', '2025-10-20T10:19:00.000Z', '2025-10-20T10:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-10-20T10:19:00.000Z');

  -- HM-3428 | RAZANA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137679698' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3428', '2025-10-21T02:02:00.000Z', '2025-10-21T02:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-21T02:02:00.000Z');

  -- HM-3429 | EZETI | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172636719' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3429', '2025-10-21T03:59:00.000Z', '2025-10-21T03:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 2, 75, 75, 150, '2025-10-21T03:59:00.000Z');

  -- HM-3430 | FAUZIAH E6726 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197013269' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3430', '2025-10-21T04:56:00.000Z', '2025-10-21T04:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-21T04:56:00.000Z');

  -- HM-3431 | NUR IZAYANI | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187776417' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-3431', '2025-10-21T05:25:00.000Z', '2025-10-21T05:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-21T05:25:00.000Z');

  -- HM-3432 |  | RM85
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-3432', '2025-10-21T07:37:00.000Z', '2025-10-21T07:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-10-21T07:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-21T07:37:00.000Z');

  -- HM-3433 | KHAIRUN NISA HARIS E0804 | RM375
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60128007668' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 375, 0, 375, 'qr', 'completed', 'Zobaze HM-3433', '2025-10-21T08:37:00.000Z', '2025-10-21T08:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Bleaching (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Bleaching (Short)' LIMIT 1), gen_random_uuid()), 'Bleaching (Short)', 1, 100, 100, 100, '2025-10-21T08:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2025-10-21T08:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 30, 30, 30, '2025-10-21T08:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-21T08:37:00.000Z');

  -- HM-3434 | HAZIRAH | RM102
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60166661912' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 102, 0, 102, 'qr', 'completed', 'Zobaze HM-3434', '2025-10-21T08:46:00.000Z', '2025-10-21T08:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-21T08:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-21T08:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'TRIAL MASQUE' LIMIT 1), (SELECT id FROM products WHERE name = 'TRIAL MASQUE' LIMIT 1), gen_random_uuid()), 'TRIAL MASQUE', 1, 22, 22, 22, '2025-10-21T08:46:00.000Z');

  -- HM-3435 | NORELYZA HUSSEIN E6763 | RM358
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127383546' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 358, 0, 358, 'qr', 'completed', 'Zobaze HM-3435', '2025-10-21T09:04:00.000Z', '2025-10-21T09:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-21T09:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-21T09:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-10-21T09:04:00.000Z');

  -- HM-3436 | MARIA AB HAMID E0205 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172203251' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3436', '2025-10-21T09:11:00.000Z', '2025-10-21T09:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-10-21T09:11:00.000Z');

  -- HM-3437 | NUR ATHIRAH AB FATAH E6762 | RM400
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60145187013' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 400, 0, 400, 'card', 'completed', 'Zobaze HM-3437', '2025-10-21T10:16:00.000Z', '2025-10-21T10:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-21T10:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-21T10:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Long)' LIMIT 1), gen_random_uuid()), 'Henna (Long)', 1, 80, 80, 80, '2025-10-21T10:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Medium)' LIMIT 1), gen_random_uuid()), 'Korean (Medium)', 1, 250, 250, 250, '2025-10-21T10:16:00.000Z');

  -- HM-3438 | SITI ZAKIAH MARHAD E5374 | RM390
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601139606991' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 390, 0, 390, 'cash', 'completed', 'Zobaze HM-3438', '2025-10-23T05:15:00.000Z', '2025-10-23T05:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-10-23T05:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-10-23T05:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 260, 260, 260, '2025-10-23T05:15:00.000Z');

  -- HM-3439 | HAFIZAH MOHD ALI E6374 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137447180' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3439', '2025-10-23T08:10:00.000Z', '2025-10-23T08:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-23T08:10:00.000Z');

  -- HM-3440 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3440', '2025-10-23T08:10:00.000Z', '2025-10-23T08:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-23T08:10:00.000Z');

  -- HM-3441 | FATIN IZZATY MOHD HANAFFI E6121 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137022169' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3441', '2025-10-23T08:29:00.000Z', '2025-10-23T08:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-23T08:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-10-23T08:29:00.000Z');

  -- HM-3442 | NUR ATHIRAH JAMADI | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111991362' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-3442', '2025-10-24T04:11:00.000Z', '2025-10-24T04:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-10-24T04:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-24T04:11:00.000Z');

  -- HM-3443 | NURIYANA SHARIFF E6764 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189594076' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3443', '2025-10-24T05:05:00.000Z', '2025-10-24T05:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-24T05:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-24T05:05:00.000Z');

  -- HM-3444 | DARLIANA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137868838' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3444', '2025-10-24T05:10:00.000Z', '2025-10-24T05:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-24T05:10:00.000Z');

  -- HM-3445 | ANUM | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197700521' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-3445', '2025-10-24T05:35:00.000Z', '2025-10-24T05:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-24T05:35:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-24T05:35:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-10-24T05:35:00.000Z');

  -- HM-3446 | syima | RM198
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127495501' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 198, 0, 198, 'qr', 'completed', 'Zobaze HM-3446', '2025-10-24T09:06:00.000Z', '2025-10-24T09:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-24T09:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-10-24T09:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-24T09:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 8, 8, 8, '2025-10-24T09:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-10-24T09:06:00.000Z');

  -- HM-3447 | NUR AMALINA ABD RASID E6765 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601155418022' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3447', '2025-10-25T02:27:00.000Z', '2025-10-25T02:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-25T02:27:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-25T02:27:00.000Z');

  -- HM-3448 | WAN NOORAIN E6766 | RM234
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60166415446' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 234, 0, 234, 'card', 'completed', 'Zobaze HM-3448', '2025-10-25T03:29:00.000Z', '2025-10-25T03:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-25T03:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-10-25T03:29:00.000Z');

  -- HM-3449 | ANGGRAINI PERTIWI E6707 | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601121739850' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'cash', 'completed', 'Zobaze HM-3449', '2025-10-25T03:33:00.000Z', '2025-10-25T03:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-10-25T03:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-25T03:33:00.000Z');

  -- HM-3450 | NAIDA RINA MAHMUD E6403 | RM120
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137787083' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'qr', 'completed', 'Zobaze HM-3450', '2025-10-25T04:23:00.000Z', '2025-10-25T04:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-10-25T04:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-10-25T04:23:00.000Z');

  -- HM-3451 | NURUL HUDA RAZALI E6767 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60173284346' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3451', '2025-10-25T04:31:00.000Z', '2025-10-25T04:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-10-25T04:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-25T04:31:00.000Z');

  -- HM-3452 | MARINA MUKHTAR E6769 | RM168
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123783286' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 168, 0, 168, 'qr', 'completed', 'Zobaze HM-3452', '2025-10-25T07:05:00.000Z', '2025-10-25T07:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), gen_random_uuid()), 'HAIRCUT TEENAGER', 1, 18, 18, 18, '2025-10-25T07:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-25T07:05:00.000Z');

  -- HM-3453 | SARIMAH AHMAD E1135 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137302166' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3453', '2025-10-25T07:23:00.000Z', '2025-10-25T07:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-25T07:23:00.000Z');

  -- HM-3454 | HALIMATUL | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111022566' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3454', '2025-10-25T07:49:00.000Z', '2025-10-25T07:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-10-25T07:49:00.000Z');

  -- HM-3455 | NURUL FARAH HIDAYAH E6768 | RM500
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60146637506' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 500, 0, 500, 'qr', 'completed', 'Zobaze HM-3455', '2025-10-25T08:16:00.000Z', '2025-10-25T08:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-10-25T08:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 80, 80, 80, '2025-10-25T08:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Medium)' LIMIT 1), gen_random_uuid()), 'Korean (Medium)', 1, 200, 200, 200, '2025-10-25T08:16:00.000Z');

  -- HM-3456 |  | RM60
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'card', 'completed', 'Zobaze HM-3456', '2025-10-25T08:51:00.000Z', '2025-10-25T08:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-10-25T08:51:00.000Z');

  -- HM-3457 | NORAZLINA | RM209
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197595957' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 209, 0, 209, 'card', 'completed', 'Zobaze HM-3457', '2025-10-25T09:27:00.000Z', '2025-10-25T09:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-10-25T09:27:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-10-25T09:27:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-10-25T09:27:00.000Z');

  -- HM-3458 | ZAHIDAH | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601114792399' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'cash', 'completed', 'Zobaze HM-3458', '2025-10-25T09:54:00.000Z', '2025-10-25T09:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 2, 75, 75, 150, '2025-10-25T09:54:00.000Z');

END $$;

-- Batch 4/4
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3459 | FARAH WAHEEDA ISMAIL | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111786188' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3459', '2025-10-26T03:54:00.000Z', '2025-10-26T03:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-26T03:54:00.000Z');

  -- HM-3460 | NOR AZLIN HALIB E6770 | RM305
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60122550080' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 305, 0, 305, 'qr', 'completed', 'Zobaze HM-3460', '2025-10-26T04:44:00.000Z', '2025-10-26T04:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-26T04:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 2, 150, 150, 300, '2025-10-26T04:44:00.000Z');

  -- HM-3461 | NURAMIRA ADIYANA E6771 | RM260
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125225423' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 260, 0, 260, 'card', 'completed', 'Zobaze HM-3461', '2025-10-26T07:08:00.000Z', '2025-10-26T07:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-26T07:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-26T07:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-26T07:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-26T07:08:00.000Z');

  -- HM-3462 | NUR RAIHANA JAMADI E0445 | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133076930' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'qr', 'completed', 'Zobaze HM-3462', '2025-10-26T07:16:00.000Z', '2025-10-26T07:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-10-26T07:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 50, 50, 50, '2025-10-26T07:16:00.000Z');

  -- HM-3463 | SITI AISHAH ABDUL HAMID E0086 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197917133' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3463', '2025-10-26T08:01:00.000Z', '2025-10-26T08:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-10-26T08:01:00.000Z');

  -- HM-3464 | ZURINA ROSMANI E4369 | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133631974' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3464', '2025-10-26T09:13:00.000Z', '2025-10-26T09:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-26T09:13:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-26T09:13:00.000Z');

  -- HM-3465 | SAPURA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60147734080' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3465', '2025-10-26T09:49:00.000Z', '2025-10-26T09:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-10-26T09:49:00.000Z');

  -- HM-3466 | ZAITUL MARLIZAWATI ZAINUDDIN E1411 | RM105
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126240025' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'qr', 'completed', 'Zobaze HM-3466', '2025-10-26T10:07:00.000Z', '2025-10-26T10:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-26T10:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-10-26T10:07:00.000Z');

  -- HM-3467 | NUREEN SYAFIQAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189797616' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3467', '2025-10-26T10:17:00.000Z', '2025-10-26T10:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-10-26T10:17:00.000Z');

  -- HM-3468 | RINA RUHAIZAH ABDUL KADIR E6415 | RM260
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60111114374' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 260, 0, 260, 'card', 'completed', 'Zobaze HM-3468', '2025-10-27T03:42:00.000Z', '2025-10-27T03:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 80, 80, 80, '2025-10-27T03:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-27T03:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-27T03:42:00.000Z');

  -- HM-3469 | HASLINDA YUSOF E6772 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127309578' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3469', '2025-10-27T06:38:00.000Z', '2025-10-27T06:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-10-27T06:38:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-27T06:38:00.000Z');

  -- HM-3470 | NAZILA | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176006879' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'card', 'completed', 'Zobaze HM-3470', '2025-10-27T07:05:00.000Z', '2025-10-27T07:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-27T07:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-10-27T07:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-27T07:05:00.000Z');

  -- HM-3471 | SITI AISAH BINTI A RAHIM | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137087695' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3471', '2025-10-27T08:10:00.000Z', '2025-10-27T08:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-27T08:10:00.000Z');

  -- HM-3472 | MUHAMMAD FAIZAL | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111739653' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3472', '2025-10-27T09:11:00.000Z', '2025-10-27T09:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-27T09:11:00.000Z');

  -- HM-3473 | ZAFIRAH | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60136544395' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-3473', '2025-10-27T09:39:00.000Z', '2025-10-27T09:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-27T09:39:00.000Z');

  -- HM-3474 | NUR HIDAYAH HAMDAN E6773 | RM200
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123678078' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 200, 0, 200, 'card', 'completed', 'Zobaze HM-3474', '2025-10-28T03:52:00.000Z', '2025-10-28T03:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-10-28T03:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-28T03:52:00.000Z');

  -- HM-3475 | ALIAH HAZIQAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137593142' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3475', '2025-10-28T08:45:00.000Z', '2025-10-28T08:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-28T08:45:00.000Z');

  -- HM-3476 | SARAH | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601127395400' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3476', '2025-10-28T09:12:00.000Z', '2025-10-28T09:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-10-28T09:12:00.000Z');

  -- HM-3477 | SURYANI OTHMAN E6774 | RM300
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137764129' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 300, 0, 300, 'card', 'completed', 'Zobaze HM-3477', '2025-10-30T04:36:00.000Z', '2025-10-30T04:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-10-30T04:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-30T04:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 1, 260, 260, 260, '2025-10-30T04:36:00.000Z');

  -- HM-3478 | NORAZIEAN AHMAD | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177466374' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3478', '2025-10-30T06:10:00.000Z', '2025-10-30T06:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-30T06:10:00.000Z');

  -- HM-3479 | SITI HAJAR MOHAMAD | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137779770' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3479', '2025-10-30T06:11:00.000Z', '2025-10-30T06:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-30T06:11:00.000Z');

  -- HM-3480 | EMY AQILAH E6775 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60147744352' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3480', '2025-10-30T07:21:00.000Z', '2025-10-30T07:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-30T07:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-30T07:21:00.000Z');

  -- HM-3481 | AYU NAJIHA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60143087879' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-3481', '2025-10-30T07:34:00.000Z', '2025-10-30T07:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-10-30T07:34:00.000Z');

  -- HM-3482 | EIZZAH AQILAH E6472 | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137780451' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'card', 'completed', 'Zobaze HM-3482', '2025-10-30T08:26:00.000Z', '2025-10-30T08:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-10-30T08:26:00.000Z');

  -- HM-3483 | HASLINDA YUSOF E6772 | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127309578' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'qr', 'completed', 'Zobaze HM-3483', '2025-10-31T03:16:00.000Z', '2025-10-31T03:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment Kids' LIMIT 1), gen_random_uuid()), 'Hair Treatment Kids', 1, 90, 90, 90, '2025-10-31T03:16:00.000Z');

  -- HM-3484 | ANIS AMIRA AFANDI | RM59
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60166885001' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 59, 0, 59, 'qr', 'completed', 'Zobaze HM-3484', '2025-10-31T04:18:00.000Z', '2025-10-31T04:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Eyelash Perming' LIMIT 1), (SELECT id FROM products WHERE name = 'Eyelash Perming' LIMIT 1), gen_random_uuid()), 'Eyelash Perming', 1, 59, 59, 59, '2025-10-31T04:18:00.000Z');

  -- HM-3485 | ROHAIZA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197065744' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3485', '2025-10-31T05:24:00.000Z', '2025-10-31T05:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-31T05:24:00.000Z');

  -- HM-3486 | MADIHAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137783205' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3486', '2025-10-31T05:34:00.000Z', '2025-10-31T05:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-31T05:34:00.000Z');

  -- HM-3487 | NOORWAHIDAH ANNERIZA BAKARUDDIN E6223 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60109080998' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3487', '2025-10-31T06:22:00.000Z', '2025-10-31T06:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-31T06:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-10-31T06:22:00.000Z');

  -- HM-3488 | INTAN | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177608081' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3488', '2025-10-31T06:54:00.000Z', '2025-10-31T06:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-10-31T06:54:00.000Z');

END $$;
