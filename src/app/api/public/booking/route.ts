import { NextRequest, NextResponse } from "next/server";
import { NotificationService } from "@/lib/services/notification-service";
import { createClient } from "@supabase/supabase-js";

// Use service role for public bookings (bypasses RLS)
const supabaseAdmin = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const {
      customerName,
      customerPhone,
      customerNotes,
      serviceId,
      staffId,
      bookingDate,
      startTime,
      endTime,
    } = body;

    // Validate required fields
    if (!customerName || !customerPhone || !serviceId || !bookingDate || !startTime) {
      return NextResponse.json(
        { error: "Missing required fields" },
        { status: 400 }
      );
    }

    // Check if customer exists
    let customerId: string;
    const { data: existingCustomer } = await supabaseAdmin
      .from("customers")
      .select("id")
      .eq("phone", customerPhone)
      .single();

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
        console.error("Customer creation error:", customerError);
        return NextResponse.json(
          { error: `Failed to create customer: ${customerError.message}` },
          { status: 500 }
        );
      }
      customerId = newCustomer.id;
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
      console.error("Booking creation error:", bookingError);
      return NextResponse.json(
        { error: `Failed to create booking: ${bookingError.message}` },
        { status: 500 }
      );
    }

    // Send WhatsApp/SMS Confirmation (Optional/Background)
    try {
      const { data: serviceData } = await supabaseAdmin
        .from("services")
        .select("name")
        .eq("id", serviceId)
        .single();

      if (serviceData) {
        const notificationResult = await NotificationService.sendConfirmation({
          customerName,
          customerPhone,
          serviceName: serviceData.name,
          date: bookingDate,
          time: startTime,
          bookingId: booking.id
        });
        console.log("[Booking] Notification result:", notificationResult);
      }
    } catch (notificationError) {
      console.error("Notification failed:", notificationError);
      // Don't fail the booking if notification fails
    }

    return NextResponse.json({
      success: true,
      bookingId: booking.id,
      message: "Booking created successfully",
    });
  } catch (error: any) {
    console.error("API error:", error);
    return NextResponse.json(
      { error: error.message || "Internal server error" },
      { status: 500 }
    );
  }
}
