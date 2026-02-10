-- ============================================
-- HMS Salon - Sales Import: 01-JAN-2025
-- Receipts: 31 | Items: 41 | Revenue: RM 4,558
-- Generated: 2026-02-09
-- ============================================

-- Run AFTER import-zobaze-data.sql (customers must exist)

-- Batch 1/1
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- SM-1829 |  | RM67
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 67, 0, 67, 'cash', 'completed', 'Zobaze SM-1829', '2025-01-02T04:51:00.000Z', '2025-01-02T04:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash', 1, 67, 67, 67, '2025-01-02T04:51:00.000Z');

  -- SM-1830 | ROSMAWATI SALHA E6455 | RM188
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197777731' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 188, 12, 188, 'cash', 'completed', 'Zobaze SM-1830', '2025-01-02T05:06:00.000Z', '2025-01-02T05:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 80, 80, 80, '2025-01-02T05:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-01-02T05:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash', 1, 70, 70, 70, '2025-01-02T05:06:00.000Z');

  -- SM-1831 | FATIN IZZATY MOHD HANAFFI E6121 | RM261
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137022169' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 261, 29, 261, 'qr', 'completed', 'Zobaze SM-1831', '2025-01-02T05:22:00.000Z', '2025-01-02T05:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'JAPANASE REBONDING LONG' LIMIT 1), (SELECT id FROM products WHERE name = 'JAPANASE REBONDING LONG' LIMIT 1), gen_random_uuid()), 'JAPANASE REBONDING LONG', 1, 290, 290, 290, '2025-01-02T05:22:00.000Z');

  -- SM-1832 | SARAH HAMIZAH ZAINAL ABIDIN E2012 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137498252' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze SM-1832', '2025-01-02T05:25:00.000Z', '2025-01-02T05:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 45, 45, 45, '2025-01-02T05:25:00.000Z');

  -- HM-1836 | NORSYAMILA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601139859165' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-1836', '2025-01-13T05:20:00.000Z', '2025-01-13T05:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-01-13T05:20:00.000Z');

  -- HM-1837 | ZAHURAH MAHMUD E6467 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197253770' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'cash', 'completed', 'Zobaze HM-1837', '2025-01-13T06:14:00.000Z', '2025-01-13T06:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), (SELECT id FROM products WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), gen_random_uuid()), 'PREMIUM SCALP TREATMENT', 1, 199, 199, 199, '2025-01-13T06:14:00.000Z');

  -- HM-1838 | NUR NAJIBAH ROZAMI E6468 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177917051' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'cash', 'completed', 'Zobaze HM-1838', '2025-01-13T06:14:00.000Z', '2025-01-13T06:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), (SELECT id FROM products WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), gen_random_uuid()), 'PREMIUM SCALP TREATMENT', 1, 199, 199, 199, '2025-01-13T06:14:00.000Z');

  -- HM-1839 | AMINAH AHMAD E3327 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6093678734' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-1839', '2025-01-13T08:48:00.000Z', '2025-01-13T08:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-01-13T08:48:00.000Z');

  -- HM-1840 | NANY HASMANIWATY AHLED E6235 | RM200
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197518795' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 200, 0, 200, 'qr', 'completed', 'Zobaze HM-1840', '2025-01-14T04:36:00.000Z', '2025-01-14T04:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold9 Hair Loss Shampoo 400ml' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold9 Hair Loss Shampoo 400ml' LIMIT 1), gen_random_uuid()), 'Gold9 Hair Loss Shampoo 400ml', 2, 50, 50, 100, '2025-01-14T04:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold9 Moisture Shampoo 400ml' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold9 Moisture Shampoo 400ml' LIMIT 1), gen_random_uuid()), 'Gold9 Moisture Shampoo 400ml', 2, 50, 50, 100, '2025-01-14T04:36:00.000Z');

  -- HM-1841 | SITI AISHAH ABDUL HAMID E0086 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197917133' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-1841', '2025-01-14T04:38:00.000Z', '2025-01-14T04:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (S/M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (S/M)' LIMIT 1), gen_random_uuid()), 'Henna (S/M)', 1, 60, 60, 60, '2025-01-14T04:38:00.000Z');

  -- HM-1842 | KAWTSAR | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111919614' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-1842', '2025-01-14T06:04:00.000Z', '2025-01-14T06:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut 5-9 Y/o' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut 5-9 Y/o' LIMIT 1), gen_random_uuid()), 'Haircut 5-9 Y/o', 3, 15, 15, 45, '2025-01-14T06:04:00.000Z');

  -- HM-1843 | ROHANI | RM67
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126041401' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 67, 0, 67, 'qr', 'completed', 'Zobaze HM-1843', '2025-01-14T11:06:00.000Z', '2025-01-14T11:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash', 1, 67, 67, 67, '2025-01-14T11:06:00.000Z');

  -- HM-1844 |  | RM40
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'cash', 'completed', 'Zobaze HM-1844', '2025-01-14T11:36:00.000Z', '2025-01-14T11:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 40, 40, 40, '2025-01-14T11:36:00.000Z');

  -- HM-1845 |  | RM63
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 63, 0, 63, 'cash', 'completed', 'Zobaze HM-1845', '2025-01-14T11:39:00.000Z', '2025-01-14T11:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash', 1, 63, 63, 63, '2025-01-14T11:39:00.000Z');

  -- HM-1846 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-1846', '2025-01-14T11:39:00.000Z', '2025-01-14T11:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-01-14T11:39:00.000Z');

  -- HM-1847 | NADIA SHAIRA SHAH E6470 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197727572' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'cash', 'completed', 'Zobaze HM-1847', '2025-01-14T11:39:00.000Z', '2025-01-14T11:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Hair Treatment/ Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Hair Treatment/ Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Hair Treatment/ Scalp Treatment + Haircut', 1, 280, 280, 280, '2025-01-14T11:39:00.000Z');

  -- HM-1848 | NADIA SHAIRA SHAH E6470 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197727572' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'qr', 'completed', 'Zobaze HM-1848', '2025-01-14T11:40:00.000Z', '2025-01-14T11:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut Package' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut Package' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut Package', 1, 280, 280, 280, '2025-01-14T11:40:00.000Z');

  -- HM-1849 |  | RM40
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'cash', 'completed', 'Zobaze HM-1849', '2025-01-15T09:49:00.000Z', '2025-01-15T09:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 40, 40, 40, '2025-01-15T09:49:00.000Z');

  -- HM-1850 | AZNAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111779796' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-1850', '2025-01-16T05:37:00.000Z', '2025-01-16T05:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-01-16T05:37:00.000Z');

  -- HM-1851 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-1851', '2025-01-16T09:13:00.000Z', '2025-01-16T09:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-01-16T09:13:00.000Z');

  -- HM-1852 |  | RM15
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-1852', '2025-01-16T09:55:00.000Z', '2025-01-16T09:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut 5-9 Y/o' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut 5-9 Y/o' LIMIT 1), gen_random_uuid()), 'Haircut 5-9 Y/o', 1, 15, 15, 15, '2025-01-16T09:55:00.000Z');

  -- HM-1853 | EIZZAH AQILAH E6472 | RM269
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137780451' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 269, 0, 269, 'qr', 'completed', 'Zobaze HM-1853', '2025-01-17T05:00:00.000Z', '2025-01-17T05:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-01-17T05:00:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), (SELECT id FROM products WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), gen_random_uuid()), 'PREMIUM SCALP TREATMENT', 1, 199, 199, 199, '2025-01-17T05:00:00.000Z');

  -- HM-1854 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-1854', '2025-01-17T05:20:00.000Z', '2025-01-17T05:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-01-17T05:20:00.000Z');

  -- HM-1855 | NURUL SYAHIRAH RUDIAN E6473 | RM269
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60145012873' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 269, 0, 269, 'qr', 'completed', 'Zobaze HM-1855', '2025-01-17T06:47:00.000Z', '2025-01-17T06:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-01-17T06:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), (SELECT id FROM products WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), gen_random_uuid()), 'PREMIUM SCALP TREATMENT', 1, 199, 199, 199, '2025-01-17T06:47:00.000Z');

  -- HM-1856 | NURUL HAZAA E6474 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60179931393' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'qr', 'completed', 'Zobaze HM-1856', '2025-01-17T09:35:00.000Z', '2025-01-17T09:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), (SELECT id FROM products WHERE name = 'PREMIUM SCALP TREATMENT' LIMIT 1), gen_random_uuid()), 'PREMIUM SCALP TREATMENT', 1, 199, 199, 199, '2025-01-17T09:35:00.000Z');

  -- HM-1857 |  | RM67
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 67, 0, 67, 'qr', 'completed', 'Zobaze HM-1857', '2025-01-19T03:10:00.000Z', '2025-01-19T03:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash', 1, 67, 67, 67, '2025-01-19T03:10:00.000Z');

  -- HM-1858 |  | RM40
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'cash', 'completed', 'Zobaze HM-1858', '2025-01-19T05:00:00.000Z', '2025-01-19T05:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 40, 40, 40, '2025-01-19T05:00:00.000Z');

  -- HM-1859 | SITI SARAH SAFAAI E6481 | RM509
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132115497' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 509, 0, 509, 'qr', 'completed', 'Zobaze HM-1859', '2025-01-23T07:42:00.000Z', '2025-01-23T07:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 380, 380, 380, '2025-01-23T07:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold9 Hair Loss Shampoo 400ml' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold9 Hair Loss Shampoo 400ml' LIMIT 1), gen_random_uuid()), 'Gold9 Hair Loss Shampoo 400ml', 1, 50, 50, 50, '2025-01-23T07:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-01-23T07:42:00.000Z');

  -- HM-1860 | MEERA | RM67
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601133279931' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 67, 0, 67, 'cash', 'completed', 'Zobaze HM-1860', '2025-01-23T09:39:00.000Z', '2025-01-23T09:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 67, 67, 67, '2025-01-23T09:39:00.000Z');

  -- HM-1861 | MAISITA NUR FADZILAH ABD KADIR E0439 | RM290
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197572456' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 290, 0, 290, 'qr', 'completed', 'Zobaze HM-1861', '2025-01-25T07:30:00.000Z', '2025-01-25T07:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Hair / Scalp Treatment + Haircut', 1, 290, 290, 290, '2025-01-25T07:30:00.000Z');

  -- HM-1862 | MUNIRA SHAHIDAH AHMAD SAYUTY E2405 | RM619
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177021874' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 619, 0, 619, 'qr', 'completed', 'Zobaze HM-1862', '2025-01-27T05:54:00.000Z', '2025-01-27T05:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-01-27T05:54:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-01-27T05:54:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese + Hair Treatment & Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese + Hair Treatment & Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Japanese + Hair Treatment & Scalp Treatment + Haircut', 1, 460, 460, 460, '2025-01-27T05:54:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-01-27T05:54:00.000Z');

END $$;
