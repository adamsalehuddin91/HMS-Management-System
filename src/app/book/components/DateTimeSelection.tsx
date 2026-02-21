"use client";

import { motion } from "framer-motion";
import { ChevronLeft, ChevronRight, Clock } from "lucide-react";
import { Card, CardContent } from "@/components/ui";
import { format } from "date-fns";
import { ms } from "date-fns/locale/ms";
import { generateCalendarDays, BookingSlot } from "@/lib/utils/booking-utils";

interface DateTimeSelectionProps {
    currentMonth: Date;
    setCurrentMonth: (date: Date) => void;
    selectedDate: Date | null;
    setSelectedDate: (date: Date) => void;
    selectedTime: string | null;
    setSelectedTime: (time: string) => void;
    availableSlots: BookingSlot[];
}

export function DateTimeSelection({
    currentMonth,
    setCurrentMonth,
    selectedDate,
    setSelectedDate,
    selectedTime,
    setSelectedTime,
    availableSlots
}: DateTimeSelectionProps) {
    const calendarDays = generateCalendarDays(
        currentMonth.getFullYear(),
        currentMonth.getMonth()
    );

    return (
        <motion.div
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -20 }}
            className="space-y-4"
        >
            <h2 className="text-lg font-bold text-gray-800">Pilih Tarikh & Masa</h2>
            <p className="text-xs text-gray-400 font-medium -mt-2">Waktu Operasi: 9:00 AM - 9:00 PM (Rehat 1:00 - 2:00 PM)</p>

            {/* Calendar */}
            <Card className="border-none shadow-sm overflow-hidden">
                <CardContent className="p-4 bg-white">
                    <div className="flex items-center justify-between mb-4">
                        <button
                            onClick={() => setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1, 1))}
                            className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
                        >
                            <ChevronLeft className="h-5 w-5" />
                        </button>
                        <h3 className="font-bold text-gray-800 uppercase tracking-wider text-sm">
                            {format(currentMonth, 'MMMM yyyy', { locale: ms })}
                        </h3>
                        <button
                            onClick={() => setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 1))}
                            className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
                        >
                            <ChevronRight className="h-5 w-5" />
                        </button>
                    </div>

                    <div className="grid grid-cols-7 gap-1 text-center mb-2">
                        {["Ahd", "Isn", "Sel", "Rab", "Kha", "Jum", "Sab"].map(d => (
                            <div key={d} className="text-[10px] font-bold text-gray-400 uppercase tracking-widest py-2">{d}</div>
                        ))}
                    </div>

                    <div className="grid grid-cols-7 gap-1">
                        {calendarDays.map((day, i) => (
                            <button
                                key={i}
                                disabled={!day.day || day.isPast}
                                onClick={() => day.day && !day.isPast && setSelectedDate(
                                    new Date(currentMonth.getFullYear(), currentMonth.getMonth(), day.day)
                                )}
                                className={`aspect-square rounded-xl text-sm font-semibold transition-all flex items-center justify-center ${!day.day ? "invisible" :
                                    day.isPast ? "text-gray-200 cursor-not-allowed" :
                                        selectedDate?.getDate() === day.day &&
                                            selectedDate?.getMonth() === currentMonth.getMonth()
                                            ? "bg-[#2e7d32] text-white shadow-md shadow-green-100 scale-110 z-10" :
                                            day.isToday ? "bg-[#e8f5e9] text-[#2e7d32] border border-[#2e7d32]/20" :
                                                "hover:bg-gray-50 text-gray-700"
                                    }`}
                            >
                                {day.day}
                            </button>
                        ))}
                    </div>
                </CardContent>
            </Card>

            {/* Time Slots */}
            {selectedDate && (
                <div className="mt-6">
                    <h3 className="text-sm font-bold text-gray-700 mb-4 flex items-center gap-2">
                        <Clock className="h-4 w-4" />
                        Slot Tersedia - {format(selectedDate, 'dd MMM')}
                    </h3>
                    <div className="grid grid-cols-4 gap-2">
                        {availableSlots.map(slot => (
                            <button
                                key={slot.time}
                                disabled={!slot.available}
                                onClick={() => setSelectedTime(slot.time)}
                                className={`py-3 rounded-xl text-sm font-bold transition-all border ${!slot.available
                                    ? "bg-gray-50 text-gray-300 cursor-not-allowed border-gray-100 line-through"
                                    : selectedTime === slot.time
                                        ? "bg-[#2e7d32] text-white border-transparent shadow-lg shadow-green-100 scale-105"
                                        : "bg-white border-gray-100 text-gray-600 hover:border-[#4caf50] hover:text-[#2e7d32]"
                                    }`}
                            >
                                {slot.time}
                            </button>
                        ))}
                    </div>
                    {availableSlots.filter(s => s.available).length === 0 && (
                        <div className="text-center py-8 bg-gray-50 rounded-2xl border border-dashed border-gray-200 mt-2">
                            <p className="text-gray-500 font-medium">Tiada slot tersedia untuk tarikh ini.</p>
                            <p className="text-xs text-gray-400 mt-1">Sila pilih tarikh lain yang bersesuaian.</p>
                        </div>
                    )}
                </div>
            )}
        </motion.div>
    );
}
