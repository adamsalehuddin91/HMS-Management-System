-- ============================================
-- HMS Salon - Sales Import: 12-DEC-2025
-- Receipts: 204 | Items: 393 | Revenue: RM 30,549
-- Generated: 2026-02-09
-- ============================================

-- Run AFTER import-zobaze-data.sql (customers must exist)

-- Batch 1/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3686 | BALQIS MAZLAN E6803 | RM185
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182844642' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 185, 0, 185, 'card', 'completed', 'Zobaze HM-3686', '2025-12-01T04:55:00.000Z', '2025-12-01T04:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-01T04:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-01T04:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-01T04:55:00.000Z');

  -- HM-3687 | NUR KAMILAH ABD JALIL E6333 | RM145
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133735785' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 145, 0, 145, 'qr', 'completed', 'Zobaze HM-3687', '2025-12-01T06:40:00.000Z', '2025-12-01T06:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 2, 10, 10, 20, '2025-12-01T06:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-12-01T06:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-01T06:40:00.000Z');

  -- HM-3688 | NURUL HAZIQAH HARON E6802 | RM429
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127682040' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 429, 0, 429, 'card', 'completed', 'Zobaze HM-3688', '2025-12-01T07:21:00.000Z', '2025-12-01T07:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-01T07:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Medium)' LIMIT 1), gen_random_uuid()), 'Korean (Medium)', 1, 200, 200, 200, '2025-12-01T07:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-12-01T07:21:00.000Z');

  -- HM-3689 | AINUL MARDHIAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60122916712' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3689', '2025-12-01T07:34:00.000Z', '2025-12-01T07:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-01T07:34:00.000Z');

  -- HM-3690 | YATI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197812198' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3690', '2025-12-01T08:38:00.000Z', '2025-12-01T08:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-01T08:38:00.000Z');

  -- HM-3691 | ASYIKIN SASHA MOHD HANIF E6701 | RM400
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126261553' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 400, 0, 400, 'qr', 'completed', 'Zobaze HM-3691', '2025-12-01T09:09:00.000Z', '2025-12-01T09:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2025-12-01T09:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-12-01T09:09:00.000Z');

  -- HM-3692 | DINA | RM160
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60175710871' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 160, 0, 160, 'qr', 'completed', 'Zobaze HM-3692', '2025-12-02T09:49:00.000Z', '2025-12-02T09:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 2, 5, 5, 10, '2025-12-02T09:49:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 2, 75, 75, 150, '2025-12-02T09:49:00.000Z');

  -- HM-3693 | ROSNAH MOHD HASHIM E3753 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60146196433' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'cash', 'completed', 'Zobaze HM-3693', '2025-12-04T02:50:00.000Z', '2025-12-04T02:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-12-04T02:50:00.000Z');

  -- HM-3694 | MAZLIANA MUSTAFA E6804 | RM382
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60192715322' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 382, 0, 382, 'card', 'completed', 'Zobaze HM-3694', '2025-12-04T05:25:00.000Z', '2025-12-04T05:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'BACK MASSAGE' LIMIT 1), (SELECT id FROM products WHERE name = 'BACK MASSAGE' LIMIT 1), gen_random_uuid()), 'BACK MASSAGE', 1, 69, 69, 69, '2025-12-04T05:25:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-04T05:25:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-04T05:25:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-04T05:25:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 199, 199, 199, '2025-12-04T05:25:00.000Z');

  -- HM-3695 | NORMAIZURA SAID E6805 | RM110
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60192683246' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 110, 0, 110, 'cash', 'completed', 'Zobaze HM-3695', '2025-12-04T08:16:00.000Z', '2025-12-04T08:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-04T08:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Medium)' LIMIT 1), gen_random_uuid()), 'Henna (Medium)', 1, 80, 80, 80, '2025-12-04T08:16:00.000Z');

  -- HM-3696 | NOORZANA KHAMIS E6422 | RM320
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137792974' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 320, 0, 320, 'card', 'completed', 'Zobaze HM-3696', '2025-12-04T08:34:00.000Z', '2025-12-04T08:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-12-04T08:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 1, 90, 90, 90, '2025-12-04T08:34:00.000Z');

  -- HM-3697 | SYAFIQAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167642644' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3697', '2025-12-04T08:53:00.000Z', '2025-12-04T08:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-04T08:53:00.000Z');

  -- HM-3698 | Hamiza Hamzah | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177437107' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3698', '2025-12-04T09:14:00.000Z', '2025-12-04T09:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-04T09:14:00.000Z');

  -- HM-3699 | SITI | RM155
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137746735' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 155, 0, 155, 'cash', 'completed', 'Zobaze HM-3699', '2025-12-05T03:16:00.000Z', '2025-12-05T03:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-05T03:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-05T03:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 120, 120, 120, '2025-12-05T03:16:00.000Z');

  -- HM-3700 | MARZIHAN AB KARIM E0421 | RM229
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60162383801' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 229, 0, 229, 'qr', 'completed', 'Zobaze HM-3700', '2025-12-05T04:49:00.000Z', '2025-12-05T04:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Q10 Shampoo 1L' LIMIT 1), (SELECT id FROM products WHERE name = 'Q10 Shampoo 1L' LIMIT 1), gen_random_uuid()), 'Q10 Shampoo 1L', 1, 150, 150, 150, '2025-12-05T04:49:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'ROOT ACTIVATING SERUM' LIMIT 1), (SELECT id FROM products WHERE name = 'ROOT ACTIVATING SERUM' LIMIT 1), gen_random_uuid()), 'ROOT ACTIVATING SERUM', 1, 79, 79, 79, '2025-12-05T04:49:00.000Z');

  -- HM-3701 | ZARINA HARUN E6807 | RM305
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127302608' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 305, 0, 305, 'qr', 'completed', 'Zobaze HM-3701', '2025-12-05T06:31:00.000Z', '2025-12-05T06:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-12-05T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-05T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-12-05T06:31:00.000Z');

  -- HM-3702 | NURIN FARIZAL E6808 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601129335317' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'qr', 'completed', 'Zobaze HM-3702', '2025-12-05T07:10:00.000Z', '2025-12-05T07:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 40, 40, 40, '2025-12-05T07:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Medium)' LIMIT 1), gen_random_uuid()), 'Korean (Medium)', 1, 200, 200, 200, '2025-12-05T07:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 40, 40, 40, '2025-12-05T07:10:00.000Z');

  -- HM-3703 | FARAH NATASHA | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127006912' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3703', '2025-12-05T07:38:00.000Z', '2025-12-05T07:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-05T07:38:00.000Z');

  -- HM-3704 |  | RM45
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3704', '2025-12-05T09:17:00.000Z', '2025-12-05T09:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-12-05T09:17:00.000Z');

  -- HM-3705 | HAIDA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60165125641' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3705', '2025-12-05T09:18:00.000Z', '2025-12-05T09:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-05T09:18:00.000Z');

  -- HM-3706 | FARAHIN | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199732611' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-3706', '2025-12-05T09:34:00.000Z', '2025-12-05T09:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-12-05T09:34:00.000Z');

  -- HM-3707 | IRMAWATI | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177633507' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3707', '2025-12-05T09:55:00.000Z', '2025-12-05T09:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-05T09:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-05T09:55:00.000Z');

  -- HM-3708 | AINI NABILAH E6809 | RM405
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137564383' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 405, 0, 405, 'cash', 'completed', 'Zobaze HM-3708', '2025-12-06T04:50:00.000Z', '2025-12-06T04:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-12-06T04:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-06T04:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-06T04:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-06T04:50:00.000Z');

  -- HM-3709 | Aida | RM175
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137770078' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 175, 0, 175, 'transfer', 'completed', 'Zobaze HM-3709', '2025-12-06T05:11:00.000Z', '2025-12-06T05:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-12-06T05:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-06T05:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-06T05:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-12-06T05:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-06T05:11:00.000Z');

  -- HM-3710 | HAMIZAH MOHAMAD E6810 | RM898
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60126307819' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 898, 0, 898, 'card', 'completed', 'Zobaze HM-3710', '2025-12-06T06:31:00.000Z', '2025-12-06T06:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-06T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-12-06T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-06T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-12-06T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese (Long)' LIMIT 1), gen_random_uuid()), 'Japanese (Long)', 1, 380, 380, 380, '2025-12-06T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-06T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-06T06:31:00.000Z');

  -- HM-3711 | FARAH FADZIL E6811 | RM155
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129151969' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 155, 0, 155, 'qr', 'completed', 'Zobaze HM-3711', '2025-12-06T06:53:00.000Z', '2025-12-06T06:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-06T06:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-06T06:53:00.000Z');

  -- HM-3712 | KHAIRUNNISA KHAIRUL ANUAR E6812 | RM465
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601114129210' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 465, 0, 465, 'qr', 'completed', 'Zobaze HM-3712', '2025-12-06T08:47:00.000Z', '2025-12-06T08:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-06T08:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-06T08:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese (Medium)' LIMIT 1), gen_random_uuid()), 'Japanese (Medium)', 1, 280, 280, 280, '2025-12-06T08:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-06T08:47:00.000Z');

  -- HM-3713 | RAHIMAH RAHMAD E6813 | RM409
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177509272' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 409, 0, 409, 'card', 'completed', 'Zobaze HM-3713', '2025-12-06T08:51:00.000Z', '2025-12-06T08:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-06T08:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-12-06T08:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 60, 60, 60, '2025-12-06T08:51:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-06T08:51:00.000Z');

  -- HM-3714 | NUR MIRA ALISSA | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125895277' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3714', '2025-12-06T09:43:00.000Z', '2025-12-06T09:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-12-06T09:43:00.000Z');

  -- HM-3715 | SITI KHADIJAH | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60122840517' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-3715', '2025-12-06T09:59:00.000Z', '2025-12-06T09:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), gen_random_uuid()), 'HAIRCUT TEENAGER', 2, 20, 20, 40, '2025-12-06T09:59:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-06T09:59:00.000Z');

  -- HM-3716 | DELAYLA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110977805' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3716', '2025-12-07T04:18:00.000Z', '2025-12-07T04:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-07T04:18:00.000Z');

  -- HM-3717 | IZZAH | RM57
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137778556' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 57, 0, 57, 'qr', 'completed', 'Zobaze HM-3717', '2025-12-07T04:19:00.000Z', '2025-12-07T04:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT BANGS' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT BANGS' LIMIT 1), gen_random_uuid()), 'HAIRCUT BANGS', 1, 7, 7, 7, '2025-12-07T04:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-12-07T04:19:00.000Z');

  -- HM-3718 | AZILA E6728 | RM255
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110754184' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 255, 0, 255, 'qr', 'completed', 'Zobaze HM-3718', '2025-12-07T04:57:00.000Z', '2025-12-07T04:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2025-12-07T04:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-07T04:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-07T04:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-12-07T04:57:00.000Z');

  -- HM-3719 | NOR EMAN ISMAIL E1842 | RM558
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601136562751' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 558, 0, 558, 'qr', 'completed', 'Zobaze HM-3719', '2025-12-07T05:59:00.000Z', '2025-12-07T05:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-07T05:59:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 50, 50, 50, '2025-12-07T05:59:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-07T05:59:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-07T05:59:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 2, 80, 80, 160, '2025-12-07T05:59:00.000Z');

  -- HM-3720 | faiza | RM115
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127394005' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 115, 0, 115, 'qr', 'completed', 'Zobaze HM-3720', '2025-12-07T07:14:00.000Z', '2025-12-07T07:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-07T07:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-07T07:14:00.000Z');

  -- HM-3721 |  | RM75
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3721', '2025-12-07T07:38:00.000Z', '2025-12-07T07:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-07T07:38:00.000Z');

  -- HM-3722 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3722', '2025-12-07T07:52:00.000Z', '2025-12-07T07:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-07T07:52:00.000Z');

  -- HM-3723 |  | RM55
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-3723', '2025-12-07T08:36:00.000Z', '2025-12-07T08:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-07T08:36:00.000Z');

  -- HM-3724 | NUR AMALINA YUSOF E6561 | RM155
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60139131706' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 155, 0, 155, 'card', 'completed', 'Zobaze HM-3724', '2025-12-07T08:44:00.000Z', '2025-12-07T08:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (1 hour)', 1, 110, 110, 110, '2025-12-07T08:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-12-07T08:44:00.000Z');

  -- HM-3725 | NURFAIRUZ SHAMSUL KAMAL | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60136612366' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3725', '2025-12-07T09:57:00.000Z', '2025-12-07T09:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-07T09:57:00.000Z');

  -- HM-3726 | NUR ADILAH KHALIDAH E6814 | RM279
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60128270872' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 279, 0, 279, 'qr', 'completed', 'Zobaze HM-3726', '2025-12-07T10:01:00.000Z', '2025-12-07T10:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 50, 50, 50, '2025-12-07T10:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-07T10:01:00.000Z');

  -- HM-3727 | BONDA E6785 | RM119
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137396434' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 119, 0, 119, 'card', 'completed', 'Zobaze HM-3727', '2025-12-07T10:15:00.000Z', '2025-12-07T10:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'BACK MASSAGE' LIMIT 1), (SELECT id FROM products WHERE name = 'BACK MASSAGE' LIMIT 1), gen_random_uuid()), 'BACK MASSAGE', 1, 69, 69, 69, '2025-12-07T10:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-07T10:15:00.000Z');

  -- HM-3728 |  | RM0
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 0, 0, 0, 'cash', 'completed', 'Zobaze HM-3728', '2025-12-07T10:16:00.000Z', '2025-12-07T10:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss (1 X free)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss (1 X free)' LIMIT 1), gen_random_uuid()), 'Hair Gloss (1 X free)', 1, 0, 0, 0, '2025-12-07T10:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic (1 X free)' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic (1 X free)' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic (1 X free)', 1, 0, 0, 0, '2025-12-07T10:16:00.000Z');

  -- HM-3729 | MAHFUZAH MUSTAPHA E6409 | RM400
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60148051831' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 400, 0, 400, 'qr', 'completed', 'Zobaze HM-3729', '2025-12-07T10:55:00.000Z', '2025-12-07T10:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 400, 400, 400, '2025-12-07T10:55:00.000Z');

  -- HM-3730 | AYU | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167130849' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-3730', '2025-12-08T03:37:00.000Z', '2025-12-08T03:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-08T03:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-08T03:37:00.000Z');

  -- HM-3731 | IRA NORLIZA MUDA E4282 | RM1060
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137001753' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 1060, 0, 1060, 'transfer', 'completed', 'Zobaze HM-3731', '2025-12-08T11:10:00.000Z', '2025-12-08T11:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 610, 610, 610, '2025-12-08T11:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 400, 400, 400, '2025-12-08T11:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-08T11:10:00.000Z');

  -- HM-3732 | LIZA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197496746' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3732', '2025-12-09T02:25:00.000Z', '2025-12-09T02:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-09T02:25:00.000Z');

  -- HM-3733 |  | RM115
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 115, 0, 115, 'qr', 'completed', 'Zobaze HM-3733', '2025-12-09T05:56:00.000Z', '2025-12-09T05:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 2, 10, 10, 20, '2025-12-09T05:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-12-09T05:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-12-09T05:56:00.000Z');

  -- HM-3734 | FATIM | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601121786088' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-3734', '2025-12-09T07:10:00.000Z', '2025-12-09T07:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-09T07:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 60, 60, 60, '2025-12-09T07:10:00.000Z');

  -- HM-3735 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3735', '2025-12-09T07:46:00.000Z', '2025-12-09T07:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-09T07:46:00.000Z');

