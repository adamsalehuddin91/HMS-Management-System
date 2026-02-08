# HMS Salon - Business Roles & Permissions

## Overview

HMS Salon has two main user roles designed for salon operations:

| Role | Description | Typical Users |
|------|-------------|---------------|
| **Admin** | Full system access | Owner, Manager |
| **Staff** | Operational access | Stylists, Therapists, Receptionists |

---

## Admin Role

### Who Should Be Admin?
- Salon Owner
- Branch Manager
- Senior Manager
- Accounts/Finance Person

### Full Access To:

| Module | Capabilities |
|--------|--------------|
| **Dashboard** | View all business metrics, sales trends, performance data |
| **POS** | Process sales, apply discounts, void transactions |
| **Appointments** | View all bookings, reschedule, cancel, assign staff |
| **Customers** | View all customers, adjust points, change tiers, export data |
| **Staff** | Add/edit staff, view all commissions, make adjustments |
| **Services** | Add/edit services, set prices, configure commission rates |
| **Inventory** | Full stock management, add products, adjust quantities |
| **Reports** | Access all reports, export financial data |
| **Settings** | Configure business info, operating hours, loyalty program |

### Admin-Only Actions:

| Action | Purpose |
|--------|---------|
| Adjust Customer Points | Add bonus points, correct errors, promotions |
| Modify Commission | Add bonuses, deductions for staff |
| Change Service Prices | Update pricing, member discounts |
| Access Financial Reports | Revenue, commission summaries |
| Configure System Settings | Business rules, loyalty program |
| Export Data | Customer lists, financial reports (CSV) |
| Void Transactions | Cancel completed sales |

---

## Staff Role

### Who Should Be Staff?
- Hairstylists
- Beauty Therapists
- Nail Technicians
- Receptionists
- Junior Staff

### Access Permissions:

| Module | Access Level | What They Can Do |
|--------|--------------|------------------|
| **Dashboard** | View Only | See today's appointments, basic stats |
| **POS** | Full | Process sales, assign themselves, collect payment |
| **Appointments** | Full | Create bookings, view calendar, manage their schedule |
| **Customers** | View Only | See customer info, check points balance |
| **Staff** | View Own Only | See their own commission, not others |
| **Services** | View Only | See service list and prices |
| **Inventory** | No Access | Cannot view stock (Admin only) |
| **Reports** | Limited | View own performance only |
| **Settings** | No Access | Cannot change system settings |

### Staff Restrictions:

| Action | Allowed? |
|--------|----------|
| Adjust customer points | No |
| View other staff commissions | No |
| Change service prices | No |
| Access inventory | No |
| Export reports | No |
| Configure settings | No |
| Void transactions | No |

---

## Daily Operations by Role

### Morning Opening (Admin)

| Time | Task | Role |
|------|------|------|
| 8:30 AM | Check dashboard for today's appointments | Admin |
| 8:45 AM | Review yesterday's sales summary | Admin |
| 9:00 AM | Confirm staff attendance | Admin |

### During Business Hours (Staff)

| Task | Role |
|------|------|
| Check-in walk-in customers | Staff/Admin |
| Process POS transactions | Staff/Admin |
| Create new bookings | Staff/Admin |
| Complete services & collect payment | Staff/Admin |
| View own commission earnings | Staff |

### End of Day (Admin)

| Task | Role |
|------|------|
| Review daily sales report | Admin |
| Check commission totals | Admin |
| Verify cash collection | Admin |
| Export daily report if needed | Admin |

---

## Commission Visibility

### Admin View
- See ALL staff commissions
- Monthly totals per staff member
- Make adjustments (bonus/deduction)
- View commission breakdown by service

### Staff View
- See ONLY their own commission
- Monthly earnings
- Service breakdown for their sales
- Cannot see other staff earnings

---

## Customer Points Management

### Who Can Adjust Points?

| Action | Admin | Staff |
|--------|-------|-------|
| View customer points | Yes | Yes |
| Add bonus points | Yes | No |
| Deduct points | Yes | No |
| Change customer tier | Yes | No |
| View points history | Yes | Yes |

### Point Adjustment Reasons (Admin Only)
- Referral Bonus
- Birthday Bonus
- Promotion
- Correction
- Complaint Resolution

---

## Report Access

### Admin Reports
| Report | Access |
|--------|--------|
| Daily Sales Summary | Full |
| Weekly Revenue Trend | Full |
| Monthly Commission Report | Full |
| Top Services Ranking | Full |
| Customer Analytics | Full |
| Staff Performance | All Staff |
| Export to CSV | Yes |

### Staff Reports
| Report | Access |
|--------|--------|
| Own Commission | Yes |
| Own Services Count | Yes |
| Other Staff Data | No |
| Financial Totals | No |
| Export | No |

---

## Recommended Staff Structure

### Small Salon (1-5 staff)
```
1 Admin (Owner/Manager)
2-4 Staff (Stylists/Therapists)
```

### Medium Salon (6-15 staff)
```
1-2 Admin (Owner + Manager)
1 Admin (Receptionist with admin rights)
5-12 Staff (Stylists/Therapists)
```

### Large Salon / Multiple Branches
```
1 Super Admin (Owner)
2-3 Admin per branch (Branch Managers)
1 Admin (Accounts/Finance)
Multiple Staff per branch
```

---

## Security Best Practices

### Password Policy
- Minimum 8 characters
- Change every 90 days
- Don't share login credentials

### Account Management
- Create individual accounts (no shared logins)
- Deactivate accounts when staff leaves
- Admin should review access quarterly

### Data Protection
- Only Admin can export customer data
- Staff cannot see financial reports
- All actions are logged for audit

---

## Quick Reference Card

### Admin Can:
- Everything a Staff can do, PLUS:
- Adjust customer points
- Modify staff commissions
- Change prices and settings
- Access all reports
- Export data
- Void transactions

### Staff Can:
- Process sales (POS)
- Create/manage bookings
- View customer info
- See own commission
- Assign themselves to services

### Staff Cannot:
- Adjust points
- See other staff commissions
- Change prices
- Access inventory
- Export reports
- Modify settings

---

## Setup Checklist for New Staff

- [ ] Create user account with correct role
- [ ] Set temporary password
- [ ] Staff changes password on first login
- [ ] Train on POS system
- [ ] Train on booking system
- [ ] Explain commission structure
- [ ] Provide this role guide

---

*Document for HMS Salon Management System*
*Last Updated: February 2026*
