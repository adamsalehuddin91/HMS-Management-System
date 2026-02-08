"use client";

import { HTMLAttributes } from "react";
import { cn, getInitials } from "@/lib/utils";

export interface AvatarProps extends HTMLAttributes<HTMLDivElement> {
  src?: string;
  name: string;
  size?: "sm" | "md" | "lg" | "xl";
}

export function Avatar({ src, name, size = "md", className, ...props }: AvatarProps) {
  const sizes = {
    sm: "h-8 w-8 text-xs",
    md: "h-10 w-10 text-sm",
    lg: "h-12 w-12 text-base",
    xl: "h-16 w-16 text-lg",
  };

  if (src) {
    return (
      <div
        className={cn(
          "rounded-full overflow-hidden bg-[var(--secondary)]",
          sizes[size],
          className
        )}
        {...props}
      >
        <img src={src} alt={name} className="h-full w-full object-cover" />
      </div>
    );
  }

  return (
    <div
      className={cn(
        "rounded-full flex items-center justify-center bg-[var(--primary-light)] text-[var(--primary-dark)] font-medium",
        sizes[size],
        className
      )}
      {...props}
    >
      {getInitials(name)}
    </div>
  );
}
