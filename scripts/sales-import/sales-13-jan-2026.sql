-- ============================================
-- HMS Salon - Sales Import: 13-JAN-2026
-- Receipts: 241 | Items: 422 | Revenue: RM 33,663
-- Generated: 2026-02-09
-- ============================================

-- Run AFTER import-zobaze-data.sql (customers must exist)

-- Batch 1/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3892 | NADIA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177449342' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-3892', '2026-01-01T03:16:00.000Z', '2026-01-01T03:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-01T03:16:00.000Z');

  -- HM-3893 | NURUL AIN | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601132571188' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3893', '2026-01-01T06:12:00.000Z', '2026-01-01T06:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 60, 60, 60, '2026-01-01T06:12:00.000Z');

  -- HM-3894 | NUR MALINA E6840 | RM414
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172302414' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 414, 0, 414, 'qr', 'completed', 'Zobaze HM-3894', '2026-01-01T06:51:00.000Z', '2026-01-01T06:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-01T06:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 2, 10, 10, 20, '2026-01-01T06:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2026-01-01T06:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-01T06:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-01T06:51:00.000Z');

  -- HM-3895 | SABRINA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601139164054' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3895', '2026-01-01T07:04:00.000Z', '2026-01-01T07:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-01T07:04:00.000Z');

  -- HM-3896 | MIRA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196497956' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3896', '2026-01-01T07:20:00.000Z', '2026-01-01T07:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-01T07:20:00.000Z');

  -- HM-3897 | ALEEYA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197542303' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3897', '2026-01-01T08:44:00.000Z', '2026-01-01T08:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-01T08:44:00.000Z');

  -- HM-3898 | NAZIRAH | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127767871' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'card', 'completed', 'Zobaze HM-3898', '2026-01-01T09:13:00.000Z', '2026-01-01T09:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-01T09:13:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-01T09:13:00.000Z');

  -- HM-3899 | NURUL ASYIKIN | RM205
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137821883' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 205, 0, 205, 'cash', 'completed', 'Zobaze HM-3899', '2026-01-01T09:48:00.000Z', '2026-01-01T09:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-01T09:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-01T09:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-01T09:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 50, 50, 50, '2026-01-01T09:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-01T09:48:00.000Z');

  -- HM-3900 | NURUL ASYIKIN | RM79
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137821883' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 79, 0, 79, 'qr', 'completed', 'Zobaze HM-3900', '2026-01-01T10:13:00.000Z', '2026-01-01T10:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-01T10:13:00.000Z');

  -- HM-3901 | SYAHIRAH | RM115
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125135772' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 115, 0, 115, 'qr', 'completed', 'Zobaze HM-3901', '2026-01-01T10:24:00.000Z', '2026-01-01T10:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-01T10:24:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-01T10:24:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-01T10:24:00.000Z');

  -- HM-3902 | SARIMAH AHMAD E1135 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137302166' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3902', '2026-01-02T02:14:00.000Z', '2026-01-02T02:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-02T02:14:00.000Z');

  -- HM-3903 | NURUL FATEHAH | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60175385612' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'cash', 'completed', 'Zobaze HM-3903', '2026-01-02T03:55:00.000Z', '2026-01-02T03:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-02T03:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2026-01-02T03:55:00.000Z');

  -- HM-3904 | SHIDA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127682690' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3904', '2026-01-02T04:18:00.000Z', '2026-01-02T04:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-02T04:18:00.000Z');

  -- HM-3905 | MUNIRA SHAHIDAH AHMAD SAYUTY E2405 | RM610
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177021874' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 610, 0, 610, 'card', 'completed', 'Zobaze HM-3905', '2026-01-02T05:55:00.000Z', '2026-01-02T05:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-02T05:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2026-01-02T05:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese + Hair Treatment & Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese + Hair Treatment & Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Japanese + Hair Treatment & Scalp Treatment + Haircut', 1, 510, 510, 510, '2026-01-02T05:55:00.000Z');

  -- HM-3906 | BELLA | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601136734105' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3906', '2026-01-02T06:18:00.000Z', '2026-01-02T06:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-02T06:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-02T06:18:00.000Z');

  -- HM-3907 | Nor Zarina | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127065584' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3907', '2026-01-02T06:19:00.000Z', '2026-01-02T06:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-02T06:19:00.000Z');

  -- HM-3908 | NOOR ATIQAH AMBIA E6656 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177879005' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3908', '2026-01-02T06:27:00.000Z', '2026-01-02T06:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2026-01-02T06:27:00.000Z');

  -- HM-3909 | MULIATI ILYAS E6457 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60192417796' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-3909', '2026-01-02T06:30:00.000Z', '2026-01-02T06:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-02T06:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-02T06:30:00.000Z');

  -- HM-3910 | EIZZAH AQILAH E6472 | RM314
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137780451' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 314, 0, 314, 'card', 'completed', 'Zobaze HM-3910', '2026-01-02T06:51:00.000Z', '2026-01-02T06:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2026-01-02T06:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-02T06:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-02T06:51:00.000Z');

  -- HM-3911 |  | RM93
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 93, 0, 93, 'qr', 'completed', 'Zobaze HM-3911', '2026-01-02T07:33:00.000Z', '2026-01-02T07:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-02T07:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2026-01-02T07:33:00.000Z');

  -- HM-3912 | SALINA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110290105' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'card', 'completed', 'Zobaze HM-3912', '2026-01-02T08:15:00.000Z', '2026-01-02T08:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-02T08:15:00.000Z');

  -- HM-3913 | RUZANNA MOHAMED E1652 | RM460
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177080508' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 460, 0, 460, 'cash', 'completed', 'Zobaze HM-3913', '2026-01-02T09:24:00.000Z', '2026-01-02T09:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 400, 400, 400, '2026-01-02T09:24:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 1, 60, 60, 60, '2026-01-02T09:24:00.000Z');

  -- HM-3914 | NANI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137991938' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3914', '2026-01-02T09:43:00.000Z', '2026-01-02T09:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-02T09:43:00.000Z');

  -- HM-3915 | SHARIFAH | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60139735876' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3915', '2026-01-03T04:51:00.000Z', '2026-01-03T04:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-03T04:51:00.000Z');

  -- HM-3916 | SHENA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601112883715' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3916', '2026-01-03T05:12:00.000Z', '2026-01-03T05:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-03T05:12:00.000Z');

  -- HM-3917 | AFIKA IZZATI E6841 | RM309
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601112949972' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 309, 0, 309, 'qr', 'completed', 'Zobaze HM-3917', '2026-01-03T05:12:00.000Z', '2026-01-03T05:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-03T05:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2026-01-03T05:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-03T05:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-03T05:12:00.000Z');

  -- HM-3918 |  | RM76
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 76, 0, 76, 'cash', 'completed', 'Zobaze HM-3918', '2026-01-03T05:13:00.000Z', '2026-01-03T05:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 2, 38, 38, 76, '2026-01-03T05:13:00.000Z');

  -- HM-3919 | SUE | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177261800' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'card', 'completed', 'Zobaze HM-3919', '2026-01-03T05:15:00.000Z', '2026-01-03T05:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-03T05:15:00.000Z');

  -- HM-3920 | DAMYA KARMILA | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60134547777' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3920', '2026-01-03T06:33:00.000Z', '2026-01-03T06:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 120, 120, 120, '2026-01-03T06:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-03T06:33:00.000Z');

  -- HM-3921 | NURUL AFIQAH GHAZALLI E6842 | RM368
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197750949' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 368, 0, 368, 'qr', 'completed', 'Zobaze HM-3921', '2026-01-03T06:47:00.000Z', '2026-01-03T06:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2026-01-03T06:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Scalp & Hair Treatment + Haircut', 1, 330, 330, 330, '2026-01-03T06:47:00.000Z');

  -- HM-3922 | SAILA SHAMINA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601127346536' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3922', '2026-01-03T08:27:00.000Z', '2026-01-03T08:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-03T08:27:00.000Z');

  -- HM-3923 | NURUL SYAHIRAH OSMAN E6397 | RM7
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60146154864' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 7, 0, 7, 'qr', 'completed', 'Zobaze HM-3923', '2026-01-03T08:43:00.000Z', '2026-01-03T08:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT BANGS' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT BANGS' LIMIT 1), gen_random_uuid()), 'HAIRCUT BANGS', 1, 7, 7, 7, '2026-01-03T08:43:00.000Z');

  -- HM-3924 | RAHMAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187837410' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3924', '2026-01-03T09:09:00.000Z', '2026-01-03T09:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-03T09:09:00.000Z');

  -- HM-3925 | NUR ASMAQ E6843 | RM299
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196669673' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 299, 0, 299, 'qr', 'completed', 'Zobaze HM-3925', '2026-01-03T09:22:00.000Z', '2026-01-03T09:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2026-01-03T09:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-03T09:22:00.000Z');

  -- HM-3926 | SHUN | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172828852' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3926', '2026-01-03T09:27:00.000Z', '2026-01-03T09:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-03T09:27:00.000Z');

  -- HM-3927 | SHAIDA | RM65
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60174541161' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 65, 0, 65, 'qr', 'completed', 'Zobaze HM-3927', '2026-01-04T03:27:00.000Z', '2026-01-04T03:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-04T03:27:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-04T03:27:00.000Z');

  -- HM-3928 | JARIJAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132886912' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3928', '2026-01-04T04:30:00.000Z', '2026-01-04T04:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-04T04:30:00.000Z');

  -- HM-3929 | RAZ | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601140336084' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-3929', '2026-01-04T06:05:00.000Z', '2026-01-04T06:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-04T06:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2026-01-04T06:05:00.000Z');

  -- HM-3930 | SHARIFAH HAFIZAH SYED ARIFFIN E0273 | RM380
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137715722' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 380, 0, 380, 'card', 'completed', 'Zobaze HM-3930', '2026-01-04T06:17:00.000Z', '2026-01-04T06:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese + Scalp Treatment/ Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese + Scalp Treatment/ Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Japanese + Scalp Treatment/ Hair Treatment + Haircut', 1, 380, 380, 380, '2026-01-04T06:17:00.000Z');

  -- HM-3931 | NABILAH IZYAN E6844 | RM428
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196496204' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 428, 0, 428, 'card', 'completed', 'Zobaze HM-3931', '2026-01-04T06:32:00.000Z', '2026-01-04T06:32:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2026-01-04T06:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2026-01-04T06:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-04T06:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-04T06:32:00.000Z');

  -- HM-3932 | Zila | RM100
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182894085' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 100, 0, 100, 'qr', 'completed', 'Zobaze HM-3932', '2026-01-04T08:04:00.000Z', '2026-01-04T08:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-04T08:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-04T08:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-04T08:04:00.000Z');

  -- HM-3933 | NABILAH MD NOH E6054 | RM340
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60105689689' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 340, 0, 340, 'qr', 'completed', 'Zobaze HM-3933', '2026-01-04T08:06:00.000Z', '2026-01-04T08:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-04T08:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-04T08:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-04T08:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-04T08:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-04T08:06:00.000Z');

  -- HM-3934 | SUHAILA MAT E0379 | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177191145' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'card', 'completed', 'Zobaze HM-3934', '2026-01-04T08:48:00.000Z', '2026-01-04T08:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2026-01-04T08:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-04T08:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-04T08:48:00.000Z');

  -- HM-3935 | LIYANA | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199529716' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-3935', '2026-01-04T09:13:00.000Z', '2026-01-04T09:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-04T09:13:00.000Z');

  -- HM-3936 | FATIN | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601121965807' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'card', 'completed', 'Zobaze HM-3936', '2026-01-04T09:37:00.000Z', '2026-01-04T09:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-04T09:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 60, 60, 60, '2026-01-04T09:37:00.000Z');

  -- HM-3937 | EKIN | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137500214' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3937', '2026-01-05T04:01:00.000Z', '2026-01-05T04:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-05T04:01:00.000Z');

  -- HM-3938 | SALFARINA SAMSUDIN E5610 | RM215
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197755563' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 215, 0, 215, 'qr', 'completed', 'Zobaze HM-3938', '2026-01-05T04:46:00.000Z', '2026-01-05T04:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-05T04:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 2, 70, 70, 140, '2026-01-05T04:46:00.000Z');

  -- HM-3939 |  | RM80
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'card', 'completed', 'Zobaze HM-3939', '2026-01-05T05:07:00.000Z', '2026-01-05T05:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 1, 80, 80, 80, '2026-01-05T05:07:00.000Z');

  -- HM-3940 | SITI NUR ATIKA | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111145078' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-3940', '2026-01-05T06:34:00.000Z', '2026-01-05T06:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-05T06:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-05T06:34:00.000Z');

  -- HM-3941 | SITI NORBAINI KAMARUDDIN E6845 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137875720' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3941', '2026-01-05T06:57:00.000Z', '2026-01-05T06:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-05T06:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-05T06:57:00.000Z');

