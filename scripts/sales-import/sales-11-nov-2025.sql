-- ============================================
-- HMS Salon - Sales Import: 11-NOV-2025
-- Receipts: 198 | Items: 361 | Revenue: RM 27,054
-- Generated: 2026-02-09
-- ============================================

-- Run AFTER import-zobaze-data.sql (customers must exist)

-- Batch 1/4
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3489 | ROHAYU MOHD SALLEH E5944 | RM319
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127718393' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 319, 0, 319, 'transfer', 'completed', 'Zobaze HM-3489', '2025-11-01T03:32:00.000Z', '2025-11-01T03:32:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-11-01T03:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-01T03:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-01T03:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 65, 65, 65, '2025-11-01T03:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-11-01T03:32:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-11-01T03:32:00.000Z');

  -- HM-3490 | MA KALTHUM ISHAK E6073 | RM195
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193657945' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 195, 0, 195, 'qr', 'completed', 'Zobaze HM-3490', '2025-11-01T03:33:00.000Z', '2025-11-01T03:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-01T03:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-11-01T03:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-01T03:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Long)' LIMIT 1), gen_random_uuid()), 'Henna (Long)', 1, 80, 80, 80, '2025-11-01T03:33:00.000Z');

  -- HM-3491 | AQILAH ABU BAKAR E1385 | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137815760' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3491', '2025-11-01T03:44:00.000Z', '2025-11-01T03:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-01T03:44:00.000Z');

  -- HM-3492 | ATIKAH MANSOR | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125392785' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3492', '2025-11-01T06:03:00.000Z', '2025-11-01T06:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-01T06:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-01T06:03:00.000Z');

  -- HM-3493 | HASLINA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197385454' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3493', '2025-11-01T06:08:00.000Z', '2025-11-01T06:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-01T06:08:00.000Z');

  -- HM-3494 | Ezza Suliana | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177281464' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'card', 'completed', 'Zobaze HM-3494', '2025-11-01T06:45:00.000Z', '2025-11-01T06:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-01T06:45:00.000Z');

  -- HM-3495 | HAMIZAH AMALINA | RM59
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601171100701' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 59, 0, 59, 'qr', 'completed', 'Zobaze HM-3495', '2025-11-01T07:16:00.000Z', '2025-11-01T07:16:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Eyelash Perming' LIMIT 1), (SELECT id FROM products WHERE name = 'Eyelash Perming' LIMIT 1), gen_random_uuid()), 'Eyelash Perming', 1, 59, 59, 59, '2025-11-01T07:16:00.000Z');

  -- HM-3496 | SARENA HASHIM E6777 | RM250
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60174838483' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 250, 0, 250, 'qr', 'completed', 'Zobaze HM-3496', '2025-11-01T08:23:00.000Z', '2025-11-01T08:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (45 minute)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (45 minute)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (45 minute)', 1, 90, 90, 90, '2025-11-01T08:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-01T08:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-11-01T08:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-01T08:23:00.000Z');

  -- HM-3497 | NURUL AIN JOHARI E2653 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177437847' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3497', '2025-11-01T08:55:00.000Z', '2025-11-01T08:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-01T08:55:00.000Z');

  -- HM-3498 | AFIQAH | RM95
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60102900904' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 95, 0, 95, 'qr', 'completed', 'Zobaze HM-3498', '2025-11-01T09:04:00.000Z', '2025-11-01T09:04:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-01T09:04:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 2, 45, 45, 90, '2025-11-01T09:04:00.000Z');

  -- HM-3499 | AMINAH AHMAD E3327 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6093678734' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3499', '2025-11-01T09:21:00.000Z', '2025-11-01T09:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Short)' LIMIT 1), gen_random_uuid()), 'Henna (Short)', 1, 60, 60, 60, '2025-11-01T09:21:00.000Z');

  -- HM-3500 | AYU | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199686527' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3500', '2025-11-01T09:25:00.000Z', '2025-11-01T09:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-01T09:25:00.000Z');

  -- HM-3501 | RASHIDAH DERAHMAN E6776 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177752048' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'card', 'completed', 'Zobaze HM-3501', '2025-11-01T09:28:00.000Z', '2025-11-01T09:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-01T09:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-01T09:28:00.000Z');

  -- HM-3502 | NUR YUSRA AB RAHIM E6778 | RM169
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199373828' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 169, 0, 169, 'qr', 'completed', 'Zobaze HM-3502', '2025-11-02T03:18:00.000Z', '2025-11-02T03:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'BACK MASSAGE' LIMIT 1), (SELECT id FROM products WHERE name = 'BACK MASSAGE' LIMIT 1), gen_random_uuid()), 'BACK MASSAGE', 1, 69, 69, 69, '2025-11-02T03:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Foot Massage' LIMIT 1), (SELECT id FROM products WHERE name = 'Foot Massage' LIMIT 1), gen_random_uuid()), 'Foot Massage', 1, 45, 45, 45, '2025-11-02T03:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-02T03:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-11-02T03:18:00.000Z');

  -- HM-3503 | ADIBAH AISHAH E2441 | RM40
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'qr', 'completed', 'Zobaze HM-3503', '2025-11-02T05:17:00.000Z', '2025-11-02T05:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-11-02T05:17:00.000Z');

  -- HM-3504 | SHARIFAH | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125406260' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3504', '2025-11-02T06:33:00.000Z', '2025-11-02T06:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-11-02T06:33:00.000Z');

  -- HM-3505 | PUTERI RAISHA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187623834' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3505', '2025-11-02T07:32:00.000Z', '2025-11-02T07:32:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-02T07:32:00.000Z');

  -- HM-3506 | KAMARIAH OTHMAN E6532 | RM320
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197106969' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 320, 0, 320, 'qr', 'completed', 'Zobaze HM-3506', '2025-11-02T07:33:00.000Z', '2025-11-02T07:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 320, 320, 320, '2025-11-02T07:33:00.000Z');

  -- HM-3507 | KAMARIAH OTHMAN E6532 | RM320
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197106969' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 320, 0, 320, 'cash', 'completed', 'Zobaze HM-3507', '2025-11-02T07:34:00.000Z', '2025-11-02T07:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 320, 320, 320, '2025-11-02T07:34:00.000Z');

  -- HM-3508 | ROZINA OTHMAN E 6779 | RM540
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60122979798' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 540, 0, 540, 'qr', 'completed', 'Zobaze HM-3508', '2025-11-02T08:14:00.000Z', '2025-11-02T08:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 450, 450, 450, '2025-11-02T08:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-02T08:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-02T08:14:00.000Z');

  -- HM-3509 | LINDA | RM455
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197956265' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 455, 0, 455, 'qr', 'completed', 'Zobaze HM-3509', '2025-11-02T08:40:00.000Z', '2025-11-02T08:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-02T08:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-02T08:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-02T08:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese + Scalp Treatment/ Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese + Scalp Treatment/ Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Japanese + Scalp Treatment/ Hair Treatment + Haircut', 1, 360, 360, 360, '2025-11-02T08:40:00.000Z');

  -- HM-3510 | LINDA | RM178
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127496175' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 178, 0, 178, 'qr', 'completed', 'Zobaze HM-3510', '2025-11-02T08:43:00.000Z', '2025-11-02T08:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'BACK MASSAGE' LIMIT 1), (SELECT id FROM products WHERE name = 'BACK MASSAGE' LIMIT 1), gen_random_uuid()), 'BACK MASSAGE', 1, 69, 69, 69, '2025-11-02T08:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Eyelash Perming' LIMIT 1), (SELECT id FROM products WHERE name = 'Eyelash Perming' LIMIT 1), gen_random_uuid()), 'Eyelash Perming', 1, 59, 59, 59, '2025-11-02T08:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-11-02T08:43:00.000Z');

  -- HM-3511 | NABILA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111463964' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3511', '2025-11-02T09:23:00.000Z', '2025-11-02T09:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-02T09:23:00.000Z');

  -- HM-3512 | NORHAYATI DAUT E5789 | RM540
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127916578' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 540, 0, 540, 'cash', 'completed', 'Zobaze HM-3512', '2025-11-02T09:28:00.000Z', '2025-11-02T09:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 450, 450, 450, '2025-11-02T09:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-11-02T09:28:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-02T09:28:00.000Z');

  -- HM-3513 | NURUL | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197330328' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3513', '2025-11-02T09:47:00.000Z', '2025-11-02T09:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-02T09:47:00.000Z');

  -- HM-3514 | ANIS NABILA | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601112749532' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3514', '2025-11-02T09:55:00.000Z', '2025-11-02T09:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 2, 75, 75, 150, '2025-11-02T09:55:00.000Z');

  -- HM-3515 | FARAH | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60109465172' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3515', '2025-11-03T05:58:00.000Z', '2025-11-03T05:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-03T05:58:00.000Z');

  -- HM-3516 |  | RM40
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'card', 'completed', 'Zobaze HM-3516', '2025-11-03T06:48:00.000Z', '2025-11-03T06:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-03T06:48:00.000Z');

  -- HM-3517 | NORSHAFEQAH E6466 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601139565153' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'cash', 'completed', 'Zobaze HM-3517', '2025-11-03T08:01:00.000Z', '2025-11-03T08:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-03T08:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-03T08:01:00.000Z');

  -- HM-3518 | NAINI | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60134354835' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-3518', '2025-11-03T08:03:00.000Z', '2025-11-03T08:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-03T08:03:00.000Z');

  -- HM-3519 | AZLINA ABD LATIFF E0039 | RM410
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177993818' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 410, 0, 410, 'qr', 'completed', 'Zobaze HM-3519', '2025-11-03T10:06:00.000Z', '2025-11-03T10:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp / Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp / Hair Treatment + Haircut', 1, 270, 270, 270, '2025-11-03T10:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-03T10:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-11-03T10:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-03T10:06:00.000Z');

  -- HM-3520 | FATIN NADZIRAH BINTI HASHIM E6255 | RM58
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182316531' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 58, 0, 58, 'cash', 'completed', 'Zobaze HM-3520', '2025-11-04T03:21:00.000Z', '2025-11-04T03:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 8, 8, 8, '2025-11-04T03:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-11-04T03:21:00.000Z');

  -- HM-3521 | SITI AFZAN | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60133583593' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3521', '2025-11-04T03:40:00.000Z', '2025-11-04T03:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-04T03:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 390, 390, 390, '2025-11-04T03:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-04T03:40:00.000Z');

  -- HM-3522 | NOR HIDAYAH ZAINAL E3785 | RM95
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177407798' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 95, 0, 95, 'qr', 'completed', 'Zobaze HM-3522', '2025-11-04T09:01:00.000Z', '2025-11-04T09:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-04T09:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-04T09:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-04T09:01:00.000Z');

  -- HM-3521 | SHAFIKAH ZAKARIA E6780 | RM540
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177863238' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 540, 0, 540, 'card', 'completed', 'Zobaze HM-3521', '2025-11-04T09:45:00.000Z', '2025-11-04T09:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-04T09:45:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 390, 390, 390, '2025-11-04T09:45:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-04T09:45:00.000Z');

  -- HM-3523 | ciknor | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137004183' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3523', '2025-11-04T10:05:00.000Z', '2025-11-04T10:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-04T10:05:00.000Z');

  -- HM-3524 | NOOR ASNIDA SHAHANI E6781 | RM710
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127902255' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 710, 0, 710, 'card', 'completed', 'Zobaze HM-3524', '2025-11-04T12:06:00.000Z', '2025-11-04T12:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Long)' LIMIT 1), gen_random_uuid()), 'Color (Long)', 1, 280, 280, 280, '2025-11-04T12:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-04T12:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Moisture Shampoo' LIMIT 1), gen_random_uuid()), 'Gold 9 Moisture Shampoo', 1, 50, 50, 50, '2025-11-04T12:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-11-04T12:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-04T12:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-04T12:06:00.000Z');

  -- HM-3525 | MASTURA MAHFAR E2107 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137009356' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3525', '2025-11-05T09:25:00.000Z', '2025-11-05T09:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-05T09:25:00.000Z');

  -- HM-3526 | NORMALA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197577560' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3526', '2025-11-05T09:38:00.000Z', '2025-11-05T09:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-05T09:38:00.000Z');

  -- HM-3527 | UMMU ATIKAH PAHRUL E0717 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167257017' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3527', '2025-11-06T03:15:00.000Z', '2025-11-06T03:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-06T03:15:00.000Z');

  -- HM-3528 | HADINA HABIL E0618 | RM440
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197114168' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 440, 0, 440, 'qr', 'completed', 'Zobaze HM-3528', '2025-11-06T06:02:00.000Z', '2025-11-06T06:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Color + Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Color + Scalp & Hair Treatment + Haircut', 1, 390, 390, 390, '2025-11-06T06:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-06T06:02:00.000Z');

  -- HM-3529 |  | RM75
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3529', '2025-11-06T09:03:00.000Z', '2025-11-06T09:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-06T09:03:00.000Z');

  -- HM-3530 |  | RM80
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3530', '2025-11-06T09:07:00.000Z', '2025-11-06T09:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-11-06T09:07:00.000Z');

  -- HM-3531 | FARIEZA NADHIRA E6782 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60187721382' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3531', '2025-11-06T09:08:00.000Z', '2025-11-06T09:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-06T09:08:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-06T09:08:00.000Z');

  -- HM-3532 | SALMAH | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167174743' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3532', '2025-11-06T09:28:00.000Z', '2025-11-06T09:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-06T09:28:00.000Z');

  -- HM-3533 | YAYA E6564 | RM330
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60162215756' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 330, 0, 330, 'qr', 'completed', 'Zobaze HM-3533', '2025-11-06T09:56:00.000Z', '2025-11-06T09:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Long)' LIMIT 1), gen_random_uuid()), 'Color (Long)', 1, 280, 280, 280, '2025-11-06T09:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-11-06T09:56:00.000Z');

  -- HM-3534 | NUR FATIN SHAHIRAH ASMADI | RM58
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601116409368' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 58, 0, 58, 'cash', 'completed', 'Zobaze HM-3534', '2025-11-06T10:01:00.000Z', '2025-11-06T10:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 8, 8, 8, '2025-11-06T10:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-11-06T10:01:00.000Z');

  -- HM-3535 | NORAINI OTHMAN E1862 | RM309
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197797275' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 309, 0, 309, 'qr', 'completed', 'Zobaze HM-3535', '2025-11-07T03:40:00.000Z', '2025-11-07T03:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 50, 50, 50, '2025-11-07T03:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-07T03:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-11-07T03:40:00.000Z');

  -- HM-3536 | IZAYU E6783 | RM229
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137313186' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 229, 0, 229, 'qr', 'completed', 'Zobaze HM-3536', '2025-11-07T06:19:00.000Z', '2025-11-07T06:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-11-07T06:19:00.000Z');

  -- HM-3537 | NOR HAZWANI | RM110
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176001497' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 110, 0, 110, 'qr', 'completed', 'Zobaze HM-3537', '2025-11-07T07:03:00.000Z', '2025-11-07T07:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-07T07:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-07T07:03:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-07T07:03:00.000Z');

