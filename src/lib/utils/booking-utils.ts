import { format } from "date-fns";

export interface Service {
    id: string;
    name: string;
    category: string;
    price: number;
    member_price?: number;
    duration?: number;
    image_url?: string;
    promo_id?: string | null;
    promo_price?: number | null;
    promo_active?: boolean;
}

export interface Staff {
    id: string;
    name: string;
    role: string;
    is_active?: boolean;
}

export interface BookingSlot {
    time: string;
    available: boolean;
}

export interface BusinessInfo {
    name: string;
    phone: string;
    whatsapp: string;
    address: string;
}

export const ALL_TIME_SLOTS = [
    "09:00", "09:30", "10:00", "10:30", "11:00", "11:30",
    "12:00", "12:30", "14:00", "14:30", "15:00", "15:30",
    "16:00", "16:30", "17:00", "17:30", "18:00", "18:30",
    "19:00", "19:30", "20:00", "20:30",
];

export const generateCalendarDays = (year: number, month: number) => {
    const days = [];
    const firstDay = new Date(year, month, 1);
    const lastDay = new Date(year, month + 1, 0);
    const today = new Date();

    for (let i = 0; i < firstDay.getDay(); i++) {
        days.push({ day: null, isToday: false, isPast: true });
    }

    for (let i = 1; i <= lastDay.getDate(); i++) {
        const date = new Date(year, month, i);
        days.push({
            day: i,
            isToday: date.toDateString() === today.toDateString(),
            isPast: date < new Date(today.getFullYear(), today.getMonth(), today.getDate()),
        });
    }

    return days;
};

export const calculateEndTime = (startTime: string, durationMinutes: number): string => {
    const [hours, mins] = startTime.split(':').map(Number);
    const totalMins = hours * 60 + mins + durationMinutes;
    const endHours = Math.floor(totalMins / 60);
    const endMins = totalMins % 60;
    return `${String(endHours).padStart(2, '0')}:${String(endMins).padStart(2, '0')}`;
};

export const getWhatsAppLink = (
    businessInfo: BusinessInfo,
    selectedDate: Date | null,
    selectedTime: string | null,
    selectedService: Service | null,
    customerName: string,
    customerPhone: string,
    bookingId: string | null
) => {
    const message = encodeURIComponent(
        `Salam! Saya telah membuat tempahan:\n\n` +
        `📅 Tarikh: ${selectedDate ? format(selectedDate, 'dd MMM yyyy') : ''}\n` +
        `⏰ Masa: ${selectedTime}\n` +
        `💇 Servis: ${selectedService?.name}\n` +
        `👤 Nama: ${customerName}\n` +
        `📱 Telefon: ${customerPhone}\n` +
        `📝 No. Tempahan: HMS-${bookingId}\n\n` +
        `Terima kasih!`
    );
    return `https://wa.me/${businessInfo.whatsapp?.replace(/[^0-9]/g, '')}?text=${message}`;
};