END $$;

-- Batch 2/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3942 |  | RM18
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 18, 0, 18, 'cash', 'completed', 'Zobaze HM-3942', '2026-01-05T07:13:00.000Z', '2026-01-05T07:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 18, 18, 18, '2026-01-05T07:13:00.000Z');

  -- HM-3943 | AYU | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60145140816' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3943', '2026-01-05T08:39:00.000Z', '2026-01-05T08:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2026-01-05T08:39:00.000Z');

  -- HM-3944 | AZILA E6728 | RM110
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110754184' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 110, 0, 110, 'qr', 'completed', 'Zobaze HM-3944', '2026-01-05T08:54:00.000Z', '2026-01-05T08:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (1 hour)', 1, 110, 110, 110, '2026-01-05T08:54:00.000Z');

  -- HM-3945 | IMANI | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60173453025' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3945', '2026-01-05T09:06:00.000Z', '2026-01-05T09:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-05T09:06:00.000Z');

  -- HM-3946 | SAMSINAR MOHTAR E0630 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167337171' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3946', '2026-01-05T09:18:00.000Z', '2026-01-05T09:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-05T09:18:00.000Z');

  -- HM-3947 | amelia | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197178118' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3947', '2026-01-06T04:44:00.000Z', '2026-01-06T04:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-06T04:44:00.000Z');

  -- HM-3948 | HAJAR | RM210
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196637090' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 210, 0, 210, 'qr', 'completed', 'Zobaze HM-3948', '2026-01-06T05:01:00.000Z', '2026-01-06T05:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-06T05:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 2, 38, 38, 76, '2026-01-06T05:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-06T05:01:00.000Z');

  -- HM-3949 | NURUL AIN AZUDIN E4360 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126729227' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'cash', 'completed', 'Zobaze HM-3949', '2026-01-06T05:37:00.000Z', '2026-01-06T05:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-06T05:37:00.000Z');

  -- HM-3950 | ANNUR AINI BINTI ABDULLAH E6654 | RM160
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60169935487' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 160, 0, 160, 'qr', 'completed', 'Zobaze HM-3950', '2026-01-06T05:56:00.000Z', '2026-01-06T05:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-06T05:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-06T05:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-06T05:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-06T05:56:00.000Z');

  -- HM-3951 | SYAKIRA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601171102708' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3951', '2026-01-06T06:07:00.000Z', '2026-01-06T06:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-06T06:07:00.000Z');

  -- HM-3952 | JANNAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189766130' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3952', '2026-01-06T08:19:00.000Z', '2026-01-06T08:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2026-01-06T08:19:00.000Z');

  -- HM-3953 | SITI AISYAH SALIM E6846 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137491707' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'qr', 'completed', 'Zobaze HM-3953', '2026-01-06T09:07:00.000Z', '2026-01-06T09:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2026-01-06T09:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2026-01-06T09:07:00.000Z');

  -- HM-3954 | NURUL ASHYIKIN E1056 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127148281' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3954', '2026-01-06T09:59:00.000Z', '2026-01-06T09:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2026-01-06T09:59:00.000Z');

  -- HM-3955 | SUZANA SAAT E6847 | RM299
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167113514' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 299, 0, 299, 'card', 'completed', 'Zobaze HM-3955', '2026-01-06T10:02:00.000Z', '2026-01-06T10:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2026-01-06T10:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-06T10:02:00.000Z');

  -- HM-3956 | SAJ | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60424610996' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3956', '2026-01-06T10:17:00.000Z', '2026-01-06T10:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-06T10:17:00.000Z');

  -- HM-3957 | RAZIAH | RM100
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197511506' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 100, 0, 100, 'cash', 'completed', 'Zobaze HM-3957', '2026-01-06T10:21:00.000Z', '2026-01-06T10:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-06T10:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Medium)' LIMIT 1), gen_random_uuid()), 'Henna (Medium)', 1, 70, 70, 70, '2026-01-06T10:21:00.000Z');

  -- HM-3958 | SITI AISHAH ABDUL HAMID E0086 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197917133' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3958', '2026-01-08T03:33:00.000Z', '2026-01-08T03:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2026-01-08T03:33:00.000Z');

  -- HM-3959 | HAWA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127611359' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3959', '2026-01-08T04:38:00.000Z', '2026-01-08T04:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2026-01-08T04:38:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-08T04:38:00.000Z');

  -- HM-3960 | NORLELA E6848 | RM350
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123961423' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 350, 0, 350, 'card', 'completed', 'Zobaze HM-3960', '2026-01-08T04:59:00.000Z', '2026-01-08T04:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 300, 300, 300, '2026-01-08T04:59:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-08T04:59:00.000Z');

  -- HM-3961 | LIA | RM155
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197915206' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 155, 0, 155, 'cash', 'completed', 'Zobaze HM-3961', '2026-01-08T05:37:00.000Z', '2026-01-08T05:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-08T05:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-08T05:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-08T05:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-08T05:37:00.000Z');

  -- HM-3962 | ALIA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177217758' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3962', '2026-01-08T05:48:00.000Z', '2026-01-08T05:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-08T05:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-08T05:48:00.000Z');

  -- HM-3963 | HANIFAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127705605' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3963', '2026-01-08T06:30:00.000Z', '2026-01-08T06:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-08T06:30:00.000Z');

  -- HM-3964 | FATEEN | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60145377092' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-3964', '2026-01-08T07:33:00.000Z', '2026-01-08T07:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-08T07:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-08T07:33:00.000Z');

  -- HM-3965 | NUR AZRIN AZHANI E6849 | RM250
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137672509' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 250, 0, 250, 'card', 'completed', 'Zobaze HM-3965', '2026-01-08T08:08:00.000Z', '2026-01-08T08:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2026-01-08T08:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-08T08:08:00.000Z');

  -- HM-3966 | Jamaliah | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196632880' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3966', '2026-01-08T08:27:00.000Z', '2026-01-08T08:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-08T08:27:00.000Z');

  -- HM-3967 | MAS SHARIFAH E2309 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127801610' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3967', '2026-01-08T08:46:00.000Z', '2026-01-08T08:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 120, 120, 120, '2026-01-08T08:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-08T08:46:00.000Z');

  -- HM-3968 | NORHANI ABDUL NASIR | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177650040' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3968', '2026-01-08T09:11:00.000Z', '2026-01-08T09:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-08T09:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2026-01-08T09:11:00.000Z');

  -- HM-3969 | ARBAIYAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137066540' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3969', '2026-01-08T09:34:00.000Z', '2026-01-08T09:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-08T09:34:00.000Z');

  -- HM-3970 | SITI NORAISYAH E6850 | RM339
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193745093' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 339, 0, 339, 'card', 'completed', 'Zobaze HM-3970', '2026-01-08T10:06:00.000Z', '2026-01-08T10:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-08T10:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-08T10:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-08T10:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 1, 80, 80, 80, '2026-01-08T10:06:00.000Z');

  -- HM-3971 | NAJWA NAWAWI | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193148617' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'transfer', 'completed', 'Zobaze HM-3971', '2026-01-09T02:52:00.000Z', '2026-01-09T02:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-09T02:52:00.000Z');

  -- HM-3972 | MANISHA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142138132' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-3972', '2026-01-09T04:20:00.000Z', '2026-01-09T04:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-09T04:20:00.000Z');

  -- HM-3973 | EIMAN ALISA E6851 | RM220
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187721356' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 220, 0, 220, 'qr', 'completed', 'Zobaze HM-3973', '2026-01-09T04:48:00.000Z', '2026-01-09T04:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-09T04:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-09T04:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-09T04:48:00.000Z');

  -- HM-3974 |  | RM60
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'card', 'completed', 'Zobaze HM-3974', '2026-01-09T07:41:00.000Z', '2026-01-09T07:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-09T07:41:00.000Z');

  -- HM-3975 | NUR HANIRA HAMZAH E1290 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60192685654' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'transfer', 'completed', 'Zobaze HM-3975', '2026-01-09T08:24:00.000Z', '2026-01-09T08:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 280, 280, 280, '2026-01-09T08:24:00.000Z');

  -- HM-3976 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3976', '2026-01-09T08:53:00.000Z', '2026-01-09T08:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-09T08:53:00.000Z');

  -- HM-3977 |  | RM15
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-3977', '2026-01-09T09:21:00.000Z', '2026-01-09T09:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-09T09:21:00.000Z');

  -- HM-3978 | HABIBAH AHMAD E6379 | RM210
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127314668' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 210, 0, 210, 'card', 'completed', 'Zobaze HM-3978', '2026-01-09T09:42:00.000Z', '2026-01-09T09:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 180, 180, 180, '2026-01-09T09:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-09T09:42:00.000Z');

  -- HM-3979 | AINUL RAHMAH E6852 | RM239
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60168066831' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 239, 0, 239, 'qr', 'completed', 'Zobaze HM-3979', '2026-01-09T10:41:00.000Z', '2026-01-09T10:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-09T10:41:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-09T10:41:00.000Z');

  -- HM-3980 | EMY | RM118
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197782839' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 118, 0, 118, 'cash', 'completed', 'Zobaze HM-3980', '2026-01-09T11:19:00.000Z', '2026-01-09T11:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), gen_random_uuid()), 'HAIRCUT TEENAGER', 1, 18, 18, 18, '2026-01-09T11:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-09T11:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-09T11:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-09T11:19:00.000Z');

  -- HM-3981 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3981', '2026-01-10T02:46:00.000Z', '2026-01-10T02:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-10T02:46:00.000Z');

  -- HM-3982 | LILI | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137777031' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3982', '2026-01-10T03:14:00.000Z', '2026-01-10T03:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-10T03:14:00.000Z');

  -- HM-3983 | ADIBAH AISHAH E2441 | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3983', '2026-01-10T04:17:00.000Z', '2026-01-10T04:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-10T04:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2026-01-10T04:17:00.000Z');

  -- HM-3984 | NURUL NAJIHAH GHAZALLI E6853 | RM339
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177331814' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 339, 0, 339, 'qr', 'completed', 'Zobaze HM-3984', '2026-01-10T04:44:00.000Z', '2026-01-10T04:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2026-01-10T04:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-10T04:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'TRIAL GLOSS' LIMIT 1), (SELECT id FROM products WHERE name = 'TRIAL GLOSS' LIMIT 1), gen_random_uuid()), 'TRIAL GLOSS', 1, 20, 20, 20, '2026-01-10T04:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'TRIAL MASQUE' LIMIT 1), (SELECT id FROM products WHERE name = 'TRIAL MASQUE' LIMIT 1), gen_random_uuid()), 'TRIAL MASQUE', 1, 20, 20, 20, '2026-01-10T04:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-10T04:44:00.000Z');

  -- HM-3985 | SALWA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60179898181' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3985', '2026-01-10T05:18:00.000Z', '2026-01-10T05:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Wash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Wash Kids' LIMIT 1), gen_random_uuid()), 'Wash Kids', 1, 30, 30, 30, '2026-01-10T05:18:00.000Z');

  -- HM-3986 | LIZA | RM160
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117563460' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 160, 0, 160, 'qr', 'completed', 'Zobaze HM-3986', '2026-01-10T06:30:00.000Z', '2026-01-10T06:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 2, 80, 80, 160, '2026-01-10T06:30:00.000Z');

  -- HM-3987 | LIZA | RM40
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117563460' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'cash', 'completed', 'Zobaze HM-3987', '2026-01-10T06:32:00.000Z', '2026-01-10T06:32:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-10T06:32:00.000Z');

  -- HM-3984 | NURUL HUDA | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60143542429' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3984', '2026-01-10T08:42:00.000Z', '2026-01-10T08:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2026-01-10T08:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-10T08:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'TRIAL GLOSS' LIMIT 1), (SELECT id FROM products WHERE name = 'TRIAL GLOSS' LIMIT 1), gen_random_uuid()), 'TRIAL GLOSS', 1, 20, 20, 20, '2026-01-10T08:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'TRIAL MASQUE' LIMIT 1), (SELECT id FROM products WHERE name = 'TRIAL MASQUE' LIMIT 1), gen_random_uuid()), 'TRIAL MASQUE', 1, 20, 20, 20, '2026-01-10T08:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-10T08:42:00.000Z');

  -- HM-3988 | jannah | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601131405233' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3988', '2026-01-10T09:21:00.000Z', '2026-01-10T09:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-10T09:21:00.000Z');

  -- HM-3989 | YANI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177743933' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3989', '2026-01-10T09:45:00.000Z', '2026-01-10T09:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-10T09:45:00.000Z');

  -- HM-3990 | MARIAMAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601127888479' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3990', '2026-01-10T09:50:00.000Z', '2026-01-10T09:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-10T09:50:00.000Z');

