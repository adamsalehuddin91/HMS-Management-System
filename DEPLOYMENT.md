# HMS Salon - Deployment Guide

## Quick Start Deployment

### Prerequisites
- Node.js 18+ installed
- Supabase account (free tier works)
- Vercel account (recommended) or any Node.js hosting
- GitHub account

---

## 1. Supabase Setup

### Create Supabase Project
1. Go to [supabase.com](https://supabase.com) and create new project
2. Note down your project credentials:
   - Project URL: `https://[your-project].supabase.co`
   - Anon Key: Found in Settings > API

### Run Database Schema
Go to **SQL Editor** in Supabase and run the scripts in order:

```sql
-- Run scripts from /scripts folder:
1. scripts/create-tables.sql        -- Core tables
2. scripts/add-business-settings.sql -- Settings table
```

### Enable Row Level Security (RLS)
Run this SQL to secure your tables:

```sql
-- Enable RLS on all tables
ALTER TABLE customers ENABLE ROW LEVEL SECURITY;
ALTER TABLE staff ENABLE ROW LEVEL SECURITY;
ALTER TABLE services ENABLE ROW LEVEL SECURITY;
ALTER TABLE sales ENABLE ROW LEVEL SECURITY;
ALTER TABLE sale_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;
ALTER TABLE commissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE points_transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE business_settings ENABLE ROW LEVEL SECURITY;

-- Create policies for authenticated access
CREATE POLICY "authenticated_access" ON customers FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "authenticated_access" ON staff FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "authenticated_access" ON services FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "authenticated_access" ON sales FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "authenticated_access" ON sale_items FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "authenticated_access" ON bookings FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "authenticated_access" ON commissions FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "authenticated_access" ON points_transactions FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "authenticated_access" ON products FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "authenticated_access" ON business_settings FOR ALL USING (auth.role() = 'authenticated');
```

### Create Admin User
In Supabase Authentication > Users, create your admin user:
1. Click "Add User"
2. Enter email and password
3. After user is created, insert into users table:

```sql
INSERT INTO users (id, email, name, role) VALUES
('[user-id-from-auth]', 'admin@yoursalon.com', 'Admin', 'admin');
```

---

## 2. Local Development

```bash
# Clone repository
git clone https://github.com/[your-username]/hms-salon.git
cd hms-salon

# Install dependencies
npm install

# Create environment file
cp .env.example .env.local

# Edit .env.local with your Supabase credentials
NEXT_PUBLIC_SUPABASE_URL=https://[your-project].supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=[your-anon-key]

# Run development server
npm run dev
```

Visit `http://localhost:3000`

---

## 3. Deploy to Vercel (Recommended)

### Option A: One-Click Deploy
[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/[your-username]/hms-salon)

### Option B: Manual Deploy

1. Push code to GitHub
2. Go to [vercel.com](https://vercel.com)
3. Click "Import Project"
4. Select your GitHub repository
5. Add Environment Variables:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
6. Click Deploy

### Custom Domain
1. Go to Project Settings > Domains
2. Add your domain
3. Update DNS records as instructed

---

## 4. Alternative Deployment Options

### Deploy to Netlify
```bash
npm run build
# Upload .next folder to Netlify
```

### Deploy to Railway
```bash
# Connect GitHub repo to Railway
# Add environment variables
# Deploy automatically
```

### Self-Hosted (VPS)
```bash
# On your server
git clone [repo]
npm install
npm run build
npm run start

# Use PM2 for process management
npm install -g pm2
pm2 start npm --name "hms-salon" -- start
```

---

## 5. Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `NEXT_PUBLIC_SUPABASE_URL` | Yes | Supabase project URL |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Yes | Supabase anonymous key |

### Creating .env.example
```env
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

---

## 6. Post-Deployment Checklist

- [ ] Verify login works
- [ ] Test POS transaction flow
- [ ] Test appointment booking
- [ ] Verify customer points system
- [ ] Check staff commission tracking
- [ ] Test all report exports
- [ ] Configure business settings
- [ ] Set up operating hours
- [ ] Create staff accounts
- [ ] Import services catalog

---

## 7. Backup & Maintenance

### Database Backup
Supabase provides automatic daily backups (Pro plan). For manual backup:
```sql
-- Export via Supabase Dashboard > Database > Backups
```

### Update Dependencies
```bash
npm update
npm audit fix
```

---

## Support

For issues or questions:
- Create GitHub issue
- Check Supabase documentation
- Review Next.js deployment guides

---

*Last Updated: February 2026*
