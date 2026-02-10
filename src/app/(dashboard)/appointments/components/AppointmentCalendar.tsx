"use client";

import { ChevronLeft, ChevronRight } from "lucide-react";
import { Card, CardContent, Button } from "@/components/ui";
import { BookingData, getBookingTime, getStatusColor } from "@/lib/utils/appointment-utils";

interface AppointmentCalendarProps {
    monthName: string;
    calendarDays: any[];
    view: "month" | "week" | "day";
    setView: (view: "month" | "week" | "day") => void;
    goToPreviousMonth: () => void;
    goToNextMonth: () => void;
    goToToday: () => void;
    onSelectBooking: (booking: BookingData) => void;
}

export function AppointmentCalendar({
    monthName,
    calendarDays,
    view,
    setView,
    goToPreviousMonth,
    goToNextMonth,
    goToToday,
    onSelectBooking
}: AppointmentCalendarProps) {
    return (
        <Card className="flex-1 min-w-0 border-none shadow-xl bg-white/50 backdrop-blur-md">
            <CardContent className="p-6">
                {/* Calendar Header */}
                <div className="flex items-center justify-between mb-8">
                    <div className="flex items-center gap-6">
                        <h2 className="text-2xl font-black tracking-tight text-gray-800">{monthName}</h2>
                        <div className="flex items-center gap-1.5 bg-gray-100/50 p-1 rounded-xl">
                            <button className="p-2 hover:bg-white hover:shadow-sm rounded-lg transition-all" onClick={goToPreviousMonth}>
                                <ChevronLeft className="h-5 w-5 text-gray-600" />
                            </button>
                            <button className="p-2 hover:bg-white hover:shadow-sm rounded-lg transition-all" onClick={goToNextMonth}>
                                <ChevronRight className="h-5 w-5 text-gray-600" />
                            </button>
                        </div>
                        <Button variant="outline" size="sm" onClick={goToToday} className="rounded-xl font-bold border-gray-200">Today</Button>
                    </div>

                    <div className="flex items-center gap-1.5 bg-gray-100/50 p-1 rounded-xl">
                        {["Month", "Week", "Day"].map((v) => (
                            <button
                                key={v}
                                onClick={() => setView(v.toLowerCase() as any)}
                                className={`px-4 py-2 text-xs font-black uppercase tracking-widest rounded-lg transition-all ${view === v.toLowerCase()
                                    ? "bg-white text-[#2e7d32] shadow-sm"
                                    : "text-gray-400 hover:text-gray-600 hover:bg-white/50"
                                    }`}
                            >
                                {v}
                            </button>
                        ))}
                    </div>
                </div>

                {/* Calendar Grid */}
                <div className="grid grid-cols-7 gap-3">
                    {["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"].map((day) => (
                        <div key={day} className="pb-4 text-center text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">
                            {day}
                        </div>
                    ))}
                    {calendarDays.map((item, idx) => (
                        <div
                            key={idx}
                            className={`min-h-[120px] p-3 border border-gray-100 rounded-2xl transition-all ${item.isToday ? "bg-green-50/30 border-[#2e7d32]/20 ring-1 ring-[#2e7d32]/5" : "bg-white/30"
                                } ${item.day ? "hover:border-[#2e7d32]/20 hover:shadow-lg hover:shadow-green-900/5 cursor-pointer group" : "opacity-30"}`}
                        >
                            {item.day && (
                                <>
                                    <div className="flex justify-between items-start mb-2">
                                        <span className={`text-sm font-black ${item.isToday ? "text-[#2e7d32]" : "text-gray-400 group-hover:text-gray-600"}`}>
                                            {String(item.day).padStart(2, '0')}
                                        </span>
                                    </div>
                                    <div className="space-y-1.5">
                                        {item.appointments.map((apt: any, i: number) => (
                                            <div
                                                key={i}
                                                onClick={(e) => {
                                                    e.stopPropagation();
                                                    if (apt.booking) onSelectBooking(apt.booking);
                                                }}
                                                className={`text-[10px] px-2.5 py-1.5 rounded-xl text-white font-bold cursor-pointer hover:scale-[1.03] transition-transform shadow-sm ${getStatusColor(apt.booking.status)}`}
                                            >
                                                <div className="flex justify-between items-center gap-1">
                                                    <span className="truncate">{apt.name}</span>
                                                    <span className="opacity-80 shrink-0 font-mono">{apt.time}</span>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </>
                            )}
                        </div>
                    ))}
                </div>
            </CardContent>
        </Card>
    );
}