END $$;

-- Batch 3/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3991 | Nuratikah | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196008891' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'card', 'completed', 'Zobaze HM-3991', '2026-01-10T09:55:00.000Z', '2026-01-10T09:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2026-01-10T09:55:00.000Z');

  -- HM-3992 | NURUL HUDA | RM53
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177493606' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 53, 0, 53, 'cash', 'completed', 'Zobaze HM-3992', '2026-01-10T10:22:00.000Z', '2026-01-10T10:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2026-01-10T10:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-10T10:22:00.000Z');

  -- HM-3993 | SITI HAJAR E6854 | RM368
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601133452481' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 368, 0, 368, 'card', 'completed', 'Zobaze HM-3993', '2026-01-10T10:41:00.000Z', '2026-01-10T10:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 330, 330, 330, '2026-01-10T10:41:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2026-01-10T10:41:00.000Z');

  -- HM-3994 | NORAINI IBRAHIM E0219 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197060642' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3994', '2026-01-11T02:29:00.000Z', '2026-01-11T02:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-11T02:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2026-01-11T02:29:00.000Z');

  -- HM-3995 | ROSANIZA | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125821357' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3995', '2026-01-11T02:56:00.000Z', '2026-01-11T02:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-11T02:56:00.000Z');

  -- HM-3996 | FAZILAH | RM120
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60135859464' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'qr', 'completed', 'Zobaze HM-3996', '2026-01-11T04:22:00.000Z', '2026-01-11T04:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-11T04:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 1, 80, 80, 80, '2026-01-11T04:22:00.000Z');

  -- HM-3997 | SARAH NAQIAH E6830 | RM358
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110302776' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 358, 0, 358, 'qr', 'completed', 'Zobaze HM-3997', '2026-01-11T04:30:00.000Z', '2026-01-11T04:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2026-01-11T04:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-11T04:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-11T04:30:00.000Z');

  -- HM-3998 | NUR FAJRINA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197822330' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3998', '2026-01-11T05:02:00.000Z', '2026-01-11T05:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-11T05:02:00.000Z');

  -- HM-3999 | NUR IZZATI E6855 | RM235
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197189157' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 235, 0, 235, 'cash', 'completed', 'Zobaze HM-3999', '2026-01-11T05:09:00.000Z', '2026-01-11T05:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-11T05:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2026-01-11T05:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-11T05:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-11T05:09:00.000Z');

  -- HM-4000 | QARMIELA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60108679233' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4000', '2026-01-11T05:24:00.000Z', '2026-01-11T05:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-11T05:24:00.000Z');

  -- HM-4001 | ZULAIKHA ZAINAL E6856 | RM210
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127077300' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 210, 0, 210, 'qr', 'completed', 'Zobaze HM-4001', '2026-01-11T06:41:00.000Z', '2026-01-11T06:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-11T06:41:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-11T06:41:00.000Z');

  -- HM-4002 | NORAZATUL | RM105
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129780835' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'qr', 'completed', 'Zobaze HM-4002', '2026-01-11T07:20:00.000Z', '2026-01-11T07:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 3, 30, 30, 90, '2026-01-11T07:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-11T07:20:00.000Z');

  -- HM-4003 | FARIZA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176940076' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4003', '2026-01-11T07:35:00.000Z', '2026-01-11T07:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-11T07:35:00.000Z');

  -- HM-4004 | AZIEMAH | RM48
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60184087345' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 48, 0, 48, 'qr', 'completed', 'Zobaze HM-4004', '2026-01-11T08:19:00.000Z', '2026-01-11T08:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-11T08:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2026-01-11T08:19:00.000Z');

  -- HM-4005 | Husna | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601115420502' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-4005', '2026-01-11T08:51:00.000Z', '2026-01-11T08:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-11T08:51:00.000Z');

  -- HM-4006 | TIYURMA SIREGAR | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117779194' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-4006', '2026-01-11T09:21:00.000Z', '2026-01-11T09:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-11T09:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-11T09:21:00.000Z');

  -- HM-4007 | SHIDAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197456303' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4007', '2026-01-11T09:24:00.000Z', '2026-01-11T09:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-11T09:24:00.000Z');

  -- HM-4008 | IJA | RM76
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601156369125' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 76, 0, 76, 'qr', 'completed', 'Zobaze HM-4008', '2026-01-11T09:39:00.000Z', '2026-01-11T09:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 2, 38, 38, 76, '2026-01-11T09:39:00.000Z');

  -- HM-4009 | MIMI | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197444032' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-4009', '2026-01-11T09:59:00.000Z', '2026-01-11T09:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-11T09:59:00.000Z');

  -- HM-4010 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4010', '2026-01-12T02:48:00.000Z', '2026-01-12T02:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-12T02:48:00.000Z');

  -- HM-4011 | NURUL IZZA YUSOFF E0166 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197127986' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4011', '2026-01-12T03:22:00.000Z', '2026-01-12T03:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-12T03:22:00.000Z');

  -- HM-4012 | FARAFADYLLA ZULKIFLY E6450 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137526609' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'qr', 'completed', 'Zobaze HM-4012', '2026-01-12T06:51:00.000Z', '2026-01-12T06:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 280, 280, 280, '2026-01-12T06:51:00.000Z');

  -- HM-4013 | FARAH IZZATI E6185 | RM600
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137707315' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 600, 0, 600, 'card', 'completed', 'Zobaze HM-4013', '2026-01-12T15:35:00.000Z', '2026-01-12T15:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese + Hair Treatment & Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese + Hair Treatment & Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Japanese + Hair Treatment & Scalp Treatment + Haircut', 1, 600, 600, 600, '2026-01-12T15:35:00.000Z');

  -- HM-4014 | FATIN NADZIRAH BINTI HASHIM E6255 | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182316531' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-4014', '2026-01-13T04:08:00.000Z', '2026-01-13T04:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2026-01-13T04:08:00.000Z');

  -- HM-4015 |  | RM50
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-4015', '2026-01-13T04:09:00.000Z', '2026-01-13T04:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-13T04:09:00.000Z');

  -- HM-4016 | ROZY | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137143236' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4016', '2026-01-13T04:29:00.000Z', '2026-01-13T04:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-13T04:29:00.000Z');

  -- HM-4017 | SALBIAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60143304618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4017', '2026-01-13T06:52:00.000Z', '2026-01-13T06:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-13T06:52:00.000Z');

  -- HM-4018 | NUSRAT | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601121709010' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-4018', '2026-01-13T07:53:00.000Z', '2026-01-13T07:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-13T07:53:00.000Z');

  -- HM-4019 | CHE NURMA E6857 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60148261607' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'cash', 'completed', 'Zobaze HM-4019', '2026-01-13T09:59:00.000Z', '2026-01-13T09:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-13T09:59:00.000Z');

  -- HM-4020 | SURIA MD SALLEH E6660 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127554550' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-4020', '2026-01-15T05:26:00.000Z', '2026-01-15T05:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 150, 150, 150, '2026-01-15T05:26:00.000Z');

  -- HM-4021 | MASTURA MAHFAR E2107 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137009356' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-4021', '2026-01-15T09:31:00.000Z', '2026-01-15T09:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-15T09:31:00.000Z');

  -- HM-4022 | NURUL ATHIRAH E6858 | RM200
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60139856101' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 200, 0, 200, 'qr', 'completed', 'Zobaze HM-4022', '2026-01-15T10:17:00.000Z', '2026-01-15T10:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2026-01-15T10:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-15T10:17:00.000Z');

  -- HM-4023 | KHAIRUL HAMIMAH ABAS E6305 | RM900
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127005316' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 900, 0, 900, 'qr', 'completed', 'Zobaze HM-4023', '2026-01-15T10:43:00.000Z', '2026-01-15T10:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 2, 170, 170, 340, '2026-01-15T10:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-15T10:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2026-01-15T10:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-15T10:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Highlight (Extra Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Highlight (Extra Long)' LIMIT 1), gen_random_uuid()), 'Highlight (Extra Long)', 1, 300, 300, 300, '2026-01-15T10:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-15T10:43:00.000Z');

  -- HM-4024 | NUR HANNANI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601112736041' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4024', '2026-01-16T03:25:00.000Z', '2026-01-16T03:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-16T03:25:00.000Z');

  -- HM-4025 | MASNAH SULAIMAN E6504 | RM229
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127410120' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 229, 0, 229, 'qr', 'completed', 'Zobaze HM-4025', '2026-01-16T04:54:00.000Z', '2026-01-16T04:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-16T04:54:00.000Z');

  -- HM-4026 | AZURA ALWEE E6860 | RM200
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137728875' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 200, 0, 200, 'qr', 'completed', 'Zobaze HM-4026', '2026-01-16T05:15:00.000Z', '2026-01-16T05:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2026-01-16T05:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-16T05:15:00.000Z');

  -- HM-4027 | SITI NORATIKAH MD NOR E6859 | RM190
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60164006752' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 190, 0, 190, 'qr', 'completed', 'Zobaze HM-4027', '2026-01-16T05:22:00.000Z', '2026-01-16T05:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-16T05:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-16T05:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-16T05:22:00.000Z');

  -- HM-4028 | NUR AINA ASYIKIN E6861 | RM428
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137770867' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 428, 0, 428, 'qr', 'completed', 'Zobaze HM-4028', '2026-01-16T08:58:00.000Z', '2026-01-16T08:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2026-01-16T08:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-16T08:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 299, 299, 299, '2026-01-16T08:58:00.000Z');

  -- HM-4029 | SITI NOR SHUHADA E6862 | RM269
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601124301107' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 269, 0, 269, 'qr', 'completed', 'Zobaze HM-4029', '2026-01-16T09:17:00.000Z', '2026-01-16T09:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-16T09:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-16T09:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-16T09:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-16T09:17:00.000Z');

  -- HM-4030 | YULIE | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60128010987' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4030', '2026-01-17T03:27:00.000Z', '2026-01-17T03:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-17T03:27:00.000Z');

  -- HM-4031 | AINA BATRISYA E6863 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177122154' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-4031', '2026-01-17T04:22:00.000Z', '2026-01-17T04:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-17T04:22:00.000Z');

  -- HM-4032 | FAIZA | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601114439943' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'transfer', 'completed', 'Zobaze HM-4032', '2026-01-17T05:30:00.000Z', '2026-01-17T05:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2026-01-17T05:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2026-01-17T05:30:00.000Z');

  -- HM-4033 | NUR SYAZWANI E6864 | RM589
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60108947280' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 589, 0, 589, 'card', 'completed', 'Zobaze HM-4033', '2026-01-17T06:08:00.000Z', '2026-01-17T06:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'G9 Moisture 1000ml' LIMIT 1), (SELECT id FROM products WHERE name = 'G9 Moisture 1000ml' LIMIT 1), gen_random_uuid()), 'G9 Moisture 1000ml', 1, 120, 120, 120, '2026-01-17T06:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-17T06:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 80, 80, 80, '2026-01-17T06:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-17T06:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-17T06:08:00.000Z');

  -- HM-4034 | NORHAYATI KHIDIR E6547 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137300430' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-4034', '2026-01-17T06:49:00.000Z', '2026-01-17T06:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-17T06:49:00.000Z');

  -- HM-4035 | NURSARAH SAFRI E6865 | RM378
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127683406' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 378, 0, 378, 'qr', 'completed', 'Zobaze HM-4035', '2026-01-17T08:20:00.000Z', '2026-01-17T08:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-17T08:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-17T08:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-17T08:20:00.000Z');

  -- HM-4036 |  | RM0
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 0, 0, 0, 'qr', 'completed', 'Zobaze HM-4036', '2026-01-17T08:47:00.000Z', '2026-01-17T08:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque (1 X free)' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque (1 X free)' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque (1 X free)', 1, 0, 0, 0, '2026-01-17T08:47:00.000Z');

  -- HM-4037 | SYAZWANI SENUSI | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177010776' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'card', 'completed', 'Zobaze HM-4037', '2026-01-17T08:54:00.000Z', '2026-01-17T08:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-17T08:54:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-17T08:54:00.000Z');

  -- HM-4038 | NABILATUL HUSNA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177056533' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4038', '2026-01-18T01:56:00.000Z', '2026-01-18T01:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-18T01:56:00.000Z');

  -- HM-4039 | KHAIRAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142828265' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4039', '2026-01-18T03:00:00.000Z', '2026-01-18T03:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-18T03:00:00.000Z');

  -- HM-4040 | Zarifah | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177408626' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4040', '2026-01-18T03:33:00.000Z', '2026-01-18T03:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-18T03:33:00.000Z');

