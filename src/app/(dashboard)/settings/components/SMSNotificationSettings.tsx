"use client";

import { useState, useEffect } from "react";
import { MessageSquare, Save, Check, Loader2, AlertCircle, ShieldCheck, Webhook, Send, MessageCircle } from "lucide-react";
import { Card, CardContent, Button, Input, Textarea } from "@/components/ui";
import { createClient } from "@/lib/supabase/client";
import { toast } from "sonner";
import { SMSSettings, DEFAULT_SMS_SETTINGS, SMSService } from "@/lib/services/sms-service";
import { logError } from "@/lib/utils/error-logger";

type Provider = 'none' | 'twilio' | 'n8n';

export function SMSNotificationSettings() {
    const [settings, setSettings] = useState<SMSSettings>(DEFAULT_SMS_SETTINGS);
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [showSaved, setShowSaved] = useState(false);
    const [testing, setTesting] = useState(false);

    useEffect(() => {
        const fetchSettings = async () => {
            const supabase = createClient();
            const { data } = await supabase
                .from('business_settings')
                .select('*')
                .eq('setting_key', 'sms_settings')
                .single();

            if (data?.setting_value) {
                // Merge with defaults to ensure all fields exist
                setSettings({ ...DEFAULT_SMS_SETTINGS, ...data.setting_value });
            }
            setLoading(false);
        };
        fetchSettings();
    }, []);

    const handleSave = async () => {
        setSaving(true);
        const supabase = createClient();

        try {
            const { error } = await supabase
                .from('business_settings')
                .upsert({
                    setting_key: 'sms_settings',
                    setting_value: settings,
                    updated_at: new Date().toISOString()
                }, { onConflict: 'setting_key' });

            if (error) throw error;
            setShowSaved(true);
            toast.success("Tetapan notifikasi telah disimpan");
            setTimeout(() => setShowSaved(false), 3000);
        } catch (err) {
            logError('SMS Settings', err);
            toast.error("Gagal menyimpan tetapan");
        } finally {
            setSaving(false);
        }
    };

    const handleTestWebhook = async () => {
        if (!settings.n8n_webhook_url) {
            toast.error("Sila masukkan URL webhook n8n");
            return;
        }

        setTesting(true);
        try {
            const result = await SMSService.testN8nWebhook(settings.n8n_webhook_url);
            if (result.success) {
                toast.success("✅ Webhook berjaya diuji! Semak n8n anda.");
            } else {
                toast.error(`❌ Webhook gagal: ${result.error}`);
            }
        } catch (error: unknown) {
            const msg = error instanceof Error ? error.message : "Unknown error";
            toast.error(`❌ Error: ${msg}`);
        } finally {
            setTesting(false);
        }
    };

    if (loading) {
        return (
            <div className="flex flex-col items-center justify-center h-64 gap-4 text-gray-400">
                <Loader2 className="h-8 w-8 animate-spin text-[#2e7d32]/20" />
                <p className="font-black text-[10px] uppercase tracking-widest">Memuatkan tetapan...</p>
            </div>
        );
    }

    return (
        <div className="space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
            {/* Header */}
            <div className="flex items-center justify-between">
                <div>
                    <h3 className="text-xl font-black text-gray-900 mb-2">Tetapan Notifikasi</h3>
                    <p className="text-sm text-gray-500 font-medium">Urus SMS & WhatsApp untuk pelanggan.</p>
                </div>
                <Button
                    onClick={handleSave}
                    disabled={saving}
                    className="bg-[#2e7d32] hover:bg-[#1b5e20] text-white px-8 rounded-2xl h-12 font-black uppercase tracking-widest transition-all active:scale-95 shadow-lg shadow-green-900/10"
                >
                    {saving ? <Loader2 className="h-4 w-4 animate-spin" /> : showSaved ? <Check className="h-4 w-4" /> : <Save className="h-4 w-4 mr-2" />}
                    {saving ? "Menyimpan..." : showSaved ? "Disimpan" : "Simpan"}
                </Button>
            </div>

            {/* Provider Selection */}
            <div className="space-y-4">
                <div className="flex items-center gap-3">
                    <div className="p-2 bg-blue-50 rounded-lg">
                        <Webhook className="h-5 w-5 text-blue-600" />
                    </div>
                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Pilih Pembekal</label>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                    {/* None */}
                    <button
                        onClick={() => setSettings({ ...settings, provider: 'none', is_enabled: false })}
                        className={`p-4 rounded-2xl border-2 transition-all ${settings.provider === 'none'
                            ? 'border-gray-400 bg-gray-50'
                            : 'border-gray-100 hover:border-gray-200'
                            }`}
                    >
                        <div className="text-center">
                            <div className="h-10 w-10 rounded-full bg-gray-100 flex items-center justify-center mx-auto mb-2">
                                <AlertCircle className="h-5 w-5 text-gray-400" />
                            </div>
                            <p className="font-black text-xs text-gray-700">Tidak Aktif</p>
                            <p className="text-[10px] text-gray-400 mt-1">Notifikasi dimatikan</p>
                        </div>
                    </button>

                    {/* Twilio SMS */}
                    <button
                        onClick={() => setSettings({ ...settings, provider: 'twilio', is_enabled: true, whatsapp_enabled: false })}
                        className={`p-4 rounded-2xl border-2 transition-all ${settings.provider === 'twilio'
                            ? 'border-blue-400 bg-blue-50'
                            : 'border-gray-100 hover:border-blue-200'
                            }`}
                    >
                        <div className="text-center">
                            <div className="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center mx-auto mb-2">
                                <MessageSquare className="h-5 w-5 text-blue-600" />
                            </div>
                            <p className="font-black text-xs text-gray-700">Twilio SMS</p>
                            <p className="text-[10px] text-gray-400 mt-1">SMS tradisional</p>
                        </div>
                    </button>

                    {/* n8n WhatsApp */}
                    <button
                        onClick={() => setSettings({ ...settings, provider: 'n8n', is_enabled: true, whatsapp_enabled: true })}
                        className={`p-4 rounded-2xl border-2 transition-all ${settings.provider === 'n8n'
                            ? 'border-green-400 bg-green-50'
                            : 'border-gray-100 hover:border-green-200'
                            }`}
                    >
                        <div className="text-center">
                            <div className="h-10 w-10 rounded-full bg-green-100 flex items-center justify-center mx-auto mb-2">
                                <MessageCircle className="h-5 w-5 text-green-600" />
                            </div>
                            <p className="font-black text-xs text-gray-700">WhatsApp (n8n)</p>
                            <p className="text-[10px] text-gray-400 mt-1">Via webhook n8n</p>
                        </div>
                    </button>
                </div>
            </div>

            {/* Provider-specific Configuration */}
            <div className="grid grid-cols-1 xl:grid-cols-2 gap-8">
                {/* Twilio Config */}
                {settings.provider === 'twilio' && (
                    <div className="space-y-6">
                        <div className="flex items-center gap-3">
                            <div className="p-2 bg-blue-50 rounded-lg">
                                <ShieldCheck className="h-5 w-5 text-blue-600" />
                            </div>
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Konfigurasi Twilio</label>
                        </div>

                        <Card className="border-2 border-gray-100 shadow-none rounded-[2rem] overflow-hidden">
                            <CardContent className="p-6 space-y-4">
                                <div className="space-y-2">
                                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest px-2">Account SID</label>
                                    <Input
                                        value={settings.twilio_sid}
                                        onChange={(e: React.ChangeEvent<HTMLInputElement>) => setSettings({ ...settings, twilio_sid: e.target.value })}
                                        placeholder="ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                                        className="h-12 border-2 border-gray-100 focus:border-blue-400 rounded-xl font-bold bg-white"
                                    />
                                </div>

                                <div className="space-y-2">
                                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest px-2">Auth Token</label>
                                    <Input
                                        type="password"
                                        value={settings.twilio_token}
                                        onChange={(e: React.ChangeEvent<HTMLInputElement>) => setSettings({ ...settings, twilio_token: e.target.value })}
                                        placeholder="••••••••••••••••••••••••••••••••"
                                        className="h-12 border-2 border-gray-100 focus:border-blue-400 rounded-xl font-bold bg-white"
                                    />
                                </div>

                                <div className="space-y-2">
                                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest px-2">Phone Number</label>
                                    <Input
                                        value={settings.twilio_phone}
                                        onChange={(e: React.ChangeEvent<HTMLInputElement>) => setSettings({ ...settings, twilio_phone: e.target.value })}
                                        placeholder="+1234567890"
                                        className="h-12 border-2 border-gray-100 focus:border-blue-400 rounded-xl font-bold bg-white"
                                    />
                                </div>
                            </CardContent>
                        </Card>
                    </div>
                )}

                {/* n8n WhatsApp Config */}
                {settings.provider === 'n8n' && (
                    <div className="space-y-6">
                        <div className="flex items-center gap-3">
                            <div className="p-2 bg-green-50 rounded-lg">
                                <Webhook className="h-5 w-5 text-green-600" />
                            </div>
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Konfigurasi n8n Webhook</label>
                        </div>

                        <Card className="border-2 border-green-100 shadow-none rounded-[2rem] overflow-hidden">
                            <CardContent className="p-6 space-y-4">
                                <div className="flex items-center justify-between p-4 bg-green-50 rounded-2xl mb-2">
                                    <div className="flex items-center gap-3">
                                        <div className={`w-3 h-3 rounded-full ${settings.whatsapp_enabled ? 'bg-green-500 animate-pulse' : 'bg-gray-300'}`} />
                                        <span className="font-black text-xs text-gray-700 uppercase">WhatsApp Status</span>
                                    </div>
                                    <button
                                        onClick={() => setSettings({ ...settings, whatsapp_enabled: !settings.whatsapp_enabled })}
                                        className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors focus:outline-none ${settings.whatsapp_enabled ? "bg-green-500" : "bg-gray-200"}`}
                                    >
                                        <span className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${settings.whatsapp_enabled ? "translate-x-6" : "translate-x-1"}`} />
                                    </button>
                                </div>

                                <div className="space-y-2">
                                    <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest px-2">n8n Webhook URL</label>
                                    <Input
                                        value={settings.n8n_webhook_url}
                                        onChange={(e: React.ChangeEvent<HTMLInputElement>) => setSettings({ ...settings, n8n_webhook_url: e.target.value })}
                                        placeholder="https://your-n8n.com/webhook/xxxxx"
                                        className="h-12 border-2 border-gray-100 focus:border-green-400 rounded-xl font-bold bg-white"
                                    />
                                </div>

                                <Button
                                    onClick={handleTestWebhook}
                                    disabled={testing || !settings.n8n_webhook_url}
                                    variant="outline"
                                    className="w-full h-11 rounded-xl border-green-200 text-green-700 hover:bg-green-50 font-bold"
                                >
                                    {testing ? (
                                        <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                                    ) : (
                                        <Send className="h-4 w-4 mr-2" />
                                    )}
                                    {testing ? "Menguji..." : "Uji Webhook"}
                                </Button>

                                <div className="p-4 bg-amber-50 rounded-2xl border border-amber-100">
                                    <div className="flex gap-3">
                                        <AlertCircle className="h-4 w-4 text-amber-500 shrink-0 mt-0.5" />
                                        <div className="space-y-2">
                                            <p className="text-[10px] font-black text-amber-800 uppercase">Persediaan n8n:</p>
                                            <ol className="text-[10px] font-medium text-amber-700/80 leading-relaxed list-decimal ml-4 space-y-1">
                                                <li>Buat workflow baru di n8n</li>
                                                <li>Tambah node <code className="bg-amber-100 px-1 rounded">Webhook</code> (POST)</li>
                                                <li>Sambung ke node WhatsApp/Twilio</li>
                                                <li>Copy webhook URL di atas</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                            </CardContent>
                        </Card>
                    </div>
                )}

                {/* Templates */}
                {settings.provider !== 'none' && (
                    <div className="space-y-6">
                        <div className="flex items-center gap-3">
                            <div className="p-2 bg-purple-50 rounded-lg">
                                <MessageSquare className="h-5 w-5 text-purple-600" />
                            </div>
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest">
                                Templat {settings.provider === 'n8n' ? 'WhatsApp' : 'SMS'}
                            </label>
                        </div>

                        <div className="space-y-6">
                            {/* Confirmation Template */}
                            <div className="space-y-3">
                                <div className="flex items-center justify-between">
                                    <label className="text-[10px] font-black text-gray-800 uppercase tracking-widest">Pengesahan Tempahan</label>
                                    <button
                                        onClick={() => setSettings({ ...settings, confirm_enabled: !settings.confirm_enabled })}
                                        className={`relative inline-flex h-5 w-9 items-center rounded-full transition-colors focus:outline-none ${settings.confirm_enabled ? "bg-[#2e7d32]" : "bg-gray-200"}`}
                                    >
                                        <span className={`inline-block h-3 w-3 transform rounded-full bg-white transition-transform ${settings.confirm_enabled ? "translate-x-5" : "translate-x-1"}`} />
                                    </button>
                                </div>
                                <Textarea
                                    value={settings.provider === 'n8n' ? settings.whatsapp_confirm_template : settings.confirm_template}
                                    onChange={(e: React.ChangeEvent<HTMLTextAreaElement>) => setSettings({
                                        ...settings,
                                        [settings.provider === 'n8n' ? 'whatsapp_confirm_template' : 'confirm_template']: e.target.value
                                    })}
                                    className="min-h-[120px] border-2 border-gray-100 focus:border-[#2e7d32] rounded-[1.5rem] font-medium p-4"
                                    placeholder="Templat pengesahan..."
                                />
                            </div>

                            {/* Reminder Template */}
                            <div className="space-y-3">
                                <div className="flex items-center justify-between">
                                    <label className="text-[10px] font-black text-gray-800 uppercase tracking-widest">Peringatan (Reminder)</label>
                                    <button
                                        onClick={() => setSettings({ ...settings, reminder_enabled: !settings.reminder_enabled })}
                                        className={`relative inline-flex h-5 w-9 items-center rounded-full transition-colors focus:outline-none ${settings.reminder_enabled ? "bg-[#2e7d32]" : "bg-gray-200"}`}
                                    >
                                        <span className={`inline-block h-3 w-3 transform rounded-full bg-white transition-transform ${settings.reminder_enabled ? "translate-x-5" : "translate-x-1"}`} />
                                    </button>
                                </div>
                                <Textarea
                                    value={settings.provider === 'n8n' ? settings.whatsapp_reminder_template : settings.reminder_template}
                                    onChange={(e: React.ChangeEvent<HTMLTextAreaElement>) => setSettings({
                                        ...settings,
                                        [settings.provider === 'n8n' ? 'whatsapp_reminder_template' : 'reminder_template']: e.target.value
                                    })}
                                    className="min-h-[120px] border-2 border-gray-100 focus:border-[#2e7d32] rounded-[1.5rem] font-medium p-4"
                                    placeholder="Templat peringatan..."
                                />
                            </div>

                            <div className="p-4 bg-blue-50 rounded-2xl border border-blue-100">
                                <div className="flex gap-3">
                                    <AlertCircle className="h-4 w-4 text-blue-500 shrink-0 mt-0.5" />
                                    <div className="space-y-1">
                                        <p className="text-[10px] font-black text-blue-800 uppercase italic">Placeholder Tersedia:</p>
                                        <p className="text-[9px] font-bold text-blue-700/70 leading-relaxed">
                                            <code className="bg-blue-100 px-1 rounded">{'{name}'}</code> - Nama pelanggan<br />
                                            <code className="bg-blue-100 px-1 rounded">{'{service}'}</code> - Nama servis<br />
                                            <code className="bg-blue-100 px-1 rounded">{'{date}'}</code> - Tarikh tempahan<br />
                                            <code className="bg-blue-100 px-1 rounded">{'{time}'}</code> - Masa tempahan
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                )}
            </div>

            {/* n8n Payload Info */}
            {settings.provider === 'n8n' && (
                <div className="p-6 bg-gray-50 rounded-[2rem] border border-gray-100">
                    <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3">Format Payload n8n:</p>
                    <pre className="text-xs font-mono bg-gray-900 text-green-400 p-4 rounded-xl overflow-x-auto">
                        {`{
  "to": "+60123456789",
  "message": "Salam Ahmad! Tempahan anda disahkan...",
  "type": "whatsapp",
  "notification_type": "confirmation | reminder | test",
  "timestamp": "2026-02-10T12:00:00.000Z"
}`}
                    </pre>
                </div>
            )}
        </div>
    );
}
