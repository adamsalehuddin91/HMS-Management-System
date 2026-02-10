"use client";

import { motion } from "framer-motion";
import { Check } from "lucide-react";

interface BookingStepsProps {
    step: "service" | "datetime" | "details" | "confirm" | "success";
}

export function BookingSteps({ step }: BookingStepsProps) {
    const steps = ["service", "datetime", "details", "confirm"];
    const currentIndex = steps.indexOf(step === "success" ? "" : step);

    if (step === "success") return null;

    return (
        <div className="max-w-lg mx-auto px-6 py-8">
            <div className="flex items-center justify-between relative px-2">
                {/* Background Line */}
                <div className="absolute top-4 left-6 right-6 h-[2px] bg-gray-100 -z-0" />

                {steps.map((s, i) => {
                    const isActive = step === s;
                    const isCompleted = currentIndex > i;

                    return (
                        <div key={s} className="flex flex-col items-center gap-2.5 relative z-10">
                            <motion.div
                                animate={isActive ? { scale: 1.25 } : { scale: 1 }}
                                className={`w-9 h-9 rounded-2xl flex items-center justify-center text-sm font-black transition-all duration-500 shadow-sm ${isActive ? "bg-[#2e7d32] text-white shadow-lg shadow-green-200 ring-4 ring-green-50" :
                                    isCompleted ? "bg-[#4caf50] text-white" : "bg-white text-gray-300 border border-gray-100"
                                    }`}>
                                {isCompleted ? <Check className="h-5 w-5 stroke-[3px]" /> : i + 1}
                            </motion.div>
                            <span className={`text-[10px] font-black uppercase tracking-widest transition-colors duration-300 ${isActive ? "text-[#2e7d32]" : "text-gray-300"
                                }`}>
                                {s === "service" ? "Servis" : s === "datetime" ? "Masa" : s === "details" ? "Info" : "Sahkan"}
                            </span>
                        </div>
                    );
                })}
            </div>
        </div>
    );
}