END $$;

-- Batch 4/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-4041 | NURUL AFIQAH ABDUL RAZAK E2640 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60194137470' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-4041', '2026-01-18T03:53:00.000Z', '2026-01-18T03:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-18T03:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-18T03:53:00.000Z');

  -- HM-4042 | FALIHIN | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60134601302' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-4042', '2026-01-18T04:21:00.000Z', '2026-01-18T04:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-18T04:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-18T04:21:00.000Z');

  -- HM-4043 | MAHIRAH ARKANUDIN E6330 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137081632' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4043', '2026-01-18T05:08:00.000Z', '2026-01-18T05:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-18T05:08:00.000Z');

  -- HM-4044 | NOOR'AIN | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127780853' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4044', '2026-01-18T05:29:00.000Z', '2026-01-18T05:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-18T05:29:00.000Z');

  -- HM-4045 | NURUL HUDA BAHARUDDIN E2920 | RM1158
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60102261084' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 1158, 0, 1158, 'qr', 'completed', 'Zobaze HM-4045', '2026-01-18T06:39:00.000Z', '2026-01-18T06:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-18T06:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2026-01-18T06:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-18T06:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese + Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese + Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Japanese + Color + Scalp / Hair Treatment + Haircut', 1, 710, 710, 710, '2026-01-18T06:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-18T06:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-18T06:39:00.000Z');

  -- HM-4046 | NURUL DALILA ABDUL RAHIM E1859 | RM315
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60195474035' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 315, 0, 315, 'qr', 'completed', 'Zobaze HM-4046', '2026-01-18T06:45:00.000Z', '2026-01-18T06:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-18T06:45:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-18T06:45:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 250, 250, 250, '2026-01-18T06:45:00.000Z');

  -- HM-4047 | SITI LIYANA E6866 | RM200
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60102424239' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 200, 0, 200, 'qr', 'completed', 'Zobaze HM-4047', '2026-01-18T06:46:00.000Z', '2026-01-18T06:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-18T06:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2026-01-18T06:46:00.000Z');

  -- HM-4048 | NUR SABRINA MOHAMED E6642 | RM105
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176582848' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'qr', 'completed', 'Zobaze HM-4048', '2026-01-19T05:46:00.000Z', '2026-01-19T05:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-19T05:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-19T05:46:00.000Z');

  -- HM-4049 | HASLINA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127145120' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4049', '2026-01-20T02:18:00.000Z', '2026-01-20T02:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-20T02:18:00.000Z');

  -- HM-4050 | YAYA E6564 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60162215756' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-4050', '2026-01-20T03:37:00.000Z', '2026-01-20T03:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-20T03:37:00.000Z');

  -- HM-4051 | NUR SHUHADAH MAHZAN E1543 | RM270
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172347874' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 270, 0, 270, 'card', 'completed', 'Zobaze HM-4051', '2026-01-20T05:22:00.000Z', '2026-01-20T05:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-20T05:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-20T05:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2026-01-20T05:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-20T05:22:00.000Z');

  -- HM-4052 | FILZAH FAKHIRAH FAKHRI E6385 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60104115980' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'card', 'completed', 'Zobaze HM-4052', '2026-01-20T05:46:00.000Z', '2026-01-20T05:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-20T05:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-20T05:46:00.000Z');

  -- HM-4053 | RINA RUHAIZAH ABDUL KADIR E6415 | RM110
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60111114374' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 110, 0, 110, 'cash', 'completed', 'Zobaze HM-4053', '2026-01-20T08:25:00.000Z', '2026-01-20T08:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (1 hour)', 1, 110, 110, 110, '2026-01-20T08:25:00.000Z');

  -- HM-4054 | MAZNAH BINTI SENAWI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127951156' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4054', '2026-01-20T09:10:00.000Z', '2026-01-20T09:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-20T09:10:00.000Z');

  -- HM-4055 | NOR FASEHAH E6867 | RM395
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117625453' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 395, 0, 395, 'qr', 'completed', 'Zobaze HM-4055', '2026-01-20T10:03:00.000Z', '2026-01-20T10:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 15, 15, 15, '2026-01-20T10:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-20T10:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese (Medium)' LIMIT 1), gen_random_uuid()), 'Japanese (Medium)', 1, 280, 280, 280, '2026-01-20T10:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 70, 70, 70, '2026-01-20T10:03:00.000Z');

  -- HM-4056 | NUR TASNIM ABDUL HAFIDZ E4959 | RM380
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133046630' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 380, 0, 380, 'card', 'completed', 'Zobaze HM-4056', '2026-01-22T07:08:00.000Z', '2026-01-22T07:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 320, 320, 320, '2026-01-22T07:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-22T07:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-22T07:08:00.000Z');

  -- HM-4057 | ERNA JASLINA E6868 | RM239
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60104291255' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 239, 0, 239, 'qr', 'completed', 'Zobaze HM-4057', '2026-01-22T08:50:00.000Z', '2026-01-22T08:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-22T08:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-22T08:50:00.000Z');

  -- HM-4058 | ZARINA ISMAIL E4152 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167278628' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-4058', '2026-01-22T08:51:00.000Z', '2026-01-22T08:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-22T08:51:00.000Z');

  -- HM-4059 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4059', '2026-01-22T09:55:00.000Z', '2026-01-22T09:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-22T09:55:00.000Z');

  -- HM-4060 | CHE NURMA E6857 | RM200
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60148261607' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 200, 0, 200, 'cash', 'completed', 'Zobaze HM-4060', '2026-01-22T10:02:00.000Z', '2026-01-22T10:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (1 hour)', 1, 110, 110, 110, '2026-01-22T10:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Scrub' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Scrub' LIMIT 1), gen_random_uuid()), 'Full Body Scrub', 1, 90, 90, 90, '2026-01-22T10:02:00.000Z');

  -- HM-4061 | FAZLINA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187849429' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-4061', '2026-01-22T10:47:00.000Z', '2026-01-22T10:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-22T10:47:00.000Z');

  -- HM-4062 | NORHAIEDAH E6869 | RM310
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127060047' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 310, 0, 310, 'qr', 'completed', 'Zobaze HM-4062', '2026-01-22T12:28:00.000Z', '2026-01-22T12:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Long)' LIMIT 1), gen_random_uuid()), 'Color (Long)', 1, 280, 280, 280, '2026-01-22T12:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-22T12:28:00.000Z');

  -- HM-4063 | AMIRAH ATIKAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60135909160' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-4063', '2026-01-23T03:33:00.000Z', '2026-01-23T03:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-23T03:33:00.000Z');

  -- HM-4064 | NORIZAN TUMIN | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137621537' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-4064', '2026-01-23T08:12:00.000Z', '2026-01-23T08:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-23T08:12:00.000Z');

  -- HM-4065 | NAZIRAH | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137462102' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-4065', '2026-01-23T08:33:00.000Z', '2026-01-23T08:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-23T08:33:00.000Z');

  -- HM-4066 | INTAN BIDAYU E6870 | RM269
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177077025' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 269, 0, 269, 'transfer', 'completed', 'Zobaze HM-4066', '2026-01-23T08:43:00.000Z', '2026-01-23T08:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-23T08:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-23T08:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-23T08:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-23T08:43:00.000Z');

  -- HM-4067 | FARAH | RM65
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126262202' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 65, 0, 65, 'card', 'completed', 'Zobaze HM-4067', '2026-01-24T03:45:00.000Z', '2026-01-24T03:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-24T03:45:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-24T03:45:00.000Z');

  -- HM-4068 | SHARIFAH SALWA E6871 | RM355
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137005284' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 355, 0, 355, 'qr', 'completed', 'Zobaze HM-4068', '2026-01-24T04:35:00.000Z', '2026-01-24T04:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2026-01-24T04:35:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Hair / Scalp Treatment + Haircut', 1, 310, 310, 310, '2026-01-24T04:35:00.000Z');

  -- HM-4069 | FARAH | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126262202' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'card', 'completed', 'Zobaze HM-4069', '2026-01-24T04:58:00.000Z', '2026-01-24T04:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-24T04:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2026-01-24T04:58:00.000Z');

  -- HM-4070 | SUHANA ARIFFIN E6872 | RM318
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601128880369' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 318, 0, 318, 'qr', 'completed', 'Zobaze HM-4070', '2026-01-24T05:29:00.000Z', '2026-01-24T05:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-24T05:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-24T05:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2026-01-24T05:29:00.000Z');

  -- HM-4071 | SURAYA SUANDI E2004 | RM144
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137272713' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 144, 0, 144, 'qr', 'completed', 'Zobaze HM-4071', '2026-01-24T06:28:00.000Z', '2026-01-24T06:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'BACK MASSAGE' LIMIT 1), (SELECT id FROM products WHERE name = 'BACK MASSAGE' LIMIT 1), gen_random_uuid()), 'BACK MASSAGE', 1, 69, 69, 69, '2026-01-24T06:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-24T06:28:00.000Z');

  -- HM-4072 | IQA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197111719' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-4072', '2026-01-24T06:35:00.000Z', '2026-01-24T06:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-24T06:35:00.000Z');

  -- HM-4073 | HALIMATUL | RM115
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111022655' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 115, 0, 115, 'cash', 'completed', 'Zobaze HM-4073', '2026-01-24T07:55:00.000Z', '2026-01-24T07:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-24T07:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 3, 15, 15, 45, '2026-01-24T07:55:00.000Z');

  -- HM-4074 | NURUL FARHANI AB RAZAK E6574 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601115336848' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-4074', '2026-01-24T08:15:00.000Z', '2026-01-24T08:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2026-01-24T08:15:00.000Z');

  -- HM-4075 | ABRIZAH | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177001600' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'cash', 'completed', 'Zobaze HM-4075', '2026-01-24T09:13:00.000Z', '2026-01-24T09:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-24T09:13:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-24T09:13:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-24T09:13:00.000Z');

  -- HM-4076 | NURUL IZAH MOHAMAD | RM240
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187831741' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 240, 0, 240, 'qr', 'completed', 'Zobaze HM-4076', '2026-01-24T09:30:00.000Z', '2026-01-24T09:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-24T09:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2026-01-24T09:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-24T09:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-24T09:30:00.000Z');

  -- HM-4077 | NURLISSA HANIM MOHAMAD E6873 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137972745' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-4077', '2026-01-24T09:48:00.000Z', '2026-01-24T09:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2026-01-24T09:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-24T09:48:00.000Z');

  -- HM-4078 | SAHIRA | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189435194' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'card', 'completed', 'Zobaze HM-4078', '2026-01-24T09:51:00.000Z', '2026-01-24T09:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-24T09:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-24T09:51:00.000Z');

  -- HM-4079 | FILZA | RM135
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60166136799' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 135, 0, 135, 'card', 'completed', 'Zobaze HM-4079', '2026-01-24T10:10:00.000Z', '2026-01-24T10:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2026-01-24T10:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-24T10:10:00.000Z');

  -- HM-4080 | KARMILA | RM18
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127578837' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 18, 0, 18, 'qr', 'completed', 'Zobaze HM-4080', '2026-01-25T02:31:00.000Z', '2026-01-25T02:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), gen_random_uuid()), 'HAIRCUT TEENAGER', 1, 18, 18, 18, '2026-01-25T02:31:00.000Z');

  -- HM-4081 | NORASHIDAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177915459' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4081', '2026-01-25T04:29:00.000Z', '2026-01-25T04:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-25T04:29:00.000Z');

  -- HM-4082 | NORAINI IBRAHIM E0219 | RM230
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197060642' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 230, 0, 230, 'qr', 'completed', 'Zobaze HM-4082', '2026-01-25T05:08:00.000Z', '2026-01-25T05:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2026-01-25T05:08:00.000Z');

  -- HM-4083 | ANILA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137764551' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-4083', '2026-01-25T05:51:00.000Z', '2026-01-25T05:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-25T05:51:00.000Z');

  -- HM-4084 | AZIRAH E6874 | RM350
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60178737324' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 350, 0, 350, 'qr', 'completed', 'Zobaze HM-4084', '2026-01-25T06:34:00.000Z', '2026-01-25T06:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 1, 260, 260, 260, '2026-01-25T06:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 90, 90, 90, '2026-01-25T06:34:00.000Z');

  -- HM-4085 | MASITAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177445960' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4085', '2026-01-25T08:19:00.000Z', '2026-01-25T08:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-25T08:19:00.000Z');

  -- HM-4086 | UNGKU HILALLIYAH E6125 | RM345
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60149642284' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 345, 0, 345, 'qr', 'completed', 'Zobaze HM-4086', '2026-01-25T08:24:00.000Z', '2026-01-25T08:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2026-01-25T08:24:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 2, 150, 150, 300, '2026-01-25T08:24:00.000Z');

  -- HM-4087 | FITRI HANNA | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177124503' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-4087', '2026-01-25T08:55:00.000Z', '2026-01-25T08:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-25T08:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-25T08:55:00.000Z');

  -- HM-4088 | NUR AZWA E6875 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60104190734' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-4088', '2026-01-25T10:36:00.000Z', '2026-01-25T10:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-25T10:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-25T10:36:00.000Z');

  -- HM-4089 | NUR SHAFIQAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177227164' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4089', '2026-01-26T04:27:00.000Z', '2026-01-26T04:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-26T04:27:00.000Z');

  -- HM-4090 | NURUL HIDAYAH E6790 | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182196366' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'qr', 'completed', 'Zobaze HM-4090', '2026-01-26T07:37:00.000Z', '2026-01-26T07:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-26T07:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 1, 80, 80, 80, '2026-01-26T07:37:00.000Z');

