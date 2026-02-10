"use client";

import { useEffect } from "react";
import { useUIStore } from "@/lib/store/ui-store";

export function FontSizeManager() {
    const fontSize = useUIStore((state) => state.fontSize);

    useEffect(() => {
        // Remove existing font size classes
        const html = document.documentElement;
        html.classList.remove("font-size-small", "font-size-medium", "font-size-large");

        // Add the current one
        html.classList.add(`font-size-${fontSize}`);

        // Also update data attribute for potential CSS selectors
        html.setAttribute("data-font-size", fontSize);
    }, [fontSize]);

    return null; // This component doesn't render anything
}
