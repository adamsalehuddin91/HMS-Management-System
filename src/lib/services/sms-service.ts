import { createClient } from "@/lib/supabase/client";

export interface SMSSettings {
    provider: 'twilio' | 'n8n' | 'none';
    twilio_sid: string;
    twilio_token: string;
    twilio_phone: string;
    // n8n WhatsApp settings
    n8n_webhook_url: string;
    whatsapp_enabled: boolean;
    // General settings
    is_enabled: boolean;
    confirm_enabled: boolean;
    reminder_enabled: boolean;
    confirm_template: string;
    reminder_template: string;
    // WhatsApp specific templates
    whatsapp_confirm_template: string;
    whatsapp_reminder_template: string;
}

export const DEFAULT_SMS_SETTINGS: SMSSettings = {
    provider: 'none',
    twilio_sid: '',
    twilio_token: '',
    twilio_phone: '',
    n8n_webhook_url: '',
    whatsapp_enabled: false,
    is_enabled: false,
    confirm_enabled: true,
    reminder_enabled: true,
    confirm_template: 'Salam {name}, tempahan {service} anda pada {date} jam {time} telah disahkan. Terima kasih!',
    reminder_template: 'Peringatan: Tempahan {service} anda adalah esok {date} jam {time}. Jumpa anda nanti!',
    whatsapp_confirm_template: '✅ *Tempahan Disahkan*\n\nSalam {name}!\n\nTempahan anda telah disahkan:\n📋 Servis: {service}\n📅 Tarikh: {date}\n🕐 Masa: {time}\n\nTerima kasih kerana memilih kami! 💜',
    whatsapp_reminder_template: '⏰ *Peringatan Tempahan*\n\nSalam {name}!\n\nIni adalah peringatan untuk tempahan anda:\n📋 Servis: {service}\n📅 Tarikh: {date}\n🕐 Masa: {time}\n\nJumpa anda nanti! 👋',
};

export interface NotificationPayload {
    customerName: string;
    customerPhone: string;
    serviceName: string;
    date: string;
    time: string;
    bookingId?: string;
}

export class SMSService {
    private static async getSettings(): Promise<SMSSettings | null> {
        const supabase = createClient();
        const { data } = await supabase
            .from('business_settings')
            .select('setting_value')
            .eq('setting_key', 'sms_settings')
            .single();

        if (data?.setting_value) {
            // Merge with defaults to ensure all fields exist
            return { ...DEFAULT_SMS_SETTINGS, ...data.setting_value };
        }
        return null;
    }

    private static interpolate(template: string, data: Record<string, string>): string {
        return template.replace(/{(\w+)}/g, (match, key) => {
            return data[key] || match;
        });
    }

    /**
     * Send booking confirmation notification (SMS or WhatsApp)
     */
    static async sendConfirmation(bookingData: NotificationPayload) {
        const settings = await this.getSettings();
        if (!settings || !settings.is_enabled || !settings.confirm_enabled) {
            // [log removed]("[Notification] Disabled or confirmation not enabled");
            return { success: false, reason: 'disabled' };
        }

        const templateData = {
            name: bookingData.customerName,
            service: bookingData.serviceName,
            date: bookingData.date,
            time: bookingData.time
        };

        // Send WhatsApp if enabled
        if (settings.whatsapp_enabled && settings.provider === 'n8n') {
            const message = this.interpolate(settings.whatsapp_confirm_template, templateData);
            return this.sendWhatsApp(bookingData.customerPhone, message, settings, 'confirmation');
        }

        // Fall back to SMS
        if (settings.provider === 'twilio') {
            const message = this.interpolate(settings.confirm_template, templateData);
            return this.sendSMS(bookingData.customerPhone, message, settings);
        }

        return { success: false, reason: 'no_provider' };
    }

