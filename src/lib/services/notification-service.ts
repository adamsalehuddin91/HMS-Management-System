import { createClient } from "@supabase/supabase-js";

// Server-side notification service (for API routes)
// Uses service role key to bypass RLS

export interface NotificationSettings {
    provider: 'twilio' | 'n8n' | 'none';
    twilio_sid: string;
    twilio_token: string;
    twilio_phone: string;
    n8n_webhook_url: string;
    whatsapp_enabled: boolean;
    is_enabled: boolean;
    confirm_enabled: boolean;
    reminder_enabled: boolean;
    confirm_template: string;
    reminder_template: string;
    whatsapp_confirm_template: string;
    whatsapp_reminder_template: string;
}

const DEFAULT_SETTINGS: NotificationSettings = {
    provider: 'none',
    twilio_sid: '',
    twilio_token: '',
    twilio_phone: '',
    n8n_webhook_url: '',
    whatsapp_enabled: false,
    is_enabled: false,
    confirm_enabled: true,
    reminder_enabled: true,
    confirm_template: 'Salam {name}, tempahan {service} anda pada {date} jam {time} telah disahkan.',
    reminder_template: 'Peringatan: Tempahan {service} anda adalah esok {date} jam {time}.',
    whatsapp_confirm_template: '✅ *Tempahan Disahkan*\n\nSalam {name}!\n\n📋 Servis: {service}\n📅 Tarikh: {date}\n🕐 Masa: {time}\n\nTerima kasih! 💜',
    whatsapp_reminder_template: '⏰ *Peringatan Tempahan*\n\nSalam {name}!\n\n📋 Servis: {service}\n📅 Tarikh: {date}\n🕐 Masa: {time}\n\nJumpa anda nanti! 👋',
};

export interface NotificationPayload {
    customerName: string;
    customerPhone: string;
    serviceName: string;
    date: string;
    time: string;
    bookingId?: string;
}

export class NotificationService {
    private static getSupabaseAdmin() {
        return createClient(
            process.env.NEXT_PUBLIC_SUPABASE_URL!,
            process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
        );
    }

    private static async getSettings(): Promise<NotificationSettings> {
        const supabase = this.getSupabaseAdmin();
        const { data } = await supabase
            .from('business_settings')
            .select('setting_value')
            .eq('setting_key', 'sms_settings')
            .single();

        if (data?.setting_value) {
            return { ...DEFAULT_SETTINGS, ...data.setting_value };
        }
        return DEFAULT_SETTINGS;
    }

    private static interpolate(template: string, data: Record<string, string>): string {
        return template.replace(/{(\w+)}/g, (match, key) => {
            return data[key] || match;
        });
    }

    private static formatPhoneNumber(phone: string): string {
        let cleaned = phone.replace(/[\s\-\(\)]/g, '');
        if (cleaned.startsWith('0')) {
            cleaned = '60' + cleaned.substring(1);
        }
        if (!cleaned.startsWith('+')) {
            cleaned = '+' + cleaned;
        }
        return cleaned;
    }

    /**
     * Send booking confirmation notification
     */
    static async sendConfirmation(payload: NotificationPayload): Promise<{ success: boolean; error?: string }> {
        const settings = await this.getSettings();

        if (!settings.is_enabled || !settings.confirm_enabled) {
            console.log("[Notification] Disabled or confirmation not enabled");
            return { success: false, error: 'disabled' };
        }

        const templateData = {
            name: payload.customerName,
            service: payload.serviceName,
            date: payload.date,
            time: payload.time
        };

        // WhatsApp via n8n
        if (settings.whatsapp_enabled && settings.provider === 'n8n' && settings.n8n_webhook_url) {
            const message = this.interpolate(settings.whatsapp_confirm_template, templateData);
            return this.sendViaWebhook(payload.customerPhone, message, settings.n8n_webhook_url, 'confirmation');
        }

        // SMS via Twilio
        if (settings.provider === 'twilio') {
            const message = this.interpolate(settings.confirm_template, templateData);
            return this.sendViaTwilio(payload.customerPhone, message, settings);
        }

        return { success: false, error: 'no_provider' };
    }

    /**
     * Send booking reminder notification
     */
    static async sendReminder(payload: NotificationPayload): Promise<{ success: boolean; error?: string }> {
        const settings = await this.getSettings();

        if (!settings.is_enabled || !settings.reminder_enabled) {
            console.log("[Notification] Disabled or reminder not enabled");
            return { success: false, error: 'disabled' };
        }

        const templateData = {
            name: payload.customerName,
            service: payload.serviceName,
            date: payload.date,
            time: payload.time
        };

        // WhatsApp via n8n
        if (settings.whatsapp_enabled && settings.provider === 'n8n' && settings.n8n_webhook_url) {
            const message = this.interpolate(settings.whatsapp_reminder_template, templateData);
            return this.sendViaWebhook(payload.customerPhone, message, settings.n8n_webhook_url, 'reminder');
        }

        // SMS via Twilio
        if (settings.provider === 'twilio') {
            const message = this.interpolate(settings.reminder_template, templateData);
            return this.sendViaTwilio(payload.customerPhone, message, settings);
        }

        return { success: false, error: 'no_provider' };
    }

    /**
     * Send message via n8n webhook
     */
    private static async sendViaWebhook(
        to: string,
        message: string,
        webhookUrl: string,
        type: 'confirmation' | 'reminder'
    ): Promise<{ success: boolean; error?: string }> {
        try {
            console.log(`[WhatsApp] Sending ${type} to ${to}`);

            const response = await fetch(webhookUrl, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
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
                console.error(`[WhatsApp] Webhook failed: ${response.status} - ${errorText}`);
                return { success: false, error: `Webhook failed: ${response.status}` };
            }

            console.log(`[WhatsApp] Successfully sent ${type}`);
            return { success: true };
        } catch (error: any) {
            console.error("[WhatsApp] Error:", error);
            return { success: false, error: error.message };
        }
    }

    /**
     * Send SMS via Twilio
     */
    private static async sendViaTwilio(
        to: string,
        message: string,
        settings: NotificationSettings
    ): Promise<{ success: boolean; error?: string }> {
        if (!settings.twilio_sid || !settings.twilio_token || !settings.twilio_phone) {
            console.warn("[SMS] Twilio credentials missing");
            return { success: false, error: "Twilio credentials missing" };
        }

        try {
            // Twilio API call
            const twilioUrl = `https://api.twilio.com/2010-04-01/Accounts/${settings.twilio_sid}/Messages.json`;
            const auth = Buffer.from(`${settings.twilio_sid}:${settings.twilio_token}`).toString('base64');

            const formData = new URLSearchParams();
            formData.append('To', this.formatPhoneNumber(to));
            formData.append('From', settings.twilio_phone);
            formData.append('Body', message);

            const response = await fetch(twilioUrl, {
                method: 'POST',
                headers: {
                    'Authorization': `Basic ${auth}`,
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: formData.toString(),
            });

            if (!response.ok) {
                const errorData = await response.json();
                console.error("[SMS] Twilio error:", errorData);
                return { success: false, error: errorData.message || `HTTP ${response.status}` };
            }

            console.log(`[SMS] Successfully sent to ${to}`);
            return { success: true };
        } catch (error: any) {
            console.error("[SMS] Error:", error);
            return { success: false, error: error.message };
        }
    }
}
