-- ============================================
-- HMS Salon - Sales Import: 05-MAY-2025
-- Receipts: 222 | Items: 324 | Revenue: RM 25,805
-- Generated: 2026-02-09
-- ============================================

-- Run AFTER import-zobaze-data.sql (customers must exist)

-- Batch 1/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-2341 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2341', '2025-05-01T07:03:00.000Z', '2025-05-01T07:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-01T07:03:00.000Z');

  -- HM-2342 |  | RM165
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 165, 0, 165, 'qr', 'completed', 'Zobaze HM-2342', '2025-05-01T07:04:00.000Z', '2025-05-01T07:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-01T07:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 110, 110, 110, '2025-05-01T07:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-01T07:04:00.000Z');

  -- HM-2343 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2343', '2025-05-01T07:04:00.000Z', '2025-05-01T07:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-01T07:04:00.000Z');

  -- HM-2344 | AZAH GHANI E6573 | RM410
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197779197' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 410, 0, 410, 'qr', 'completed', 'Zobaze HM-2344', '2025-05-01T07:05:00.000Z', '2025-05-01T07:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-01T07:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-05-01T07:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-05-01T07:05:00.000Z');

  -- HM-2345 |  | RM55
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-2345', '2025-05-01T09:08:00.000Z', '2025-05-01T09:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-01T09:08:00.000Z');

  -- HM-2346 |  | RM150
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-2346', '2025-05-01T09:09:00.000Z', '2025-05-01T09:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-05-01T09:09:00.000Z');

  -- HM-2347 |  | RM105
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'qr', 'completed', 'Zobaze HM-2347', '2025-05-01T10:06:00.000Z', '2025-05-01T10:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2025-05-01T10:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-01T10:06:00.000Z');

  -- HM-2348 |  | RM55
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-2348', '2025-05-01T10:48:00.000Z', '2025-05-01T10:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-01T10:48:00.000Z');

  -- HM-2349 | ADIBAH | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187662326' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-2349', '2025-05-02T06:34:00.000Z', '2025-05-02T06:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-02T06:34:00.000Z');

  -- HM-2350 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2350', '2025-05-02T06:34:00.000Z', '2025-05-02T06:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-02T06:34:00.000Z');

  -- HM-2351 | RUZANNA MOHAMED E1652 | RM380
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177080508' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 380, 0, 380, 'cash', 'completed', 'Zobaze HM-2351', '2025-05-02T08:21:00.000Z', '2025-05-02T08:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 380, 380, 380, '2025-05-02T08:21:00.000Z');

  -- HM-2352 | NUR AISHAH IZZATI ZULKIFLI E6539 | RM388
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197717602' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 388, 0, 388, 'card', 'completed', 'Zobaze HM-2352', '2025-05-03T04:58:00.000Z', '2025-05-03T04:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-03T04:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 40, 40, 40, '2025-05-03T04:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-03T04:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-05-03T04:58:00.000Z');

  -- HM-2353 |  | RM108
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 108, 0, 108, 'qr', 'completed', 'Zobaze HM-2353', '2025-05-03T09:17:00.000Z', '2025-05-03T09:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-03T09:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2025-05-03T09:17:00.000Z');

  -- HM-2354 |  | RM143
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 143, 0, 143, 'qr', 'completed', 'Zobaze HM-2354', '2025-05-03T09:20:00.000Z', '2025-05-03T09:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 75, 75, 75, '2025-05-03T09:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2025-05-03T09:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Wash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Wash Kids' LIMIT 1), gen_random_uuid()), 'Wash Kids', 1, 30, 30, 30, '2025-05-03T09:20:00.000Z');

  -- HM-2355 |  | RM15
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-2355', '2025-05-03T09:20:00.000Z', '2025-05-03T09:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-03T09:20:00.000Z');

  -- HM-2356 |  | RM55
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-2356', '2025-05-03T09:20:00.000Z', '2025-05-03T09:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-03T09:20:00.000Z');

  -- HM-2357 |  | RM75
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-2357', '2025-05-03T09:21:00.000Z', '2025-05-03T09:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-03T09:21:00.000Z');

  -- HM-2358 |  | RM55
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-2358', '2025-05-03T09:49:00.000Z', '2025-05-03T09:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-03T09:49:00.000Z');

  -- HM-2359 | NURUL FARHANI AB RAZAK E6574 | RM210
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601115336848' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 210, 0, 210, 'qr', 'completed', 'Zobaze HM-2359', '2025-05-04T02:55:00.000Z', '2025-05-04T02:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-05-04T02:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-04T02:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Wash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Wash Kids' LIMIT 1), gen_random_uuid()), 'Wash Kids', 1, 30, 30, 30, '2025-05-04T02:55:00.000Z');

  -- HM-2360 | ADHASLINAH ABDUL KADIR E3780 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197573137' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-2360', '2025-05-04T03:59:00.000Z', '2025-05-04T03:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-04T03:59:00.000Z');

  -- HM-2361 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2361', '2025-05-04T04:28:00.000Z', '2025-05-04T04:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-04T04:28:00.000Z');

  -- HM-2362 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2362', '2025-05-04T04:53:00.000Z', '2025-05-04T04:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-04T04:53:00.000Z');

  -- HM-2363 | FIQAH | RM120
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197750949' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'qr', 'completed', 'Zobaze HM-2363', '2025-05-04T05:03:00.000Z', '2025-05-04T05:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-04T05:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-04T05:03:00.000Z');

  -- HM-2364 | AIN NAJWA | RM115
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60198386139' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 115, 0, 115, 'qr', 'completed', 'Zobaze HM-2364', '2025-05-04T05:53:00.000Z', '2025-05-04T05:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-04T05:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-04T05:53:00.000Z');

  -- HM-2365 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2365', '2025-05-04T05:54:00.000Z', '2025-05-04T05:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-04T05:54:00.000Z');

  -- HM-2366 |  | RM50
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-2366', '2025-05-04T05:55:00.000Z', '2025-05-04T05:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-04T05:55:00.000Z');

  -- HM-2367 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2367', '2025-05-04T06:05:00.000Z', '2025-05-04T06:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-04T06:05:00.000Z');

  -- HM-2368 | FATIN NOR RAZLIN RABUAN E5755 | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60104377512' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'qr', 'completed', 'Zobaze HM-2368', '2025-05-04T07:14:00.000Z', '2025-05-04T07:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-04T07:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-04T07:14:00.000Z');

  -- HM-2369 | SITI KALSOM | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197924313' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2369', '2025-05-04T08:40:00.000Z', '2025-05-04T08:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-04T08:40:00.000Z');

  -- HM-2370 | ZULIKHA ZAINUL ABIDIN E6453 | RM359
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601136011688' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 359, 0, 359, 'cash', 'completed', 'Zobaze HM-2370', '2025-05-04T08:55:00.000Z', '2025-05-04T08:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2025-05-04T08:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-04T08:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 40, 40, 40, '2025-05-04T08:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-05-04T08:55:00.000Z');

  -- HM-2371 | KAK YATI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60166246798' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2371', '2025-05-04T09:07:00.000Z', '2025-05-04T09:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-04T09:07:00.000Z');

  -- HM-2372 | NUR NATASHA MOHD HAIRIE LIM E6439 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127709239' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-2372', '2025-05-04T09:39:00.000Z', '2025-05-04T09:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-04T09:39:00.000Z');

  -- HM-2373 | NUR HAMIZAH AB RAHIM E6575 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197572893' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-2373', '2025-05-04T10:10:00.000Z', '2025-05-04T10:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-04T10:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-05-04T10:10:00.000Z');

  -- HM-2374 | HASLINDA AHMAD RAHMAN E6576 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177343173' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-2374', '2025-05-05T07:33:00.000Z', '2025-05-05T07:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-05T07:33:00.000Z');

  -- HM-2375 | NUR ZULIKHA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60134414027' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2375', '2025-05-05T07:34:00.000Z', '2025-05-05T07:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-05T07:34:00.000Z');

  -- HM-2376 | HASLINDA AHMAD RAHMAN E6576 | RM250
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177343173' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 250, 0, 250, 'qr', 'completed', 'Zobaze HM-2376', '2025-05-05T07:35:00.000Z', '2025-05-05T07:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2025-05-05T07:35:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 200, 200, 200, '2025-05-05T07:35:00.000Z');

  -- HM-2377 | KASMAWATI KAMARUDIN E1955 | RM160
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127430757' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 160, 0, 160, 'cash', 'completed', 'Zobaze HM-2377', '2025-05-05T07:35:00.000Z', '2025-05-05T07:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Q10 Shampoo 1L' LIMIT 1), (SELECT id FROM products WHERE name = 'Q10 Shampoo 1L' LIMIT 1), gen_random_uuid()), 'Q10 Shampoo 1L', 1, 160, 160, 160, '2025-05-05T07:35:00.000Z');

  -- HM-2378 |  | RM125
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 125, 0, 125, 'qr', 'completed', 'Zobaze HM-2378', '2025-05-05T08:47:00.000Z', '2025-05-05T08:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-05-05T08:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-05T08:47:00.000Z');

  -- HM-2379 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2379', '2025-05-05T09:24:00.000Z', '2025-05-05T09:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-05T09:24:00.000Z');

  -- HM-2380 | DETTY DELINA NORAZILAN E6408 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60179499171' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-2380', '2025-05-06T09:31:00.000Z', '2025-05-06T09:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-06T09:31:00.000Z');

  -- HM-2381 |  | RM80
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'card', 'completed', 'Zobaze HM-2381', '2025-05-06T09:38:00.000Z', '2025-05-06T09:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-05-06T09:38:00.000Z');

  -- HM-2382 | FADHILAH NOOR BASIR E6577 | RM119
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60136341787' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 119, 0, 119, 'qr', 'completed', 'Zobaze HM-2382', '2025-05-06T09:39:00.000Z', '2025-05-06T09:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 119, 119, 119, '2025-05-06T09:39:00.000Z');

  -- HM-2383 | SITI RAMLAH TOPAN E1845 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167036006' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-2383', '2025-05-08T02:54:00.000Z', '2025-05-08T02:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-08T02:54:00.000Z');

  -- HM-2384 | FARIDAH LEBAR | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197963498' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2384', '2025-05-08T03:29:00.000Z', '2025-05-08T03:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-08T03:29:00.000Z');

  -- HM-2385 | HASLINDA MOHAMED KAMAR E6487 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197503761' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-2385', '2025-05-08T04:28:00.000Z', '2025-05-08T04:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-08T04:28:00.000Z');

  -- HM-2386 | ROHAYA ABD KADIR E1504 | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167744752' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-2386', '2025-05-08T07:11:00.000Z', '2025-05-08T07:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-08T07:11:00.000Z');

  -- HM-2387 |  | RM55
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-2387', '2025-05-08T07:11:00.000Z', '2025-05-08T07:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 55, 55, 55, '2025-05-08T07:11:00.000Z');

  -- HM-2388 |  | RM45
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-2388', '2025-05-08T07:12:00.000Z', '2025-05-08T07:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-08T07:12:00.000Z');

  -- HM-2389 | SULASTRI | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189026477' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-2389', '2025-05-08T09:08:00.000Z', '2025-05-08T09:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-08T09:08:00.000Z');

  -- HM-2390 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2390', '2025-05-08T09:37:00.000Z', '2025-05-08T09:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-08T09:37:00.000Z');