END $$;

-- Batch 2/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3736 |  | RM45
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3736', '2025-12-09T11:23:00.000Z', '2025-12-09T11:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-09T11:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-09T11:23:00.000Z');

  -- HM-3737 | RABIATUL ADAWIYAH AZMAN E6815 | RM300
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137318248' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 300, 0, 300, 'card', 'completed', 'Zobaze HM-3737', '2025-12-09T11:26:00.000Z', '2025-12-09T11:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Hair / Scalp Treatment + Haircut', 1, 300, 300, 300, '2025-12-09T11:26:00.000Z');

  -- HM-3738 | NUR ARDAWATI ADNAN E1013 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127442128' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3738', '2025-12-11T04:56:00.000Z', '2025-12-11T04:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-11T04:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-12-11T04:56:00.000Z');

  -- HM-3739 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3739', '2025-12-11T04:58:00.000Z', '2025-12-11T04:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-11T04:58:00.000Z');

  -- HM-3740 | SHAZLIEN ADENAN E6816 | RM450
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177912305' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 450, 0, 450, 'qr', 'completed', 'Zobaze HM-3740', '2025-12-11T07:21:00.000Z', '2025-12-11T07:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 80, 80, 80, '2025-12-11T07:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-11T07:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 1, 260, 260, 260, '2025-12-11T07:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 80, 80, 80, '2025-12-11T07:21:00.000Z');

  -- HM-3742 | SITI NUR HALIMAH E6817 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601127664136' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3742', '2025-12-11T08:29:00.000Z', '2025-12-11T08:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-11T08:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-11T08:29:00.000Z');

  -- HM-3743 | HANUMRA RAMLI E6818 | RM290
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197106971' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 290, 0, 290, 'card', 'completed', 'Zobaze HM-3743', '2025-12-11T10:20:00.000Z', '2025-12-11T10:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-12-11T10:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-11T10:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-11T10:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 1, 65, 65, 65, '2025-12-11T10:20:00.000Z');

  -- HM-3744 | MA KALTHUM ISHAK E6073 | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193657945' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'cash', 'completed', 'Zobaze HM-3744', '2025-12-12T04:30:00.000Z', '2025-12-12T04:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-12T04:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-12T04:30:00.000Z');

  -- HM-3745 | JUHAIZA TALIB E2250 | RM230
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197702865' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 230, 0, 230, 'card', 'completed', 'Zobaze HM-3745', '2025-12-12T06:48:00.000Z', '2025-12-12T06:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-12-12T06:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-12T06:48:00.000Z');

  -- HM-3746 | FARAHWAHIDA MOHD YUSOF E2280 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193531231' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3746', '2025-12-12T06:50:00.000Z', '2025-12-12T06:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-12T06:50:00.000Z');

  -- HM-3747 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3747', '2025-12-12T07:04:00.000Z', '2025-12-12T07:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-12T07:04:00.000Z');

  -- HM-3748 | SITI FATIMAH MD TAHRIN E6681 | RM79
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132399940' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 79, 0, 79, 'qr', 'completed', 'Zobaze HM-3748', '2025-12-12T07:39:00.000Z', '2025-12-12T07:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-12T07:39:00.000Z');

  -- HM-3749 | FATIN NAJIHA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142525732' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3749', '2025-12-13T02:52:00.000Z', '2025-12-13T02:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-13T02:52:00.000Z');

  -- HM-3750 | AISAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+609277655116' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3750', '2025-12-13T03:52:00.000Z', '2025-12-13T03:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-13T03:52:00.000Z');

  -- HM-3751 | SYAHIRAH | RM38
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60139121045' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 38, 0, 38, 'cash', 'completed', 'Zobaze HM-3751', '2025-12-13T04:29:00.000Z', '2025-12-13T04:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2025-12-13T04:29:00.000Z');

  -- HM-3752 | ALIYAA ZUHAIMY E2591 | RM229
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182445650' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 229, 0, 229, 'card', 'completed', 'Zobaze HM-3752', '2025-12-13T06:53:00.000Z', '2025-12-13T06:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-13T06:53:00.000Z');

  -- HM-3753 | SITI NOOR FAREHA | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167955951' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3753', '2025-12-13T07:11:00.000Z', '2025-12-13T07:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-13T07:11:00.000Z');

  -- HM-3754 | HANIS | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199102383' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3754', '2025-12-13T07:38:00.000Z', '2025-12-13T07:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-13T07:38:00.000Z');

  -- HM-3755 | PUTRI | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125509491' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3755', '2025-12-13T07:39:00.000Z', '2025-12-13T07:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-13T07:39:00.000Z');

  -- HM-3756 | NUR NABILAH KHAIRUL ANWAR | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60173732162' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3756', '2025-12-14T03:02:00.000Z', '2025-12-14T03:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-12-14T03:02:00.000Z');

  -- HM-3757 | FARAHIN | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60149321546' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3757', '2025-12-14T03:05:00.000Z', '2025-12-14T03:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-14T03:05:00.000Z');

  -- HM-3758 |  | RM65
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 65, 0, 65, 'cash', 'completed', 'Zobaze HM-3758', '2025-12-14T05:48:00.000Z', '2025-12-14T05:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-14T05:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 60, 60, 60, '2025-12-14T05:48:00.000Z');

  -- HM-3759 | MIRA | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60173675643' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-3759', '2025-12-14T07:27:00.000Z', '2025-12-14T07:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-14T07:27:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-14T07:27:00.000Z');

  -- HM-3760 | MARIANI MAT AIL E5923 | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177917396' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'card', 'completed', 'Zobaze HM-3760', '2025-12-14T08:41:00.000Z', '2025-12-14T08:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-14T08:41:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-12-14T08:41:00.000Z');

  -- HM-3761 | SITI NOOR FAREHA | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167955951' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'card', 'completed', 'Zobaze HM-3761', '2025-12-14T08:53:00.000Z', '2025-12-14T08:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-14T08:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 100, 100, 100, '2025-12-14T08:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-14T08:53:00.000Z');

  -- HM-3762 | MIRA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193148978' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3762', '2025-12-14T10:02:00.000Z', '2025-12-14T10:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-14T10:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2025-12-14T10:02:00.000Z');

  -- HM-3763 | NURUL ATIKAH MOHD SHUKOR | RM69
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601165511017' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 69, 0, 69, 'qr', 'completed', 'Zobaze HM-3763', '2025-12-15T02:41:00.000Z', '2025-12-15T02:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'BACK MASSAGE' LIMIT 1), (SELECT id FROM products WHERE name = 'BACK MASSAGE' LIMIT 1), gen_random_uuid()), 'BACK MASSAGE', 1, 69, 69, 69, '2025-12-15T02:41:00.000Z');

  -- HM-3764 | Norhaliza Abdul Rahman | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177043603' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3764', '2025-12-15T03:00:00.000Z', '2025-12-15T03:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-15T03:00:00.000Z');

  -- HM-3765 | NURUL | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177941628' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3765', '2025-12-15T03:33:00.000Z', '2025-12-15T03:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-15T03:33:00.000Z');

  -- HM-3766 | NORAZAH BAHARIM E1275 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197788829' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3766', '2025-12-15T04:42:00.000Z', '2025-12-15T04:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-15T04:42:00.000Z');

  -- HM-3767 | NURUL AFFYRA ANUAR E3944 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60104022726' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3767', '2025-12-15T05:06:00.000Z', '2025-12-15T05:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-15T05:06:00.000Z');

  -- HM-3768 | NURUL AKMALIAH HALIM E6819 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60186631630' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3768', '2025-12-15T06:27:00.000Z', '2025-12-15T06:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-15T06:27:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-15T06:27:00.000Z');

  -- HM-3769 | HASIDAH OTHMAN E1968 | RM100
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197288264' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 100, 0, 100, 'cash', 'completed', 'Zobaze HM-3769', '2025-12-15T06:57:00.000Z', '2025-12-15T06:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-15T06:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-12-15T06:57:00.000Z');

  -- HM-3770 | FATINI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60134836936' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3770', '2025-12-15T08:21:00.000Z', '2025-12-15T08:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-15T08:21:00.000Z');

  -- HM-3771 | NADHRATUN NABILA RASHID E6820 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601132015740' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3771', '2025-12-15T10:25:00.000Z', '2025-12-15T10:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-15T10:25:00.000Z');

  -- HM-3772 | AZATY HAMZAH E1240 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137575014' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3772', '2025-12-16T02:11:00.000Z', '2025-12-16T02:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-16T02:11:00.000Z');

  -- HM-3773 | FARISHA ADINA FOZITAUFIP E6822 | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601139224098' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'qr', 'completed', 'Zobaze HM-3773', '2025-12-16T06:10:00.000Z', '2025-12-16T06:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 130, 130, 130, '2025-12-16T06:10:00.000Z');

  -- HM-3774 | SALMIAH | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3774', '2025-12-16T06:27:00.000Z', '2025-12-16T06:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-16T06:27:00.000Z');

  -- HM-3775 | FATIHAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133341998' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3775', '2025-12-16T07:07:00.000Z', '2025-12-16T07:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-16T07:07:00.000Z');

  -- HM-3776 | RENI | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129454205' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'cash', 'completed', 'Zobaze HM-3776', '2025-12-16T07:31:00.000Z', '2025-12-16T07:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-16T07:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-12-16T07:31:00.000Z');

  -- HM-3777 | LAILA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60104071906' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3777', '2025-12-16T09:06:00.000Z', '2025-12-16T09:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-16T09:06:00.000Z');

  -- HM-3778 | MIMI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132914149' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3778', '2025-12-16T09:37:00.000Z', '2025-12-16T09:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-16T09:37:00.000Z');

  -- HM-3779 | FARAH | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177467994' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3779', '2025-12-18T06:28:00.000Z', '2025-12-18T06:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-18T06:28:00.000Z');

  -- HM-3780 | MASTURA MAHFAR E2107 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137009356' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3780', '2025-12-18T06:47:00.000Z', '2025-12-18T06:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-18T06:47:00.000Z');

  -- HM-3781 | ROKIAH IDRIS E1985 | RM245
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601115726986' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 245, 0, 245, 'card', 'completed', 'Zobaze HM-3781', '2025-12-18T07:08:00.000Z', '2025-12-18T07:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2025-12-18T07:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-18T07:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-12-18T07:08:00.000Z');

  -- HM-3782 | JUHAIZA TALIB E2250 | RM200
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197702865' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 200, 0, 200, 'card', 'completed', 'Zobaze HM-3782', '2025-12-18T08:50:00.000Z', '2025-12-18T08:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (1 hour)', 1, 110, 110, 110, '2025-12-18T08:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (45 minute)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (45 minute)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (45 minute)', 1, 90, 90, 90, '2025-12-18T08:50:00.000Z');

  -- HM-3783 | NUR AQILAH ALIAH E6823 | RM334
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60183644329' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 334, 0, 334, 'qr', 'completed', 'Zobaze HM-3783', '2025-12-18T10:01:00.000Z', '2025-12-18T10:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-18T10:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-18T10:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-18T10:01:00.000Z');

  -- HM-3784 | NAJWA NAWAWI | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193148617' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-3784', '2025-12-18T10:28:00.000Z', '2025-12-18T10:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-18T10:28:00.000Z');

  -- HM-3785 | NAJWA NAWAWI | RM115
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193148617' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 115, 0, 115, 'card', 'completed', 'Zobaze HM-3785', '2025-12-19T06:28:00.000Z', '2025-12-19T06:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-19T06:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-19T06:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Wash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Wash Kids' LIMIT 1), gen_random_uuid()), 'Wash Kids', 1, 30, 30, 30, '2025-12-19T06:28:00.000Z');

  -- HM-3786 | NORAZIAN E6824 | RM345
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6097909273' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 345, 0, 345, 'qr', 'completed', 'Zobaze HM-3786', '2025-12-19T07:36:00.000Z', '2025-12-19T07:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-19T07:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-19T07:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'SERVIS ANTI-KUTU' LIMIT 1), (SELECT id FROM products WHERE name = 'SERVIS ANTI-KUTU' LIMIT 1), gen_random_uuid()), 'SERVIS ANTI-KUTU', 1, 100, 100, 100, '2025-12-19T07:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 200, 200, 200, '2025-12-19T07:36:00.000Z');

