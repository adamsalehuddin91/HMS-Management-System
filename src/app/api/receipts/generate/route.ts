/**
 * API Route: Generate and Upload Receipt PDF
 * POST /api/receipts/generate
 * 
 * Generates PDF receipt, uploads to Supabase Storage,
 * and triggers n8n webhook for WhatsApp delivery
 */

import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';
import { generateReceiptPDF } from '@/lib/pdf-generator';

export async function POST(request: NextRequest) {
    try {
        const data = await request.json();

        // Validate required fields
        if (!data.customer?.name || !data.customer?.phone) {
            return NextResponse.json(
                { error: 'Customer name and phone are required' },
                { status: 400 }
            );
        }

        if (!data.sale?.id || !data.sale?.total || !data.sale?.items) {
            return NextResponse.json(
                { error: 'Sale data is incomplete' },
                { status: 400 }
            );
        }

        // Generate PDF
        const pdfBuffer = await generateReceiptPDF(data);

        // Upload to Supabase Storage
        const supabase = await createClient();
        const filename = `${data.sale.id}.pdf`;
        const filepath = `receipts/${filename}`;

        const { data: uploadData, error: uploadError } = await supabase.storage
            .from('temp-receipts')
            .upload(filepath, pdfBuffer, {
                contentType: 'application/pdf',
                cacheControl: '3600',
                upsert: true
            });

        if (uploadError) {
            console.error('Upload error:', uploadError);
            return NextResponse.json(
                { error: 'Failed to upload PDF' },
                { status: 500 }
            );
        }

        // Get public URL
        const { data: { publicUrl } } = supabase.storage
            .from('temp-receipts')
            .getPublicUrl(filepath);

        // Send to n8n webhook for WhatsApp delivery
        const n8nWebhookUrl = process.env.N8N_RECEIPT_WEBHOOK_URL ||
            'https://n8n.atokcloud.com/webhook/hms-receipt';

        const webhookResponse = await fetch(n8nWebhookUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                customer: data.customer,
                sale: data.sale,
                receipt_pdf_url: publicUrl
            })
        });

        if (!webhookResponse.ok) {
            console.error('n8n webhook failed:', await webhookResponse.text());
            // Don't fail the request - PDF is uploaded successfully
        }

        return NextResponse.json({
            success: true,
            pdf_url: publicUrl,
            message: 'Receipt generated and sent to customer'
        });

    } catch (error) {
        console.error('Error generating receipt:', error);
        return NextResponse.json(
            { error: 'Internal server error' },
            { status: 500 }
        );
    }
}