END $$;

-- Batch 2/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-2391 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2391', '2025-05-08T09:38:00.000Z', '2025-05-08T09:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-08T09:38:00.000Z');

  -- HM-2392 | ZAITI ISMAIL E6578 | RM229
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197970663' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 229, 0, 229, 'qr', 'completed', 'Zobaze HM-2392', '2025-05-09T03:53:00.000Z', '2025-05-09T03:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-05-09T03:53:00.000Z');

  -- HM-2393 | NOORMINSHAH A. LAHAD E2223 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133581955' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-2393', '2025-05-09T04:19:00.000Z', '2025-05-09T04:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-09T04:19:00.000Z');

  -- HM-2394 | MANISAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137808966' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2394', '2025-05-09T04:56:00.000Z', '2025-05-09T04:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-09T04:56:00.000Z');

  -- HM-2395 | NORJULIA MOHAMMAD NORDIN E2146 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133525824' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2395', '2025-05-09T06:42:00.000Z', '2025-05-09T06:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-09T06:42:00.000Z');

  -- HM-2396 | NUR ZAFIRAH ABD HASHIM E2170 | RM155
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132224052' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 155, 0, 155, 'qr', 'completed', 'Zobaze HM-2396', '2025-05-09T06:53:00.000Z', '2025-05-09T06:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-09T06:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Long)' LIMIT 1), gen_random_uuid()), 'Henna (Long)', 1, 80, 80, 80, '2025-05-09T06:53:00.000Z');

  -- HM-2397 | NORHANI ABDUL NASIR | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177650040' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-2397', '2025-05-09T07:53:00.000Z', '2025-05-09T07:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-09T07:53:00.000Z');

  -- HM-2398 | JURIFAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60162328180' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2398', '2025-05-09T08:04:00.000Z', '2025-05-09T08:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-09T08:04:00.000Z');

  -- HM-2399 | SU | RM109
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127952908' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 109, 0, 109, 'qr', 'completed', 'Zobaze HM-2399', '2025-05-09T09:01:00.000Z', '2025-05-09T09:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-09T09:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-09T09:01:00.000Z');

  -- HM-2400 | NURFAZRINA MOHD ZAMRI E6433 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60146382010' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-2400', '2025-05-09T09:43:00.000Z', '2025-05-09T09:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-09T09:43:00.000Z');

  -- HM-2401 | NURUL AKMA NASRI E4888 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137282882' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-2401', '2025-05-09T09:44:00.000Z', '2025-05-09T09:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-05-09T09:44:00.000Z');

  -- HM-2402 | ASHA HASNIMY MOHD HASHIM E2833 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197733160' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2402', '2025-05-10T02:02:00.000Z', '2025-05-10T02:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-10T02:02:00.000Z');

  -- HM-2403 | KARMILA | RM128
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127578837' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 128, 0, 128, 'cash', 'completed', 'Zobaze HM-2403', '2025-05-10T04:32:00.000Z', '2025-05-10T04:32:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-05-10T04:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 48, 48, 48, '2025-05-10T04:32:00.000Z');

  -- HM-2404 | NORHANA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137246582' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2404', '2025-05-10T05:42:00.000Z', '2025-05-10T05:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-10T05:42:00.000Z');

  -- HM-2405 | ARNI | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197373043' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2405', '2025-05-10T06:42:00.000Z', '2025-05-10T06:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-10T06:42:00.000Z');

  -- HM-2406 | AIDA AZMAN E5768 | RM490
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142756804' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 490, 0, 490, 'cash', 'completed', 'Zobaze HM-2406', '2025-05-10T07:09:00.000Z', '2025-05-10T07:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 380, 380, 380, '2025-05-10T07:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (1 hour)', 1, 110, 110, 110, '2025-05-10T07:09:00.000Z');

  -- HM-2407 | NUR NADIA ASYIKIN MOHD SALLEH E5936 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601162187097' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-2407', '2025-05-10T07:57:00.000Z', '2025-05-10T07:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-10T07:57:00.000Z');

  -- HM-2408 | NOR EMAN ISMAIL E1842 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601136562751' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-2408', '2025-05-10T08:11:00.000Z', '2025-05-10T08:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-10T08:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2025-05-10T08:11:00.000Z');

  -- HM-2409 | SAHIRA | RM40
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189435194' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'qr', 'completed', 'Zobaze HM-2409', '2025-05-10T08:50:00.000Z', '2025-05-10T08:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-05-10T08:50:00.000Z');

  -- HM-2410 | AISYAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60168669469' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2410', '2025-05-10T09:19:00.000Z', '2025-05-10T09:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-10T09:19:00.000Z');

  -- HM-2411 | KAK ATIE | RM224
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601165497575' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 224, 0, 224, 'qr', 'completed', 'Zobaze HM-2411', '2025-05-10T10:00:00.000Z', '2025-05-10T10:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-10T10:00:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-10T10:00:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-10T10:00:00.000Z');

  -- HM-2412 |  | RM80
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-2412', '2025-05-10T10:02:00.000Z', '2025-05-10T10:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-05-10T10:02:00.000Z');

  -- HM-2413 | NORSHUHADA SHAHDAN E6406 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176552014' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2413', '2025-05-11T03:19:00.000Z', '2025-05-11T03:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-05-11T03:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-11T03:19:00.000Z');

  -- HM-2414 | AINA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601169335207' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-2414', '2025-05-11T04:25:00.000Z', '2025-05-11T04:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-11T04:25:00.000Z');

  -- HM-2415 | NORFAUZIAH SURATAMIN E6579 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137908857' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-2415', '2025-05-11T04:39:00.000Z', '2025-05-11T04:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-11T04:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-05-11T04:39:00.000Z');

  -- HM-2416 | ZAITUL MARLIZAWATI ZAINUDDIN E1411 | RM125
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126240025' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 125, 0, 125, 'qr', 'completed', 'Zobaze HM-2416', '2025-05-11T05:04:00.000Z', '2025-05-11T05:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-11T05:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-11T05:04:00.000Z');

  -- HM-2417 | SYAZWANA AZYYATI | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60103107443' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2417', '2025-05-11T05:40:00.000Z', '2025-05-11T05:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-11T05:40:00.000Z');

  -- HM-2418 | SALFARINA SAMSUDIN E5610 | RM140
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197755563' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 140, 0, 140, 'qr', 'completed', 'Zobaze HM-2418', '2025-05-11T07:56:00.000Z', '2025-05-11T07:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 2, 70, 70, 140, '2025-05-11T07:56:00.000Z');

  -- HM-2419 | SHAFIKA | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197541596' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'qr', 'completed', 'Zobaze HM-2419', '2025-05-12T03:15:00.000Z', '2025-05-12T03:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-12T03:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-12T03:15:00.000Z');

  -- HM-2420 | AISYAH | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60135284096' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'transfer', 'completed', 'Zobaze HM-2420', '2025-05-12T06:46:00.000Z', '2025-05-12T06:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 2, 50, 50, 100, '2025-05-12T06:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-12T06:46:00.000Z');

  -- HM-2421 | FATIN SHAHIRAH MOKHTAR E6580 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601161317185' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'qr', 'completed', 'Zobaze HM-2421', '2025-05-12T06:47:00.000Z', '2025-05-12T06:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-12T06:47:00.000Z');

  -- HM-2422 | MIN SYAHIRA MANAT E3075 | RM165
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117574791' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 165, 0, 165, 'cash', 'completed', 'Zobaze HM-2422', '2025-05-12T07:02:00.000Z', '2025-05-12T07:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-12T07:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Wash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Wash Kids' LIMIT 1), gen_random_uuid()), 'Wash Kids', 3, 30, 30, 90, '2025-05-12T07:02:00.000Z');

  -- HM-2423 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2423', '2025-05-12T07:02:00.000Z', '2025-05-12T07:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-12T07:02:00.000Z');

  -- HM-2424 | NAS | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601128781223' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-2424', '2025-05-12T07:31:00.000Z', '2025-05-12T07:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-12T07:31:00.000Z');

  -- HM-2425 | AZIRAH | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60105607421' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'card', 'completed', 'Zobaze HM-2425', '2025-05-12T08:25:00.000Z', '2025-05-12T08:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-12T08:25:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-12T08:25:00.000Z');

  -- HM-2426 | FARHANA MD YUNOS E4673 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60164141724' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2426', '2025-05-12T08:41:00.000Z', '2025-05-12T08:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-12T08:41:00.000Z');

  -- HM-2427 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2427', '2025-05-12T09:14:00.000Z', '2025-05-12T09:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-12T09:14:00.000Z');

  -- HM-2428 |  | RM105
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'qr', 'completed', 'Zobaze HM-2428', '2025-05-12T09:17:00.000Z', '2025-05-12T09:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-12T09:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-12T09:17:00.000Z');

  -- HM-2429 | HIDAYAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601133062883' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2429', '2025-05-13T04:12:00.000Z', '2025-05-13T04:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-13T04:12:00.000Z');

  -- HM-2430 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2430', '2025-05-13T04:55:00.000Z', '2025-05-13T04:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-13T04:55:00.000Z');

  -- HM-2431 | MIMI AIDILIA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199936481' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2431', '2025-05-13T06:34:00.000Z', '2025-05-13T06:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-13T06:34:00.000Z');

  -- HM-2432 | ADRIANA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60173784010' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2432', '2025-05-13T06:37:00.000Z', '2025-05-13T06:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-13T06:37:00.000Z');

  -- HM-2433 | NABIHAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601113286867' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-2433', '2025-05-13T08:16:00.000Z', '2025-05-13T08:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-13T08:16:00.000Z');

  -- HM-2434 | NURUL ASUHANA E6582 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60109066227' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-2434', '2025-05-13T08:29:00.000Z', '2025-05-13T08:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-13T08:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-05-13T08:29:00.000Z');

  -- HM-2435 | FATIN AFIQA MANSOR E6581 | RM229
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142802004' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 229, 0, 229, 'card', 'completed', 'Zobaze HM-2435', '2025-05-13T08:43:00.000Z', '2025-05-13T08:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-05-13T08:43:00.000Z');

  -- HM-2436 | NORJULIA MOHAMMAD NORDIN E2146 | RM264
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133525824' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 264, 0, 264, 'qr', 'completed', 'Zobaze HM-2436', '2025-05-15T05:50:00.000Z', '2025-05-15T05:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-05-15T05:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-05-15T05:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-15T05:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-15T05:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-15T05:50:00.000Z');

  -- HM-2437 | SHAKILAH NAZ KASSIM E5993 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197861958' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2437', '2025-05-15T09:23:00.000Z', '2025-05-15T09:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-15T09:23:00.000Z');

  -- HM-2438 | NORASIMAH SABRAN E5941 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167024192' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-2438', '2025-05-15T09:24:00.000Z', '2025-05-15T09:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-15T09:24:00.000Z');

  -- HM-2439 |  | RM70
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'card', 'completed', 'Zobaze HM-2439', '2025-05-15T09:25:00.000Z', '2025-05-15T09:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-15T09:25:00.000Z');

  -- HM-2440 | NORIFFAH HANI SAIMON E1145 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197756672' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'card', 'completed', 'Zobaze HM-2440', '2025-05-15T09:33:00.000Z', '2025-05-15T09:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-15T09:33:00.000Z');

