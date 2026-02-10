-- Add birthday and notes columns to customers table
-- Run this in Supabase SQL Editor

-- Add birthday column
ALTER TABLE customers ADD COLUMN IF NOT EXISTS birthday DATE;

-- Add notes column
ALTER TABLE customers ADD COLUMN IF NOT EXISTS notes TEXT;

-- Create index for birthday lookups (for auto-bonus feature)
CREATE INDEX IF NOT EXISTS idx_customers_birthday ON customers(birthday);

-- Optional: Add a function to check today's birthdays
CREATE OR REPLACE FUNCTION get_todays_birthdays()
RETURNS TABLE(id UUID, name TEXT, phone TEXT, birthday DATE, points_balance INTEGER) AS $$
BEGIN
  RETURN QUERY
  SELECT c.id, c.name, c.phone, c.birthday, c.points_balance
  FROM customers c
  WHERE EXTRACT(MONTH FROM c.birthday) = EXTRACT(MONTH FROM CURRENT_DATE)
    AND EXTRACT(DAY FROM c.birthday) = EXTRACT(DAY FROM CURRENT_DATE);
END;
$$ LANGUAGE plpgsql;
