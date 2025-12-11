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

    // 5. Get today's date formatted
    final String todayDate = DateFormat(
      'yyyy/MM/dd - HH:mm',
    ).format(DateTime.now());

    // 6. Add date text aligned to the left, near the bottom
    const double textWidth = 200;
    const double textHeight = 20;
    const double leftMargin = 20;
    const double bottomMargin = 175; // Distance from bottom
    final double yPosition = pageHeight - bottomMargin;

    page.graphics.drawString(
      todayDate,
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: Rect.fromLTWH(leftMargin, yPosition, textWidth, textHeight),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)), // Black color
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
