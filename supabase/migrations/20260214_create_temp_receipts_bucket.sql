-- Create storage bucket for temporary receipt PDFs
-- Auto-delete after 24 hours via lifecycle policy

-- Create bucket
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'temp-receipts',
  'temp-receipts',
  true, -- Public access for WhatsApp to download
  1048576, -- 1MB limit per file
  ARRAY['application/pdf']
)
ON CONFLICT (id) DO NOTHING;

-- Allow public read access (for WhatsApp download)
CREATE POLICY "Public read access for temp receipts"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'temp-receipts');

-- Allow authenticated users to upload receipts
CREATE POLICY "Authenticated users can upload receipts"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'temp-receipts');

-- Allow authenticated users to delete receipts
CREATE POLICY "Authenticated users can delete receipts"
ON storage.objects FOR DELETE
TO authenticated
USING (bucket_id = 'temp-receipts');

-- Create function to auto-delete old receipts (older than 24 hours)
CREATE OR REPLACE FUNCTION public.cleanup_old_receipts()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  DELETE FROM storage.objects
  WHERE bucket_id = 'temp-receipts'
    AND created_at < NOW() - INTERVAL '24 hours';
END;
$$;

-- Schedule cleanup to run every hour (requires pg_cron extension)
-- Note: This requires pg_cron extension which may not be available on all Supabase plans
-- Alternative: Call this function via Edge Function or external cron job
COMMENT ON FUNCTION public.cleanup_old_receipts IS 'Deletes receipt PDFs older than 24 hours. Call this via cron job or Edge Function.';
