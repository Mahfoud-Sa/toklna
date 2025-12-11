import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

/// Service for generating and modifying PDF files
class PdfDateService {
  /// Loads the certificate PDF from assets, adds today's date,
  /// saves the modified PDF, and returns the file path.
  static Future<String> generatePdfWithDate() async {
    // 1. Load PDF from assets
    final ByteData data = await rootBundle.load('assets/certificate.pdf');
    final Uint8List bytes = data.buffer.asUint8List();

    // 2. Load the existing PDF document
    final PdfDocument document = PdfDocument(inputBytes: bytes);

    // 3. Get the LAST page
    final PdfPage page = document.pages[document.pages.count - 1];

    // 4. Get page height to calculate vertical center position
    final double pageHeight = page.getClientSize().height;

    // 5. Get today's date and time formatted
    final DateTime now = DateTime.now();
    final String timeString = DateFormat(
      'h:mm a',
    ).format(now); // e.g., "6:50 PM"
    final String dateString = DateFormat(
      'EEEE, MMMM d, yyyy',
    ).format(now); // e.g., "Friday, January 5, 2024"

    // 6. Add date/time text left-aligned, near the bottom
    const double textWidth = 200;
    const double lineHeight = 14;
    const double leftMargin = 20;
    const double bottomMargin = 175; // Distance from bottom
    final double yPosition = pageHeight - bottomMargin;

    // Gray color brush
    final PdfBrush grayBrush = PdfSolidBrush(PdfColor(128, 128, 128));

    // Draw time on first line (smaller font, left-aligned, gray)
    page.graphics.drawString(
      timeString,
      PdfStandardFont(PdfFontFamily.helvetica, 9),
      bounds: Rect.fromLTWH(leftMargin, yPosition, textWidth, lineHeight),
      brush: grayBrush,
    );

    // Draw date on second line (smaller font, left-aligned, gray)
    page.graphics.drawString(
      dateString,
      PdfStandardFont(PdfFontFamily.helvetica, 9),
      bounds: Rect.fromLTWH(
        leftMargin,
        yPosition + lineHeight,
        textWidth,
        lineHeight,
      ),
      brush: grayBrush,
    );

    // 6. Save the modified PDF to bytes
    final List<int> modifiedBytes = await document.save();
    document.dispose();

    // 7. Get the temporary directory and save the file
    final Directory tempDir = await getTemporaryDirectory();
    final String filePath = '${tempDir.path}/certificate_with_date.pdf';
    final File file = File(filePath);
    await file.writeAsBytes(modifiedBytes);

    // 8. Return the file path for navigation
    return filePath;
  }
}
