"use client";

import { Calendar as CalendarIcon, Clock, ChevronLeft, ChevronRight } from "lucide-react";
import { Card, CardContent } from "@/components/ui";
import { format } from "date-fns";
import { generateCalendarDays } from "@/lib/utils/booking-utils";

interface DateTimeStepProps {
    currentMonth: Date;
    setCurrentMonth: (date: Date) => void;
    selectedDate: Date | null;
    setSelectedDate: (date: Date) => void;
    selectedTime: string | null;
    setSelectedTime: (time: string) => void;
    timeSlots: string[];
}

export function DateTimeStep({
    currentMonth,
    setCurrentMonth,
    selectedDate,
    setSelectedDate,
    selectedTime,
    setSelectedTime,
    timeSlots
}: DateTimeStepProps) {
    const calendarDays = generateCalendarDays(currentMonth.getFullYear(), currentMonth.getMonth());
    const monthName = currentMonth.toLocaleString("default", { month: "long", year: "numeric" });

    return (
        <div className="space-y-8">
            <div className="flex items-center gap-3">
                <div className="p-2.5 bg-green-50 rounded-xl">
                    <CalendarIcon className="h-5 w-5 text-[#2e7d32]" />
                </div>
                <div>
                    <h3 className="text-lg font-black text-gray-900">Tarikh & Masa</h3>
                    <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Tentukan waktu temujanji</p>
                </div>
            </div>

            <Card className="border-none shadow-xl bg-white/50 backdrop-blur-md rounded-3xl overflow-hidden">
                <CardContent className="p-6">
                    <div className="flex items-center justify-between mb-8">
                        <h4 className="font-extrabold text-gray-800 text-sm uppercase tracking-wider">{monthName}</h4>
                        <div className="flex gap-1.5 p-1 bg-gray-100/50 rounded-xl">
                            <button
                                onClick={() => setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1))}
                                className="p-2 hover:bg-white hover:shadow-sm rounded-lg transition-all"
                            >
                                <ChevronLeft className="h-4 w-4 text-gray-600" />
                            </button>
                            <button
                                onClick={() => setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1))}
                                className="p-2 hover:bg-white hover:shadow-sm rounded-lg transition-all"
                            >
                                <ChevronRight className="h-4 w-4 text-gray-600" />
                            </button>
                        </div>
                    </div>

                    <div className="grid grid-cols-7 gap-1 mb-2">
                        {["A", "I", "S", "R", "K", "J", "S"].map((d, i) => (
                            <div key={i} className="text-center text-[10px] font-black text-gray-300 uppercase tracking-widest py-2">
                                {d}
                            </div>
                        ))}
                    </div>

                    <div className="grid grid-cols-7 gap-1">
                        {calendarDays.map((item, idx) => {
                            const isSelected = selectedDate &&
                                item.day === selectedDate.getDate() &&
                                currentMonth.getMonth() === selectedDate.getMonth() &&
                                currentMonth.getFullYear() === selectedDate.getFullYear();

                            return (
                                <button
                                    key={idx}
                                    disabled={!item.day || item.isPast}
                                    onClick={() => {
                                        if (item.day && !item.isPast) {
                                            setSelectedDate(new Date(currentMonth.getFullYear(), currentMonth.getMonth(), item.day));
                                        }
                                    }}
                                    className={`aspect-square flex items-center justify-center rounded-xl text-xs font-black transition-all ${!item.day
                                            ? "invisible"
                                            : item.isPast
                                                ? "text-gray-200 cursor-not-allowed"
                                                : isSelected
                                                    ? "bg-[#2e7d32] text-white shadow-lg shadow-green-100 scale-105"
                                                    : item.isToday
                                                        ? "bg-green-50 text-[#2e7d32] ring-1 ring-[#2e7d32]/20"
                                                        : "hover:bg-gray-50 text-gray-600"
                                        }`}
                                >
                                    {item.day}
                                </button>
                            );
                        })}
                    </div>
                </CardContent>
            </Card>

            {selectedDate && (
                <div className="space-y-4 animate-in fade-in slide-in-from-bottom-2">
                    <div className="flex items-center gap-2 text-gray-400">
                        <Clock className="h-4 w-4" />
                        <span className="text-[10px] font-black uppercase tracking-[0.2em]">Pilih Masa - {format(selectedDate, 'dd MMM')}</span>
                    </div>
                    <div className="grid grid-cols-4 gap-2.5">
                        {timeSlots.map((time) => (
                            <button
                                key={time}
                                onClick={() => setSelectedTime(time)}
                                className={`py-4 rounded-2xl text-xs font-black border transition-all ${selectedTime === time
                                        ? "bg-[#2e7d32] border-[#2e7d32] text-white shadow-xl shadow-green-900/10 scale-105"
                                        : "bg-white border-gray-100 text-gray-500 hover:border-green-200 hover:text-[#2e7d32]"
                                    }`}
                            >
                                {time}
                            </button>
                        ))}
                    </div>
                </div>
            )}
        </div>
    );
}
