/**
 * Simple in-memory rate limiter for API routes
 * Tracks requests by IP address to prevent abuse
 */

interface RateLimitEntry {
    count: number;
    resetTime: number;
}

const rateLimitMap = new Map<string, RateLimitEntry>();

// Clean up old entries every 5 minutes
setInterval(() => {
    const now = Date.now();
    for (const [key, entry] of rateLimitMap.entries()) {
        if (now > entry.resetTime) {
            rateLimitMap.delete(key);
        }
    }
}, 5 * 60 * 1000);

export interface RateLimitConfig {
    /** Maximum number of requests allowed in the time window */
    maxRequests: number;
    /** Time window in milliseconds */
    windowMs: number;
}

export interface RateLimitResult {
    success: boolean;
    limit: number;
    remaining: number;
    resetTime: number;
}

/**
 * Check if a request should be rate limited
 * @param identifier - Unique identifier (e.g., IP address)
 * @param config - Rate limit configuration
 * @returns Rate limit result with success status and metadata
 */
export function checkRateLimit(
    identifier: string,
    config: RateLimitConfig
): RateLimitResult {
    const now = Date.now();
    const entry = rateLimitMap.get(identifier);

    // No entry or expired entry - allow and create new
    if (!entry || now > entry.resetTime) {
        const resetTime = now + config.windowMs;
        rateLimitMap.set(identifier, {
            count: 1,
            resetTime
        });

        return {
            success: true,
            limit: config.maxRequests,
            remaining: config.maxRequests - 1,
            resetTime
        };
    }

    // Entry exists and not expired
    if (entry.count >= config.maxRequests) {
        // Rate limit exceeded
        return {
            success: false,
            limit: config.maxRequests,
            remaining: 0,
            resetTime: entry.resetTime
        };
    }

    // Increment count and allow
    entry.count++;
    rateLimitMap.set(identifier, entry);

    return {
        success: true,
        limit: config.maxRequests,
        remaining: config.maxRequests - entry.count,
        resetTime: entry.resetTime
    };
}

/**
 * Extract IP address from Next.js request
 * @param request - Next.js request object
 * @returns IP address or 'unknown'
 */
export function getClientIp(request: Request): string {
    // Check x-forwarded-for header (common in proxies/load balancers)
    const forwardedFor = request.headers.get('x-forwarded-for');
    if (forwardedFor) {
        // Take the first IP if multiple are present
        return forwardedFor.split(',')[0].trim();
    }

    // Check x-real-ip header
    const realIp = request.headers.get('x-real-ip');
    if (realIp) {
        return realIp.trim();
    }

    // Fallback to unknown (should not happen in production)
    return 'unknown';
}
