import { NextRequest, NextResponse } from "next/server";
import { z } from "zod";
import { NotificationService } from "@/lib/services/notification-service";
import { createClient } from "@supabase/supabase-js";

// Zod schema for booking validation
const bookingSchema = z.object({
  customerName: z
    .string()
    .min(2, "Name must be at least 2 characters")
    .max(100, "Name must be under 100 characters")
    .trim(),
  customerPhone: z
    .string()
    .regex(/^[\d\s+\-()]{8,20}$/, "Invalid phone number format")
    .trim(),
  customerNotes: z
    .string()
    .max(500, "Notes must be under 500 characters")
    .optional()
    .default(""),
  serviceId: z.string().uuid("Invalid service ID"),
  staffId: z.string().uuid("Invalid staff ID").optional().nullable(),
  bookingDate: z
    .string()
    .regex(/^\d{4}-\d{2}-\d{2}$/, "Date must be YYYY-MM-DD format"),
  startTime: z
    .string()
    .regex(/^\d{2}:\d{2}(:\d{2})?$/, "Time must be HH:MM format"),
  endTime: z
    .string()
    .regex(/^\d{2}:\d{2}(:\d{2})?$/, "Time must be HH:MM format")
    .optional(),
});

// Use service role for public bookings (bypasses RLS)
// SERVICE_ROLE_KEY is required - do not fall back to anon key
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
if (!serviceRoleKey) {
  console.error("CRITICAL: SUPABASE_SERVICE_ROLE_KEY is not configured");
}

const supabaseAdmin = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  serviceRoleKey || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

/**
 * Validate request origin to prevent CSRF attacks.
 * Allows requests from same origin and configured allowed origins.
 */
function validateOrigin(request: NextRequest): boolean {
  const origin = request.headers.get("origin");
  const referer = request.headers.get("referer");
  const host = request.headers.get("host");

  // Allow server-side requests (no origin header)
  if (!origin && !referer) return true;

  // Build allowed origins list
  const allowedOrigins: string[] = [];
  if (host) {
    allowedOrigins.push(`https://${host}`, `http://${host}`);
  }
  if (process.env.NEXT_PUBLIC_APP_URL) {
    allowedOrigins.push(process.env.NEXT_PUBLIC_APP_URL);
  }
  // Always allow localhost in development
  if (process.env.NODE_ENV === "development") {
    allowedOrigins.push("http://localhost:3000", "http://localhost:3001");
  }

  if (origin && allowedOrigins.some((allowed) => origin.startsWith(allowed))) {
    return true;
  }
  if (referer && allowedOrigins.some((allowed) => referer.startsWith(allowed))) {
    return true;
  }

  return false;
}

export async function POST(request: NextRequest) {
  try {
    // CSRF protection: validate request origin
    if (!validateOrigin(request)) {
      return NextResponse.json(
        { error: "Forbidden: invalid request origin" },
        { status: 403 }
      );
    }

    // Warn if service role key is missing (use anon key as degraded fallback)
    if (!serviceRoleKey) {
      console.error("WARNING: Using anon key for booking - configure SUPABASE_SERVICE_ROLE_KEY");
    }

    const body = await request.json();

    // Validate input with Zod
    const result = bookingSchema.safeParse(body);
    if (!result.success) {
      const errors = result.error.issues.map((i) => i.message);
      return NextResponse.json(
        { error: "Validation failed", details: errors },
        { status: 400 }
      );
    }

    const {
      customerName,
      customerPhone,
      customerNotes,
      serviceId,
      staffId,
      bookingDate,
      startTime,
      endTime,
    } = result.data;

    // Check if customer exists (use maybeSingle to avoid error on 0 results)
    let customerId: string;
    const { data: existingCustomer } = await supabaseAdmin
      .from("customers")
      .select("id")
      .eq("phone", customerPhone)
      .maybeSingle();

    if (existingCustomer) {
      customerId = existingCustomer.id;
    } else {
      // Create new customer
      const { data: newCustomer, error: customerError } = await supabaseAdmin
        .from("customers")
        .insert({
          name: customerName,
          phone: customerPhone,
          tier: "Normal",
          points_balance: 0,
          created_at: new Date().toISOString(),
        })
        .select()
        .single();

      if (customerError) {
        return NextResponse.json(
          { error: "Failed to create customer" },
          { status: 500 }
        );
      }
      customerId = newCustomer.id;
    }

    // Check for duplicate booking (same customer + date + time)
    const { data: duplicateBooking } = await supabaseAdmin
      .from("bookings")
      .select("id")
      .eq("customer_id", customerId)
      .eq("booking_date", bookingDate)
      .eq("start_time", startTime)
      .in("status", ["pending", "confirmed"])
      .maybeSingle();

    if (duplicateBooking) {
      return NextResponse.json(
        { error: "A booking already exists for this date and time" },
        { status: 409 }
      );
    }

    // Create booking
    const { data: booking, error: bookingError } = await supabaseAdmin
      .from("bookings")
      .insert({
        customer_id: customerId,
        service_id: serviceId,
        staff_id: staffId || null,
        booking_date: bookingDate,
        booking_time: startTime, // Legacy column
        start_time: startTime,
        end_time: endTime,
        status: "pending",
        notes: customerNotes || `Online booking by ${customerName}`,
        created_at: new Date().toISOString(),
      })
      .select()
      .single();

    if (bookingError) {
      return NextResponse.json(
        { error: "Failed to create booking" },
        { status: 500 }
      );
    }

    // Send notification (non-blocking - don't fail booking if this fails)
    try {
      const { data: serviceData } = await supabaseAdmin
        .from("services")
        .select("name")
        .eq("id", serviceId)
        .single();

      if (serviceData) {
        await NotificationService.sendConfirmation({
          customerName,
          customerPhone,
          serviceName: serviceData.name,
          date: bookingDate,
          time: startTime,
          bookingId: booking.id,
        });
      }
    } catch {
      // Non-critical: notification failure doesn't affect booking
    }

    return NextResponse.json({
      success: true,
      bookingId: booking.id,
      message: "Booking created successfully",
    });
  } catch (error: unknown) {
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 }
    );
  }
}
