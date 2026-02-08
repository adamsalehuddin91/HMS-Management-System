# HMS Salon Management System
## Complete Use Case & Features Guide

**Version:** 1.0
**Last Updated:** February 2026
**System:** Web-based Salon Management Platform

---

## Executive Summary

HMS Salon is a comprehensive, modern salon management system designed to streamline daily operations, track staff performance, manage customer loyalty, and provide real-time business insights. Built for hair salons, beauty centers, and wellness spas.

---

## Table of Contents

1. [Dashboard & Analytics](#1-dashboard--analytics)
2. [Appointment Management](#2-appointment-management)
3. [Customer & Loyalty Management](#3-customer--loyalty-management)
4. [Point of Sale (POS)](#4-point-of-sale-pos)
5. [Staff & Commission Management](#5-staff--commission-management)
6. [Services & Pricing](#6-services--pricing)
7. [Inventory Management](#7-inventory-management)
8. [Reports & Analytics](#8-reports--analytics)
9. [Business Settings](#9-business-settings)
10. [User Roles & Access](#10-user-roles--access)

---

## 1. Dashboard & Analytics

### Purpose
Real-time overview of business performance at a glance.

### Features

| Feature | Description |
|---------|-------------|
| Today's Sales | Current day revenue with comparison to yesterday |
| Weekly Sales Chart | Visual bar chart showing Mon-Sun performance |
| Monthly Commission | Total staff commissions for the month |
| Points Issued | Loyalty points distributed this month |
| Top Services | 5 best-performing services by revenue |
| Upcoming Appointments | Next 5 scheduled bookings |

### Use Cases

**Scenario 1: Morning Business Check**
> Owner opens dashboard at 9 AM to see yesterday's performance (+15% vs previous day), checks 5 upcoming appointments, and notes which services are trending.

**Scenario 2: Weekly Review**
> Manager reviews weekly sales chart every Monday to identify slow days and plan promotions accordingly.

---

## 2. Appointment Management

### Purpose
Centralized booking calendar with status tracking and deposit management.

### Calendar View Features

| View Mode | Description |
|-----------|-------------|
| Month View | Full month overview with color-coded bookings |
| Day Selection | Click any date to see detailed appointments |
| Status Colors | Blue (Confirmed), Orange (Pending), Green (Completed), Gray (Cancelled) |

### Booking Details

- Customer name and membership tier
- Service name, price, and duration
- Assigned stylist/therapist
- Deposit amount and payment status
- Special notes/requests

### New Booking Process

| Step | Action |
|------|--------|
| 1. Customer | Search existing or create walk-in customer |
| 2. Service | Select service and assign staff member |
| 3. Date/Time | Pick available date and 30-min time slot |
| 4. Confirm | Review details, set deposit (25% default) |

### Use Cases

**Scenario 1: Phone Booking**
> Receptionist receives call, searches customer "Sarah", selects "Hair Coloring" service, assigns to "Amy (Senior Stylist)", picks Saturday 2:30 PM, confirms with RM50 deposit requirement.

**Scenario 2: Walk-in Customer**
> New customer arrives without appointment. Staff creates booking with walk-in option, enters name and phone for future marketing.

**Scenario 3: Convert to Sale**
> Customer completes service. Staff clicks "Convert to Sale" to transfer booking details directly to POS for payment.

---

## 3. Customer & Loyalty Management

### Purpose
Build customer relationships through membership tiers and reward points.

### Customer Information

| Field | Description |
|-------|-------------|
| Name & Phone | Primary contact details |
| Email | For marketing communications |
| Tier | Normal / Member / VIP |
| Points Balance | Current redeemable points |
| Visit History | Total visits and spending |

### Loyalty Points System

| Action | Points |
|--------|--------|
| Every RM 1 spent | 1 point earned |
| Member bonus | 2x points multiplier |
| Redemption | 100 points = RM 3 discount |
| Max redemption | 20% of bill |

### Admin Controls

- **Adjust Points**: Add or deduct points manually
- **Adjustment Reasons**: Referral Bonus, Birthday Bonus, Correction, Promotion
- **Activity Log**: Complete history of all point transactions

### Use Cases

**Scenario 1: Birthday Reward**
> Admin searches customer "Lisa", clicks Adjust Points, adds 500 points with reason "Birthday Bonus". Lisa receives notification of reward.

**Scenario 2: Referral Program**
> Customer refers friend. Admin adds 200 referral bonus points to both customers' accounts.

**Scenario 3: Activity Review**
> Manager checks customer's activity log to see their earning/spending pattern over past 6 months.

---

## 4. Point of Sale (POS)

### Purpose
Complete sales transaction processing with staff commission tracking.

### Transaction Flow

```
Select Services → Assign Staff → Add Customer → Redeem Points → Choose Payment → Complete Sale
```

### Key Features

| Feature | Description |
|---------|-------------|
| Service Grid | Browse by category, search by name |
| Member Pricing | Auto-applies discounted price for members |
| Staff Assignment | Primary stylist + optional sharing staff |
| Commission Preview | See commission breakdown before completing |
| Points Redemption | Redeem customer points for discount |
| Multiple Payments | Cash, QR Pay, Card, Bank Transfer |

### Staff Sharing & Commission

| Scenario | Primary Staff | Secondary Staff |
|----------|---------------|-----------------|
| Stylist alone | 15% | - |
| 2 Stylists sharing | 8% each | 8% each |
| Stylist + Assistant | 10% | 5% |
| Assistant alone | 10% | - |

### Use Cases

**Scenario 1: Regular Sale**
> Customer "Amy" gets haircut (RM80). Staff selects service, assigns stylist "John", customer pays cash. John earns RM12 commission (15%).

**Scenario 2: Service Sharing**
> Customer gets hair coloring (RM250). Senior stylist "May" does coloring while assistant "Ali" helps with washing. May gets RM25 (10%), Ali gets RM12.50 (5%).

**Scenario 3: Member with Points**
> VIP member "Sarah" has 500 points. Gets facial (RM180), redeems 500 points for RM15 discount, pays RM165. Earns 165 new points.

**Scenario 4: Booking Conversion**
> Customer arrives for 3 PM appointment. Staff clicks booking, "Convert to Sale", all details pre-filled. Complete payment in 30 seconds.

---

## 5. Staff & Commission Management

### Purpose
Track staff performance and manage commission payouts.

### Staff Dashboard

| Metric | Description |
|--------|-------------|
| Total Staff | Active team members |
| Monthly Commission | Combined earnings this month |
| Services Completed | Number of services performed |
| Average Rating | Customer feedback score |

### Staff Profile

- Personal details (name, phone, email)
- Role (Stylist, Senior Stylist, Therapist, Assistant)
- Active/Inactive status
- Monthly performance metrics

### Commission Features

| Feature | Description |
|---------|-------------|
| Auto-calculation | Commission calculated per sale automatically |
| Manual Adjustment | Add bonus or deduction with reason |
| History Tracking | View all commission transactions |
| Monthly Summary | Total earnings per staff per month |

### Adjustment Reasons

- Performance Bonus
- Customer Compliment
- Overtime Work
- Training Completion
- Sales Target Achieved
- Late Attendance (deduction)
- Customer Complaint (deduction)

### Use Cases

**Scenario 1: Performance Bonus**
> Stylist "May" exceeded monthly target. Manager adjusts commission +RM200 with reason "Sales Target Achieved".

**Scenario 2: Commission Review**
> Owner reviews monthly report, sees "John" earned RM2,450 from 45 services. Compares with last month's RM2,100.

**Scenario 3: New Staff Onboarding**
> Admin adds new staff "Sara", sets role as "Junior Stylist", marks as active. Sara can now be assigned to services.

---

## 6. Services & Pricing

### Purpose
Manage service catalog with member pricing and commission rates.

### Service Information

| Field | Description |
|-------|-------------|
| Name | Service display name |
| Category | Haircut, Hair Spa, Facial, Treatment, etc. |
| Regular Price | Standard customer price |
| Member Price | Discounted member price |
| Duration | Service time in minutes |
| Commission Rate | Staff earning percentage |

### Categories

- Haircut
- Hair Spa
- Hair Coloring
- Facial
- Treatment
- Henna
- Massage

### Use Cases

**Scenario 1: Price Update**
> Owner increases "Premium Hair Spa" from RM150 to RM180, member price from RM120 to RM150. Changes apply immediately.

**Scenario 2: New Service**
> Salon introduces "Keratin Treatment" at RM350 (member RM300), 120 minutes duration, 12% commission rate.

**Scenario 3: Seasonal Promotion**
> Temporarily reduce member price for "Facial Package" for Raya promotion. Revert after promotion ends.

---

## 7. Inventory Management

### Purpose
Track product stock levels and manage supplies.

### Dashboard Metrics

| Metric | Description |
|--------|-------------|
| Total Products | Active products in system |
| Low Stock Alert | Products below reorder level |
| Total Value | Combined inventory value |

### Product Information

| Field | Description |
|-------|-------------|
| Name | Product display name |
| Brand | Manufacturer/brand |
| SKU | Stock keeping unit code |
| Category | Shampoo, Conditioner, Treatment, etc. |
| Cost Price | Purchase cost |
| Sell Price | Customer price |
| Stock Level | Current quantity |
| Reorder Level | Low stock alert threshold |

### Stock Status Indicators

| Status | Description |
|--------|-------------|
| Green | Healthy stock level |
| Orange | Low stock (at/below threshold) |
| Red | Out of stock |

### Use Cases

**Scenario 1: Restock Alert**
> Dashboard shows 3 low stock items. Manager orders "L'Oreal Shampoo" (5 remaining, reorder at 10).

**Scenario 2: Product Sale**
> Customer buys "Hair Serum" RM45 at checkout. Stock automatically reduces by 1.

**Scenario 3: New Product**
> Salon adds new "Moroccan Oil" product: RM85 sell price, RM45 cost, initial stock 20 units.

---

## 8. Reports & Analytics

### Purpose
Business intelligence and performance tracking.

### Report Types

| Report | Description |
|--------|-------------|
| Sales Overview | Today, week, month revenue |
| Top Services | Best performing services by revenue |
| Staff Commission | Individual earnings breakdown |
| Transaction History | Recent sales with status |
| Customer Activity | Active customer count |

### Date Filters

- Today
- This Week
- This Month
- Last Month
- Custom Range

### Export Features

- Download CSV reports
- Financial summary export
- Staff commission export

### Use Cases

**Scenario 1: Monthly Review**
> Owner generates "This Month" report. Sees RM45,000 revenue, 320 transactions, top service is "Hair Coloring" with RM12,000.

**Scenario 2: Staff Performance**
> Manager compares staff commissions. "Amy" leads with RM3,200, followed by "John" RM2,800. Uses data for performance reviews.

**Scenario 3: Accountant Export**
> End of month, export financial report CSV for accountant. Includes all transactions with payment methods.

---

## 9. Business Settings

### Purpose
Configure system behavior and business rules.

### Settings Sections

| Section | Configurable Options |
|---------|---------------------|
| Business Info | Name, phone, email, WhatsApp, address |
| Operating Hours | Open/close times per day, closed days |
| Loyalty Program | Points earning rate, redemption rules, expiry |
| Notifications | Coming soon |
| User Roles | Permission management |
| Security | Coming soon |

### Loyalty Configuration

| Setting | Description |
|---------|-------------|
| Points per RM | How many points earned per RM spent |
| Member Multiplier | Bonus multiplier for members (e.g., 2x) |
| Points per Discount | Points needed for RM1 discount |
| Max Redemption | Maximum % of bill payable by points |
| Expiry Period | Months until points expire |

### Use Cases

**Scenario 1: Holiday Hours**
> Set Sunday as closed during Ramadan. Toggle "Closed" for Sundays in Operating Hours.

**Scenario 2: Loyalty Boost**
> Increase member multiplier from 2x to 3x for festive season promotion.

**Scenario 3: Contact Update**
> Update business phone number and WhatsApp for new line.

---

## 10. User Roles & Access

### Purpose
Control system access based on staff roles.

### Role Permissions

| Feature | Admin | Staff |
|---------|-------|-------|
| Dashboard | Full | View Only |
| POS | Full | Full |
| Appointments | Full | Full |
| Customers | Full | View Only |
| Staff Management | Full | No Access |
| Services | Full | View Only |
| Inventory | Full | No Access |
| Reports | Full | Limited |
| Settings | Full | No Access |

### Use Cases

**Scenario 1: New Staff Login**
> New receptionist gets Staff role. Can process sales and bookings but cannot change prices or view reports.

**Scenario 2: Manager Promotion**
> Promote senior staff to Admin role for full system access including settings.

---

## System Benefits Summary

### For Owners
- Real-time business visibility
- Automated commission calculations
- Customer loyalty insights
- Financial reporting

### For Managers
- Staff performance tracking
- Inventory alerts
- Appointment oversight
- Report generation

### For Staff
- Easy POS transactions
- Clear commission tracking
- Simple booking management
- Customer information access

### For Customers
- Loyalty rewards
- Member discounts
- Appointment reminders
- Professional service

---

## Technical Specifications

| Aspect | Details |
|--------|---------|
| Platform | Web-based (Desktop & Tablet optimized) |
| Database | Cloud-hosted (Supabase/PostgreSQL) |
| Security | Role-based access, encrypted data |
| Availability | 24/7 cloud access |
| Updates | Automatic, no downtime |

---

## Feature Count Summary

| Category | Count |
|----------|-------|
| Main Modules | 10 |
| Dashboard Pages | 10 |
| Database Tables | 11 |
| Forms & Modals | 20+ |
| Report Types | 5 |
| User Roles | 2 |

---

## Support & Contact

For system support or feature requests, please contact the development team.

---

*Document auto-generated from HMS Salon v1.0 codebase*
*Features may be updated as system evolves*
