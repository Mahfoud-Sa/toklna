import 'dart:math';
import 'package:flutter/material.dart';
import 'package:toklna/data.dart';
import 'package:toklna/l10n/app_localizations.dart';
import 'package:toklna/main.dart';
import 'package:toklna/pages/services_page.dart';
import 'package:toklna/services/pdf_date_service.dart';

// Main widget for the health passport page
class HealthPassportPage extends StatefulWidget {
  final String? userImage; // User image path from assets or file

  const HealthPassportPage({super.key, this.userImage});

  @override
  State<HealthPassportPage> createState() => _HealthPassportPageState();
}

class _HealthPassportPageState extends State<HealthPassportPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    // Using a Scaffold for basic page layout with an AppBar
    return Scaffold(
      backgroundColor: const Color(
        0xFFF7F7F7,
      ), // Light grey background for the whole page
      appBar: AppBar(
        backgroundColor: const Color(
          0xFF009688,
        ), // Teal green color for the app bar
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(
            isArabic ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          l10n.healthPassport,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Add menu action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Fixed header container - always visible
          const SizedBox(height: 10),
          Container(
            height: 180,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/red_s.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            // Content inside the gradient header
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage(Data.personalImage),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Left side - Icons and text
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildCircularIcon(
                              Icons.qr_code,
                              onTap: () {
                                _showBarcodeDialog();
                              },
                            ),
                            const SizedBox(width: 10),
                            _buildCircularIcon(
                              Icons.translate,
                              onTap: () {
                                appLocale.value =
                                    appLocale.value.languageCode == 'ar'
                                    ? const Locale('en')
                                    : const Locale('ar');
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          isArabic ? Data.userName : Data.userNameEn,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),

                  // Right side - Profile picture (centered vertically)
                ],
              ),
            ),
          ),
          // White card that overlaps header - stays fixed with scrollable content inside
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -15),
              child: Container(
                margin: const EdgeInsets.only(top: 0, left: 15, right: 15),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: isArabic
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      // Last update text
                      Center(
                        child: Builder(
                          builder: (context) {
                            final now = DateTime.now();
                            if (isArabic) {
                              final arabicDays = [
                                'الإثنين',
                                'الثلاثاء',
                                'الأربعاء',
                                'الخميس',
                                'الجمعة',
                                'السبت',
                                'الأحد',
                              ];
                              final arabicMonths = [
                                'يناير',
                                'فبراير',
                                'مارس',
                                'أبريل',
                                'مايو',
                                'يونيو',
                                'يوليو',
                                'أغسطس',
                                'سبتمبر',
                                'أكتوبر',
                                'نوفمبر',
                                'ديسمبر',
                              ];
                              final dayName = arabicDays[now.weekday - 1];
                              final monthName = arabicMonths[now.month - 1];
                              final hour = now.hour > 12
                                  ? now.hour - 12
                                  : (now.hour == 0 ? 12 : now.hour);
                              final period = now.hour >= 12 ? 'م' : 'ص';
                              return Text(
                                '${l10n.lastUpdate}: $dayName ${now.day} $monthName $hour:${now.minute.toString().padLeft(2, '0')} $period',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              );
                            } else {
                              final englishDays = [
                                'Monday',
                                'Tuesday',
                                'Wednesday',
                                'Thursday',
                                'Friday',
                                'Saturday',
                                'Sunday',
                              ];
                              final englishMonths = [
                                'January',
                                'February',
                                'March',
                                'April',
                                'May',
                                'June',
                                'July',
                                'August',
                                'September',
                                'October',
                                'November',
                                'December',
                              ];
                              final dayName = englishDays[now.weekday - 1];
                              final monthName = englishMonths[now.month - 1];
                              final hour = now.hour > 12
                                  ? now.hour - 12
                                  : (now.hour == 0 ? 12 : now.hour);
                              final period = now.hour >= 12 ? 'PM' : 'AM';
                              return Text(
                                '${l10n.lastUpdate}: $dayName ${now.day} $monthName $hour:${now.minute.toString().padLeft(2, '0')} $period',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Personal Information Section Title
                      Text(
                        l10n.personalInformation,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Personal Information Rows
                      _buildInfoRow(
                        l10n.nationality,
                        isArabic ? '1 حصر ن' : '1 HSR N',
                        isArabic,
                      ),
                      _buildInfoRow(
                        l10n.idNumber,
                        Data.passportNumber,
                        isArabic,
                      ),
                      _buildInfoRow(
                        l10n.issuePlace,
                        isArabic ? 'وكالة الأمارة للشوؤن الأمنية' : 'EA for SA',
                        isArabic,
                      ),
                      _buildInfoRow(l10n.issueDate, Data.startDate, isArabic),
                      _buildInfoRow(l10n.birthDate, Data.birthDate, isArabic),
                      _buildInfoRow(
                        l10n.profession,
                        isArabic ? 'عامل' : 'Worker',
                        isArabic,
                      ),
                      _buildInfoRow(
                        l10n.religion,
                        isArabic ? 'الاسلام' : 'Islam',
                        isArabic,
                      ),
                      _buildInfoRow(
                        l10n.employer,
                        isArabic ? Data.workOwnerName : Data.workOwnerNameEn,
                        isArabic,
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 15),
                      // Health Information Section Title
                      Text(
                        l10n.healthInformation,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        l10n.vaccineDetails,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Vaccine Doses Information
                      _buildVaccineInfoRow(
                        l10n.firstDose,
                        Data.firstDoseDate,
                        isArabic ? 'فايزر-بيونتيك' : 'Pfizer-BioNTech',
                        isArabic,
                      ),
                      const SizedBox(height: 10),
                      _buildVaccineInfoRow(
                        l10n.secondDose,
                        Data.secondDoseDate,
                        isArabic ? 'فايزر-بيونتيك' : 'Pfizer-BioNTech',
                        isArabic,
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 1, color: Color(0xFFEEEEEE)),
                      const SizedBox(height: 20),
                      // PCR Test Result Section
                      Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.analytics_outlined,
                              size: 50,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              l10n.pcrResultNotAvailable,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 1, color: Color(0xFFEEEEEE)),
                      const SizedBox(height: 20),
                      // Travel Medical Insurance Section
                      Column(
                        crossAxisAlignment: isArabic
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.travelInsurance,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.shield_outlined,
                                  size: 60,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  l10n.healthStatusInsuranceNotRequired,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // Download Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF009688),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () async {
                            if (Data.passportFile.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(l10n.uploadPdfMessage)),
                              );
                              return;
                            }
                            try {
                              final filePath =
                                  await PdfDateService.generatePdfWithDate();
                              if (mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        PdfViewerPage(path: filePath),
                                  ),
                                );
                              }
                            } catch (e) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Failed to open PDF: $e'),
                                  ),
                                );
                              }
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.picture_as_pdf,
                                color: Colors.white,
                                size: 28,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                l10n.downloadPassport,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBarcodeDialog() {
    final barcodes = [
      'assets/barcode_1.png',
      'assets/barcode_3.png',
      'assets/barcode_4.png',
      'assets/barcode_5.png',
      'assets/barcode_6.png',
      'assets/qr_code.png',
    ];
    final randomBarcode = barcodes[Random().nextInt(barcodes.length)];

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Barcode / QR Code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(randomBarcode, height: 200, fit: BoxFit.contain),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009688),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for the top circular icons
  Widget _buildCircularIcon(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF009688), size: 20),
      ),
    );
  }

  // Helper widget for a single row of personal information
  Widget _buildInfoRow(String label, String value, bool isArabic) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: isArabic
            ? [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ]
            : [
                Text(
                  label,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
      ),
    );
  }

  // Helper widget for vaccine information rows
  Widget _buildVaccineInfoRow(
    String dose,
    String date,
    String vaccine,
    bool isArabic,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: isArabic
              ? [
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    dose,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ]
              : [
                  Text(
                    dose,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: isArabic
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                vaccine,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