END $$;

-- Batch 3/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3787 | MARIA AB HAMID E0205 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172203251' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3787', '2025-12-19T07:41:00.000Z', '2025-12-19T07:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-12-19T07:41:00.000Z');

  -- HM-3788 | SOFIA | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197557923' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'qr', 'completed', 'Zobaze HM-3788', '2025-12-19T08:49:00.000Z', '2025-12-19T08:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-19T08:49:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-12-19T08:49:00.000Z');

  -- HM-3789 | SYAZWANI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177823486' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3789', '2025-12-19T08:57:00.000Z', '2025-12-19T08:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-19T08:57:00.000Z');

  -- HM-3790 | SITI NOR AZLIANA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167659872' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3790', '2025-12-19T09:23:00.000Z', '2025-12-19T09:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-19T09:23:00.000Z');

  -- HM-3791 | MAHFUZAH BUANG E0084 | RM120
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197903005' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'cash', 'completed', 'Zobaze HM-3791', '2025-12-20T03:30:00.000Z', '2025-12-20T03:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-12-20T03:30:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-12-20T03:30:00.000Z');

  -- HM-3792 | RUS HABIZA BINTI ABD YARUS E6360 | RM339
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129607593' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 339, 0, 339, 'qr', 'completed', 'Zobaze HM-3792', '2025-12-20T04:17:00.000Z', '2025-12-20T04:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2025-12-20T04:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 40, 40, 40, '2025-12-20T04:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 219, 219, 219, '2025-12-20T04:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Wash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Wash Kids' LIMIT 1), gen_random_uuid()), 'Wash Kids', 1, 30, 30, 30, '2025-12-20T04:17:00.000Z');

  -- HM-3793 | JUE | RM138
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177338337' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 138, 0, 138, 'qr', 'completed', 'Zobaze HM-3793', '2025-12-20T04:56:00.000Z', '2025-12-20T04:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-20T04:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 45, 45, 45, '2025-12-20T04:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2025-12-20T04:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-20T04:56:00.000Z');

  -- HM-3794 |  | RM15
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-3794', '2025-12-20T04:57:00.000Z', '2025-12-20T04:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-20T04:57:00.000Z');

  -- HM-3795 |  | RM70
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'cash', 'completed', 'Zobaze HM-3795', '2025-12-20T05:43:00.000Z', '2025-12-20T05:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-12-20T05:43:00.000Z');

  -- HM-3796 | NORAZLINA E6825 | RM469
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177629297' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 469, 0, 469, 'card', 'completed', 'Zobaze HM-3796', '2025-12-20T08:23:00.000Z', '2025-12-20T08:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-20T08:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 49, 49, 49, '2025-12-20T08:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-12-20T08:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-20T08:23:00.000Z');

  -- HM-3797 | SAHIRA | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189435194' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'card', 'completed', 'Zobaze HM-3797', '2025-12-20T09:11:00.000Z', '2025-12-20T09:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-12-20T09:11:00.000Z');

  -- HM-3798 | NABIHAH E6826 | RM400
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6082010463' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 400, 0, 400, 'card', 'completed', 'Zobaze HM-3798', '2025-12-20T10:22:00.000Z', '2025-12-20T10:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-20T10:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Extra Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Extra Long)' LIMIT 1), gen_random_uuid()), 'Korean (Extra Long)', 1, 370, 370, 370, '2025-12-20T10:22:00.000Z');

  -- HM-3799 | NURUL AIDA HANAFFI E1965 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125601095' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-3799', '2025-12-21T04:46:00.000Z', '2025-12-21T04:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-21T04:46:00.000Z');

  -- HM-3800 | SUHAILA TAAT E6368 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197230507' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3800', '2025-12-21T04:46:00.000Z', '2025-12-21T04:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-21T04:46:00.000Z');

  -- HM-3801 | ZURAIDAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189546673' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3801', '2025-12-21T05:18:00.000Z', '2025-12-21T05:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-21T05:18:00.000Z');

  -- HM-3802 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3802', '2025-12-21T05:19:00.000Z', '2025-12-21T05:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-21T05:19:00.000Z');

  -- HM-3803 | ADIBAH AISHAH E2441 | RM40
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'cash', 'completed', 'Zobaze HM-3803', '2025-12-21T05:48:00.000Z', '2025-12-21T05:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-12-21T05:48:00.000Z');

  -- HM-3804 | EYRAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601161247428' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3804', '2025-12-21T06:48:00.000Z', '2025-12-21T06:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-21T06:48:00.000Z');

  -- HM-3805 | LIZA | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182917665' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-3805', '2025-12-21T08:01:00.000Z', '2025-12-21T08:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-21T08:01:00.000Z');

  -- HM-3806 | MAI | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601161306998' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3806', '2025-12-21T08:20:00.000Z', '2025-12-21T08:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-21T08:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-21T08:20:00.000Z');

  -- HM-3807 | AMINAH AHMAD E3327 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6093678734' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3807', '2025-12-21T08:31:00.000Z', '2025-12-21T08:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-12-21T08:31:00.000Z');

  -- HM-3808 | KAKMI | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197116467' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-3808', '2025-12-21T09:10:00.000Z', '2025-12-21T09:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-21T09:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-12-21T09:10:00.000Z');

  -- HM-3809 | NIK HUSNI HANIY MOHD HUSIN E6390 | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60136090929' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'card', 'completed', 'Zobaze HM-3809', '2025-12-21T09:58:00.000Z', '2025-12-21T09:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-21T09:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-12-21T09:58:00.000Z');

  -- HM-3810 | AZYAN | RM38
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137124212' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 38, 0, 38, 'qr', 'completed', 'Zobaze HM-3810', '2025-12-22T03:11:00.000Z', '2025-12-22T03:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2025-12-22T03:11:00.000Z');

  -- HM-3811 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3811', '2025-12-22T04:19:00.000Z', '2025-12-22T04:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-22T04:19:00.000Z');

  -- HM-3812 | NURUL AFIQAH FADZIL E6589 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167167878' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3812', '2025-12-22T05:18:00.000Z', '2025-12-22T05:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-22T05:18:00.000Z');

  -- HM-3813 | MISRIAH EMANI E1261 | RM245
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177635586' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 245, 0, 245, 'qr', 'completed', 'Zobaze HM-3813', '2025-12-22T06:15:00.000Z', '2025-12-22T06:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-22T06:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-22T06:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-12-22T06:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-22T06:15:00.000Z');

  -- HM-3814 | NOOR FAIZAH SAMSUDIN E6471 | RM190
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127913299' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 190, 0, 190, 'qr', 'completed', 'Zobaze HM-3814', '2025-12-22T06:16:00.000Z', '2025-12-22T06:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-22T06:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-22T06:16:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-22T06:16:00.000Z');

  -- HM-3815 | FATIN AZUA E6827 | RM140
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137328902' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 140, 0, 140, 'card', 'completed', 'Zobaze HM-3815', '2025-12-22T07:50:00.000Z', '2025-12-22T07:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 140, 140, 140, '2025-12-22T07:50:00.000Z');

  -- HM-3816 | SHARIFAH NADIAH E5809 | RM358
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60116210016' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 358, 0, 358, 'qr', 'completed', 'Zobaze HM-3816', '2025-12-22T07:53:00.000Z', '2025-12-22T07:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 50, 50, 50, '2025-12-22T07:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-22T07:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-22T07:53:00.000Z');

  -- HM-3817 | MIMI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60111127471' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3817', '2025-12-22T07:59:00.000Z', '2025-12-22T07:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-22T07:59:00.000Z');

  -- HM-3818 | ERIN | RM184
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60178340479' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 184, 0, 184, 'qr', 'completed', 'Zobaze HM-3818', '2025-12-22T08:14:00.000Z', '2025-12-22T08:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-22T08:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2025-12-22T08:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-22T08:14:00.000Z');

  -- HM-3819 | CEKDA E0205 | RM500
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177611645' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 500, 0, 500, 'qr', 'completed', 'Zobaze HM-3819', '2025-12-22T08:47:00.000Z', '2025-12-22T08:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-12-22T08:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 50, 50, 50, '2025-12-22T08:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-22T08:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Medium)' LIMIT 1), gen_random_uuid()), 'Korean (Medium)', 1, 200, 200, 200, '2025-12-22T08:47:00.000Z');

  -- HM-3820 | KAKMI | RM254
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197116467' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 254, 0, 254, 'cash', 'completed', 'Zobaze HM-3820', '2025-12-22T09:38:00.000Z', '2025-12-22T09:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 2, 10, 10, 20, '2025-12-22T09:38:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-12-22T09:38:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-22T09:38:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-22T09:38:00.000Z');

  -- HM-3821 | HAJAR | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197273961' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'qr', 'completed', 'Zobaze HM-3821', '2025-12-23T04:21:00.000Z', '2025-12-23T04:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 3, 30, 30, 90, '2025-12-23T04:21:00.000Z');

  -- HM-3822 | ALIA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601113275473' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3822', '2025-12-23T04:49:00.000Z', '2025-12-23T04:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-23T04:49:00.000Z');

  -- HM-3823 | MAZNAH | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177990029' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3823', '2025-12-23T06:12:00.000Z', '2025-12-23T06:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-12-23T06:12:00.000Z');

  -- HM-3824 | FATIN NADZIRAH BINTI HASHIM E6255 | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182316531' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-3824', '2025-12-23T06:13:00.000Z', '2025-12-23T06:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-12-23T06:13:00.000Z');

  -- HM-3825 | IZZAH NASRI | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601165115501' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3825', '2025-12-23T06:14:00.000Z', '2025-12-23T06:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-12-23T06:14:00.000Z');

  -- HM-3826 | NAZIRAH M TAHRIR E6179 | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197610768' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'card', 'completed', 'Zobaze HM-3826', '2025-12-23T08:05:00.000Z', '2025-12-23T08:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-23T08:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-23T08:05:00.000Z');

  -- HM-3827 | SITI | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601121543451' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3827', '2025-12-23T08:53:00.000Z', '2025-12-23T08:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-23T08:53:00.000Z');

  -- HM-3828 | AMIRAH | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60145623035' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3828', '2025-12-23T09:17:00.000Z', '2025-12-23T09:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-23T09:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-12-23T09:17:00.000Z');

  -- HM-3829 | MA KALTHUM ISHAK E6073 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193657945' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-3829', '2025-12-23T09:55:00.000Z', '2025-12-23T09:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Medium)' LIMIT 1), gen_random_uuid()), 'Henna (Medium)', 1, 70, 70, 70, '2025-12-23T09:55:00.000Z');

  -- HM-3830 | NURFASHA AQILAH E6617 | RM135
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60183614165' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 135, 0, 135, 'qr', 'completed', 'Zobaze HM-3830', '2025-12-25T06:55:00.000Z', '2025-12-25T06:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-12-25T06:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-25T06:55:00.000Z');

  -- HM-3831 | NALIZA HASSAN E6443 | RM385
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176575878' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 385, 0, 385, 'qr', 'completed', 'Zobaze HM-3831', '2025-12-25T06:58:00.000Z', '2025-12-25T06:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (1 hour)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (1 hour)', 1, 110, 110, 110, '2025-12-25T06:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 2, 10, 10, 20, '2025-12-25T06:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-25T06:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-25T06:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-25T06:58:00.000Z');

  -- HM-3832 | ATIRAH | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167089011' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'cash', 'completed', 'Zobaze HM-3832', '2025-12-25T06:59:00.000Z', '2025-12-25T06:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult  (1 X free)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult  (1 X free)' LIMIT 1), gen_random_uuid()), 'Haircut Adult  (1 X free)', 1, 0, 0, 0, '2025-12-25T06:59:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-25T06:59:00.000Z');

  -- HM-3833 | TIKAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137922017' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3833', '2025-12-25T07:00:00.000Z', '2025-12-25T07:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-25T07:00:00.000Z');

  -- HM-3834 | NURLINA E6539 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60195594694' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3834', '2025-12-25T07:01:00.000Z', '2025-12-25T07:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-12-25T07:01:00.000Z');

  -- HM-3835 | NABILA HUDA E6520 | RM190
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60102183775' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 190, 0, 190, 'cash', 'completed', 'Zobaze HM-3835', '2025-12-25T07:05:00.000Z', '2025-12-25T07:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-25T07:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-25T07:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-25T07:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-25T07:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-25T07:05:00.000Z');

  -- HM-3836 | SITI HAWA | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172329586' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3836', '2025-12-25T07:25:00.000Z', '2025-12-25T07:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-25T07:25:00.000Z');

