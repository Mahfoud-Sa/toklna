import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:toklna/widgets/tawakkalna_certificate.dart';

/// Generates a PDF bytes for the given [certificate].
Future<Uint8List> generateCertificatePdf(
  VaccinationCertificate certificate,
) async {
  final doc = pw.Document();

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(24),
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Vaccination Certificate',
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text('شهادة التطعيم', style: pw.TextStyle(fontSize: 14)),
                  ],
                ),
                pw.Container(
                  width: 56,
                  height: 56,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey300,
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Center(
                    child: pw.Icon(
                      pw.IconData(0xe3af),
                      size: 28,
                      color: PdfColors.teal,
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 12),
            pw.Divider(),

            // Personal info table (two columns)
            pw.Table(
              columnWidths: {
                0: pw.FlexColumnWidth(1),
                1: pw.FlexColumnWidth(1),
              },
              children: [
                _infoRow('ID No.', 'رقم الهوية', certificate.idNo),
                _infoRow(
                  'Passport No.',
                  'رقم جواز السفر',
                  certificate.passportNo,
                ),
                _infoRow('Name (AR)', 'الإسم', certificate.nameArabic),
                _infoRow('Name (EN)', 'Name', certificate.nameEnglish),
                _infoRow(
                  'Date of Birth',
                  'تاريخ الميلاد',
                  certificate.dateOfBirth,
                ),
                _infoRow('Nationality', 'الجنسية', certificate.nationality),
                _infoRow('Blood Type', 'فصيلة الدم', certificate.bloodType),
                _infoRow(
                  'Insurance',
                  'حالة التأمين',
                  certificate.insuranceStatus,
                ),
              ],
            ),

            pw.SizedBox(height: 12),
            pw.Divider(),

            pw.Text(
              'Vaccination History',
              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 8),

            // Doses
            pw.Column(
              children: certificate.doses.map((d) {
                return pw.Container(
                  margin: pw.EdgeInsets.symmetric(vertical: 6),
                  padding: pw.EdgeInsets.all(10),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey100,
                    borderRadius: pw.BorderRadius.circular(6),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            d.doseNumber,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          pw.Text(
                            d.date,
                            style: pw.TextStyle(color: PdfColors.grey700),
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 6),
                      pw.Text(d.vaccineType),
                      pw.SizedBox(height: 6),
                      pw.Row(
                        children: [
                          pw.Icon(
                            pw.IconData(0xe1b9),
                            size: 10,
                            color: PdfColors.grey700,
                          ),
                          pw.SizedBox(width: 6),
                          pw.Text(
                            'Batch: ${d.batchNumber}',
                            style: pw.TextStyle(color: PdfColors.grey700),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            pw.SizedBox(height: 12),
            pw.Divider(),

            pw.SizedBox(height: 8),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // QR placeholder
                pw.Container(
                  width: 100,
                  height: 100,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey200,
                    borderRadius: pw.BorderRadius.circular(6),
                  ),
                  child: pw.Center(child: pw.Text('QR')),
                ),
                pw.SizedBox(width: 12),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'امسح رمز الاستجابة السريعة للتحقق الإلكتروني',
                        textAlign: pw.TextAlign.right,
                      ),
                      pw.SizedBox(height: 8),
                      pw.Text(
                        'Scan the QR code for electronic validation',
                        style: pw.TextStyle(color: PdfColors.grey700),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            pw.Spacer(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  certificate.reportTimeAndDate,
                  style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
                ),
                pw.Text(
                  certificate.pageNumber,
                  style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  return doc.save();
}

pw.TableRow _infoRow(String en, String ar, String value) {
  return pw.TableRow(
    children: [
      pw.Padding(
        padding: pw.EdgeInsets.symmetric(vertical: 6),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              en,
              style: pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              value,
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
          ],
        ),
      ),
      pw.Padding(
        padding: pw.EdgeInsets.symmetric(vertical: 6),
        child: pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text(
                ar,
                style: pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                value,
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

/// Helper to create and open the PDF using `printing` package
Future<void> generateAndOpenCertificatePdf(
  VaccinationCertificate certificate, {
  String filename = 'certificate.pdf',
}) async {
  final bytes = await generateCertificatePdf(certificate);
  try {
    await Printing.layoutPdf(onLayout: (_) async => bytes, name: filename);
  } on MissingPluginException catch (e) {
    // Happens when the native plugin isn't registered (app not fully rebuilt,
    // running in unsupported platform, or plugin not added). Provide a clear
    // log message and rethrow so callers can handle it if needed.
    // Common fix: stop the app, run `flutter clean` && `flutter pub get`,
    // then a full `flutter run` (not hot reload).
    print('MissingPluginException while trying to open PDF: $e');
    print(
      'If you just added the `printing` plugin, stop the app and run a full rebuild:',
    );
    print('  flutter clean; flutter pub get; flutter run');
    rethrow;
  }
}