END $$;

-- Batch 2/4
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3538 | AFIF NAJIHAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177174456' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3538', '2025-11-07T07:06:00.000Z', '2025-11-07T07:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-07T07:06:00.000Z');

  -- HM-3539 | AZILAH ABDUL HAMID | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127347172' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-3539', '2025-11-07T07:37:00.000Z', '2025-11-07T07:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-07T07:37:00.000Z');

  -- HM-3540 | SITI BAIZURA BAHARI E4555 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60165555700' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3540', '2025-11-07T09:26:00.000Z', '2025-11-07T09:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-07T09:26:00.000Z');

  -- HM-3541 | NURUL AKMA NASRI E4888 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137282882' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-3541', '2025-11-07T11:30:00.000Z', '2025-11-07T11:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-11-07T11:30:00.000Z');

  -- HM-3542 | AIREEN | RM25
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60192018305' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 25, 0, 25, 'qr', 'completed', 'Zobaze HM-3542', '2025-11-08T02:15:00.000Z', '2025-11-08T02:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Styling' LIMIT 1), (SELECT id FROM products WHERE name = 'Styling' LIMIT 1), gen_random_uuid()), 'Styling', 1, 25, 25, 25, '2025-11-08T02:15:00.000Z');

  -- HM-3543 | NORSHUHADA SHAHDAN E6406 | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176552014' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3543', '2025-11-08T03:20:00.000Z', '2025-11-08T03:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-11-08T03:20:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-08T03:20:00.000Z');

  -- HM-3544 | ADIBAH AISHAH E2441 | RM40
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'qr', 'completed', 'Zobaze HM-3544', '2025-11-08T03:23:00.000Z', '2025-11-08T03:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-11-08T03:23:00.000Z');

  -- HM-3545 | NURULHAFIDZAH ABU SHUKOR E6404 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196660721' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3545', '2025-11-08T03:59:00.000Z', '2025-11-08T03:59:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-08T03:59:00.000Z');

  -- HM-3546 | NURAMIRA ADIYANA E6771 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60125225423' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-3546', '2025-11-08T04:01:00.000Z', '2025-11-08T04:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-08T04:01:00.000Z');

  -- HM-3547 | SAIDAH | RM35
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177233183' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 35, 0, 35, 'qr', 'completed', 'Zobaze HM-3547', '2025-11-08T04:50:00.000Z', '2025-11-08T04:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), gen_random_uuid()), 'HAIRCUT TEENAGER', 1, 20, 20, 20, '2025-11-08T04:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-08T04:50:00.000Z');

  -- HM-3548 | YASMIN SOFIYA | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193130907' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3548', '2025-11-08T05:14:00.000Z', '2025-11-08T05:14:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-08T05:14:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-08T05:14:00.000Z');

  -- HM-3549 | AIMI NADIYAH | RM220
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60196356086' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 220, 0, 220, 'qr', 'completed', 'Zobaze HM-3549', '2025-11-08T05:44:00.000Z', '2025-11-08T05:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-08T05:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-08T05:44:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-08T05:44:00.000Z');

  -- HM-3550 | MARINA MAHPOL E6622 | RM105
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172785429' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'card', 'completed', 'Zobaze HM-3550', '2025-11-08T06:26:00.000Z', '2025-11-08T06:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-08T06:26:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-08T06:26:00.000Z');

  -- HM-3551 | IZZA IZHANI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110905081' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3551', '2025-11-08T07:33:00.000Z', '2025-11-08T07:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-08T07:33:00.000Z');

  -- HM-3552 | ezzaddin | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182387905' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3552', '2025-11-08T07:37:00.000Z', '2025-11-08T07:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment Kids' LIMIT 1), gen_random_uuid()), 'Hair Treatment Kids', 1, 80, 80, 80, '2025-11-08T07:37:00.000Z');

  -- HM-3553 | AINA ATHIRAH | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110746709' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3553', '2025-11-08T08:17:00.000Z', '2025-11-08T08:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 60, 60, 60, '2025-11-08T08:17:00.000Z');

  -- HM-3554 | Ain | RM67
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182246477' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 67, 0, 67, 'qr', 'completed', 'Zobaze HM-3554', '2025-11-08T08:31:00.000Z', '2025-11-08T08:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-08T08:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-08T08:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'TRIAL MASQUE' LIMIT 1), (SELECT id FROM products WHERE name = 'TRIAL MASQUE' LIMIT 1), gen_random_uuid()), 'TRIAL MASQUE', 1, 22, 22, 22, '2025-11-08T08:31:00.000Z');

  -- HM-3555 | NABILA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60172498354' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3555', '2025-11-08T08:50:00.000Z', '2025-11-08T08:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-08T08:50:00.000Z');

  -- HM-3556 | NURFARHANA AB RAZAK E4155 | RM370
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177228720' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 370, 0, 370, 'qr', 'completed', 'Zobaze HM-3556', '2025-11-09T05:12:00.000Z', '2025-11-09T05:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-09T05:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 1, 260, 260, 260, '2025-11-09T05:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 80, 80, 80, '2025-11-09T05:12:00.000Z');

  -- HM-3557 | NOORZAWANI NORDIN E0569 | RM155
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137138195' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 155, 0, 155, 'card', 'completed', 'Zobaze HM-3557', '2025-11-09T05:13:00.000Z', '2025-11-09T05:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment Kids' LIMIT 1), gen_random_uuid()), 'Hair Treatment Kids', 1, 80, 80, 80, '2025-11-09T05:13:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-09T05:13:00.000Z');

  -- HM-3558 | EFY | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177243391' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3558', '2025-11-09T05:57:00.000Z', '2025-11-09T05:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-09T05:57:00.000Z');

  -- HM-3559 | NURUL HUDA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177571692' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3559', '2025-11-09T07:03:00.000Z', '2025-11-09T07:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-09T07:03:00.000Z');

  -- HM-3560 | LAILA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127367571' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3560', '2025-11-09T07:23:00.000Z', '2025-11-09T07:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-09T07:23:00.000Z');

  -- HM-3561 | AISY ZAFIRAH RUZAIRI AZZAM | RM130
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177104396' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 130, 0, 130, 'qr', 'completed', 'Zobaze HM-3561', '2025-11-09T09:09:00.000Z', '2025-11-09T09:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 1, 130, 130, 130, '2025-11-09T09:09:00.000Z');

  -- HM-3562 | SITI AMINAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123084262' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3562', '2025-11-09T09:10:00.000Z', '2025-11-09T09:10:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-09T09:10:00.000Z');

  -- HM-3563 | NABILAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111114808' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3563', '2025-11-09T09:31:00.000Z', '2025-11-09T09:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-09T09:31:00.000Z');

  -- HM-3564 | KAK EL | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117775006' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3564', '2025-11-10T05:43:00.000Z', '2025-11-10T05:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-10T05:43:00.000Z');

  -- HM-3565 | ATHIRAH E6140 | RM234
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177440769' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 234, 0, 234, 'qr', 'completed', 'Zobaze HM-3565', '2025-11-10T10:29:00.000Z', '2025-11-10T10:29:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-10T10:29:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-11-10T10:29:00.000Z');

  -- HM-3566 | IYLIA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193663272' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3566', '2025-11-11T04:28:00.000Z', '2025-11-11T04:28:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-11T04:28:00.000Z');

  -- HM-3567 | FARIDAH HASHIM E6784 | RM230
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60134209209' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 230, 0, 230, 'cash', 'completed', 'Zobaze HM-3567', '2025-11-11T07:52:00.000Z', '2025-11-11T07:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 230, 230, 230, '2025-11-11T07:52:00.000Z');

  -- HM-3568 | NORHAIDA HAMDAN E0235 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127080315' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3568', '2025-11-11T08:17:00.000Z', '2025-11-11T08:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-11T08:17:00.000Z');

  -- HM-3569 | NOOR AMIRAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60198449420' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3569', '2025-11-13T04:01:00.000Z', '2025-11-13T04:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-13T04:01:00.000Z');

  -- HM-3570 | naziha | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601126306543' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3570', '2025-11-13T05:35:00.000Z', '2025-11-13T05:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-13T05:35:00.000Z');

  -- HM-3571 |  | RM70
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-3571', '2025-11-13T05:36:00.000Z', '2025-11-13T05:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 70, 70, 70, '2025-11-13T05:36:00.000Z');

  -- HM-3572 | IZWYN ZULKAPRI E6485 | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127319918' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3572', '2025-11-13T09:34:00.000Z', '2025-11-13T09:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-11-13T09:34:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-13T09:34:00.000Z');

  -- HM-3573 | BONDA E6785 | RM240
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137396434' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 240, 0, 240, 'card', 'completed', 'Zobaze HM-3573', '2025-11-13T10:18:00.000Z', '2025-11-13T10:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-11-13T10:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-13T10:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Medium)' LIMIT 1), gen_random_uuid()), 'Korean (Medium)', 1, 200, 200, 200, '2025-11-13T10:18:00.000Z');

  -- HM-3574 | NORAZLIAH NORDIN E6134 | RM519
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197771385' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 519, 0, 519, 'qr', 'completed', 'Zobaze HM-3574', '2025-11-14T04:07:00.000Z', '2025-11-14T04:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-11-14T04:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-11-14T04:07:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-11-14T04:07:00.000Z');

  -- HM-3575 | SALWA | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60179898181' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3575', '2025-11-14T05:34:00.000Z', '2025-11-14T05:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-14T05:34:00.000Z');

  -- HM-3576 | ANIS | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60145904553' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3576', '2025-11-15T02:21:00.000Z', '2025-11-15T02:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-15T02:21:00.000Z');

  -- HM-3577 | DAYANG | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111400840' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3577', '2025-11-15T03:50:00.000Z', '2025-11-15T03:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-15T03:50:00.000Z');

  -- HM-3578 | ASYA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601160969274' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3578', '2025-11-15T03:50:00.000Z', '2025-11-15T03:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-15T03:50:00.000Z');

  -- HM-3579 | NUR SURIANI SALLEH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60142216464' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3579', '2025-11-15T04:56:00.000Z', '2025-11-15T04:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-15T04:56:00.000Z');

  -- HM-3580 | NABILAH MOHAMED E6786 | RM483
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60102887027' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 483, 0, 483, 'card', 'completed', 'Zobaze HM-3580', '2025-11-15T05:50:00.000Z', '2025-11-15T05:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-11-15T05:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-15T05:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-15T05:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-11-15T05:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-11-15T05:50:00.000Z');

  -- HM-3581 | AMIRAH | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60145623035' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3581', '2025-11-15T06:31:00.000Z', '2025-11-15T06:31:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-11-15T06:31:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-15T06:31:00.000Z');

  -- HM-3582 | SITI RAMLAH TOPAN E1845 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60167036006' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3582', '2025-11-15T07:01:00.000Z', '2025-11-15T07:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-15T07:01:00.000Z');

  -- HM-3583 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3583', '2025-11-15T07:08:00.000Z', '2025-11-15T07:08:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-15T07:08:00.000Z');

  -- HM-3584 | FILA | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601161719441' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3584', '2025-11-15T09:30:00.000Z', '2025-11-15T09:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-15T09:30:00.000Z');

  -- HM-3585 | KAK LIZA | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197508584' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'cash', 'completed', 'Zobaze HM-3585', '2025-11-16T03:45:00.000Z', '2025-11-16T03:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-11-16T03:45:00.000Z');

  -- HM-3586 | IZZATUL | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601125683140' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3586', '2025-11-16T04:15:00.000Z', '2025-11-16T04:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-16T04:15:00.000Z');

  -- HM-3587 | HANA | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601126940017' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'cash', 'completed', 'Zobaze HM-3587', '2025-11-16T04:18:00.000Z', '2025-11-16T04:18:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-16T04:18:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-11-16T04:18:00.000Z');

