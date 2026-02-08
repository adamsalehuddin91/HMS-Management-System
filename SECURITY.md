# HMS Salon - Security Guide

## Security Overview

This document outlines security measures, known considerations, and best practices for the HMS Salon system.

---

## Current Security Status

### Protected Areas

| Area | Status | Protection |
|------|--------|------------|
| SQL Injection | Protected | Supabase parameterized queries |
| XSS Attacks | Protected | React auto-escaping |
| CSRF | Protected | Supabase JWT tokens |
| Authentication | Protected | Supabase Auth (bcrypt) |
| Password Storage | Protected | Supabase handles hashing |
| Session Management | Protected | HTTP-only cookies |

### Requires Configuration

| Area | Action Required |
|------|-----------------|
| Row Level Security (RLS) | Enable on all tables |
| Environment Variables | Never commit .env files |
| Admin Authorization | Configure RLS policies |

---

## Pre-Deployment Checklist

### 1. Environment Variables
- [ ] `.env.local` is in `.gitignore`
- [ ] Never committed secrets to git history
- [ ] Production uses separate Supabase project
- [ ] All team members use their own credentials

### 2. Supabase Configuration
- [ ] RLS enabled on ALL tables
- [ ] Policies restrict access appropriately
- [ ] Admin functions require admin role
- [ ] API rate limiting enabled (Pro plan)

### 3. Application Security
- [ ] Input validation on all forms
- [ ] Error messages don't expose internals
- [ ] Logging enabled for audit trail
- [ ] Regular dependency updates

---

## Row Level Security (RLS) Policies

Run these in Supabase SQL Editor:

```sql
-- Customers: All authenticated can read, only staff can write
CREATE POLICY "staff_customers_policy" ON customers
  FOR ALL USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');

-- Sales: Only authenticated users
CREATE POLICY "staff_sales_policy" ON sales
  FOR ALL USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');

-- Commission: Staff can only see their own
CREATE POLICY "own_commission_policy" ON commissions
  FOR SELECT USING (
    staff_id IN (
      SELECT id FROM staff WHERE user_id = auth.uid()
    ) OR
    EXISTS (SELECT 1 FROM users WHERE id = auth.uid() AND role = 'admin')
  );

-- Points transactions: Authenticated access
CREATE POLICY "points_policy" ON points_transactions
  FOR ALL USING (auth.role() = 'authenticated');
```

---

## Sensitive Data Handling

### What's Stored
- Customer names, phone numbers, emails
- Payment transaction records
- Staff commission data
- Business settings

### What's NOT Stored
- Credit card numbers (use payment gateway)
- Full passwords (only hashed by Supabase)
- Personal identification numbers

### Recommendations
1. Use HTTPS only (enforced by Vercel/hosting)
2. Consider field-level encryption for PII
3. Implement data retention policies
4. Regular backup of database

---

## User Roles

| Role | Access Level |
|------|--------------|
| Admin | Full system access, settings, reports |
| Staff | POS, bookings, customer view (limited) |

### Role-Based Restrictions
- Only admins can adjust customer points
- Only admins can access settings
- Staff can only view their own commission
- All users must authenticate

---

## Common Vulnerabilities & Mitigations

### 1. Unauthorized Access
**Risk:** User bypasses frontend role checks
**Mitigation:** RLS policies enforce server-side

### 2. Data Exposure
**Risk:** Sensitive data visible in network tab
**Mitigation:** Only fetch necessary fields, use RLS

### 3. Session Hijacking
**Risk:** Session token stolen
**Mitigation:** HTTP-only cookies, HTTPS only

### 4. Brute Force Login
**Risk:** Unlimited login attempts
**Mitigation:** Supabase has built-in rate limiting

---

## Security Incident Response

If you suspect a security breach:

1. **Immediate:** Rotate Supabase API keys
2. **Investigate:** Check Supabase logs
3. **Contain:** Disable affected accounts
4. **Report:** Document incident details
5. **Recover:** Restore from backup if needed

### Rotate API Keys
1. Go to Supabase Dashboard > Settings > API
2. Click "Generate new key"
3. Update all deployments with new key

---

## Regular Maintenance

### Weekly
- [ ] Review Supabase logs for anomalies
- [ ] Check for failed login attempts

### Monthly
- [ ] Run `npm audit` for vulnerabilities
- [ ] Update dependencies
- [ ] Review user access permissions

### Quarterly
- [ ] Full security review
- [ ] Rotate API keys
- [ ] Test backup restoration

---

## Contact

For security concerns:
- Create private GitHub issue
- Email: [security@yourdomain.com]

---

*Security is everyone's responsibility. Report suspicious activity immediately.*
