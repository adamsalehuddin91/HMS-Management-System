import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { z } from "zod";
import { logError } from "@/lib/utils/error-logger";

// Validation schema
const smsRequestSchema = z.object({
    to: z.string().regex(/^[\d\s+\-()]{8,20}$/, "Invalid phone number"),
    type: z.enum(["confirmation", "reminder"]),
    customerName: z.string().min(1),
    serviceName: z.string().min(1),
    date: z.string(),
    time: z.string(),
});

// Use service role to access SMS settings securely
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

// Only create client if key exists (will check at runtime)
const supabaseAdmin = serviceRoleKey
    ? createClient(process.env.NEXT_PUBLIC_SUPABASE_URL!, serviceRoleKey)
    : null;

/**
 * Server-side SMS/WhatsApp sending API
 * Protects Twilio credentials from client exposure
 */
export async function POST(request: NextRequest) {
    try {
        // Runtime check for service role key
        if (!serviceRoleKey || !supabaseAdmin) {
            logError('SMS API', 'CRITICAL: SUPABASE_SERVICE_ROLE_KEY is not configured');
            return NextResponse.json(
                { error: "Server configuration error" },
                { status: 500 }
            );
        }

        // Validate request body
        const body = await request.json();
        const result = smsRequestSchema.safeParse(body);

        if (!result.success) {
            return NextResponse.json(
                { error: "Invalid request", details: result.error.issues },
                { status: 400 }
            );
        }

        const { to, type, customerName, serviceName, date, time } = result.data;

        // Fetch SMS settings from database (server-side only)
        const { data: settingsData } = await supabaseAdmin
            .from("business_settings")
            .select("setting_value")
            .eq("setting_key", "sms_settings")
            .single();

        if (!settingsData?.setting_value) {
            return NextResponse.json(
                { error: "SMS settings not configured" },
                { status: 500 }
            );
        }

        const settings = settingsData.setting_value;

        // Check if notifications are enabled
        if (!settings.is_enabled) {
            return NextResponse.json(
                { success: false, reason: "disabled" },
                { status: 200 }
            );
        }

        // Check if specific notification type is enabled
        if (type === "confirmation" && !settings.confirm_enabled) {
            return NextResponse.json(
                { success: false, reason: "confirmation_disabled" },
                { status: 200 }
            );
        }

        if (type === "reminder" && !settings.reminder_enabled) {
            return NextResponse.json(
                { success: false, reason: "reminder_disabled" },
                { status: 200 }
            );
        }

        // Prepare template data
        const templateData: Record<string, string> = {
            name: customerName,
            service: serviceName,
            date,
            time,
        };

        // Interpolate template
        const interpolate = (template: string) => {
            return template.replace(/{(\w+)}/g, (match, key) => {
                return templateData[key] || match;
            });
        };

        // Send via WhatsApp (n8n) if enabled
        if (settings.whatsapp_enabled && settings.provider === "n8n") {
            const template =
                type === "confirmation"
                    ? settings.whatsapp_confirm_template
                    : settings.whatsapp_reminder_template;
            const message = interpolate(template);

            return await sendWhatsApp(to, message, settings, type);
        }

        // Send via Twilio SMS
        if (settings.provider === "twilio") {
            const template =
                type === "confirmation"
                    ? settings.confirm_template
                    : settings.reminder_template;
            const message = interpolate(template);

            return await sendTwilioSMS(to, message, settings);
        }

        return NextResponse.json(
            { success: false, reason: "no_provider" },
            { status: 200 }
        );
    } catch (error: unknown) {
        logError('SMS API', error);
        return NextResponse.json(
            { error: "Internal server error" },
            { status: 500 }
        );
    }
}

/**
 * Send WhatsApp message via n8n webhook
 */
async function sendWhatsApp(
    to: string,
    message: string,
    settings: any,
    type: string
): Promise<NextResponse> {
    if (!settings.n8n_webhook_url) {
        return NextResponse.json(
            { success: false, error: "n8n webhook URL not configured" },
            { status: 500 }
        );
    }

    try {
        const response = await fetch(settings.n8n_webhook_url, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                to: formatPhoneNumber(to),
                message,
                type: "whatsapp",
                notification_type: type,
                timestamp: new Date().toISOString(),
            }),
        });

        if (!response.ok) {
            return NextResponse.json(
                { success: false, error: `Webhook failed: ${response.status}` },
                { status: 500 }
            );
        }

        return NextResponse.json({ success: true });
    } catch (error: unknown) {
        const msg = error instanceof Error ? error.message : "Failed to send WhatsApp";
        return NextResponse.json({ success: false, error: msg }, { status: 500 });
    }
}

/**
 * Send SMS via Twilio
 */
async function sendTwilioSMS(
    to: string,
    message: string,
    settings: any
): Promise<NextResponse> {
    if (!settings.twilio_sid || !settings.twilio_token || !settings.twilio_phone) {
        return NextResponse.json(
            { success: false, error: "Twilio credentials missing" },
            { status: 500 }
        );
    }

    try {
        // Call Twilio API
        const twilioUrl = `https://api.twilio.com/2010-04-01/Accounts/${settings.twilio_sid}/Messages.json`;
        const auth = Buffer.from(`${settings.twilio_sid}:${settings.twilio_token}`).toString("base64");

        const response = await fetch(twilioUrl, {
            method: "POST",
            headers: {
                "Authorization": `Basic ${auth}`,
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams({
                To: formatPhoneNumber(to),
                From: settings.twilio_phone,
                Body: message,
            }),
        });

        if (!response.ok) {
            return NextResponse.json(
                { success: false, error: `Twilio API failed: ${response.status}` },
                { status: 500 }
            );
        }

        return NextResponse.json({ success: true });
    } catch (error: unknown) {
        const msg = error instanceof Error ? error.message : "Failed to send SMS";
        return NextResponse.json({ success: false, error: msg }, { status: 500 });
    }
}

/**
 * Format phone number for WhatsApp (ensure country code)
 */
function formatPhoneNumber(phone: string): string {
    let cleaned = phone.replace(/[\s\-\(\)]/g, "");

    // If starts with 0, assume Malaysian number
    if (cleaned.startsWith("0")) {
        cleaned = "60" + cleaned.substring(1);
    }

    // Ensure starts with +
    if (!cleaned.startsWith("+")) {
        cleaned = "+" + cleaned;
    }

    return cleaned;
}
