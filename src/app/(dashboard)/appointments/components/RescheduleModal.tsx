"use client";

import { Clock, Loader2 } from "lucide-react";
import { Button, Card, CardContent } from "@/components/ui";
import { format } from "date-fns";
import { BookingData, getBookingTime } from "@/lib/utils/appointment-utils";

interface RescheduleModalProps {
    booking: BookingData;
    rescheduleDate: string;
    setRescheduleDate: (date: string) => void;
    rescheduleTime: string;
    setRescheduleTime: (time: string) => void;
    timeSlots: string[];
    rescheduling: boolean;
    onClose: () => void;
    onConfirm: () => void;
}

export function RescheduleModal({
    booking,
    rescheduleDate,
    setRescheduleDate,
    rescheduleTime,
    setRescheduleTime,
    timeSlots,
    rescheduling,
    onClose,
    onConfirm
}: RescheduleModalProps) {
    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
            <Card className="w-full max-w-md border-none shadow-2xl bg-white overflow-hidden rounded-[2rem]">
                <div className="h-2 bg-gradient-to-r from-amber-400 to-amber-600" />
                <CardContent className="p-8">
                    <div className="flex items-center gap-4 mb-8">
                        <div className="p-4 bg-amber-50 rounded-2xl">
                            <Clock className="h-6 w-6 text-amber-600" />
                        </div>
                        <div>
                            <h3 className="text-xl font-black text-gray-900">Reschedule</h3>
                            <p className="text-xs font-bold text-gray-400 uppercase tracking-widest mt-1">Change Appointment Slot</p>
                        </div>
                    </div>

                    <div className="p-5 bg-gray-50 rounded-2xl mb-8 space-y-3 border border-gray-100">
                        <div className="flex justify-between items-center">
                            <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Customer</span>
                            <span className="text-sm font-extrabold text-gray-800">{booking.customer?.name}</span>
                        </div>
                        <div className="flex justify-between items-center">
                            <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Service</span>
                            <span className="text-sm font-bold text-gray-600">{booking.service?.name}</span>
                        </div>
                        <div className="flex justify-between items-center pt-3 border-t border-gray-200/50">
                            <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Current</span>
                            <span className="text-sm font-black text-amber-600">
                                {format(new Date(booking.booking_date), 'MMM d')} at {getBookingTime(booking).slice(0, 5)}
                            </span>
                        </div>
                    </div>

                    <div className="space-y-6 mb-8">
                        <div className="space-y-2">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] ml-1">New Date</label>
                            <input
                                type="date"
                                value={rescheduleDate}
                                onChange={(e) => setRescheduleDate(e.target.value)}
                                min={format(new Date(), 'yyyy-MM-dd')}
                                className="w-full h-14 bg-gray-50 border-gray-100 rounded-2xl px-5 font-bold text-gray-900 focus:ring-2 focus:ring-amber-500/20 focus:border-amber-500 transition-all outline-none"
                            />
                        </div>
                        <div className="space-y-2">
                            <label className="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] ml-1">New Time</label>
                            <select
                                value={rescheduleTime}
                                onChange={(e) => setRescheduleTime(e.target.value)}
                                className="w-full h-14 bg-gray-50 border-gray-100 rounded-2xl px-5 font-bold text-gray-900 focus:ring-2 focus:ring-amber-500/20 focus:border-amber-500 transition-all outline-none appearance-none cursor-pointer"
                            >
                                {timeSlots.map(slot => (
                                    <option key={slot} value={slot}>{slot}</option>
                                ))}
                            </select>
                        </div>
                    </div>

                    <div className="flex gap-3">
                        <Button
                            variant="ghost"
                            className="flex-1 h-14 rounded-2xl font-black text-gray-400 hover:text-gray-600 hover:bg-gray-50 transition-all"
                            onClick={onClose}
                            disabled={rescheduling}
                        >
                            Back
                        </Button>
                        <Button
                            className="flex-1 h-14 rounded-2xl bg-amber-500 hover:bg-amber-600 text-white font-black shadow-lg shadow-amber-100 transition-all active:scale-[0.98]"
                            onClick={onConfirm}
                            disabled={rescheduling || !rescheduleDate || !rescheduleTime}
                        >
                            {rescheduling ? (
                                <Loader2 className="h-5 w-5 animate-spin mx-auto" />
                            ) : (
                                "Confirm New Slot"
                            )}
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
