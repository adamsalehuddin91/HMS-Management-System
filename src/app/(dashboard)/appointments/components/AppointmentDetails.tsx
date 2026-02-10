"use client";

import Link from "next/link";
import { X, MessageSquare, Calendar as CalendarIcon, Clock, User } from "lucide-react";
import { Button, Card, CardContent, Avatar, Badge } from "@/components/ui";
import { formatCurrency } from "@/lib/utils";
import { format } from "date-fns";
import {
    BookingData,
    getBookingTime,
    getDepositAmount,
    isCustomerMember,
    getServiceDuration
} from "@/lib/utils/appointment-utils";

interface AppointmentDetailsProps {
    booking: BookingData | null;
    loading: boolean;
    onClose: () => void;
    onReschedule: () => void;
    onCancel: () => void;
}

export function AppointmentDetails({
    booking,
    loading,
    onClose,
    onReschedule,
    onCancel
}: AppointmentDetailsProps) {
    if (loading) {
        return (
            <Card className="w-full lg:w-96 shrink-0 border-none shadow-xl bg-white/50 backdrop-blur-md">
                <CardContent className="p-12 text-center text-gray-400">
                    <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-[#2e7d32] mx-auto mb-4" />
                    <p className="font-bold text-xs uppercase tracking-widest">Loading Details...</p>
                </CardContent>
            </Card>
        );
    }

    if (!booking) {
        return (
            <Card className="w-full lg:w-96 shrink-0 border-none shadow-xl bg-white/50 backdrop-blur-md h-fit">
                <CardContent className="p-12 text-center">
                    <div className="w-20 h-20 bg-gray-50 rounded-full flex items-center justify-center mx-auto mb-6 text-gray-200">
                        <CalendarIcon className="h-10 w-10" />
                    </div>
                    <p className="font-black text-gray-900 mb-2">No Selection</p>
                    <p className="text-sm text-gray-400">Click on an appointment to view full details.</p>
                </CardContent>
            </Card>
        );
    }

    return (
        <Card className="w-full lg:w-96 shrink-0 border-none shadow-xl bg-white ring-1 ring-black/[0.05] flex flex-col h-full overflow-hidden">
            <div className="h-2 bg-gradient-to-r from-[#2e7d32] to-[#4caf50]" />
            <CardContent className="p-6 overflow-y-auto">
                <div className="flex items-center justify-between mb-8">
                    <h3 className="text-xs font-black text-gray-400 uppercase tracking-[0.2em]">Appointment Details</h3>
                    <button
                        onClick={onClose}
                        className="p-2 hover:bg-gray-50 rounded-xl transition-colors text-gray-400"
                    >
                        <X className="h-4 w-4" />
                    </button>
                </div>

                {/* Customer Hub */}
                <div className="flex items-center gap-4 mb-8 p-4 bg-gray-50 rounded-2xl border border-gray-100">
                    <div className="w-14 h-14 bg-white rounded-xl shadow-sm border border-gray-100 flex items-center justify-center overflow-hidden">
                        <User className="h-6 w-6 text-[#2e7d32]" />
                    </div>
                    <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 mb-0.5">
                            <p className="font-extrabold text-gray-900 truncate">{booking.customer?.name || 'Walk-in'}</p>
                            {isCustomerMember(booking.customer) && (
                                <Badge className="bg-[#e8f5e9] text-[#2e7d32] border-none text-[8px] font-black uppercase tracking-tighter">Member</Badge>
                            )}
                        </div>
                        <p className="text-xs font-bold text-gray-400">{booking.customer?.phone || '-'}</p>
                    </div>
                    <button className="p-2.5 bg-[#2e7d32] text-white rounded-xl shadow-lg shadow-green-100 hover:scale-105 transition-transform">
                        <MessageSquare className="h-4 w-4" />
                    </button>
                </div>

                {/* Service Specs */}
                <div className="space-y-6 mb-8">
                    <div className="p-4 bg-[var(--primary-light)]/10 rounded-2xl border border-[#2e7d32]/5">
                        <p className="text-[10px] font-black text-[#2e7d32] uppercase tracking-widest mb-3">Service & Stylist</p>
                        <div className="space-y-4">
                            <div className="flex justify-between items-start">
                                <div>
                                    <p className="font-extrabold text-gray-900">{booking.service?.name}</p>
                                    <p className="text-xs font-bold text-[#2e7d32] flex items-center gap-1.5 mt-1">
                                        <Clock className="w-3.5 h-3.5" />
                                        {getServiceDuration(booking.service)} mins
                                    </p>
                                </div>
                                <p className="text-lg font-black text-[#2e7d32]">{formatCurrency(booking.service?.price || 0)}</p>
                            </div>
                            <div className="flex items-center gap-3 pt-3 border-t border-[#2e7d32]/10">
                                <Avatar name={booking.staff?.name || 'Staff'} size="sm" className="h-7 w-7" />
                                <p className="text-xs font-bold text-gray-600">{booking.staff?.name || 'Unassigned'}</p>
                            </div>
                        </div>
                    </div>

                    <div className="grid grid-cols-2 gap-3">
                        <div className="p-4 bg-gray-50 rounded-2xl border border-gray-100">
                            <div className="flex items-center gap-2 mb-1.5 text-gray-400">
                                <CalendarIcon className="h-3 w-3" />
                                <span className="text-[9px] font-black uppercase tracking-widest">Date</span>
                            </div>
                            <p className="text-sm font-black text-gray-900">
                                {format(new Date(booking.booking_date), 'MMM d, yyyy')}
                            </p>
                        </div>
                        <div className="p-4 bg-gray-50 rounded-2xl border border-gray-100">
                            <div className="flex items-center gap-2 mb-1.5 text-gray-400">
                                <Clock className="h-3 w-3" />
                                <span className="text-[9px] font-black uppercase tracking-widest">Time</span>
                            </div>
                            <p className="text-sm font-black text-gray-900">
                                {getBookingTime(booking).slice(0, 5)}
                            </p>
                        </div>
                    </div>
                </div>

                {/* Status Chips */}
                <div className="space-y-3 mb-8">
                    <div className="flex justify-between items-center px-4 py-3 bg-white border border-gray-100 rounded-2xl shadow-sm">
                        <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Status</span>
                        <Badge className={`border-none font-black text-[10px] ${booking.status === 'confirmed' ? 'bg-[#e8f5e9] text-[#2e7d32]' :
                                booking.status === 'pending' ? 'bg-amber-50 text-amber-600' :
                                    booking.status === 'completed' ? 'bg-blue-50 text-blue-600' : 'bg-red-50 text-red-600'
                            }`}>
                            {booking.status.toUpperCase()}
                        </Badge>
                    </div>
                    <div className="flex justify-between items-center px-4 py-3 bg-white border border-gray-100 rounded-2xl shadow-sm">
                        <span className="text-[10px] font-black text-gray-400 uppercase tracking-widest">Deposit</span>
                        <Badge className={`border-none font-black text-[10px] ${booking.deposit_paid ? 'bg-[#e8f5e9] text-[#2e7d32]' : 'bg-gray-100 text-gray-400'}`}>
                            {booking.deposit_paid ? 'PAID' : 'UNPAID'}
                        </Badge>
                    </div>
                </div>

                {/* Financial Summary */}
                <div className="p-5 bg-gray-900 rounded-3xl text-white shadow-xl mb-8 relative overflow-hidden group">
                    <div className="absolute top-0 right-0 w-32 h-32 bg-white/5 rounded-full -mr-16 -mt-16 blur-2xl group-hover:bg-white/10 transition-colors" />
                    <div className="space-y-4 relative z-10">
                        <div className="flex justify-between items-center text-gray-400">
                            <span className="text-[10px] font-black uppercase tracking-widest">Total Bill</span>
                            <span className="font-bold">{formatCurrency(booking.service?.price || 0)}</span>
                        </div>
                        {booking.deposit_paid && getDepositAmount(booking) > 0 && (
                            <div className="flex justify-between items-center text-green-400/80">
                                <span className="text-[10px] font-black uppercase tracking-widest">Deposit Paid</span>
                                <span className="font-bold">-{formatCurrency(getDepositAmount(booking))}</span>
                            </div>
                        )}
                        <div className="pt-4 border-t border-white/10 flex justify-between items-end">
                            <span className="text-[10px] font-black uppercase tracking-widest text-[#4caf50]">Remaining</span>
                            <span className="text-3xl font-black tracking-tighter">
                                {formatCurrency(
                                    (booking.service?.price || 0) -
                                    (booking.deposit_paid ? getDepositAmount(booking) : 0)
                                )}
                            </span>
                        </div>
                    </div>
                </div>

                {/* Action HQ */}
                {booking.status !== 'completed' && booking.status !== 'cancelled' && (
                    <div className="space-y-3">
                        <Link href={`/pos?booking=${booking.id}`} className="block">
                            <Button className="w-full bg-[#2e7d32] hover:bg-[#1b5e20] h-14 rounded-2xl text-base font-black shadow-lg shadow-green-100 transition-all active:scale-[0.98]">
                                Convert to Sale
                            </Button>
                        </Link>

                        <div className="grid grid-cols-2 gap-3">
                            <Button
                                variant="outline"
                                className="h-12 rounded-2xl border-gray-100 font-extrabold text-xs text-gray-600 hover:bg-gray-50"
                                onClick={onReschedule}
                            >
                                <Clock className="h-3.5 w-3.5 mr-2 text-[#2e7d32]" />
                                Reschedule
                            </Button>
                            <Button
                                variant="outline"
                                className="h-12 rounded-2xl border-red-50 font-extrabold text-xs text-red-400 hover:bg-red-50 hover:text-red-500 hover:border-red-100"
                                onClick={onCancel}
                            >
                                <X className="h-3.5 w-3.5 mr-2" />
                                Cancel
                            </Button>
                        </div>
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
