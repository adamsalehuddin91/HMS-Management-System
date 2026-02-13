/**
 * Error logging utility for production-safe error handling
 * 
 * In development: Logs errors to console for debugging
 * In production: Silently handles errors (can be extended with error tracking service)
 */

type ErrorContext = string;

/**
 * Log an error with context
 * Only logs to console in development mode
 */
export function logError(context: ErrorContext, error: unknown): void {
    if (process.env.NODE_ENV === 'development') {
        console.error(`[${context}]`, error);
    }

    // TODO: In production, send to error tracking service (e.g., Sentry)
    // if (process.env.NODE_ENV === 'production') {
    //   sendToErrorTracking(context, error);
    // }
}

/**
 * Log a warning with context
 * Only logs to console in development mode
 */
export function logWarning(context: ErrorContext, message: string): void {
    if (process.env.NODE_ENV === 'development') {
        console.warn(`[${context}]`, message);
    }
}

/**
 * Log info message with context
 * Only logs to console in development mode
 */
export function logInfo(context: ErrorContext, message: string): void {
    if (process.env.NODE_ENV === 'development') {
        console.log(`[${context}]`, message);
    }
}
