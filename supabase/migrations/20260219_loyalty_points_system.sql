-- ============================================================
-- HMS Salon - Loyalty Points System Migration
-- Run these in Supabase SQL Editor IN ORDER
-- ============================================================

-- 1. services: add is_point_eligible flag
ALTER TABLE services
  ADD COLUMN IF NOT EXISTS is_point_eligible BOOLEAN NOT NULL DEFAULT true;

-- Exclude "Hair Cut" from earning points
UPDATE services
SET is_point_eligible = false
WHERE name ILIKE '%hair cut%' OR name ILIKE '%haircut%';


-- 2. promotions: new table
CREATE TABLE IF NOT EXISTS promotions (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name         TEXT NOT NULL,
  promo_price  NUMERIC(10,2) NOT NULL,
  description  TEXT,
  service_id   UUID REFERENCES services(id) ON DELETE SET NULL,
  start_date   DATE NOT NULL,
  end_date     DATE NOT NULL,
  is_active    BOOLEAN NOT NULL DEFAULT true,
  created_by   UUID REFERENCES auth.users(id),
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Index for POS promo lookup
CREATE INDEX IF NOT EXISTS idx_promotions_service_dates
  ON promotions(service_id, start_date, end_date)
  WHERE is_active = true;


-- 3. points_transactions: add expiry columns
ALTER TABLE points_transactions
  ADD COLUMN IF NOT EXISTS expires_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS is_expired  BOOLEAN NOT NULL DEFAULT false;

-- Backfill existing 'earn' rows with 6-month expiry
UPDATE points_transactions
SET expires_at = created_at + INTERVAL '6 months'
WHERE (type = 'earn' OR type = 'earned') AND expires_at IS NULL;

-- Index for expiry job
CREATE INDEX IF NOT EXISTS idx_pts_expiry
  ON points_transactions(expires_at, is_expired)
  WHERE is_expired = false;


-- 4. sales: add promotional flag
ALTER TABLE sales
  ADD COLUMN IF NOT EXISTS is_promotional BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS promotion_id   UUID REFERENCES promotions(id) ON DELETE SET NULL;


-- 5. Effective balance view (optional convenience view)
CREATE OR REPLACE VIEW customer_effective_points AS
SELECT
  customer_id,
  COALESCE(SUM(
    CASE
      WHEN (type = 'earn' OR type = 'earned')
           AND (expires_at IS NULL OR expires_at > NOW())
           AND is_expired = false
        THEN points
      WHEN type = 'redeem' OR type = 'redeemed' THEN -points
      WHEN type = 'adjust' OR type = 'adjusted' THEN points  -- can be negative
      WHEN type = 'expire' THEN -points
      ELSE 0
    END
  ), 0) AS effective_balance
FROM points_transactions
GROUP BY customer_id;


-- ============================================================
-- Daily expiry job (run via Supabase CRON or pg_cron)
-- Schedule: 0 1 * * *  (1am daily)
-- ============================================================
/*
DO $$
DECLARE
  expired_row RECORD;
  new_balance BIGINT;
BEGIN
  FOR expired_row IN
    SELECT pt.*, c.points_balance
    FROM points_transactions pt
    JOIN customers c ON c.id = pt.customer_id
    WHERE pt.type = 'earn'
      AND pt.expires_at <= NOW()
      AND pt.is_expired = false
  LOOP
    -- Mark as expired
    UPDATE points_transactions SET is_expired = true WHERE id = expired_row.id;

    -- Recalculate effective balance
    SELECT COALESCE(SUM(
      CASE
        WHEN (type='earn' OR type='earned') AND (expires_at IS NULL OR expires_at > NOW()) AND is_expired=false THEN points
        WHEN type IN ('redeem','redeemed') THEN -points
        WHEN type IN ('adjust','adjusted') THEN points
        WHEN type = 'expire' THEN -points
        ELSE 0
      END
    ), 0) INTO new_balance
    FROM points_transactions
    WHERE customer_id = expired_row.customer_id;

    -- Insert explicit 'expire' record
    INSERT INTO points_transactions (customer_id, type, points, balance_after, reason, is_expired)
    VALUES (expired_row.customer_id, 'expire', expired_row.points, new_balance, 'Auto-expired after 6 months', false);

    -- Update cached balance
    UPDATE customers SET points_balance = new_balance WHERE id = expired_row.customer_id;
  END LOOP;
END $$;
*/
