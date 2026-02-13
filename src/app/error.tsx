"use client";

import { useEffect } from "react";
import { Button } from "@/components/ui/button";
import { AlertCircle } from "lucide-react";

export default function GlobalError({
    error,
    reset,
}: {
    error: Error & { digest?: string };
    reset: () => void;
}) {
    useEffect(() => {
        console.error("Global error:", error);
    }, [error]);

    return (
        <html>
            <body>
                <div className="min-h-screen flex flex-col items-center justify-center p-4 bg-gray-50">
                    <div className="text-center space-y-4 max-w-md">
                        <div className="flex justify-center">
                            <div className="h-12 w-12 rounded-full bg-red-100 flex items-center justify-center">
                                <AlertCircle className="h-6 w-6 text-red-600" />
                            </div>
                        </div>
                        <h2 className="text-2xl font-bold text-gray-900">Something went wrong!</h2>
                        <p className="text-gray-500">
                            We apologize for the inconvenience. An unexpected error has occurred.
                        </p>
                        <div className="pt-4">
                            <Button onClick={() => reset()} variant="primary">
                                Try again
                            </Button>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    );
}
