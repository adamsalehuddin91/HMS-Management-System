import { jsPDF } from "jspdf";
import { format } from "date-fns";

export interface ReceiptItem {
  name: string;
  quantity: number;
  price: number;
  total: number;
  itemType: 'service' | 'product';
  staffName?: string;
}

export interface ReceiptData {
  receiptNo: string;
  date: Date;
  businessName: string;
  businessPhone: string;
  businessAddress?: string;
  customerName?: string;
  customerPhone?: string;
  items: ReceiptItem[];
  subtotal: number;
  pointsRedeemed: number;
  pointsDiscount: number;
  depositDeducted: number;
  total: number;
  paymentMethod: string;
  pointsEarned: number;
  cashReceived?: number;
  change?: number;
}

/**
 * Generate a 58mm thermal receipt PDF
 * 58mm = ~164 points width
 */
export function generateReceipt(data: ReceiptData): jsPDF {
  // 58mm width, variable height (will auto-extend)
  const pageWidth = 58;
  const margin = 3;
  const contentWidth = pageWidth - (margin * 2);

  // Create PDF with custom size
  const doc = new jsPDF({
    orientation: "portrait",
    unit: "mm",
    format: [pageWidth, 200], // Height will be trimmed
  });

  let y = 5; // Starting Y position
  const lineHeight = 4;
  const smallLineHeight = 3;

  // Helper functions
  const centerText = (text: string, fontSize: number, bold = false) => {
    doc.setFontSize(fontSize);
    doc.setFont("helvetica", bold ? "bold" : "normal");
    const textWidth = doc.getTextWidth(text);
    doc.text(text, (pageWidth - textWidth) / 2, y);
    y += fontSize > 8 ? lineHeight : smallLineHeight;
  };

  const leftText = (text: string, fontSize: number, bold = false) => {
    doc.setFontSize(fontSize);
    doc.setFont("helvetica", bold ? "bold" : "normal");
    doc.text(text, margin, y);
    y += fontSize > 8 ? lineHeight : smallLineHeight;
  };

  const rightText = (text: string, fontSize: number) => {
    doc.setFontSize(fontSize);
    doc.setFont("helvetica", "normal");
    const textWidth = doc.getTextWidth(text);
    doc.text(text, pageWidth - margin - textWidth, y);
  };

  const leftRightText = (left: string, right: string, fontSize: number, leftBold = false) => {
    doc.setFontSize(fontSize);
    doc.setFont("helvetica", leftBold ? "bold" : "normal");
    doc.text(left, margin, y);
    doc.setFont("helvetica", "normal");
    const rightWidth = doc.getTextWidth(right);
    doc.text(right, pageWidth - margin - rightWidth, y);
    y += fontSize > 8 ? lineHeight : smallLineHeight;
  };

  const dashedLine = () => {
    doc.setFontSize(6);
    doc.setFont("helvetica", "normal");
    const dashes = "-".repeat(40);
    const textWidth = doc.getTextWidth(dashes);
    doc.text(dashes, (pageWidth - textWidth) / 2, y);
    y += smallLineHeight;
  };

  const formatCurrency = (amount: number): string => {
    return `RM ${amount.toFixed(2)}`;
  };

  // === RECEIPT CONTENT ===

  // Business Header
  centerText(data.businessName.toUpperCase(), 10, true);
  y += 1;

  if (data.businessAddress) {
    // Split long address into lines
    doc.setFontSize(6);
    const addressLines = doc.splitTextToSize(data.businessAddress, contentWidth);
    addressLines.forEach((line: string) => {
      centerText(line, 6);
    });
  }

  centerText(`Tel: ${data.businessPhone}`, 6);
  y += 2;

  // Receipt Info
  dashedLine();
  centerText("RESIT JUALAN", 8, true);
  centerText("SALES RECEIPT", 6);
  dashedLine();

  // Receipt details
  leftRightText("No:", data.receiptNo, 7);
  leftRightText("Tarikh:", format(data.date, "dd/MM/yyyy"), 7);
  leftRightText("Masa:", format(data.date, "HH:mm"), 7);

  if (data.customerName) {
    leftRightText("Pelanggan:", "", 7);
    leftText(data.customerName, 7, true);
  }

  y += 1;
  dashedLine();

  // Items Header
  leftText("ITEM", 6, true);
  y -= smallLineHeight;
  rightText("JUMLAH", 6);
  y += smallLineHeight;
  dashedLine();

  // Items
  data.items.forEach((item) => {
    // Item name (may wrap)
    doc.setFontSize(7);
    doc.setFont("helvetica", "normal");

    const itemLabel = item.itemType === 'product' ? '[P] ' : '';
    const itemName = `${itemLabel}${item.name}`;
    const nameLines = doc.splitTextToSize(itemName, contentWidth - 15);

    nameLines.forEach((line: string, index: number) => {
      doc.text(line, margin, y);
      if (index === 0) {
        // Price on first line
        const priceText = formatCurrency(item.total);
        const priceWidth = doc.getTextWidth(priceText);
        doc.text(priceText, pageWidth - margin - priceWidth, y);
      }
      y += smallLineHeight;
    });

    // Quantity and unit price
    doc.setFontSize(6);
    doc.setTextColor(100);
    const qtyText = `  ${item.quantity} x ${formatCurrency(item.price)}`;
    doc.text(qtyText, margin, y);

    // Staff name if service
    if (item.staffName) {
      const staffText = `(${item.staffName})`;
      const staffWidth = doc.getTextWidth(staffText);
      doc.text(staffText, pageWidth - margin - staffWidth, y);
    }
    doc.setTextColor(0);
    y += smallLineHeight + 1;
  });

  dashedLine();

  // Totals
  leftRightText("Jumlah Kecil:", formatCurrency(data.subtotal), 7);

  if (data.pointsDiscount > 0) {
    leftRightText(`Tolak Mata (${data.pointsRedeemed} pts):`, `-${formatCurrency(data.pointsDiscount)}`, 7);
  }

  if (data.depositDeducted > 0) {
    leftRightText("Tolak Deposit:", `-${formatCurrency(data.depositDeducted)}`, 7);
  }

  dashedLine();

  // Grand Total
  doc.setFontSize(9);
  doc.setFont("helvetica", "bold");
  doc.text("JUMLAH", margin, y);
  const totalText = formatCurrency(data.total);
  const totalWidth = doc.getTextWidth(totalText);
  doc.text(totalText, pageWidth - margin - totalWidth, y);
  y += lineHeight + 1;

  dashedLine();

  // Payment Info
  leftRightText("Bayaran:", data.paymentMethod.toUpperCase(), 7);

  if (data.cashReceived && data.cashReceived > data.total) {
    leftRightText("Diterima:", formatCurrency(data.cashReceived), 7);
    leftRightText("Baki:", formatCurrency(data.change || 0), 7);
  }

  // Points earned
  if (data.pointsEarned > 0 && data.customerName) {
    y += 1;
    dashedLine();
    centerText(`★ Mata Diperoleh: +${data.pointsEarned} pts ★`, 7, true);
  }

  y += 2;
  dashedLine();

  // Footer
  centerText("Terima Kasih!", 8, true);
  centerText("Thank You For Your Visit", 6);
  y += 2;
  centerText("Sila simpan resit ini", 5);
  centerText("Please keep this receipt", 5);

  y += 3;

  // Timestamp
  doc.setFontSize(5);
  doc.setTextColor(150);
  centerText(`Dicetak: ${format(new Date(), "dd/MM/yyyy HH:mm:ss")}`, 5);
  doc.setTextColor(0);

  return doc;
}

/**
 * Download receipt as PDF
 */
export function downloadReceipt(data: ReceiptData): void {
  const doc = generateReceipt(data);
  const filename = `resit-${data.receiptNo}-${format(data.date, "yyyyMMdd-HHmm")}.pdf`;
  doc.save(filename);
}

/**
 * Open receipt in new window for printing
 */
export function printReceipt(data: ReceiptData): void {
  const doc = generateReceipt(data);
  const pdfBlob = doc.output("blob");
  const pdfUrl = URL.createObjectURL(pdfBlob);
  window.open(pdfUrl, "_blank");
}