END $$;

-- Batch 3/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-2441 | SHIKIN | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110628676' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-2441', '2025-05-16T03:02:00.000Z', '2025-05-16T03:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-16T03:02:00.000Z');

  -- HM-2442 | MASZURIAH | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127898022' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-2442', '2025-05-16T03:29:00.000Z', '2025-05-16T03:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-16T03:29:00.000Z');

  -- HM-2443 |  | RM105
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'qr', 'completed', 'Zobaze HM-2443', '2025-05-16T03:46:00.000Z', '2025-05-16T03:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-16T03:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-16T03:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-05-16T03:46:00.000Z');

  -- HM-2444 | HASLINA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176302996' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2444', '2025-05-16T05:15:00.000Z', '2025-05-16T05:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-16T05:15:00.000Z');

  -- HM-2445 | ROZIAH TALIP E6583 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167447722' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'qr', 'completed', 'Zobaze HM-2445', '2025-05-16T05:17:00.000Z', '2025-05-16T05:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 280, 280, 280, '2025-05-16T05:17:00.000Z');

  -- HM-2446 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-2446', '2025-05-16T07:24:00.000Z', '2025-05-16T07:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-16T07:24:00.000Z');

  -- HM-2447 | SURAYA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197166221' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2447', '2025-05-16T07:56:00.000Z', '2025-05-16T07:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-16T07:56:00.000Z');

  -- HM-2448 | NORLIZA BASIRON E2410 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127311450' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2448', '2025-05-16T09:02:00.000Z', '2025-05-16T09:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-16T09:02:00.000Z');

  -- HM-2449 | NUR IDNA ERISA E6584 | RM330
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111272469' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 330, 0, 330, 'qr', 'completed', 'Zobaze HM-2449', '2025-05-16T09:40:00.000Z', '2025-05-16T09:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-05-16T09:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Hair / Scalp Treatment + Haircut', 1, 290, 290, 290, '2025-05-16T09:40:00.000Z');

  -- HM-2450 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2450', '2025-05-16T09:42:00.000Z', '2025-05-16T09:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-16T09:42:00.000Z');

  -- HM-2451 | NUR ATIQAH IBRAHIM E5948 | RM65
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132298902' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 65, 0, 65, 'qr', 'completed', 'Zobaze HM-2451', '2025-05-17T04:36:00.000Z', '2025-05-17T04:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-17T04:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-17T04:36:00.000Z');

  -- HM-2452 | NOR FAEEZAH FADZIL E4851 | RM348
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172762493' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 348, 0, 348, 'qr', 'completed', 'Zobaze HM-2452', '2025-05-17T04:45:00.000Z', '2025-05-17T04:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-05-17T04:45:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-17T04:45:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-17T04:45:00.000Z');

  -- HM-2453 | NUR AMIRAH AZIZ E6331 | RM400
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137424497' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 400, 0, 400, 'qr', 'completed', 'Zobaze HM-2453', '2025-05-17T05:42:00.000Z', '2025-05-17T05:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Scalp & Hair Treatment + Haircut', 1, 330, 330, 330, '2025-05-17T05:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 70, 70, 70, '2025-05-17T05:42:00.000Z');

  -- HM-2454 |  | RM60
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'transfer', 'completed', 'Zobaze HM-2454', '2025-05-17T05:45:00.000Z', '2025-05-17T05:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 60, 60, 60, '2025-05-17T05:45:00.000Z');

  -- HM-2455 | FARAH NADIA SHAMSURI E1908 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142390255' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2455', '2025-05-17T07:18:00.000Z', '2025-05-17T07:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-17T07:18:00.000Z');

  -- HM-2456 | MARDIANA CHE BAHARUN | RM249
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60174532968' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 249, 0, 249, 'card', 'completed', 'Zobaze HM-2456', '2025-05-17T07:26:00.000Z', '2025-05-17T07:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-05-17T07:26:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-17T07:26:00.000Z');

  -- HM-2457 | NORIDA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60124481355' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2457', '2025-05-17T08:01:00.000Z', '2025-05-17T08:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-17T08:01:00.000Z');

  -- HM-2458 | HEZE | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127127837' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-2458', '2025-05-17T08:58:00.000Z', '2025-05-17T08:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-17T08:58:00.000Z');

  -- HM-2459 | NOR HASLINA ZAKARIA E2919 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133311379' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-2459', '2025-05-17T09:26:00.000Z', '2025-05-17T09:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-05-17T09:26:00.000Z');

  -- HM-2460 | Aida | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137770078' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-2460', '2025-05-17T10:11:00.000Z', '2025-05-17T10:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-05-17T10:11:00.000Z');

  -- HM-2461 | NORIZAN UMAR E4689 | RM230
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129839470' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 230, 0, 230, 'qr', 'completed', 'Zobaze HM-2461', '2025-05-18T05:08:00.000Z', '2025-05-18T05:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-18T05:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-18T05:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-18T05:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-18T05:08:00.000Z');

  -- HM-2462 | WAN RASHIDAH WAN MAJID E6218 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197534813' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'qr', 'completed', 'Zobaze HM-2462', '2025-05-18T05:32:00.000Z', '2025-05-18T05:32:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-05-18T05:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-05-18T05:32:00.000Z');

  -- HM-2463 | SITI | RM165
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137746735' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 165, 0, 165, 'qr', 'completed', 'Zobaze HM-2463', '2025-05-18T06:43:00.000Z', '2025-05-18T06:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-05-18T06:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-18T06:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-18T06:43:00.000Z');

  -- HM-2464 | HAJAR | RM65
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60147755374' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 65, 0, 65, 'card', 'completed', 'Zobaze HM-2464', '2025-05-18T07:44:00.000Z', '2025-05-18T07:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-18T07:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-18T07:44:00.000Z');

  -- HM-2465 | NURUL IZZATY E6586 | RM219
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127328756' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 219, 0, 219, 'card', 'completed', 'Zobaze HM-2465', '2025-05-18T08:15:00.000Z', '2025-05-18T08:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Growth Ampoule' LIMIT 1), (SELECT id FROM products WHERE name = 'Growth Ampoule' LIMIT 1), gen_random_uuid()), 'Growth Ampoule', 1, 20, 20, 20, '2025-05-18T08:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-18T08:15:00.000Z');

  -- HM-2466 | AINA | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60135642539' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'qr', 'completed', 'Zobaze HM-2466', '2025-05-18T08:47:00.000Z', '2025-05-18T08:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-18T08:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-18T08:47:00.000Z');

  -- HM-2467 | NURMAZUZIL KAMARULZAMAN E6587 | RM344
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129245647' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 344, 0, 344, 'qr', 'completed', 'Zobaze HM-2467', '2025-05-18T09:08:00.000Z', '2025-05-18T09:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-05-18T09:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-18T09:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-18T09:08:00.000Z');

  -- HM-2468 | NORA | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123996014' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-2468', '2025-05-18T09:58:00.000Z', '2025-05-18T09:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-18T09:58:00.000Z');

  -- HM-2469 |  | RM60
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-2469', '2025-05-18T10:01:00.000Z', '2025-05-18T10:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-05-18T10:01:00.000Z');

  -- HM-2470 | NADIATUL HUDA E6588 | RM135
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111175344' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 135, 0, 135, 'card', 'completed', 'Zobaze HM-2470', '2025-05-18T10:01:00.000Z', '2025-05-18T10:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-18T10:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-05-18T10:01:00.000Z');

  -- HM-2471 | FATIN NADZIRAH BINTI HASHIM E6255 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182316531' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-2471', '2025-05-19T04:08:00.000Z', '2025-05-19T04:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-05-19T04:08:00.000Z');

  -- HM-2472 | NURUL AFIQAH FADZIL E6589 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167167878' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'cash', 'completed', 'Zobaze HM-2472', '2025-05-19T05:01:00.000Z', '2025-05-19T05:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-19T05:01:00.000Z');

  -- HM-2473 | NORLIDA | RM110
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167221784' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 110, 0, 110, 'cash', 'completed', 'Zobaze HM-2473', '2025-05-19T05:41:00.000Z', '2025-05-19T05:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-05-19T05:41:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-05-19T05:41:00.000Z');

  -- HM-2474 | NUR IZZAN AQILAH ISMAIL E6590 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60186627622' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'cash', 'completed', 'Zobaze HM-2474', '2025-05-19T05:44:00.000Z', '2025-05-19T05:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-19T05:44:00.000Z');

  -- HM-2475 | ZAINAB | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111285350' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'cash', 'completed', 'Zobaze HM-2475', '2025-05-20T05:56:00.000Z', '2025-05-20T05:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (1 hour)', 1, 110, 110, 110, '2025-05-20T05:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-20T05:56:00.000Z');

  -- HM-2476 | NURUL AIN | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177095429' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-2476', '2025-05-20T05:58:00.000Z', '2025-05-20T05:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-05-20T05:58:00.000Z');

  -- HM-2477 | PIPAH | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60138804215' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2477', '2025-05-20T08:38:00.000Z', '2025-05-20T08:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-20T08:38:00.000Z');

  -- HM-2478 | khairina | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60134909749' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2478', '2025-05-20T09:09:00.000Z', '2025-05-20T09:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-20T09:09:00.000Z');

  -- HM-2479 | SITI NUR HADIS A RAHMAN E6591 | RM368
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60136420192' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 368, 0, 368, 'card', 'completed', 'Zobaze HM-2479', '2025-05-20T10:04:00.000Z', '2025-05-20T10:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-05-20T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-20T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-20T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-20T10:04:00.000Z');

  -- HM-2480 | Nuratikah | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196008891' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-2480', '2025-05-22T06:37:00.000Z', '2025-05-22T06:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-05-22T06:37:00.000Z');

  -- HM-2481 | ZARIANI SALIM E1890 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127541272' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-2481', '2025-05-22T06:39:00.000Z', '2025-05-22T06:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-22T06:39:00.000Z');

  -- HM-2482 | MAHFUZAH BUANG E0084 | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197903005' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-2482', '2025-05-22T07:21:00.000Z', '2025-05-22T07:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-05-22T07:21:00.000Z');

  -- HM-2483 | YANA KSL E6299 | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197072924' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-2483', '2025-05-22T07:42:00.000Z', '2025-05-22T07:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-22T07:42:00.000Z');

  -- HM-2484 | HASLINA E1904 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197515797' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'cash', 'completed', 'Zobaze HM-2484', '2025-05-22T08:00:00.000Z', '2025-05-22T08:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-22T08:00:00.000Z');

  -- HM-2485 | YUSNITA YUSOP E0792 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60108445067' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2485', '2025-05-22T09:40:00.000Z', '2025-05-22T09:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-22T09:40:00.000Z');

  -- HM-2486 | FATIN IZZTI | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601140025221' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-2486', '2025-05-22T09:48:00.000Z', '2025-05-22T09:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-22T09:48:00.000Z');

  -- HM-2487 | NORALIZA JAFAR E6592 | RM230
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601156683144' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 230, 0, 230, 'qr', 'completed', 'Zobaze HM-2487', '2025-05-23T04:00:00.000Z', '2025-05-23T04:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-05-23T04:00:00.000Z');

  -- HM-2488 | MANIHAH ALIAS E6593 | RM269
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176472632' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 269, 0, 269, 'cash', 'completed', 'Zobaze HM-2488', '2025-05-23T04:24:00.000Z', '2025-05-23T04:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-05-23T04:24:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-23T04:24:00.000Z');

  -- HM-2489 | IZAYU | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137313186' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2489', '2025-05-23T05:19:00.000Z', '2025-05-23T05:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-23T05:19:00.000Z');

  -- HM-2490 | SUSILAWATI MD SUKOR E3071 | RM230
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60107746036' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 230, 0, 230, 'qr', 'completed', 'Zobaze HM-2490', '2025-05-23T06:06:00.000Z', '2025-05-23T06:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-05-23T06:06:00.000Z');

