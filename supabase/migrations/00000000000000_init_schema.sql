-- Enable necessary extensions
create extension if not exists "uuid-ossp";

-- USERS (Managed by Supabase Auth, this is a public profile table)
create table public.users (
  id uuid references auth.users not null primary key,
  email text not null,
  name text,
  phone text,
  role text default 'staff' check (role in ('admin', 'staff')),
  avatar_url text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- CUSTOMERS
create table public.customers (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  phone text,
  email text,
  tier text default 'Normal' check (tier in ('Normal', 'Member', 'VIP')),
  points_balance integer default 0,
  total_spent decimal(10,2) default 0.00,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- STAFF
create table public.staff (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  phone text,
  role text default 'stylist',
  commission_rate decimal(5,2) default 0.00,
  is_active boolean default true,
  avatar_url text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- SERVICES
create table public.services (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  category text not null,
  price decimal(10,2) not null default 0.00,
  member_price decimal(10,2) default 0.00,
  duration integer not null default 60, -- in minutes
  commission_rate decimal(5,2) default 0.00,
  is_active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- PRODUCTS
create table public.products (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  sku text unique,
  brand text,
  category text,
  cost_price decimal(10,2) default 0.00,
  sell_price decimal(10,2) not null default 0.00,
  stock_quantity integer default 0,
  low_stock_threshold integer default 5,
  is_active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- BOOKINGS
create table public.bookings (
  id uuid default uuid_generate_v4() primary key,
  customer_id uuid references public.customers(id),
  service_id uuid references public.services(id),
  staff_id uuid references public.staff(id),
  booking_date date not null,
  booking_time time not null,
  status text default 'pending' check (status in ('pending', 'confirmed', 'completed', 'cancelled', 'no_show')),
  deposit decimal(10,2) default 0.00,
  notes text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- SALES
create table public.sales (
  id uuid default uuid_generate_v4() primary key,
  customer_id uuid references public.customers(id),
  subtotal decimal(10,2) not null default 0.00,
  discount decimal(10,2) default 0.00,
  points_redeemed integer default 0,
  points_value decimal(10,2) default 0.00,
  total decimal(10,2) not null default 0.00,
  payment_method text not null check (payment_method in ('cash', 'card', 'qr', 'transfer')),
  status text default 'completed' check (status in ('completed', 'refunded')),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- SALE ITEMS
create table public.sale_items (
  id uuid default uuid_generate_v4() primary key,
  sale_id uuid references public.sales(id) on delete cascade,
  item_type text not null check (item_type in ('service', 'product')),
  item_id uuid not null, -- references services(id) or products(id) depending on type
  stylist_id uuid references public.staff(id),
  quantity integer default 1,
  price decimal(10,2) not null, -- snapshot of price at time of sale
  commission_amount decimal(10,2) default 0.00,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- POINTS TRANSACTIONS
create table public.points_transactions (
  id uuid default uuid_generate_v4() primary key,
  customer_id uuid references public.customers(id) on delete cascade,
  type text not null check (type in ('earned', 'redeemed', 'adjusted')),
  points integer not null,
  balance_after integer not null,
  reason text,
  sale_id uuid references public.sales(id),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- STOCK MOVEMENTS
create table public.stock_movements (
  id uuid default uuid_generate_v4() primary key,
  product_id uuid references public.products(id) on delete cascade,
  type text not null check (type in ('in', 'out', 'adjustment')),
  quantity integer not null,
  reason text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- COMMISSIONS
create table public.commissions (
  id uuid default uuid_generate_v4() primary key,
  staff_id uuid references public.staff(id),
  sale_id uuid references public.sales(id),
  sale_item_id uuid references public.sale_items(id),
  amount decimal(10,2) not null,
  date date default CURRENT_DATE,
  is_paid boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- RLS POLICIES (Simple for MVP start - modify as needed for production)
alter table public.users enable row level security;
alter table public.customers enable row level security;
alter table public.staff enable row level security;
alter table public.services enable row level security;
alter table public.products enable row level security;
alter table public.bookings enable row level security;
alter table public.sales enable row level security;
alter table public.sale_items enable row level security;
alter table public.points_transactions enable row level security;
alter table public.stock_movements enable row level security;
alter table public.commissions enable row level security;

-- Allow authenticated users to read everything (Staff access)
create policy "Allow authenticated read access" on public.users for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.customers for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.staff for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.services for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.products for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.bookings for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.sales for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.sale_items for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.points_transactions for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.stock_movements for select using (auth.role() = 'authenticated');
create policy "Allow authenticated read access" on public.commissions for select using (auth.role() = 'authenticated');

-- Allow authenticated users to insert/update (Staff actions)
-- For now, we trust authenticated users (staff). In future, can refine by role.
create policy "Allow authenticated insert" on public.customers for insert with check (auth.role() = 'authenticated');
create policy "Allow authenticated update" on public.customers for update using (auth.role() = 'authenticated');

create policy "Allow authenticated insert" on public.bookings for insert with check (auth.role() = 'authenticated');
create policy "Allow authenticated update" on public.bookings for update using (auth.role() = 'authenticated');

-- Triggers for updated_at
create or replace function update_updated_at_column()
returns trigger as $$
begin
    new.updated_at = now();
    return new;
end;
$$ language plpgsql;

create trigger update_customers_updated_at
before update on public.customers
for each row execute function update_updated_at_column();