END $$;

-- Batch 5/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-4091 | HAWIYAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60194774953' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4091', '2026-01-26T09:30:00.000Z', '2026-01-26T09:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-26T09:30:00.000Z');

  -- HM-4092 | SITI FATIMAH E6876 | RM660
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127375823' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 660, 0, 660, 'qr', 'completed', 'Zobaze HM-4092', '2026-01-26T10:15:00.000Z', '2026-01-26T10:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Extra Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Extra Long)' LIMIT 1), gen_random_uuid()), 'Color (Extra Long)', 1, 290, 290, 290, '2026-01-26T10:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Extra Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Extra Long)' LIMIT 1), gen_random_uuid()), 'Korean (Extra Long)', 1, 370, 370, 370, '2026-01-26T10:15:00.000Z');

  -- HM-4093 | PUAN MASAINI | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177127604' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-4093', '2026-01-27T03:52:00.000Z', '2026-01-27T03:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-27T03:52:00.000Z');

  -- HM-4094 | SURIANI AHMAD E6725 | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177614898' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-4094', '2026-01-27T04:19:00.000Z', '2026-01-27T04:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2026-01-27T04:19:00.000Z');

  -- HM-4095 | SHA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137942310' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4095', '2026-01-27T06:29:00.000Z', '2026-01-27T06:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-27T06:29:00.000Z');

  -- HM-4096 | BELLA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60107826713' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-4096', '2026-01-27T08:58:00.000Z', '2026-01-27T08:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-27T08:58:00.000Z');

  -- HM-4097 | NADIENE | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172358073' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-4097', '2026-01-27T09:54:00.000Z', '2026-01-27T09:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-27T09:54:00.000Z');

  -- HM-4098 | NURUL SUHADA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126364908' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-4098', '2026-01-27T10:10:00.000Z', '2026-01-27T10:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-27T10:10:00.000Z');

  -- HM-4099 | LATIFAH HASHIM E1424 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187733564' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4099', '2026-01-29T03:43:00.000Z', '2026-01-29T03:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-29T03:43:00.000Z');

  -- HM-4100 | HAFIZAH MOHD ALI E6374 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137447180' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4100', '2026-01-29T04:11:00.000Z', '2026-01-29T04:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-29T04:11:00.000Z');

  -- HM-4101 | SARIMAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601115230355' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4101', '2026-01-29T07:21:00.000Z', '2026-01-29T07:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-29T07:21:00.000Z');

  -- HM-4102 | SYARA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60192664900' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-4102', '2026-01-29T08:50:00.000Z', '2026-01-29T08:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-29T08:50:00.000Z');

  -- HM-4103 | AFINA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137661064' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-4103', '2026-01-29T08:51:00.000Z', '2026-01-29T08:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-29T08:51:00.000Z');

  -- HM-4104 | SITI | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601156489837' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-4104', '2026-01-29T09:09:00.000Z', '2026-01-29T09:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-29T09:09:00.000Z');

  -- HM-4105 | KAK JU | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197780358' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'cash', 'completed', 'Zobaze HM-4105', '2026-01-29T09:34:00.000Z', '2026-01-29T09:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-29T09:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-29T09:34:00.000Z');

  -- HM-4106 | NURUL 'AMIRAH ROSLAN E6597 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60194816587' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-4106', '2026-01-29T10:06:00.000Z', '2026-01-29T10:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-29T10:06:00.000Z');

  -- HM-4107 | IEZRAH | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60164145651' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-4107', '2026-01-29T10:09:00.000Z', '2026-01-29T10:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-29T10:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-29T10:09:00.000Z');

  -- HM-4108 | NAZIRAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199148491' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4108', '2026-01-30T03:43:00.000Z', '2026-01-30T03:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-30T03:43:00.000Z');

  -- HM-4109 | NOR HAZWANI | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176001497' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-4109', '2026-01-30T04:37:00.000Z', '2026-01-30T04:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Foot Massage' LIMIT 1), (SELECT id FROM products WHERE name = 'Foot Massage' LIMIT 1), gen_random_uuid()), 'Foot Massage', 1, 45, 45, 45, '2026-01-30T04:37:00.000Z');

  -- HM-4110 | SITI ZALEKA E6806 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137746735' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4110', '2026-01-30T06:17:00.000Z', '2026-01-30T06:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-30T06:17:00.000Z');

  -- HM-4111 | FIZA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60194292379' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-4111', '2026-01-30T06:17:00.000Z', '2026-01-30T06:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-30T06:17:00.000Z');

  -- HM-4112 | MAISARA FAISAL | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60105690952' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-4112', '2026-01-30T09:29:00.000Z', '2026-01-30T09:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2026-01-30T09:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2026-01-30T09:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2026-01-30T09:29:00.000Z');

  -- HM-4113 | MAHFUZAH BUANG E0084 | RM220
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197903005' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 220, 0, 220, 'card', 'completed', 'Zobaze HM-4113', '2026-01-30T09:43:00.000Z', '2026-01-30T09:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Medium)' LIMIT 1), gen_random_uuid()), 'Henna (Medium)', 1, 70, 70, 70, '2026-01-30T09:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-30T09:43:00.000Z');

  -- HM-4114 | HAYATI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197313361' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4114', '2026-01-30T10:02:00.000Z', '2026-01-30T10:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2026-01-30T10:02:00.000Z');

  -- HM-4115 | NUR ERMA ABD GHANI E6877 | RM450
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601153792001' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 450, 0, 450, 'qr', 'completed', 'Zobaze HM-4115', '2026-01-30T10:32:00.000Z', '2026-01-30T10:32:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese (Long)' LIMIT 1), gen_random_uuid()), 'Japanese (Long)', 1, 380, 380, 380, '2026-01-30T10:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 70, 70, 70, '2026-01-30T10:32:00.000Z');

  -- HM-4116 | HIDAYAH | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60175099859' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-4116', '2026-01-31T03:13:00.000Z', '2026-01-31T03:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2026-01-31T03:13:00.000Z');

  -- HM-4117 | NURHAIDA ABD MANAF E6878 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189864337' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'card', 'completed', 'Zobaze HM-4117', '2026-01-31T04:00:00.000Z', '2026-01-31T04:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-31T04:00:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 120, 120, 120, '2026-01-31T04:00:00.000Z');

  -- HM-4118 | MARYAM JAMILAH E6879 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60162669013' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-4118', '2026-01-31T04:07:00.000Z', '2026-01-31T04:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-31T04:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2026-01-31T04:07:00.000Z');

  -- HM-4119 | NIK NUR AISYAH IMAN | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196562804' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-4119', '2026-01-31T04:28:00.000Z', '2026-01-31T04:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2026-01-31T04:28:00.000Z');

  -- HM-4120 | ADIBAH AISHAH E2441 | RM95
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 95, 0, 95, 'qr', 'completed', 'Zobaze HM-4120', '2026-01-31T04:31:00.000Z', '2026-01-31T04:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2026-01-31T04:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2026-01-31T04:31:00.000Z');

  -- HM-4121 | ASYILAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60134955645' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-4121', '2026-01-31T05:13:00.000Z', '2026-01-31T05:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-31T05:13:00.000Z');

  -- HM-4122 | FARAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187937294' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-4122', '2026-01-31T05:14:00.000Z', '2026-01-31T05:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-31T05:14:00.000Z');

  -- HM-4123 | NORLIN | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197249017' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-4123', '2026-01-31T05:20:00.000Z', '2026-01-31T05:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-31T05:20:00.000Z');

  -- HM-4124 | RAMLAH RASHID | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137787768' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'cash', 'completed', 'Zobaze HM-4124', '2026-01-31T05:43:00.000Z', '2026-01-31T05:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2026-01-31T05:43:00.000Z');

  -- HM-4125 | FAUZIANA E6881 | RM383
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189797390' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 383, 0, 383, 'qr', 'completed', 'Zobaze HM-4125', '2026-01-31T06:39:00.000Z', '2026-01-31T06:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2026-01-31T06:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hydro Advance Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hydro Advance Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Hydro Advance Scalp Treatment', 1, 259, 259, 259, '2026-01-31T06:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-31T06:39:00.000Z');

  -- HM-4126 | ROHAIZA AHMAD E6690 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197513179' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-4126', '2026-01-31T07:34:00.000Z', '2026-01-31T07:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2026-01-31T07:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-31T07:34:00.000Z');

  -- HM-4127 | AISYAH | RM155
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167196202' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 155, 0, 155, 'cash', 'completed', 'Zobaze HM-4127', '2026-01-31T07:36:00.000Z', '2026-01-31T07:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2026-01-31T07:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2026-01-31T07:36:00.000Z');

  -- HM-4128 | ASMA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60194604672' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-4128', '2026-01-31T09:49:00.000Z', '2026-01-31T09:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2026-01-31T09:49:00.000Z');

  -- HM-4129 | SHAKILAH NAZ KASSIM E5993 | RM465
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197861958' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 465, 0, 465, 'qr', 'completed', 'Zobaze HM-4129', '2026-01-31T09:54:00.000Z', '2026-01-31T09:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2026-01-31T09:54:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2026-01-31T09:54:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Highlight (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Highlight (Medium)' LIMIT 1), gen_random_uuid()), 'Highlight (Medium)', 1, 200, 200, 200, '2026-01-31T09:54:00.000Z');

  -- HM-4130 |  | RM95
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 95, 0, 95, 'qr', 'completed', 'Zobaze HM-4130', '2026-01-31T10:01:00.000Z', '2026-01-31T10:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-31T10:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2026-01-31T10:01:00.000Z');

  -- HM-4131 | SUE E6780 | RM1029
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6090108242' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 1029, 0, 1029, 'card', 'completed', 'Zobaze HM-4131', '2026-01-31T10:04:00.000Z', '2026-01-31T10:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Long)' LIMIT 1), gen_random_uuid()), 'Color (Long)', 1, 280, 280, 280, '2026-01-31T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2026-01-31T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2026-01-31T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2026-01-31T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2026-01-31T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2026-01-31T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Highlight (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Highlight (Long)' LIMIT 1), gen_random_uuid()), 'Highlight (Long)', 1, 250, 250, 250, '2026-01-31T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2026-01-31T10:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 180, 180, 180, '2026-01-31T10:04:00.000Z');

END $$;