END $$;

-- Batch 4/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-2491 | liana | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60195699828' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-2491', '2025-05-23T06:30:00.000Z', '2025-05-23T06:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-23T06:30:00.000Z');

  -- HM-2492 | SHARIFAH RAHIMAH E1975 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197511858' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2492', '2025-05-23T06:50:00.000Z', '2025-05-23T06:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-23T06:50:00.000Z');

  -- HM-2493 | AZMINA FATIN | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137135851' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-2493', '2025-05-23T07:40:00.000Z', '2025-05-23T07:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-23T07:40:00.000Z');

  -- HM-2494 | Zati | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60179882461' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2494', '2025-05-23T07:44:00.000Z', '2025-05-23T07:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-23T07:44:00.000Z');

  -- HM-2495 | MUNIRAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6017722776' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2495', '2025-05-23T09:04:00.000Z', '2025-05-23T09:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-23T09:04:00.000Z');

  -- HM-2496 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2496', '2025-05-23T09:13:00.000Z', '2025-05-23T09:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-23T09:13:00.000Z');

  -- HM-2498 | YAYA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60162215756' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-2498', '2025-05-23T10:25:00.000Z', '2025-05-23T10:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 60, 60, 60, '2025-05-23T10:25:00.000Z');

  -- HM-2499 | NURUL HIDAYAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182196366' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-2499', '2025-05-23T10:27:00.000Z', '2025-05-23T10:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-23T10:27:00.000Z');

  -- HM-2500 | SYAZANA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60136360277' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-2500', '2025-05-24T03:43:00.000Z', '2025-05-24T03:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-24T03:43:00.000Z');

  -- HM-2501 | IQMA NABILA | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601125417616' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-2501', '2025-05-24T03:56:00.000Z', '2025-05-24T03:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-05-24T03:56:00.000Z');

  -- HM-2502 | NOR AZURA ISMAIL E6594 | RM269
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601114797748' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 269, 0, 269, 'qr', 'completed', 'Zobaze HM-2502', '2025-05-24T05:19:00.000Z', '2025-05-24T05:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-05-24T05:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-24T05:19:00.000Z');

  -- HM-2503 |  | RM45
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-2503', '2025-05-24T05:39:00.000Z', '2025-05-24T05:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-24T05:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-24T05:39:00.000Z');

  -- HM-2504 |  | RM75
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2504', '2025-05-24T05:39:00.000Z', '2025-05-24T05:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-24T05:39:00.000Z');

  -- HM-2505 | ROZIAH KAMAL | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197718300' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2505', '2025-05-24T05:56:00.000Z', '2025-05-24T05:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-24T05:56:00.000Z');

  -- HM-2506 | ASNIDA ABDUL WAHAB E6595 | RM484
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60174118086' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 484, 0, 484, 'card', 'completed', 'Zobaze HM-2506', '2025-05-24T06:07:00.000Z', '2025-05-24T06:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-05-24T06:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-24T06:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-05-24T06:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment Kids' LIMIT 1), gen_random_uuid()), 'Hair Treatment Kids', 1, 80, 80, 80, '2025-05-24T06:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-24T06:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-24T06:07:00.000Z');

  -- HM-2507 | SUZIANA E5443 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127006747' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'card', 'completed', 'Zobaze HM-2507', '2025-05-24T07:04:00.000Z', '2025-05-24T07:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-24T07:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-05-24T07:04:00.000Z');

  -- HM-2508 | AISYA IRDINA HISSAMUDIN E6156 | RM348
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60194882611' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 348, 0, 348, 'card', 'completed', 'Zobaze HM-2508', '2025-05-24T08:10:00.000Z', '2025-05-24T08:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-05-24T08:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-24T08:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-24T08:10:00.000Z');

  -- HM-2509 | RENI | RM120
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129454205' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'qr', 'completed', 'Zobaze HM-2509', '2025-05-24T09:14:00.000Z', '2025-05-24T09:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-24T09:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-24T09:14:00.000Z');

  -- HM-2510 | AMINAH AHMAD E3327 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6093678734' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-2510', '2025-05-24T09:56:00.000Z', '2025-05-24T09:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-05-24T09:56:00.000Z');

  -- HM-2511 | NAZIRAH M TAHRIR E6179 | RM175
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197610768' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 175, 0, 175, 'qr', 'completed', 'Zobaze HM-2511', '2025-05-24T10:03:00.000Z', '2025-05-24T10:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-05-24T10:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-05-24T10:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-24T10:03:00.000Z');

  -- HM-2512 | RAHAYU IZWAN BORHANUDDN E1003 | RM348
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127811216' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 348, 0, 348, 'card', 'completed', 'Zobaze HM-2512', '2025-05-24T10:22:00.000Z', '2025-05-24T10:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-05-24T10:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-24T10:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-24T10:22:00.000Z');

  -- HM-2513 | ATIKA ARIS | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123977959' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2513', '2025-05-25T02:20:00.000Z', '2025-05-25T02:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-25T02:20:00.000Z');

  -- HM-2514 | NURUL HUSNA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60138060460' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2514', '2025-05-25T03:10:00.000Z', '2025-05-25T03:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-25T03:10:00.000Z');

  -- HM-2515 | RINI FARHANA OTHMAN E0004 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197965053' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'qr', 'completed', 'Zobaze HM-2515', '2025-05-25T03:34:00.000Z', '2025-05-25T03:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-25T03:34:00.000Z');

  -- HM-2516 | NADA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187802047' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2516', '2025-05-25T03:54:00.000Z', '2025-05-25T03:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-25T03:54:00.000Z');

  -- HM-2517 | NABILA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601120788875' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2517', '2025-05-25T04:02:00.000Z', '2025-05-25T04:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-25T04:02:00.000Z');

  -- HM-2518 | YANA | RM195
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127467274' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 195, 0, 195, 'qr', 'completed', 'Zobaze HM-2518', '2025-05-25T04:53:00.000Z', '2025-05-25T04:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 2, 75, 75, 150, '2025-05-25T04:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-25T04:53:00.000Z');

  -- HM-2519 | IKA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177004113' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2519', '2025-05-25T05:42:00.000Z', '2025-05-25T05:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-25T05:42:00.000Z');

  -- HM-2520 | ALIZA JABARULLAH E2839 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60146644165' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'qr', 'completed', 'Zobaze HM-2520', '2025-05-25T06:47:00.000Z', '2025-05-25T06:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-25T06:47:00.000Z');

  -- HM-2521 | FATNIN | RM165
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110831858' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 165, 0, 165, 'qr', 'completed', 'Zobaze HM-2521', '2025-05-25T07:12:00.000Z', '2025-05-25T07:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-25T07:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-05-25T07:12:00.000Z');

  -- HM-2522 | NOORMINSHAH A. LAHAD E2223 | RM430
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133581955' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 430, 0, 430, 'qr', 'completed', 'Zobaze HM-2522', '2025-05-25T09:41:00.000Z', '2025-05-25T09:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 380, 380, 380, '2025-05-25T09:41:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-05-25T09:41:00.000Z');

  -- HM-2523 | NURUL SORFINA ROHIMI E6596 | RM290
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172322894' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 290, 0, 290, 'qr', 'completed', 'Zobaze HM-2523', '2025-05-25T10:07:00.000Z', '2025-05-25T10:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Hair / Scalp Treatment + Haircut', 1, 290, 290, 290, '2025-05-25T10:07:00.000Z');

  -- HM-2524 | SITI ROHANA TUKIMAN E2513 | RM229
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127641971' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 229, 0, 229, 'qr', 'completed', 'Zobaze HM-2524', '2025-05-25T10:31:00.000Z', '2025-05-25T10:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-25T10:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-25T10:31:00.000Z');

  -- HM-2525 | SARAH RASLI | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60169234349' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-2525', '2025-05-26T05:06:00.000Z', '2025-05-26T05:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-26T05:06:00.000Z');

  -- HM-2526 | HASYA | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60105578060' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-2526', '2025-05-26T05:12:00.000Z', '2025-05-26T05:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-26T05:12:00.000Z');

  -- HM-2527 | AZNAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111779796' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2527', '2025-05-26T05:41:00.000Z', '2025-05-26T05:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-26T05:41:00.000Z');

  -- HM-2528 | NURUL 'AMIRAH ROSLAN E6597 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60194816587' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-2528', '2025-05-26T05:48:00.000Z', '2025-05-26T05:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-05-26T05:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-26T05:48:00.000Z');

  -- HM-2529 | ILYA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177036966' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2529', '2025-05-26T08:34:00.000Z', '2025-05-26T08:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-26T08:34:00.000Z');

  -- HM-2530 | KHAI | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177475662' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-2530', '2025-05-26T09:27:00.000Z', '2025-05-26T09:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 2, 75, 75, 150, '2025-05-26T09:27:00.000Z');

  -- HM-2531 | ROS | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137732882' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2531', '2025-05-26T09:28:00.000Z', '2025-05-26T09:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-26T09:28:00.000Z');

  -- HM-2532 | NORAZAH BAHARIM E1275 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197788829' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2532', '2025-05-27T03:23:00.000Z', '2025-05-27T03:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-27T03:23:00.000Z');

  -- HM-2533 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-2533', '2025-05-27T09:34:00.000Z', '2025-05-27T09:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-27T09:34:00.000Z');

  -- HM-2534 |  | RM75
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2534', '2025-05-27T09:34:00.000Z', '2025-05-27T09:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-27T09:34:00.000Z');

  -- HM-2535 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2535', '2025-05-27T09:35:00.000Z', '2025-05-27T09:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-27T09:35:00.000Z');

  -- HM-2536 | ZIRA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601127702250' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-2536', '2025-05-29T05:26:00.000Z', '2025-05-29T05:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-29T05:26:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Foot Massage' LIMIT 1), (SELECT id FROM products WHERE name = 'Foot Massage' LIMIT 1), gen_random_uuid()), 'Foot Massage', 1, 45, 45, 45, '2025-05-29T05:26:00.000Z');

  -- HM-2537 | NAJWA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60183658002' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-2537', '2025-05-29T08:56:00.000Z', '2025-05-29T08:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-29T08:56:00.000Z');

  -- HM-2538 | NURSAHIRAH NADIRAH RUDI E6598 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601151232351' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'qr', 'completed', 'Zobaze HM-2538', '2025-05-29T09:24:00.000Z', '2025-05-29T09:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-29T09:24:00.000Z');

  -- HM-2539 | FIZA | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127327403' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-2539', '2025-05-30T02:53:00.000Z', '2025-05-30T02:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-30T02:53:00.000Z');

  -- HM-2540 | RUS HABIZA BINTI ABD YARUS E6360 | RM368
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129607593' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 368, 0, 368, 'qr', 'completed', 'Zobaze HM-2540', '2025-05-30T04:25:00.000Z', '2025-05-30T04:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-05-30T04:25:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-30T04:25:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-30T04:25:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-30T04:25:00.000Z');

  -- HM-2541 | ISTIQAMAH E2386 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196780532' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'cash', 'completed', 'Zobaze HM-2541', '2025-05-30T05:45:00.000Z', '2025-05-30T05:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-30T05:45:00.000Z');

