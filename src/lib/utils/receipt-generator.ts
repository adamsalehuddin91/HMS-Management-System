import { jsPDF } from "jspdf";
import { format } from "date-fns";
import QRCode from "qrcode";

// Add missing type definition for setLineDash
declare module "jspdf" {
  interface jsPDF {
    setLineDash(dashArray: number[], dashPhase: number): jsPDF;
  }
}

export interface ReceiptItem {
  name: string;
  quantity: number;
  price: number;
  total: number;
  itemType: 'service' | 'product';
  staffName?: string;
  promoDescription?: string;
  originalPrice?: number;
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
  bookingUrl?: string;
  googleReviewUrl?: string;
}

/**
 * Generate WhatsApp QR code as data URL
 */
async function generateWhatsAppQR(phone: string): Promise<string | null> {
  try {
    // Clean phone number: remove non-digits, ensure 60 prefix
    const raw = phone.replace(/\D/g, "");
    let cleanPhone = raw;
    if (raw.startsWith("0")) cleanPhone = "6" + raw;
    else if (raw.startsWith("1")) cleanPhone = "60" + raw;

    const url = `https://wa.me/${cleanPhone}`;
    return await QRCode.toDataURL(url, {
      width: 200,
      margin: 1,
      color: { dark: "#000000", light: "#ffffff" },
    });
  } catch {
    return null;
  }
}

/**
 * Generate a 58mm thermal receipt PDF
 * 58mm = ~164 points width
 */
