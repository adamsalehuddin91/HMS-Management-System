"use client";

import { useEffect } from "react";
import { Button } from "@/components/ui/button";
import { AlertTriangle } from "lucide-react";
import { Card, CardContent } from "@/components/ui/card";

export default function DashboardError({
    error,
    reset,
}: {
    error: Error & { digest?: string };
    reset: () => void;
}) {
    useEffect(() => {
        console.error("Dashboard error:", error);
    }, [error]);

    return (
        <div className="h-full flex items-center justify-center p-6">
            <Card className="max-w-md w-full border-red-200">
                <CardContent className="pt-6 text-center space-y-4">
                    <div className="flex justify-center">
                        <div className="h-12 w-12 rounded-full bg-red-100 flex items-center justify-center">
                            <AlertTriangle className="h-6 w-6 text-red-600" />
                        </div>
                    </div>
                    <h2 className="text-xl font-bold text-gray-900">Dashboard Error</h2>
                    <p className="text-sm text-gray-500">
                        There was an issue loading this part of the dashboard.
                    </p>
                    <div className="pt-2">
                        <Button onClick={() => reset()} variant="outline" className="min-w-[100px]">
                            Retry
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