END $$;

-- Batch 3/4
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3588 | MARIANI MAT AIL E5923 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177917396' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3588', '2025-11-16T04:53:00.000Z', '2025-11-16T04:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-16T04:53:00.000Z');

  -- HM-3589 | SITI RAUDHAH | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60184696692' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3589', '2025-11-16T05:26:00.000Z', '2025-11-16T05:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-16T05:26:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-16T05:26:00.000Z');

  -- HM-3590 | AIZAN E2160 | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110887815' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'card', 'completed', 'Zobaze HM-3590', '2025-11-16T06:19:00.000Z', '2025-11-16T06:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-11-16T06:19:00.000Z');

  -- HM-3591 | NUR ALIYAH ELEEZA E6739 | RM500
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60134800662' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 500, 0, 500, 'card', 'completed', 'Zobaze HM-3591', '2025-11-16T06:37:00.000Z', '2025-11-16T06:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 2, 250, 250, 500, '2025-11-16T06:37:00.000Z');

  -- HM-3592 | FATIMAH KHATUN SAMURA E5318 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601154169716' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3592', '2025-11-16T06:47:00.000Z', '2025-11-16T06:47:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-16T06:47:00.000Z');

  -- HM-3593 |  | RM55
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3593', '2025-11-16T07:19:00.000Z', '2025-11-16T07:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-16T07:19:00.000Z');

  -- HM-3594 | NURSAKINAH AISHAH | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60136715153' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'card', 'completed', 'Zobaze HM-3594', '2025-11-16T07:37:00.000Z', '2025-11-16T07:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-16T07:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-16T07:37:00.000Z');

  -- HM-3595 | HASYA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60124897793' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3595', '2025-11-16T07:56:00.000Z', '2025-11-16T07:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-16T07:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-16T07:56:00.000Z');

  -- HM-3596 | FAUZIAH E6726 | RM120
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197013269' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'cash', 'completed', 'Zobaze HM-3596', '2025-11-16T08:36:00.000Z', '2025-11-16T08:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-11-16T08:36:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-16T08:36:00.000Z');

  -- HM-3597 | LINA | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60129658472' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'cash', 'completed', 'Zobaze HM-3597', '2025-11-16T08:58:00.000Z', '2025-11-16T08:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-16T08:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-16T08:58:00.000Z');

  -- HM-3598 | SYAKIRA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111315464' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3598', '2025-11-16T09:43:00.000Z', '2025-11-16T09:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-16T09:43:00.000Z');

  -- HM-3599 | nur | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132180147' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3599', '2025-11-17T02:49:00.000Z', '2025-11-17T02:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-17T02:49:00.000Z');

  -- HM-3600 | WAN NURAINI E0072 | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132116202' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-3600', '2025-11-17T04:24:00.000Z', '2025-11-17T04:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-11-17T04:24:00.000Z');

  -- HM-3601 | dens | RM40
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182705411' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 40, 0, 40, 'card', 'completed', 'Zobaze HM-3601', '2025-11-17T04:26:00.000Z', '2025-11-17T04:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Styling' LIMIT 1), (SELECT id FROM products WHERE name = 'Styling' LIMIT 1), gen_random_uuid()), 'Styling', 1, 40, 40, 40, '2025-11-17T04:26:00.000Z');

  -- HM-3602 | PUSPA INAYAT KHALID E5968 | RM390
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197205804' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 390, 0, 390, 'card', 'completed', 'Zobaze HM-3602', '2025-11-17T04:37:00.000Z', '2025-11-17T04:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-11-17T04:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-11-17T04:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-17T04:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 70, 70, 70, '2025-11-17T04:37:00.000Z');

  -- HM-3603 | NURUL AIN SEDIK E2784 | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60139662307' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3603', '2025-11-17T04:45:00.000Z', '2025-11-17T04:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-17T04:45:00.000Z');

  -- HM-3604 | nayli | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197883937' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3604', '2025-11-17T07:12:00.000Z', '2025-11-17T07:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-17T07:12:00.000Z');

  -- HM-3605 | EYKIN | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110055706' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3605', '2025-11-17T07:51:00.000Z', '2025-11-17T07:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-17T07:51:00.000Z');

  -- HM-3606 | NASUHA MUHAMMAD | RM125
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601119442560' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 125, 0, 125, 'cash', 'completed', 'Zobaze HM-3606', '2025-11-17T07:52:00.000Z', '2025-11-17T07:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-17T07:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-17T07:52:00.000Z');

  -- HM-3607 | didl | RM349
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189730364' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 349, 0, 349, 'qr', 'completed', 'Zobaze HM-3607', '2025-11-17T10:53:00.000Z', '2025-11-17T10:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-17T10:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-11-17T10:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-11-17T10:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-17T10:53:00.000Z');

  -- HM-3608 | AIN | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197781175' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-3608', '2025-11-18T08:12:00.000Z', '2025-11-18T08:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Short)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Short)', 1, 70, 70, 70, '2025-11-18T08:12:00.000Z');

  -- HM-3609 |  | RM98
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 98, 0, 98, 'cash', 'completed', 'Zobaze HM-3609', '2025-11-18T08:22:00.000Z', '2025-11-18T08:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 53, 53, 53, '2025-11-18T08:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-11-18T08:22:00.000Z');

  -- HM-3610 | ARINAASNA MAT TAMIDI E6787 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60183868085' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'card', 'completed', 'Zobaze HM-3610', '2025-11-18T08:37:00.000Z', '2025-11-18T08:37:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 150, 150, 150, '2025-11-18T08:37:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-18T08:37:00.000Z');

  -- HM-3611 | SITI RAUDHAH MOHAMAD YAHYA E6517 | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177114764' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'qr', 'completed', 'Zobaze HM-3611', '2025-11-18T09:25:00.000Z', '2025-11-18T09:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-18T09:25:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-18T09:25:00.000Z');

  -- HM-3612 | AZNAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111779796' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3612', '2025-11-20T03:09:00.000Z', '2025-11-20T03:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-20T03:09:00.000Z');

  -- HM-3613 | ZUHAIRI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60103531616' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3613', '2025-11-20T03:54:00.000Z', '2025-11-20T03:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-20T03:54:00.000Z');

  -- HM-3614 | NIRWANI E6788 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127159328' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'qr', 'completed', 'Zobaze HM-3614', '2025-11-20T04:57:00.000Z', '2025-11-20T04:57:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-20T04:57:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-20T04:57:00.000Z');

  -- HM-3615 | YUWANA MOHAMAD JALANI E3495 | RM295
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177168695' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 295, 0, 295, 'card', 'completed', 'Zobaze HM-3615', '2025-11-20T08:15:00.000Z', '2025-11-20T08:15:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-11-20T08:15:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-20T08:15:00.000Z');

  -- HM-3616 | ROHAYAH KAHAR E0010 | RM549
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60178412808' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 549, 0, 549, 'transfer', 'completed', 'Zobaze HM-3616', '2025-11-20T09:01:00.000Z', '2025-11-20T09:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2025-11-20T09:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-20T09:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-11-20T09:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-20T09:01:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-11-20T09:01:00.000Z');

  -- HM-3617 | NOR AMILIA SYARINA E6789 | RM510
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197323775' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 510, 0, 510, 'qr', 'completed', 'Zobaze HM-3617', '2025-11-20T09:09:00.000Z', '2025-11-20T09:09:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2025-11-20T09:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-20T09:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 1, 260, 260, 260, '2025-11-20T09:09:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Treatment Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Treatment Kids' LIMIT 1), gen_random_uuid()), 'Treatment Kids', 1, 30, 30, 30, '2025-11-20T09:09:00.000Z');

  -- HM-3618 | ILY | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601111428805' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'qr', 'completed', 'Zobaze HM-3618', '2025-11-20T09:49:00.000Z', '2025-11-20T09:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-20T09:49:00.000Z');

  -- HM-3619 | NURUL HIDAYAH E6790 | RM469
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182196366' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 469, 0, 469, 'qr', 'completed', 'Zobaze HM-3619', '2025-11-20T10:49:00.000Z', '2025-11-20T10:49:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Medium)' LIMIT 1), gen_random_uuid()), 'Color (Medium)', 1, 220, 220, 220, '2025-11-20T10:49:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-11-20T10:49:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 170, 170, 170, '2025-11-20T10:49:00.000Z');

  -- HM-3620 | ASMIDA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127531483' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3620', '2025-11-21T05:13:00.000Z', '2025-11-21T05:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-21T05:13:00.000Z');

  -- HM-3621 | NORAFISYAH E4516 | RM100
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137279335' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 100, 0, 100, 'qr', 'completed', 'Zobaze HM-3621', '2025-11-21T05:24:00.000Z', '2025-11-21T05:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-21T05:24:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-11-21T05:24:00.000Z');

  -- HM-3622 | NUR NABILAH RASIDI E6791 | RM530
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60122493850' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 530, 0, 530, 'qr', 'completed', 'Zobaze HM-3622', '2025-11-21T05:52:00.000Z', '2025-11-21T05:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2025-11-21T05:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-11-21T05:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (L)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (L)' LIMIT 1), gen_random_uuid()), 'Hair Wash (L)', 1, 50, 50, 50, '2025-11-21T05:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 2, 150, 150, 300, '2025-11-21T05:52:00.000Z');

  -- HM-3623 | NUR ZAFIRAH ABD HASHIM E2170 | RM360
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132224052' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 360, 0, 360, 'card', 'completed', 'Zobaze HM-3623', '2025-11-21T07:11:00.000Z', '2025-11-21T07:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 190, 190, 190, '2025-11-21T07:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-11-21T07:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-21T07:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 70, 70, 70, '2025-11-21T07:11:00.000Z');

  -- HM-3624 | SUHANA AHMAD E6337 | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137215212' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'cash', 'completed', 'Zobaze HM-3624', '2025-11-21T07:13:00.000Z', '2025-11-21T07:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-21T07:13:00.000Z');

  -- HM-3625 | ARIQA FATIN E6792 | RM450
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60174330407' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 450, 0, 450, 'qr', 'completed', 'Zobaze HM-3625', '2025-11-21T09:13:00.000Z', '2025-11-21T09:13:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Extra Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Extra Long)' LIMIT 1), gen_random_uuid()), 'Color (Extra Long)', 1, 340, 340, 340, '2025-11-21T09:13:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 80, 80, 80, '2025-11-21T09:13:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-21T09:13:00.000Z');

  -- HM-3626 | FADHILAH NOOR BASIR E6577 | RM272
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60136341787' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 272, 0, 272, 'card', 'completed', 'Zobaze HM-3626', '2025-11-22T06:19:00.000Z', '2025-11-22T06:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), gen_random_uuid()), 'HAIRCUT TEENAGER', 1, 18, 18, 18, '2025-11-22T06:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 3, 5, 5, 15, '2025-11-22T06:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-11-22T06:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-11-22T06:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-22T06:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-11-22T06:19:00.000Z');

  -- HM-3627 | WAN NOORAIN E6766 | RM125
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60166415446' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 125, 0, 125, 'card', 'completed', 'Zobaze HM-3627', '2025-11-22T06:21:00.000Z', '2025-11-22T06:21:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-22T06:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-22T06:21:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 90, 90, 90, '2025-11-22T06:21:00.000Z');

  -- HM-3628 |  | RM120
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 120, 0, 120, 'card', 'completed', 'Zobaze HM-3628', '2025-11-22T06:23:00.000Z', '2025-11-22T06:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-11-22T06:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-22T06:23:00.000Z');

  -- HM-3629 | SHAZWANA HUSIN E0965 | RM105
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197020240' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'qr', 'completed', 'Zobaze HM-3629', '2025-11-22T07:19:00.000Z', '2025-11-22T07:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-22T07:19:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-22T07:19:00.000Z');

  -- HM-3630 | AHIRA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601158304785' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3630', '2025-11-22T07:52:00.000Z', '2025-11-22T07:52:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-22T07:52:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2025-11-22T07:52:00.000Z');

  -- HM-3631 | WANI KHALID | RM15
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601161160939' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 15, 0, 15, 'qr', 'completed', 'Zobaze HM-3631', '2025-11-23T03:51:00.000Z', '2025-11-23T03:51:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-23T03:51:00.000Z');

  -- HM-3632 | ADIBAH AISHAH E2441 | RM200
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 200, 0, 200, 'qr', 'completed', 'Zobaze HM-3632', '2025-11-23T04:11:00.000Z', '2025-11-23T04:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 50, 50, 50, '2025-11-23T04:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-23T04:11:00.000Z');

  -- HM-3633 | HAZIRAH RAZAK | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601112719416' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'qr', 'completed', 'Zobaze HM-3633', '2025-11-23T04:34:00.000Z', '2025-11-23T04:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-23T04:34:00.000Z');

  -- HM-3634 | NURHIDAYAH ABDULLAH E6794 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123175415' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3634', '2025-11-23T05:26:00.000Z', '2025-11-23T05:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-23T05:26:00.000Z');

  -- HM-3635 | FATIN | RM80
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601128425658' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 80, 0, 80, 'qr', 'completed', 'Zobaze HM-3635', '2025-11-23T06:38:00.000Z', '2025-11-23T06:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-23T06:38:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-23T06:38:00.000Z');

  -- HM-3636 | NABILAH | RM85
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60145457970' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 85, 0, 85, 'qr', 'completed', 'Zobaze HM-3636', '2025-11-23T07:02:00.000Z', '2025-11-23T07:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-23T07:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Long)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Long)', 1, 80, 80, 80, '2025-11-23T07:02:00.000Z');

  -- HM-3637 | SARAH | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197777830' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'qr', 'completed', 'Zobaze HM-3637', '2025-11-23T07:44:00.000Z', '2025-11-23T07:44:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-11-23T07:44:00.000Z');