export async function generateReceipt(data: ReceiptData): Promise<jsPDF> {
  // 58mm width, variable height (will auto-extend)
  const pageWidth = 58;
  const margin = 4; // Increased margin for frame
  const contentWidth = pageWidth - (margin * 2);

  // Calculate estimated height to set initial canvas
  // Base height (header + footer) + items * estimated_item_height
  const estimatedHeight = 150 + (data.items.length * 10);

  // Create PDF with custom size
  const doc = new jsPDF({
    orientation: "portrait",
    unit: "mm",
    format: [pageWidth, estimatedHeight],
  });

  let y = 6; // Starting Y position inside frame
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
    doc.text(text, margin + 1, y); // +1 padding from frame
  };

  const rightText = (text: string, fontSize: number) => {
    doc.setFontSize(fontSize);
    doc.setFont("helvetica", "normal");
    const textWidth = doc.getTextWidth(text);
    doc.text(text, pageWidth - margin - 1 - textWidth, y); // -1 padding from frame
  };

  const leftRightText = (left: string, right: string, fontSize: number, leftBold = false, rightBold = false) => {
    doc.setFontSize(fontSize);
    doc.setFont("helvetica", leftBold ? "bold" : "normal");
    doc.text(left, margin + 1, y);

    doc.setFont("helvetica", rightBold ? "bold" : "normal");
    const rightWidth = doc.getTextWidth(right);
    doc.text(right, pageWidth - margin - 1 - rightWidth, y);
    y += fontSize > 8 ? lineHeight : smallLineHeight;
  };

  const drawDashedLine = () => {
    doc.setFontSize(6);
    doc.setFont("helvetica", "normal");
    const dashes = "- ".repeat(25);
    const textWidth = doc.getTextWidth(dashes);
    doc.text(dashes, (pageWidth - textWidth) / 2, y);
    y += smallLineHeight;
  };

  const formatCurrency = (amount: number): string => {
    return `RM ${amount.toFixed(2)}`;
  };

  // === RECEIPT CONTENT ===

  // 1. Business Header
  y += 2;
  centerText(data.businessName.toUpperCase(), 9, true);
  y += 1;

  if (data.businessAddress) {
    // Split long address into lines
    doc.setFontSize(6);
    const addressLines = doc.splitTextToSize(data.businessAddress, contentWidth - 2);
    addressLines.forEach((line: string) => {
      centerText(line, 6);
    });
  }

  centerText(`Tel: ${data.businessPhone}`, 6);
  y += 2;

  // 2. Receipt Title & Info
  drawDashedLine();
  centerText("RESIT JUALAN", 8, true);
  // centerText("SALES RECEIPT", 5); // Optional: reduce height

  y += 1;
  const dateStr = format(data.date, "dd/MM/yyyy");
  const timeStr = format(data.date, "HH:mm");

  leftRightText("No:", data.receiptNo, 7);
  leftRightText("Tarikh:", `${dateStr} ${timeStr}`, 7);

  if (data.customerName) {
    y += 1;
    doc.setFontSize(7);
    doc.setFont("helvetica", "normal");
    doc.text("Pelanggan:", margin + 1, y);
    y += smallLineHeight;
    doc.setFont("helvetica", "bold");
    doc.text(data.customerName, margin + 1, y);
    y += smallLineHeight + 1;
  } else {
    y += 2;
  }

  // 3. Items Header
  drawDashedLine();
  doc.setFontSize(6);
  doc.setFont("helvetica", "bold");
  doc.text("BUTIRAN", margin + 1, y);
  const totalLabelWidth = doc.getTextWidth("JUMLAH");
  doc.text("JUMLAH", pageWidth - margin - 1 - totalLabelWidth, y);
  y += smallLineHeight;
  drawDashedLine();

  // 4. Items List
  data.items.forEach((item) => {
    // Item name (may wrap)
    doc.setFontSize(7);
    doc.setFont("helvetica", "normal");

    const itemLabel = item.itemType === 'product' ? '[P] ' : '';
    const itemName = `${itemLabel}${item.name}`;

    // Calculate space for price column (approx 15mm)
    const maxNameWidth = contentWidth - 15;
    const nameLines = doc.splitTextToSize(itemName, maxNameWidth);

    // Print first line with price
    doc.text(nameLines[0], margin + 1, y);

    const priceText = formatCurrency(item.total);
    doc.setFont("helvetica", "bold");
    const priceWidth = doc.getTextWidth(priceText);
    doc.text(priceText, pageWidth - margin - 1 - priceWidth, y);
    y += smallLineHeight;

    // Additional lines for long names
    if (nameLines.length > 1) {
      doc.setFont("helvetica", "normal");
      for (let i = 1; i < nameLines.length; i++) {
        doc.text(nameLines[i], margin + 1, y);
        y += smallLineHeight;
      }
    }

    // Quantity and unit price details
    doc.setFontSize(6);
    doc.setTextColor(80); // Gray text

    // Show original price crossed out if promo applied
    if (item.originalPrice && item.originalPrice > item.price) {
      const origText = `Harga Asal: ${formatCurrency(item.originalPrice)}`;
      doc.setFont("helvetica", "normal");
      doc.text(origText, margin + 1, y);
      // Draw strikethrough line
      const origWidth = doc.getTextWidth(origText);
      const strikeY = y - 0.8;
      doc.setLineWidth(0.15);
      doc.line(margin + 1, strikeY, margin + 1 + origWidth, strikeY);
      y += smallLineHeight;
    }

    let detailText = `${item.quantity} x ${formatCurrency(item.price)}`;
    if (item.staffName) {
      detailText += ` (${item.staffName})`;
    }
    // Add promo description if active (New line)
    if (item.promoDescription) {
      doc.text(detailText, margin + 1, y);
      y += smallLineHeight;

      doc.setFont("helvetica", "italic");
      doc.setFontSize(5);
      const promoText = `(Promo: ${item.promoDescription})`;
      const promoLines = doc.splitTextToSize(promoText, contentWidth - 2);
      promoLines.forEach((line: string) => {
        doc.text(line, margin + 1, y);
        y += smallLineHeight;
      });
      doc.setFont("helvetica", "normal");
    } else {
      doc.text(detailText, margin + 1, y);
    }
    doc.setTextColor(0); // Reset black
    y += smallLineHeight + 2; // Extra spacing between items
  });

  y += 1;
  drawDashedLine();

  // 5. Totals
  y += 1;
  leftRightText("Jumlah Kecil:", formatCurrency(data.subtotal), 7);

  if (data.pointsDiscount > 0) {
    leftRightText(`Mata (${data.pointsRedeemed}):`, `-${formatCurrency(data.pointsDiscount)}`, 7);
  }

  if (data.depositDeducted > 0) {
    leftRightText("Deposit:", `-${formatCurrency(data.depositDeducted)}`, 7);
  }

  y += 1;
  // Grand Total Box
  doc.setDrawColor(0);
  doc.setLineWidth(0.1);
  // doc.rect(margin, y - 1, contentWidth, 7); // Optional box around total

  doc.setFontSize(10);
  doc.setFont("helvetica", "bold");
  // Cleaned up overlapping text issue
  doc.text("JUMLAH BESAR", margin + 1, y + 4);

  const finalTotal = formatCurrency(data.total);
  const finalTotalWidth = doc.getTextWidth(finalTotal);
  doc.text(finalTotal, pageWidth - margin - 1 - finalTotalWidth, y + 4);
  y += 9;

  drawDashedLine();

  // 6. Payment Info
  y += 1;
  leftRightText("Kaedah Bayaran:", data.paymentMethod.toUpperCase(), 7);

  if (data.cashReceived && data.cashReceived > data.total) {
    leftRightText("Tunai Diterima:", formatCurrency(data.cashReceived), 7);
    leftRightText("Baki:", formatCurrency(data.change || 0), 7, false, true);
  }

  // 7. Points Earned
  if (data.pointsEarned > 0 && data.customerName) {
    y += 3;
    doc.setLineWidth(0.1);
    doc.setLineDash([1, 1], 0);
    doc.rect(margin + 4, y, contentWidth - 8, 8);
    y += 5;
    centerText(`+${data.pointsEarned} Mata Ganjaran`, 7, true);
    doc.setLineDash([], 0); // Reset dash
    y += 4;
  }

  // 8. WhatsApp QR Code
  if (data.businessPhone && data.businessPhone !== "-") {
    const qrDataUrl = await generateWhatsAppQR(data.businessPhone);
    if (qrDataUrl) {
      y += 3;
      const qrSize = 18; // mm
      const qrX = (pageWidth - qrSize) / 2;
      doc.addImage(qrDataUrl, "PNG", qrX, y, qrSize, qrSize);
      y += qrSize + 2;
      centerText("Scan Untuk WhatsApp Kami", 6, true);
      y += 1;
    }
  }

  // 9. Footer
  y += 4;
  centerText("Terima Kasih!", 8, true);
  centerText("Sila Datang Lagi", 6);

  y += 4;
  // Timestamp footer
  doc.setFontSize(5);
  doc.setTextColor(150);
  centerText(`${format(new Date(), "dd/MM/yyyy HH:mm:ss")}`, 5);

  // ADD FRAME
  // Finally, draw the frame around the entire used content area
  // We use the current 'y' to determine height
  const frameHeight = y + 3; // + padding bottom

  // Re-init doc if one page is enough (usually is for thermal receipts)
  // Actually jsPDF adds pages automatically if we overflow, but for thermal we want one long page.
  // The initial estimatedHeight might be too short or too long. 
  // There isn't a perfect way to resize a page in jsPDF after content creation easily without plugins.
  // However, we can just draw the rect on the pages that exist.

  // Assuming single page for thermal receipt usually
  doc.setLineWidth(0.3);
  doc.setDrawColor(0);
  doc.rect(margin, 2, contentWidth, frameHeight - 4); // x, y, w, h

  // Decorative corners (inner)
  const cornerSize = 2;
  const innerMargin = margin + 1.5;
  const innerW = contentWidth - 3;
  const innerH = frameHeight - 7;
  const topY = 3.5;

  // Small aesthetic inner corners
  doc.setLineWidth(0.1);
  // Top-Left
  doc.line(innerMargin, topY + cornerSize, innerMargin, topY);
  doc.line(innerMargin, topY, innerMargin + cornerSize, topY);
  // Top-Right
  doc.line(innerMargin + innerW - cornerSize, topY, innerMargin + innerW, topY);
  doc.line(innerMargin + innerW, topY, innerMargin + innerW, topY + cornerSize);
  // Bottom-Left
  doc.line(innerMargin, topY + innerH - cornerSize, innerMargin, topY + innerH);
  doc.line(innerMargin, topY + innerH, innerMargin + cornerSize, topY + innerH);
  // Bottom-Right
  doc.line(innerMargin + innerW - cornerSize, topY + innerH, innerMargin + innerW, topY + innerH);
  doc.line(innerMargin + innerW, topY + innerH, innerMargin + innerW, topY + innerH - cornerSize);


  return doc;
}