END $$;

-- Batch 5/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-2542 | NABILAH KASIM E1762 | RM325
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60184733650' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 325, 0, 325, 'transfer', 'completed', 'Zobaze HM-2542', '2025-05-30T06:08:00.000Z', '2025-05-30T06:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 280, 280, 280, '2025-05-30T06:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-30T06:08:00.000Z');

  -- HM-2543 | EIZZAH AQILAH E6472 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137780451' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'cash', 'completed', 'Zobaze HM-2543', '2025-05-30T06:27:00.000Z', '2025-05-30T06:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-05-30T06:27:00.000Z');

  -- HM-2544 | ROHAZA ABDULLAH E2539 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137792594' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-2544', '2025-05-30T07:11:00.000Z', '2025-05-30T07:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-05-30T07:11:00.000Z');

  -- HM-2545 | Anis | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177347421' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-2545', '2025-05-30T07:39:00.000Z', '2025-05-30T07:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-05-30T07:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-30T07:39:00.000Z');

  -- HM-2546 | RAFIDAH MASIDANG E6599 | RM269
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187915946' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 269, 0, 269, 'qr', 'completed', 'Zobaze HM-2546', '2025-05-30T09:14:00.000Z', '2025-05-30T09:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 40, 40, 40, '2025-05-30T09:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-05-30T09:14:00.000Z');

  -- HM-2547 |  | RM130
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'qr', 'completed', 'Zobaze HM-2547', '2025-05-30T09:14:00.000Z', '2025-05-30T09:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-05-30T09:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-05-30T09:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-05-30T09:14:00.000Z');

  -- HM-2548 | NOR ALINA CHE YON E6600 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60135505011' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'card', 'completed', 'Zobaze HM-2548', '2025-05-30T09:17:00.000Z', '2025-05-30T09:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-30T09:17:00.000Z');

  -- HM-2549 |  | RM45
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-2549', '2025-05-30T09:18:00.000Z', '2025-05-30T09:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-05-30T09:18:00.000Z');

  -- HM-2550 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2550', '2025-05-31T02:47:00.000Z', '2025-05-31T02:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-31T02:47:00.000Z');

  -- HM-2551 | SALWA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172742127' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2551', '2025-05-31T03:33:00.000Z', '2025-05-31T03:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-31T03:33:00.000Z');

  -- HM-2552 | ZALINA MD RAMLI E6601 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127906335' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'qr', 'completed', 'Zobaze HM-2552', '2025-05-31T04:14:00.000Z', '2025-05-31T04:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 280, 280, 280, '2025-05-31T04:14:00.000Z');

  -- HM-2553 | SITI AISAH E6603 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601127199096' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'qr', 'completed', 'Zobaze HM-2553', '2025-05-31T06:05:00.000Z', '2025-05-31T06:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-31T06:05:00.000Z');

  -- HM-2554 | AYSHA HUMAIRA E6604 | RM388
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177569954' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 388, 0, 388, 'qr', 'completed', 'Zobaze HM-2554', '2025-05-31T06:06:00.000Z', '2025-05-31T06:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-05-31T06:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-05-31T06:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-05-31T06:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-31T06:06:00.000Z');

  -- HM-2555 | NUR NAZIHA ARIS E1403 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137781019' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2555', '2025-05-31T06:44:00.000Z', '2025-05-31T06:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-31T06:44:00.000Z');

  -- HM-2556 | ALYA | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601161215033' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-2556', '2025-05-31T07:19:00.000Z', '2025-05-31T07:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-05-31T07:19:00.000Z');

  -- HM-2557 | AJLAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125385657' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-2557', '2025-05-31T07:49:00.000Z', '2025-05-31T07:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-05-31T07:49:00.000Z');

  -- HM-2558 | RUZITA SELAMAT E2185 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197149729' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-2558', '2025-05-31T08:30:00.000Z', '2025-05-31T08:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-05-31T08:30:00.000Z');

  -- HM-2559 | FOZIAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129301309' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-2559', '2025-05-31T09:13:00.000Z', '2025-05-31T09:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-05-31T09:13:00.000Z');

  -- HM-2560 | SITI NUR AMIRAH E6605 | RM249
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126133248' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 249, 0, 249, 'qr', 'completed', 'Zobaze HM-2560', '2025-05-31T09:22:00.000Z', '2025-05-31T09:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2025-05-31T09:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-05-31T09:22:00.000Z');

  -- HM-2561 | NUR AZAYANA HUSIN E5808 | RM360
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60139442037' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 360, 0, 360, 'qr', 'completed', 'Zobaze HM-2561', '2025-05-31T09:41:00.000Z', '2025-05-31T09:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Hair / Scalp Treatment + Haircut', 1, 360, 360, 360, '2025-05-31T09:41:00.000Z');

  -- HM-2562 |  | RM85
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'card', 'completed', 'Zobaze HM-2562', '2025-05-31T10:09:00.000Z', '2025-05-31T10:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 55, 55, 55, '2025-05-31T10:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Wash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Wash Kids' LIMIT 1), gen_random_uuid()), 'Wash Kids', 1, 30, 30, 30, '2025-05-31T10:09:00.000Z');

  -- HM-2563 | Wawa | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601161362063' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-2563', '2025-05-31T10:29:00.000Z', '2025-05-31T10:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-05-31T10:29:00.000Z');

END $$;