END $$;

-- Batch 4/4
DO $$
DECLARE
  v_sale_id UUID;
  v_customer_id UUID;
BEGIN

  -- HM-3638 |  | RM30
  v_customer_id := NULL;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3638', '2025-11-24T03:20:00.000Z', '2025-11-24T03:20:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-24T03:20:00.000Z');

  -- HM-3639 | NORSAFINA SAIAN E2500 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127790035' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'card', 'completed', 'Zobaze HM-3639', '2025-11-24T04:26:00.000Z', '2025-11-24T04:26:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-24T04:26:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-24T04:26:00.000Z');

  -- HM-3640 | Atiqah | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601133251152' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'cash', 'completed', 'Zobaze HM-3640', '2025-11-24T05:54:00.000Z', '2025-11-24T05:54:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-24T05:54:00.000Z');

  -- HM-3641 | ZARIDAH JINAL E6795 | RM309
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197978940' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 309, 0, 309, 'qr', 'completed', 'Zobaze HM-3641', '2025-11-24T05:56:00.000Z', '2025-11-24T05:56:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 80, 80, 80, '2025-11-24T05:56:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-11-24T05:56:00.000Z');

  -- HM-3642 | Hidayah | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60175099859' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3642', '2025-11-24T06:07:00.000Z', '2025-11-24T06:07:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-24T06:07:00.000Z');

  -- HM-3643 | SYASYA | RM115
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60177013943' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 115, 0, 115, 'qr', 'completed', 'Zobaze HM-3643', '2025-11-24T07:02:00.000Z', '2025-11-24T07:02:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-24T07:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-24T07:02:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 60, 60, 60, '2025-11-24T07:02:00.000Z');

  -- HM-3644 | NOR HAMIZA E6796 | RM185
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60194702603' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 185, 0, 185, 'qr', 'completed', 'Zobaze HM-3644', '2025-11-24T07:50:00.000Z', '2025-11-24T07:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-24T07:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-24T07:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-24T07:50:00.000Z');

  -- HM-3645 | HAZEL | RM77
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60122733340' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 77, 0, 77, 'qr', 'completed', 'Zobaze HM-3645', '2025-11-24T09:12:00.000Z', '2025-11-24T09:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 2, 2, 2, '2025-11-24T09:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-24T09:12:00.000Z');

  -- HM-3646 | MIMI AIDILIA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60199936481' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3646', '2025-11-25T02:19:00.000Z', '2025-11-25T02:19:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-25T02:19:00.000Z');

  -- HM-3647 | HASNAH BAHARIN E6797 | RM180
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137280951' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 180, 0, 180, 'transfer', 'completed', 'Zobaze HM-3647', '2025-11-25T03:39:00.000Z', '2025-11-25T03:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-25T03:39:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-25T03:39:00.000Z');

  -- HM-3648 | SYUKRIAH | RM45
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6098608703' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 45, 0, 45, 'card', 'completed', 'Zobaze HM-3648', '2025-11-25T04:25:00.000Z', '2025-11-25T04:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (M)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (M)' LIMIT 1), gen_random_uuid()), 'Hair Wash (M)', 1, 45, 45, 45, '2025-11-25T04:25:00.000Z');

  -- HM-3649 | ROS | RM109
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137732882' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 109, 0, 109, 'qr', 'completed', 'Zobaze HM-3649', '2025-11-25T05:43:00.000Z', '2025-11-25T05:43:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-25T05:43:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-11-25T05:43:00.000Z');

  -- HM-3650 | RABIATUL ADAWIYAH | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60176010457' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3650', '2025-11-25T05:45:00.000Z', '2025-11-25T05:45:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-25T05:45:00.000Z');

  -- HM-3651 | Intan | RM230
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60136993006' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 230, 0, 230, 'qr', 'completed', 'Zobaze HM-3651', '2025-11-27T03:24:00.000Z', '2025-11-27T03:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-27T03:24:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 200, 200, 200, '2025-11-27T03:24:00.000Z');

  -- HM-3652 | NORSAFINA SAIAN E2500 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127790035' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'qr', 'completed', 'Zobaze HM-3652', '2025-11-27T04:17:00.000Z', '2025-11-27T04:17:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-27T04:17:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 120, 120, 120, '2025-11-27T04:17:00.000Z');

  -- HM-3653 | DANISHA | RM55
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601137693107' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 55, 0, 55, 'card', 'completed', 'Zobaze HM-3653', '2025-11-27T04:22:00.000Z', '2025-11-27T04:22:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-27T04:22:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-11-27T04:22:00.000Z');

  -- HM-3654 | DHIA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60193759947' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3654', '2025-11-27T05:01:00.000Z', '2025-11-27T05:01:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-27T05:01:00.000Z');

  -- HM-3655 | Ana | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127878452' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-3655', '2025-11-27T07:36:00.000Z', '2025-11-27T07:36:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-27T07:36:00.000Z');

  -- HM-3656 | NABILAH KASIM E1762 | RM173
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60184733650' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 173, 0, 173, 'qr', 'completed', 'Zobaze HM-3656', '2025-11-27T08:35:00.000Z', '2025-11-27T08:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-27T08:35:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-11-27T08:35:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-27T08:35:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 38, 38, 38, '2025-11-27T08:35:00.000Z');

  -- HM-3657 | MASRIZAN RAHANI E6309 | RM125
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197352773' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 125, 0, 125, 'cash', 'completed', 'Zobaze HM-3657', '2025-11-27T09:05:00.000Z', '2025-11-27T09:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-27T09:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-27T09:05:00.000Z');

  -- HM-3658 | NOR ASIKIN MOHAMAD E0395 | RM105
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197720350' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'cash', 'completed', 'Zobaze HM-3658', '2025-11-27T10:11:00.000Z', '2025-11-27T10:11:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-27T10:11:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Medium)' LIMIT 1), gen_random_uuid()), 'Henna (Medium)', 1, 75, 75, 75, '2025-11-27T10:11:00.000Z');

  -- HM-3659 | AZIZAH ABDUL RAZAK E6798 | RM190
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60124194984' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 190, 0, 190, 'qr', 'completed', 'Zobaze HM-3659', '2025-11-28T08:00:00.000Z', '2025-11-28T08:00:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-28T08:00:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-28T08:00:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Medium)' LIMIT 1), gen_random_uuid()), 'Henna (Medium)', 1, 75, 75, 75, '2025-11-28T08:00:00.000Z');

  -- HM-3660 | SITI ADILAH | RM65
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182667716' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 65, 0, 65, 'qr', 'completed', 'Zobaze HM-3660', '2025-11-28T08:27:00.000Z', '2025-11-28T08:27:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-11-28T08:27:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-28T08:27:00.000Z');

  -- HM-3661 | SHARIFAH NORIATI E6821 | RM360
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+6091897225' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 360, 0, 360, 'card', 'completed', 'Zobaze HM-3661', '2025-11-28T08:48:00.000Z', '2025-11-28T08:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-11-28T08:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-28T08:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Korean (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Korean (Long)' LIMIT 1), gen_random_uuid()), 'Korean (Long)', 1, 260, 260, 260, '2025-11-28T08:48:00.000Z');

  -- HM-3662 | KHAIRIAH E3488 | RM640
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60132197187' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 640, 0, 640, 'qr', 'completed', 'Zobaze HM-3662', '2025-11-28T08:53:00.000Z', '2025-11-28T08:53:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 50, 50, 50, '2025-11-28T08:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-28T08:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Japanese (Long)' LIMIT 1), (SELECT id FROM products WHERE name = 'Japanese (Long)' LIMIT 1), gen_random_uuid()), 'Japanese (Long)', 1, 360, 360, 360, '2025-11-28T08:53:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 200, 200, 200, '2025-11-28T08:53:00.000Z');

  -- HM-3663 | SYAHIRAH E6799 | RM199
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601115072601' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 199, 0, 199, 'qr', 'completed', 'Zobaze HM-3663', '2025-11-28T08:58:00.000Z', '2025-11-28T08:58:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-28T08:58:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 169, 169, 169, '2025-11-28T08:58:00.000Z');

  -- HM-3664 | FIZA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127295520' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'card', 'completed', 'Zobaze HM-3664', '2025-11-28T09:30:00.000Z', '2025-11-28T09:30:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-28T09:30:00.000Z');

  -- HM-3665 | AINA SYAFINA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601160515730' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3665', '2025-11-28T09:34:00.000Z', '2025-11-28T09:34:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-28T09:34:00.000Z');

  -- HM-3666 | NOORWAHIDAH ANNERIZA BAKARUDDIN E6223 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60109080998' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3666', '2025-11-28T09:50:00.000Z', '2025-11-28T09:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 2, 15, 15, 30, '2025-11-28T09:50:00.000Z');

  -- HM-3667 | JAEMA | RM22
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60174755534' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 22, 0, 22, 'cash', 'completed', 'Zobaze HM-3667', '2025-11-29T02:24:00.000Z', '2025-11-29T02:24:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT BANGS' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT BANGS' LIMIT 1), gen_random_uuid()), 'HAIRCUT BANGS', 1, 7, 7, 7, '2025-11-29T02:24:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-29T02:24:00.000Z');

  -- HM-3668 | NUR HIDAYAH AYOEP E6340 | RM128
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60189043562' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 128, 0, 128, 'qr', 'completed', 'Zobaze HM-3668', '2025-11-29T03:06:00.000Z', '2025-11-29T03:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 8, 8, 8, '2025-11-29T03:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-29T03:06:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hairwash Kids' LIMIT 1), gen_random_uuid()), 'Haircut + Hairwash Kids', 1, 45, 45, 45, '2025-11-29T03:06:00.000Z');

  -- HM-3669 | ADIBAH AISHAH E2441 | RM135
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60197851618' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 135, 0, 135, 'qr', 'completed', 'Zobaze HM-3669', '2025-11-29T03:48:00.000Z', '2025-11-29T03:48:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Full Body Massage (45 minute)' LIMIT 1), (SELECT id FROM products WHERE name = 'Full Body Massage (45 minute)' LIMIT 1), gen_random_uuid()), 'Full Body Massage (45 minute)', 1, 90, 90, 90, '2025-11-29T03:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-29T03:48:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Wash (S)' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Wash (S)' LIMIT 1), gen_random_uuid()), 'Hair Wash (S)', 1, 40, 40, 40, '2025-11-29T03:48:00.000Z');

  -- HM-3670 | HAIRUNNISA ABU SAMAH E6800 | RM325
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60162278814' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 325, 0, 325, 'card', 'completed', 'Zobaze HM-3670', '2025-11-29T06:23:00.000Z', '2025-11-29T06:23:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Henna (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Henna (Medium)' LIMIT 1), gen_random_uuid()), 'Henna (Medium)', 1, 65, 65, 65, '2025-11-29T06:23:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), (SELECT id FROM products WHERE name = 'Scalp & Hair Treatment + Haircut' LIMIT 1), gen_random_uuid()), 'Scalp & Hair Treatment + Haircut', 1, 260, 260, 260, '2025-11-29T06:23:00.000Z');

  -- HM-3671 | MIA | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60123294535' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3671', '2025-11-29T06:50:00.000Z', '2025-11-29T06:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-29T06:50:00.000Z');

  -- HM-3672 | Noorliyana | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60182776099' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3672', '2025-11-29T07:33:00.000Z', '2025-11-29T07:33:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), (SELECT id FROM products WHERE name = 'HAIRCUT TEENAGER' LIMIT 1), gen_random_uuid()), 'HAIRCUT TEENAGER', 1, 20, 20, 20, '2025-11-29T07:33:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-29T07:33:00.000Z');

  -- HM-3673 | AMIRA | RM60
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60143428292' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 60, 0, 60, 'cash', 'completed', 'Zobaze HM-3673', '2025-11-29T08:25:00.000Z', '2025-11-29T08:25:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 2, 30, 30, 60, '2025-11-29T08:25:00.000Z');

  -- HM-3674 | HANI | RM50
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60173563087' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 50, 0, 50, 'qr', 'completed', 'Zobaze HM-3674', '2025-11-29T08:39:00.000Z', '2025-11-29T08:39:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 50, 50, 50, '2025-11-29T08:39:00.000Z');

  -- HM-3675 | SURIA MD SALLEH E6660 | RM294
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127554550' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 294, 0, 294, 'qr', 'completed', 'Zobaze HM-3675', '2025-11-29T08:50:00.000Z', '2025-11-29T08:50:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Color (Short)' LIMIT 1), (SELECT id FROM products WHERE name = 'Color (Short)' LIMIT 1), gen_random_uuid()), 'Color (Short)', 1, 170, 170, 170, '2025-11-29T08:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-29T08:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Kids' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Kids' LIMIT 1), gen_random_uuid()), 'Haircut Kids', 1, 15, 15, 15, '2025-11-29T08:50:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Nexxen Tonic' LIMIT 1), (SELECT id FROM products WHERE name = 'Nexxen Tonic' LIMIT 1), gen_random_uuid()), 'Nexxen Tonic', 1, 79, 79, 79, '2025-11-29T08:50:00.000Z');

  -- HM-3676 | EIZZAH AQILAH E6472 | RM150
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137780451' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 150, 0, 150, 'card', 'completed', 'Zobaze HM-3676', '2025-11-29T10:06:00.000Z', '2025-11-29T10:06:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-29T10:06:00.000Z');

  -- HM-3677 | NOOR ASNIDA SHAHANI E6781 | RM299
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127902255' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 299, 0, 299, 'card', 'completed', 'Zobaze HM-3677', '2025-11-29T10:40:00.000Z', '2025-11-29T10:40:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Treatment' LIMIT 1), gen_random_uuid()), 'Hair Treatment', 1, 70, 70, 70, '2025-11-29T10:40:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Premium Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Premium Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Premium Scalp Treatment', 1, 229, 229, 229, '2025-11-29T10:40:00.000Z');

  -- HM-3678 | NUR ASHIKIN | RM135
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601127802557' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 135, 0, 135, 'qr', 'completed', 'Zobaze HM-3678', '2025-11-30T03:05:00.000Z', '2025-11-30T03:05:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Gold 9 Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Gold 9 Hair Masque' LIMIT 1), gen_random_uuid()), 'Gold 9 Hair Masque', 1, 50, 50, 50, '2025-11-30T03:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-11-30T03:05:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-30T03:05:00.000Z');

  -- HM-3679 | RINA | RM105
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60127989191' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 105, 0, 105, 'qr', 'completed', 'Zobaze HM-3679', '2025-11-30T04:55:00.000Z', '2025-11-30T04:55:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Gloss' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Gloss' LIMIT 1), gen_random_uuid()), 'Hair Gloss', 1, 40, 40, 40, '2025-11-30T04:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-11-30T04:55:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-30T04:55:00.000Z');

  -- HM-3680 | AYU | RM75
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60179876985' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 75, 0, 75, 'card', 'completed', 'Zobaze HM-3680', '2025-11-30T07:03:00.000Z', '2025-11-30T07:03:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash (Medium)' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash (Medium)', 1, 75, 75, 75, '2025-11-30T07:03:00.000Z');

  -- HM-3681 | NORUL WAHIZASAADIAH E6801 | RM185
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60165269363' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 185, 0, 185, 'card', 'completed', 'Zobaze HM-3681', '2025-11-30T07:12:00.000Z', '2025-11-30T07:12:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 5, 5, 5, '2025-11-30T07:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-30T07:12:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Standard Scalp Treatment' LIMIT 1), (SELECT id FROM products WHERE name = 'Standard Scalp Treatment' LIMIT 1), gen_random_uuid()), 'Standard Scalp Treatment', 1, 150, 150, 150, '2025-11-30T07:12:00.000Z');

  -- HM-3682 | HIDAYAH | RM70
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60128207319' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 70, 0, 70, 'qr', 'completed', 'Zobaze HM-3682', '2025-11-30T08:38:00.000Z', '2025-11-30T08:38:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-11-30T08:38:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 60, 60, 60, '2025-11-30T08:38:00.000Z');

  -- HM-3683 | NAILIDA ALI E0588 | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+60137462473' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'qr', 'completed', 'Zobaze HM-3683', '2025-11-30T08:42:00.000Z', '2025-11-30T08:42:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-30T08:42:00.000Z');

  -- HM-3684 | NOLI | RM30
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601117777596' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 30, 0, 30, 'cash', 'completed', 'Zobaze HM-3684', '2025-11-30T10:32:00.000Z', '2025-11-30T10:32:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut Adult' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut Adult' LIMIT 1), gen_random_uuid()), 'Haircut Adult', 1, 30, 30, 30, '2025-11-30T10:32:00.000Z');

  -- HM-3685 | AMALINA | RM65
  v_customer_id := NULL;
  SELECT id INTO v_customer_id FROM customers WHERE phone = '+601110656854' LIMIT 1;
  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)
  VALUES (v_customer_id, 65, 0, 65, 'cash', 'completed', 'Zobaze HM-3685', '2025-11-30T10:35:00.000Z', '2025-11-30T10:35:00.000Z')
  RETURNING id INTO v_sale_id;
  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Hair Masque' LIMIT 1), (SELECT id FROM products WHERE name = 'Hair Masque' LIMIT 1), gen_random_uuid()), 'Hair Masque', 1, 10, 10, 10, '2025-11-30T10:35:00.000Z'),
    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), (SELECT id FROM products WHERE name = 'Haircut + Hair Wash Express' LIMIT 1), gen_random_uuid()), 'Haircut + Hair Wash Express', 1, 55, 55, 55, '2025-11-30T10:35:00.000Z');

END $$;
