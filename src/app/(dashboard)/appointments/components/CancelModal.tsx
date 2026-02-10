"use client";

import { AlertTriangle, X, Loader2 } from "lucide-react";
import { Button, Card, CardContent } from "@/components/ui";
import { format } from "date-fns";
import { BookingData, getBookingTime, getDepositAmount } from "@/lib/utils/appointment-utils";
import { formatCurrency } from "@/lib/utils";

interface CancelModalProps {
    booking: BookingData;
    cancelReason: string;
    setCancelReason: (reason: string) => void;
    cancelling: boolean;
    onClose: () => void;
    onConfirm: () => void;
}

export function CancelModal({
    booking,
    cancelReason,
    setCancelReason,
    cancelling,
    onClose,
    onConfirm
}: CancelModalProps) {
    return (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
            <Card className="w-full max-w-md border-none shadow-2xl bg-white overflow-hidden rounded-[2rem]">
                <div className="h-2 bg-gradient-to-r from-red-400 to-red-600" />
                <CardContent className="p-8">
                    <div className="flex items-center gap-4 mb-8">
                        <div className="p-4 bg-red-50 rounded-2xl">
                            <AlertTriangle className="h-6 w-6 text-red-600" />
                        </div>
                        <div>
                            <h3 className="text-xl font-black text-gray-900">Cancel Booking</h3>
                            <p className="text-xs font-bold text-gray-400 uppercase tracking-widest mt-1">This action is permanent</p>
                        </div>
                    </div>

                    <div className="p-5 bg-gray-50 rounded-2xl mb-8 space-y-3 border border-gray-100">
                        <div className="flex justify-between items-center">
                            <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Customer</span>
                            <span className="text-sm font-extrabold text-gray-800">{booking.customer?.name}</span>
                        </div>
                        <div className="flex justify-between items-center">
                            <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Scheduled</span>
                            <span className="text-sm font-black text-gray-800">
                                {format(new Date(booking.booking_date), 'MMM d, yyyy')} at {getBookingTime(booking).slice(0, 5)}
                            </span>
                        </div>
                        {booking.deposit_paid && getDepositAmount(booking) > 0 && (
                            <div className="flex justify-between items-center pt-3 border-t border-gray-200/50">
                                <span className="text-[10px] font-black text-amber-600 uppercase tracking-widest">Deposit Paid</span>
                                <span className="text-sm font-black text-amber-600">{formatCurrency(getDepositAmount(booking))}</span>
                            </div>
                        )}
                    </div>

                    {booking.deposit_paid && getDepositAmount(booking) > 0 && (
                        <div className="p-4 bg-amber-50 rounded-2xl mb-6 flex items-start gap-3 border border-amber-100/50">
                            <AlertTriangle className="h-4 w-4 text-amber-600 shrink-0 mt-0.5" />
                            <div className="space-y-1">
                                <p className="text-xs font-black text-amber-900 uppercase tracking-tight">Deposit Notice</p>
                                <p className="text-[11px] font-bold text-amber-700 leading-tight">
                                    Customer has paid a deposit. Please ensure refund processing follows salon policy.
                                </p>
                            </div>
                        </div>
                    )}

                    <div className="space-y-2 mb-8">
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] ml-1">Reason for Cancellation</label>
                        <select
                            value={cancelReason}
                            onChange={(e) => setCancelReason(e.target.value)}
                            className="w-full h-14 bg-gray-50 border-gray-100 rounded-2xl px-5 font-bold text-gray-900 focus:ring-2 focus:ring-red-500/20 focus:border-red-500 transition-all outline-none appearance-none cursor-pointer"
                        >
                            <option value="Customer request">Customer request</option>
                            <option value="Staff unavailable">Staff unavailable</option>
                            <option value="Customer no-show">Customer no-show</option>
                            <option value="Double booking">Double booking</option>
                            <option value="Emergency">Emergency</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div className="flex gap-3">
                        <Button
                            variant="ghost"
                            className="flex-1 h-14 rounded-2xl font-black text-gray-400 hover:text-gray-600 hover:bg-gray-50 transition-all"
                            onClick={onClose}
                            disabled={cancelling}
                        >
                            Keep Booking
                        </Button>
                        <Button
                            className="flex-1 h-14 rounded-2xl bg-red-500 hover:bg-red-600 text-white font-black shadow-lg shadow-red-100 transition-all active:scale-[0.98]"
                            onClick={onConfirm}
                            disabled={cancelling}
                        >
                            {cancelling ? (
                                <Loader2 className="h-5 w-5 animate-spin mx-auto" />
                            ) : (
                                "Cancel Booking"
                            )}
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
