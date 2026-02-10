# HMS Salon - Feature Roadmap

## Current Version: v1.0 (LIVE)
All core salon management features completed.

---

## Next Phase: Customer Booking Portal

### Priority: HIGH
### Requested: February 2026

### Feature Description
Public booking page where customers can:
- View available time slots
- Book appointments directly
- Select preferred service & stylist
- Receive confirmation via WhatsApp/SMS

---

### Proposed Features

#### 1. Public Booking Page (`/book`)
- No login required for customers
- Mobile-friendly design
- Salon branding (logo, colors)

#### 2. Service Selection
- Browse available services
- See prices (regular & member)
- View service duration
- Filter by category

#### 3. Staff Selection (Optional)
- View available stylists
- "Any available" option
- Staff photos & specialties

#### 4. Date & Time Selection
- Calendar view
- Only show available slots
- Block fully booked times
- Respect operating hours
- Buffer time between bookings

#### 5. Customer Information
- Name & phone (required)
- Email (optional)
- Special requests/notes

#### 6. Booking Confirmation
- Summary before confirm
- Deposit requirement (optional)
- WhatsApp confirmation message
- Booking reference number

#### 7. Slot Availability Logic
```
Available Slots = Operating Hours
                  - Existing Bookings
                  - Staff Breaks
                  - Buffer Time
```

---

### Technical Requirements

#### New Pages
| Page | Route | Access |
|------|-------|--------|
| Booking Portal | `/book` | Public |
| Slot Checker | `/book/slots` | Public API |
| Confirmation | `/book/confirm` | Public |
| Success | `/book/success` | Public |

#### New API Endpoints
| Endpoint | Purpose |
|----------|---------|
| `GET /api/services` | List active services |
| `GET /api/staff` | List available staff |
| `GET /api/slots?date=&service=` | Available time slots |
| `POST /api/bookings` | Create booking |

#### Database Changes
- Add `is_online_booking` to bookings table
- Add `booking_source` (walk-in, phone, online)
- Add `confirmation_sent` flag

---

### UI Mockup Flow

```
[Select Service]
      ↓
[Choose Date]
      ↓
[Pick Time Slot] → Shows only available
      ↓
[Select Staff] (optional)
      ↓
[Enter Details] → Name, Phone
      ↓
[Review & Confirm]
      ↓
[Success + WhatsApp Link]
```

---

### WhatsApp Integration

#### Confirmation Message Template
```
Salam! Terima kasih kerana membuat tempahan di [Salon Name].

📅 Tarikh: [Date]
⏰ Masa: [Time]
💇 Servis: [Service]
👤 Stylist: [Staff Name]

Sila hadir 10 minit awal.
Untuk batal/tukar, hubungi [Phone].

Nombor Tempahan: [Booking ID]
```

#### Send via WhatsApp API
- Option 1: WhatsApp Business API
- Option 2: Click-to-WhatsApp link
- Option 3: Twilio WhatsApp

---

### Slot Calculation Example

**Operating Hours:** 9:00 AM - 9:00 PM
**Service Duration:** 60 minutes
**Buffer Time:** 15 minutes

**Existing Bookings on Feb 10:**
- 10:00 AM - 11:00 AM (Booked)
- 2:00 PM - 3:30 PM (Booked)

**Available Slots:**
- 9:00 AM ✓
- 11:15 AM ✓
- 12:30 PM ✓
- 3:45 PM ✓
- 5:00 PM ✓
- 6:15 PM ✓
- 7:30 PM ✓

---

### Security Considerations

| Risk | Mitigation |
|------|------------|
| Spam bookings | Rate limiting, phone verification |
| Fake bookings | Deposit requirement option |
| Bot attacks | reCAPTCHA |
| Data privacy | Only collect necessary info |

---

### Estimated Development

| Component | Complexity |
|-----------|------------|
| Public booking UI | Medium |
| Slot availability API | Medium |
| WhatsApp integration | Low-Medium |
| Admin booking management | Already exists |

---

### Future Enhancements

- [ ] Online payment for deposit
- [ ] Customer login for booking history
- [ ] Reschedule/cancel by customer
- [ ] Automated reminders (24hr before)
- [ ] Google Calendar sync
- [ ] Waitlist for fully booked slots

---

## Other Planned Features

### Phase 2
- [ ] Customer self-booking portal ← **NEXT**
- [ ] WhatsApp notifications
- [ ] Online payment integration

### Phase 3
- [ ] Customer mobile app
- [ ] Staff mobile app
- [ ] Multi-branch support

### Phase 4
- [ ] Advanced analytics
- [ ] Marketing automation
- [ ] Integration with accounting software

---

*Last Updated: February 8, 2026*
