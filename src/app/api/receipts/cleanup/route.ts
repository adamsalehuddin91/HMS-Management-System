/**
 * API Route: Cleanup Old Receipts
 * POST /api/receipts/cleanup
 * 
 * Deletes receipt PDFs older than 24 hours from Supabase Storage
 * Call this via cron job (e.g., Vercel Cron, GitHub Actions)
 */

import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function POST(request: NextRequest) {
    try {
        // Verify cron secret to prevent unauthorized access
        const authHeader = request.headers.get('authorization');
        const cronSecret = process.env.CRON_SECRET;

        if (cronSecret && authHeader !== `Bearer ${cronSecret}`) {
            return NextResponse.json(
                { error: 'Unauthorized' },
                { status: 401 }
            );
        }

        const supabase = await createClient();

        // List all files in temp-receipts bucket
        const { data: files, error: listError } = await supabase.storage
            .from('temp-receipts')
            .list('receipts', {
                limit: 1000,
                sortBy: { column: 'created_at', order: 'asc' }
            });

        if (listError) {
            console.error('List error:', listError);
            return NextResponse.json(
                { error: 'Failed to list files' },
                { status: 500 }
            );
        }

        if (!files || files.length === 0) {
            return NextResponse.json({
                success: true,
                deleted: 0,
                message: 'No files to delete'
            });
        }

        // Filter files older than 24 hours
        const now = new Date();
        const twentyFourHoursAgo = new Date(now.getTime() - 24 * 60 * 60 * 1000);

        const oldFiles = files.filter(file => {
            const createdAt = new Date(file.created_at);
            return createdAt < twentyFourHoursAgo;
        });

        if (oldFiles.length === 0) {
            return NextResponse.json({
                success: true,
                deleted: 0,
                message: 'No old files to delete'
            });
        }

        // Delete old files
        const filePaths = oldFiles.map(file => `receipts/${file.name}`);

        const { data: deleteData, error: deleteError } = await supabase.storage
            .from('temp-receipts')
            .remove(filePaths);

        if (deleteError) {
            console.error('Delete error:', deleteError);
            return NextResponse.json(
                { error: 'Failed to delete files' },
                { status: 500 }
            );
        }

        return NextResponse.json({
            success: true,
            deleted: oldFiles.length,
            message: `Deleted ${oldFiles.length} old receipt(s)`
        });

    } catch (error) {
        console.error('Error cleaning up receipts:', error);
        return NextResponse.json(
            { error: 'Internal server error' },
            { status: 500 }
        );
    }
}

// Allow GET for manual testing
export async function GET(request: NextRequest) {
    return POST(request);
}
