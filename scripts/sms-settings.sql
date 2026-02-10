-- HMS Salon - SMS Settings Initializer
-- Run this in Supabase Dashboard > SQL Editor

INSERT INTO business_settings (setting_key, setting_value) VALUES
  ('sms_settings', '{
    "provider": "twilio",
    "twilio_sid": "",
    "twilio_token": "",
    "twilio_phone": "",
    "is_enabled": false,
    "confirm_enabled": true,
    "reminder_enabled": true,
    "confirm_template": "Salam {name}, tempahan anda untuk {service} pada {date} jam {time} telah disahkan. Terima kasih!",
    "reminder_template": "Peringatan: Tempahan {service} anda adalah esok pada {time}. Jumpa anda nanti!"
  }'::jsonb)
ON CONFLICT (setting_key) DO NOTHING;
