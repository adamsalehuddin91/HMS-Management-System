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
    /**
     * Send booking confirmation notification (SMS or WhatsApp)
     * Now calls server-side API to protect credentials
     */
    static async sendConfirmation(bookingData: NotificationPayload) {
        try {
            const response = await fetch('/api/sms/send', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    to: bookingData.customerPhone,
                    type: 'confirmation',
                    customerName: bookingData.customerName,
                    serviceName: bookingData.serviceName,
                    date: bookingData.date,
                    time: bookingData.time,
                }),
            });

            if (!response.ok) {
                const error = await response.json();
                return { success: false, error: error.error || 'Failed to send notification' };
            }

            const result = await response.json();
            return result;
        } catch (error: unknown) {
            const msg = error instanceof Error ? error.message : 'Failed to send confirmation';
            return { success: false, error: msg };
        }
    }

    /**
     * Send booking reminder notification (SMS or WhatsApp)
     * Now calls server-side API to protect credentials
     */
    static async sendReminder(bookingData: NotificationPayload) {
        try {
            const response = await fetch('/api/sms/send', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    to: bookingData.customerPhone,
                    type: 'reminder',
                    customerName: bookingData.customerName,
                    serviceName: bookingData.serviceName,
                    date: bookingData.date,
                    time: bookingData.time,
                }),
            });

            if (!response.ok) {
                const error = await response.json();
                return { success: false, error: error.error || 'Failed to send notification' };
            }

            const result = await response.json();
            return result;
        } catch (error: unknown) {
            const msg = error instanceof Error ? error.message : 'Failed to send reminder';
            return { success: false, error: msg };
        }
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