/**
 * Download receipt as PDF
 */
export async function downloadReceipt(data: ReceiptData): Promise<void> {
  const doc = await generateReceipt(data);
  const filename = `resit-${data.receiptNo}-${format(data.date, "yyyyMMdd-HHmm")}.pdf`;
  doc.save(filename);
}

/**
 * Open receipt in new window for printing
 */
export async function printReceipt(data: ReceiptData): Promise<void> {
  const doc = await generateReceipt(data);
  const pdfBlob = doc.output("blob");
  const pdfUrl = URL.createObjectURL(pdfBlob);
  window.open(pdfUrl, "_blank");
}

/**
 * Generate WhatsApp formatted receipt text (plain text)
 */
export function generateWhatsAppReceipt(data: ReceiptData): string {
  const itemsList = data.items.map(item => {
    let line = `• ${item.name} x${item.quantity} - RM${item.total.toFixed(2)}`;
    if (item.originalPrice && item.originalPrice > item.price) {
      line += `\n  ~Harga Asal: RM${(item.originalPrice * item.quantity).toFixed(2)}~ → RM${item.total.toFixed(2)}`;
    }
    if (item.promoDescription) {
      line += `\n  (Promosi: ${item.promoDescription})`;
    }
    return line;
  }).join('\n');

  const totalSection = [
    `Jumlah: RM${data.total.toFixed(2)}`,
    data.pointsDiscount > 0 ? `Diskaun Mata: -RM${data.pointsDiscount.toFixed(2)}` : '',
    data.depositDeducted > 0 ? `Deposit: -RM${data.depositDeducted.toFixed(2)}` : '',
    `Bayaran: ${data.paymentMethod.toUpperCase()}`
  ].filter(Boolean).join('\n');

  const footerLinks = [
    data.bookingUrl ? `\n📅 *Buat Temujanji Seterusnya:*\n${data.bookingUrl}` : '',
    data.googleReviewUrl ? `\n⭐ *Review Kami di Google:*\n${data.googleReviewUrl}` : '',
  ].filter(Boolean).join('\n');

  return `*RESIT PEMBAYARAN - ${data.businessName.toUpperCase()}*
Tarikh: ${format(data.date, "dd/MM/yyyy HH:mm")}
No. Resit: ${data.receiptNo}
--------------------------------
*ITEM:*
${itemsList}
--------------------------------
${totalSection}

*Terima kasih kerana memilih ${data.businessName}!* 🙏
Kami menghargai sokongan anda.${footerLinks}`;
}