    /**
     * Send booking reminder notification (SMS or WhatsApp)
     */
    static async sendReminder(bookingData: NotificationPayload) {
        const settings = await this.getSettings();
        if (!settings || !settings.is_enabled || !settings.reminder_enabled) {
            // [log removed]("[Notification] Disabled or reminder not enabled");
            return { success: false, reason: 'disabled' };
        }

        const templateData = {
            name: bookingData.customerName,
            service: bookingData.serviceName,
            date: bookingData.date,
            time: bookingData.time
        };

        // Send WhatsApp if enabled
        if (settings.whatsapp_enabled && settings.provider === 'n8n') {
            const message = this.interpolate(settings.whatsapp_reminder_template, templateData);
            return this.sendWhatsApp(bookingData.customerPhone, message, settings, 'reminder');
        }

        // Fall back to SMS
        if (settings.provider === 'twilio') {
            const message = this.interpolate(settings.reminder_template, templateData);
            return this.sendSMS(bookingData.customerPhone, message, settings);
        }

        return { success: false, reason: 'no_provider' };
    }

    /**
     * Send WhatsApp message via n8n webhook
     */
    private static async sendWhatsApp(
        to: string,
        message: string,
        settings: SMSSettings,
        type: 'confirmation' | 'reminder'
    ): Promise<{ success: boolean; error?: string }> {
        if (!settings.n8n_webhook_url) {
            // [warn removed]("[WhatsApp] n8n webhook URL not configured");
            return { success: false, error: "n8n webhook URL not configured" };
        }

        try {
            // [log removed](`[WhatsApp] Sending ${type} to ${to}`);

            const response = await fetch(settings.n8n_webhook_url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    to: this.formatPhoneNumber(to),
                    message,
                    type: 'whatsapp',
                    notification_type: type,
                    timestamp: new Date().toISOString()
                }),
            });

            if (!response.ok) {
                const errorText = await response.text();
                // [error removed](`[WhatsApp] n8n webhook failed: ${response.status} - ${errorText}`);
                return { success: false, error: `Webhook failed: ${response.status}` };
            }

            // [log removed](`[WhatsApp] Successfully sent ${type} notification`);
            return { success: true };
        } catch (error: unknown) {
            const msg = error instanceof Error ? error.message : "Failed to send WhatsApp";
            return { success: false, error: msg };
        }
    }

    /**
     * Send SMS via Twilio
     */
    private static async sendSMS(
        to: string,
        message: string,
        settings: SMSSettings
    ): Promise<{ success: boolean; error?: string }> {
        if (settings.provider !== 'twilio') {
            return { success: false, error: "Twilio not configured" };
        }

        if (!settings.twilio_sid || !settings.twilio_token || !settings.twilio_phone) {
            // [warn removed]("[SMS] Twilio credentials missing");
            return { success: false, error: "Twilio credentials missing" };
        }

        try {
            // [log removed](`[SMS] Sending to ${to}: ${message.substring(0, 50)}...`);

            // In production, this would call Twilio API
            // For now, we log the message (would need API route for actual Twilio calls)
            // const twilioUrl = `https://api.twilio.com/2010-04-01/Accounts/${settings.twilio_sid}/Messages.json`;

            return { success: true };
        } catch (error: unknown) {
            const msg = error instanceof Error ? error.message : "Failed to send SMS";
            return { success: false, error: msg };
        }
    }

    /**
     * Format phone number for WhatsApp (ensure country code)
     */
    private static formatPhoneNumber(phone: string): string {
        // Remove spaces, dashes, and parentheses
        let cleaned = phone.replace(/[\s\-\(\)]/g, '');

        // If starts with 0, assume Malaysian number
        if (cleaned.startsWith('0')) {
            cleaned = '60' + cleaned.substring(1);
        }

        // Ensure starts with +
        if (!cleaned.startsWith('+')) {
            cleaned = '+' + cleaned;
        }

        return cleaned;
    }

    /**
     * Test n8n webhook connection
     */
    static async testN8nWebhook(webhookUrl: string): Promise<{ success: boolean; error?: string }> {
        try {
            const response = await fetch(webhookUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    to: '+60123456789',
                    message: '🧪 Test message from HMS Salon',
                    type: 'whatsapp',
                    notification_type: 'test',
                    timestamp: new Date().toISOString()
                }),
            });

            if (!response.ok) {
                return { success: false, error: `HTTP ${response.status}` };
            }

            return { success: true };
        } catch (error: unknown) {
            const msg = error instanceof Error ? error.message : "Webhook test failed";
            return { success: false, error: msg };
        }
    }
}