END $$;

-- Batch 4/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3837 | IZZATI | RM65
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601128672527' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 65, 0, 65, 'qr', 'completed', 'Zobaze HM-3837', '2025-12-25T07:46:00.000Z', '2025-12-25T07:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-25T07:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-25T07:46:00.000Z');

  -- HM-3838 | FATIHAH | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601163908089' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-3838', '2025-12-25T09:37:00.000Z', '2025-12-25T09:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-25T09:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-25T09:37:00.000Z');

  -- HM-3839 | FATIHAH | RM105
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601163908089' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'qr', 'completed', 'Zobaze HM-3839', '2025-12-25T09:42:00.000Z', '2025-12-25T09:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-25T09:42:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-25T09:42:00.000Z');

  -- HM-3840 | IMAN RASYIDAH E6828 | RM280
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177079700' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 280, 0, 280, 'qr', 'completed', 'Zobaze HM-3840', '2025-12-25T10:24:00.000Z', '2025-12-25T10:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-25T10:24:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-12-25T10:24:00.000Z');

  -- HM-3841 | AIN | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137792784' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3841', '2025-12-26T03:11:00.000Z', '2025-12-26T03:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-26T03:11:00.000Z');

  -- HM-3842 | ALYA | RM120
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60173283752' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'qr', 'completed', 'Zobaze HM-3842', '2025-12-26T05:38:00.000Z', '2025-12-26T05:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 4, 30, 30, 120, '2025-12-26T05:38:00.000Z');

  -- HM-3843 | LATIFAH INSANIAH SELAMAT | RM173
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127979576' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 173, 0, 173, 'qr', 'completed', 'Zobaze HM-3843', '2025-12-26T07:15:00.000Z', '2025-12-26T07:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-12-26T07:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-26T07:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2025-12-26T07:15:00.000Z');

  -- HM-3844 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3844', '2025-12-26T07:42:00.000Z', '2025-12-26T07:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-26T07:42:00.000Z');

  -- HM-3845 | SARAH AMELIA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197562396' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3845', '2025-12-26T08:03:00.000Z', '2025-12-26T08:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-26T08:03:00.000Z');

  -- HM-3846 | NOR ASYIQIN E6829 | RM340
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601119862746' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 340, 0, 340, 'qr', 'completed', 'Zobaze HM-3846', '2025-12-26T08:26:00.000Z', '2025-12-26T08:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 80, 80, 80, '2025-12-26T08:26:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 1, 260, 260, 260, '2025-12-26T08:26:00.000Z');

  -- HM-3847 | ELLA E6761 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193450422' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3847', '2025-12-26T08:46:00.000Z', '2025-12-26T08:46:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-12-26T08:46:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-26T08:46:00.000Z');

  -- HM-3848 | NORAIN | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137955990' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3848', '2025-12-26T09:37:00.000Z', '2025-12-26T09:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-26T09:37:00.000Z');

  -- HM-3849 | SITI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197615011' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3849', '2025-12-27T02:57:00.000Z', '2025-12-27T02:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-27T02:57:00.000Z');

  -- HM-3850 | JAMALIAH ALI | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137811116' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3850', '2025-12-27T03:44:00.000Z', '2025-12-27T03:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-27T03:44:00.000Z');

  -- HM-3851 | ROHAYU MOHD SALLEH E5944 | RM470
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127718393' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 470, 0, 470, 'transfer', 'completed', 'Zobaze HM-3851', '2025-12-27T04:57:00.000Z', '2025-12-27T04:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-27T04:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-12-27T04:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-12-27T04:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 20, 20, 20, '2025-12-27T04:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Medium)' LIMIT 1), gen_random_uuid()), 'Korean (Medium)', 1, 200, 200, 200, '2025-12-27T04:57:00.000Z');

  -- HM-3852 | SARAH NAQIAH E6830 | RM304
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110302776' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 304, 0, 304, 'qr', 'completed', 'Zobaze HM-3852', '2025-12-27T05:43:00.000Z', '2025-12-27T05:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-27T05:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-27T05:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-27T05:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-27T05:43:00.000Z');

  -- HM-3853 | MAR | RM100
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137143812' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 100, 0, 100, 'qr', 'completed', 'Zobaze HM-3853', '2025-12-27T05:47:00.000Z', '2025-12-27T05:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-12-27T05:47:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-27T05:47:00.000Z');

  -- HM-3854 | NUR AIDIL E6831 | RM310
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601127391844' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 310, 0, 310, 'qr', 'completed', 'Zobaze HM-3854', '2025-12-27T07:09:00.000Z', '2025-12-27T07:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-27T07:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 260, 260, 260, '2025-12-27T07:09:00.000Z');

  -- HM-3855 | ZULAIKA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111486287' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3855', '2025-12-27T07:11:00.000Z', '2025-12-27T07:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 60, 60, 60, '2025-12-27T07:11:00.000Z');

  -- HM-3856 | SHIKIN | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197409880' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3856', '2025-12-27T08:20:00.000Z', '2025-12-27T08:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-12-27T08:20:00.000Z');

  -- HM-3857 | FAIZA | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127565955' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3857', '2025-12-27T09:23:00.000Z', '2025-12-27T09:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-27T09:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-27T09:23:00.000Z');

  -- HM-3858 | FATIHA | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60165962440' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3858', '2025-12-27T09:33:00.000Z', '2025-12-27T09:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-12-27T09:33:00.000Z');

  -- HM-3859 | FIZA | RM159
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601113350953' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 159, 0, 159, 'cash', 'completed', 'Zobaze HM-3859', '2025-12-28T02:06:00.000Z', '2025-12-28T02:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-12-28T02:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-28T02:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-28T02:06:00.000Z');

  -- HM-3860 | ASMAA AFIQAH | RM120
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60195300712' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'card', 'completed', 'Zobaze HM-3860', '2025-12-28T03:18:00.000Z', '2025-12-28T03:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (45 minute)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (45 minute)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (45 minute)', 1, 90, 90, 90, '2025-12-28T03:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-28T03:18:00.000Z');

  -- HM-3861 | AIDA AZMAN E5768 | RM129
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142756804' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 129, 0, 129, 'qr', 'completed', 'Zobaze HM-3861', '2025-12-28T04:22:00.000Z', '2025-12-28T04:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-28T04:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-28T04:22:00.000Z');

  -- HM-3862 | DHUZAILINAWATI KAMARUDDIN E6832 | RM400
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137780030' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 400, 0, 400, 'transfer', 'completed', 'Zobaze HM-3862', '2025-12-28T04:41:00.000Z', '2025-12-28T04:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-12-28T04:41:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 180, 180, 180, '2025-12-28T04:41:00.000Z');

  -- HM-3863 | AIDA AZMAN E5768 | RM370
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142756804' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 370, 0, 370, 'cash', 'completed', 'Zobaze HM-3863', '2025-12-28T04:45:00.000Z', '2025-12-28T04:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 300, 300, 300, '2025-12-28T04:45:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-12-28T04:45:00.000Z');

  -- HM-3864 | JOHANNA JOHARI E6733 | RM78
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137754242' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 78, 0, 78, 'cash', 'completed', 'Zobaze HM-3864', '2025-12-28T07:44:00.000Z', '2025-12-28T07:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-12-28T07:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2025-12-28T07:44:00.000Z');

  -- HM-3866 | SYASYA AMIRA E6833 | RM830
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6097238285' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 830, 0, 830, 'card', 'completed', 'Zobaze HM-3866', '2025-12-28T07:54:00.000Z', '2025-12-28T07:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Long)' LIMIT 1), gen_random_uuid()), 'Color (Long)', 1, 280, 280, 280, '2025-12-28T07:54:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 330, 330, 330, '2025-12-28T07:54:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 220, 220, 220, '2025-12-28T07:54:00.000Z');

  -- HM-3867 | NAJIHA | RM65
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601161199370' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 65, 0, 65, 'qr', 'completed', 'Zobaze HM-3867', '2025-12-28T08:27:00.000Z', '2025-12-28T08:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-28T08:27:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-12-28T08:27:00.000Z');

  -- HM-3868 | NURULZAIMA A MAJID E4355 | RM320
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197617017' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 320, 0, 320, 'qr', 'completed', 'Zobaze HM-3868', '2025-12-28T09:16:00.000Z', '2025-12-28T09:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 320, 320, 320, '2025-12-28T09:16:00.000Z');

  -- HM-3869 | DHIYA ALFINA | RM155
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196879462' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 155, 0, 155, 'qr', 'completed', 'Zobaze HM-3869', '2025-12-28T09:20:00.000Z', '2025-12-28T09:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-12-28T09:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 2, 75, 75, 150, '2025-12-28T09:20:00.000Z');

  -- HM-3870 | LINDA | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110402459' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3870', '2025-12-28T09:48:00.000Z', '2025-12-28T09:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-28T09:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-28T09:48:00.000Z');

  -- HM-3871 | SALINA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197769196' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3871', '2025-12-29T02:52:00.000Z', '2025-12-29T02:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-29T02:52:00.000Z');

  -- HM-3872 | NUR FARINNA 6835 | RM230
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111428673' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 230, 0, 230, 'qr', 'completed', 'Zobaze HM-3872', '2025-12-29T03:56:00.000Z', '2025-12-29T03:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-29T03:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-29T03:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-29T03:56:00.000Z');

  -- HM-3873 | NUR THOHIRAH E6834 | RM428
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601131791240' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 428, 0, 428, 'card', 'completed', 'Zobaze HM-3873', '2025-12-29T04:11:00.000Z', '2025-12-29T04:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2025-12-29T04:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-12-29T04:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-29T04:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-29T04:11:00.000Z');

  -- HM-3874 | AZIAN | RM120
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177247559' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'qr', 'completed', 'Zobaze HM-3874', '2025-12-29T05:41:00.000Z', '2025-12-29T05:41:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 2, 45, 45, 90, '2025-12-29T05:41:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-29T05:41:00.000Z');

  -- HM-3875 | SALIZA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137431577' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3875', '2025-12-29T06:11:00.000Z', '2025-12-29T06:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-29T06:11:00.000Z');

  -- HM-3876 | IZZAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601156663045' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3876', '2025-12-29T06:53:00.000Z', '2025-12-29T06:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-29T06:53:00.000Z');

  -- HM-3877 | NUR SYUHADA FARHANY E6836 | RM350
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601118505386' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 350, 0, 350, 'cash', 'completed', 'Zobaze HM-3877', '2025-12-29T06:57:00.000Z', '2025-12-29T06:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-29T06:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Hair / Scalp Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Hair / Scalp Treatment + Haircut', 1, 300, 300, 300, '2025-12-29T06:57:00.000Z');

  -- HM-3878 | ZAITUL NADIAH E6616 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601112105933' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3878', '2025-12-29T07:21:00.000Z', '2025-12-29T07:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-29T07:21:00.000Z');

  -- HM-3879 | MAKJAH | RM90
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123171960' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 90, 0, 90, 'cash', 'completed', 'Zobaze HM-3879', '2025-12-29T08:08:00.000Z', '2025-12-29T08:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-12-29T08:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2025-12-29T08:08:00.000Z');

  -- HM-3880 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3880', '2025-12-29T09:04:00.000Z', '2025-12-29T09:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-29T09:04:00.000Z');

  -- HM-3881 | AINITA | RM245
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129018253' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 245, 0, 245, 'cash', 'completed', 'Zobaze HM-3881', '2025-12-29T09:48:00.000Z', '2025-12-29T09:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-29T09:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-12-29T09:48:00.000Z');

  -- HM-3882 | NUR FATHIAH | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177456169' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3882', '2025-12-29T10:03:00.000Z', '2025-12-29T10:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-29T10:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Wash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Wash Kids' LIMIT 1), gen_random_uuid()), 'Wash Kids', 1, 30, 30, 30, '2025-12-29T10:03:00.000Z');

  -- HM-3883 | NOOR ASNIDA SHAHANI E6781 | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127902255' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'card', 'completed', 'Zobaze HM-3883', '2025-12-29T11:05:00.000Z', '2025-12-29T11:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-29T11:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-12-29T11:05:00.000Z');

  -- HM-3884 | NUURUL AFIFAH HUSIN E3930 | RM620
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60138535321' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 620, 0, 620, 'card', 'completed', 'Zobaze HM-3884', '2025-12-29T11:34:00.000Z', '2025-12-29T11:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-29T11:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean + Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean + Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Korean + Color + Scalp / Hair Treatment + Haircut', 1, 570, 570, 570, '2025-12-29T11:34:00.000Z');

  -- HM-3885 | SITI NURFATIN IMRAN E6120 | RM240
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601120563914' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 240, 0, 240, 'qr', 'completed', 'Zobaze HM-3885', '2025-12-30T06:40:00.000Z', '2025-12-30T06:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-30T06:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-30T06:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 2, 75, 75, 150, '2025-12-30T06:40:00.000Z');

  -- HM-3886 | FADZILAH RAHMAT E6657 | RM819
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127201517' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 819, 0, 819, 'card', 'completed', 'Zobaze HM-3886', '2025-12-30T07:09:00.000Z', '2025-12-30T07:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 371, 371, 371, '2025-12-30T07:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-30T07:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Ice Spa' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Ice Spa' LIMIT 1), gen_random_uuid()), 'Gold 9 Ice Spa', 1, 50, 50, 50, '2025-12-30T07:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-12-30T07:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-12-30T07:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-12-30T07:09:00.000Z');

  -- HM-3887 | SITI NURFATIN IMRAN E6120 | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601120563914' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'card', 'completed', 'Zobaze HM-3887', '2025-12-30T07:10:00.000Z', '2025-12-30T07:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-30T07:10:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-12-30T07:10:00.000Z');

END $$;

-- Batch 5/5
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3888 | AHLIA RAHMAN E6838 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6081319761' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'cash', 'completed', 'Zobaze HM-3888', '2025-12-30T08:28:00.000Z', '2025-12-30T08:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-12-30T08:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-30T08:28:00.000Z');

  -- HM-3889 | TASYA | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601156812663' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-3889', '2025-12-30T09:06:00.000Z', '2025-12-30T09:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-30T09:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-12-30T09:06:00.000Z');

  -- HM-3890 | RAIHAN ABD KARIM E3041 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60175845512' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3890', '2025-12-30T09:36:00.000Z', '2025-12-30T09:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-30T09:36:00.000Z');

  -- HM-3891 | SITI AMIRAH E6839 | RM240
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129070601' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 240, 0, 240, 'card', 'completed', 'Zobaze HM-3891', '2025-12-30T10:29:00.000Z', '2025-12-30T10:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-12-30T10:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-12-30T10:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-12-30T10:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-12-30T10:29:00.000Z');

END $$;
