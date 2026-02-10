# HMS Salon - Improvements Log

## Session: February 8, 2026

### Completed Improvements

#### 1. Customer Birthday & Notes Fields
**Status:** Implemented

**Changes Made:**
- Added `birthday` and `notes` fields to customer forms
- New Customer modal now includes birthday picker and notes textarea
- Edit Customer modal added for updating existing customers
- Birthday indicator (cake emoji) shows on customer list for today's birthdays
- Notes preview shown in customer list table

**Files Modified:**
- `src/app/(dashboard)/customers/page.tsx` - Full customer form enhancement

**SQL Required:**
Run `scripts/add-customer-fields.sql` in Supabase:
```sql
ALTER TABLE customers ADD COLUMN IF NOT EXISTS birthday DATE;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS notes TEXT;
CREATE INDEX IF NOT EXISTS idx_customers_birthday ON customers(birthday);
```

---

#### 2. Refund/Void Transaction
**Status:** Implemented

**Changes Made:**
- Added void button on transaction list (admin only)
- Void confirmation modal with reason selection
- Reverses earned points on void
- Restores redeemed points on void
- Marks commissions as voided
- Visual indication of voided transactions (strikethrough)

**Files Modified:**
- `src/app/(dashboard)/reports/page.tsx` - Full void transaction feature

**SQL Required:**
Run `scripts/add-void-columns.sql` in Supabase:
```sql
ALTER TABLE sales ADD COLUMN IF NOT EXISTS voided_at TIMESTAMPTZ;
ALTER TABLE sales ADD COLUMN IF NOT EXISTS voided_by UUID;
ALTER TABLE sales ADD COLUMN IF NOT EXISTS void_reason TEXT;
ALTER TABLE commissions ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';
```

---

### Pending Improvements

#### 3. Reschedule & Cancel Booking
**Status:** Implemented

**Changes Made:**
- Reschedule modal with date and time picker
- Cancel booking modal with reason selection
- Auto-updates booking status (pending/cancelled)
- Deposit warning on cancellation
- Time slots from 9 AM to 8 PM

**Files Modified:**
- `src/app/(dashboard)/appointments/page.tsx` - Full reschedule & cancel implementation

---

#### 4. Product Sales in POS
**Status:** Implemented

**Changes Made:**
- Added Services/Products toggle tabs in POS
- Products grid with stock level indicator
- Stock validation before adding to cart
- Automatic inventory deduction on sale
- 5% commission rate for product sales
- Visual product badge in cart items

**Files Modified:**
- `src/app/(dashboard)/pos/page.tsx` - Full product sales integration

---

#### 5. Invoice/Receipt PDF Generation
**Status:** Implemented ✅

**Changes Made:**
- Added jsPDF library for PDF generation
- Created receipt generator utility (`lib/utils/receipt-generator.ts`)
- 58mm thermal receipt format (POS printer compatible)
- Bilingual labels (Malay + English)
- Includes: Business info, items, staff, points, payment method
- Download button added to POS Success Modal
- Receipt filename: `resit-{ID}-{date}.pdf`

**Files Created:**
- `src/lib/utils/receipt-generator.ts` - PDF generation utility

**Files Modified:**
- `src/app/(dashboard)/pos/page.tsx` - Added business info state, pass to modal
- `src/app/(dashboard)/pos/components/SuccessModal.tsx` - Download receipt button

**Usage:**
After completing a sale, click "Muat Turun Resit" to download PDF receipt.

---

### Pending Improvements

#### 6. Stock Adjustment History
**Priority:** MEDIUM
**Scope:**
- Track all stock changes (adjustments, sales, returns)
- Show history in inventory module
- Export capability

#### 7. WhatsApp Notifications via n8n
**Status:** Implemented ✅

**Changes Made:**
- Added n8n webhook integration for WhatsApp notifications
- Provider selection UI (None / Twilio SMS / WhatsApp n8n)
- Webhook test button for connection verification
- Server-side NotificationService for API routes
- Bilingual WhatsApp templates with emoji support
- Auto phone number formatting (Malaysian +60)

**Files Created:**
- `src/lib/services/notification-service.ts`

**Files Modified:**
- `src/lib/services/sms-service.ts`
- `src/app/(dashboard)/settings/components/SMSNotificationSettings.tsx`
- `src/app/api/public/booking/route.ts`

**n8n Webhook Payload:**
```json
{
  "to": "+60123456789",
  "message": "✅ Tempahan Disahkan...",
  "type": "whatsapp",
  "notification_type": "confirmation | reminder | test"
}
```

---

#### 8. Staff Attendance
**Priority:** LOW
**Scope:**
- Clock in/out functionality
- Attendance report
- Overtime tracking

#### 9. Package/Bundle Deals
**Priority:** LOW
**Scope:**
- Create service packages with discount
- Package selection in POS
- Validity period for packages

#### 10. Enhanced Reports
**Priority:** LOW
**Scope:**
- YoY comparison
- Peak hours analysis
- Customer retention metrics
- LTV calculation

---

## Customer Booking Portal

### Already Implemented:
- 5-step booking flow
- Service & staff selection
- Date/time with slot availability
- Existing customer detection by phone
- WhatsApp confirmation link

### Required Setup:
1. Run RLS policies: `scripts/public-booking-rls.sql`
2. Or add `SUPABASE_SERVICE_ROLE_KEY` to `.env.local`

---

## Quick Reference - SQL Scripts

| Script | Purpose |
|--------|---------|
| `add-customer-fields.sql` | Add birthday & notes columns |
| `add-void-columns.sql` | Add void transaction columns |
| `public-booking-rls.sql` | Allow public booking access |
| `create-tables.sql` | Base schema |
| `alter-schema.sql` | Schema updates |

---

## Estimated Completion

| Phase | Items | Time |
|-------|-------|------|
| Phase 1 (Core) | Void, Reschedule, Cancel | 1 session |
| Phase 2 (Sales) | Products, Invoice | 1 session |
| Phase 3 (Ops) | SMS, Attendance | 1 session |
| Phase 4 (Analytics) | Reports, Packages | 1 session |

---

*Last Updated: February 8, 2026*
*Session by: Tokwi v4.0*
