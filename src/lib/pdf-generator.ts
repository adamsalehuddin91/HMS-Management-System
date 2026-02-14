/**
 * PDF Receipt Generator
 * Generates professional PDF receipts for HMS Salon sales
 */

import { jsPDF } from 'jspdf';

interface SaleItem {
    name: string;
    quantity: number;
    price: number;
}

interface Sale {
    id: string;
    total: number;
    date: string;
    items: SaleItem[];
}

interface Customer {
    name: string;
    phone: string;
}

interface ReceiptData {
    customer: Customer;
    sale: Sale;
}

export async function generateReceiptPDF(data: ReceiptData): Promise<Buffer> {
    const doc = new jsPDF();

    // Header
    doc.setFontSize(20);
    doc.setFont('helvetica', 'bold');
    doc.text('HAIDA MUSLIMAH SALON', 105, 20, { align: 'center' });

    doc.setFontSize(10);
    doc.setFont('helvetica', 'normal');
    doc.text('Resit Pembayaran', 105, 28, { align: 'center' });

    // Line separator
    doc.line(20, 35, 190, 35);

    // Receipt details
    doc.setFontSize(11);
    doc.setFont('helvetica', 'bold');
    doc.text('No. Resit:', 20, 45);
    doc.setFont('helvetica', 'normal');
    doc.text(data.sale.id.substring(0, 8).toUpperCase(), 60, 45);

    doc.setFont('helvetica', 'bold');
    doc.text('Tarikh:', 20, 52);
    doc.setFont('helvetica', 'normal');
    const date = new Date(data.sale.date).toLocaleDateString('ms-MY', {
        day: 'numeric',
        month: 'long',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
    doc.text(date, 60, 52);

    doc.setFont('helvetica', 'bold');
    doc.text('Pelanggan:', 20, 59);
    doc.setFont('helvetica', 'normal');
    doc.text(data.customer.name, 60, 59);

    doc.setFont('helvetica', 'bold');
    doc.text('Telefon:', 20, 66);
    doc.setFont('helvetica', 'normal');
    doc.text(data.customer.phone, 60, 66);

    // Line separator
    doc.line(20, 73, 190, 73);

    // Items header
    doc.setFontSize(11);
    doc.setFont('helvetica', 'bold');
    doc.text('Butiran Perkhidmatan', 20, 82);

    // Items table
    let yPos = 90;
    doc.setFontSize(10);

    data.sale.items.forEach((item, index) => {
        const itemTotal = item.price * item.quantity;

        doc.setFont('helvetica', 'normal');
        doc.text(`${index + 1}. ${item.name}`, 20, yPos);
        doc.text(`${item.quantity}x`, 120, yPos);
        doc.text(`RM${item.price.toFixed(2)}`, 145, yPos);
        doc.text(`RM${itemTotal.toFixed(2)}`, 170, yPos, { align: 'right' });

        yPos += 7;
    });

    // Line separator
    doc.line(20, yPos + 3, 190, yPos + 3);

    // Total
    yPos += 10;
    doc.setFontSize(14);
    doc.setFont('helvetica', 'bold');
    doc.text('JUMLAH:', 20, yPos);
    doc.text(`RM${data.sale.total.toFixed(2)}`, 190, yPos, { align: 'right' });

    // Footer
    yPos += 20;
    doc.setFontSize(9);
    doc.setFont('helvetica', 'italic');
    doc.text('Terima kasih atas sokongan anda!', 105, yPos, { align: 'center' });

    yPos += 7;
    doc.setFont('helvetica', 'normal');
    doc.text('Haida Muslimah Salon', 105, yPos, { align: 'center' });

    // Convert to buffer
    const pdfBuffer = Buffer.from(doc.output('arraybuffer'));

    return pdfBuffer;
}
