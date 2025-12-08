import 'package:flutter/material.dart';

/// Data model representing a vaccination dose entry
class Dose {
  final String doseNumber; // e.g., "First Dose"
  final String vaccineType; // e.g., "Pfizer-BionTech (COMIRNAT®)"
  final String date; // e.g., "2021-10-05"
  final String batchNumber; // e.g., "FG3526"

  Dose({
    required this.doseNumber,
    required this.vaccineType,
    required this.date,
    required this.batchNumber,
  });
}

/// Main certificate data model
class VaccinationCertificate {
  // Personal Information
  final String idNo;
  final String passportNo;
  final String nameArabic;
  final String nameEnglish;
  final String dateOfBirth;
  final String nationality;
  final String bloodType;
  final String insuranceStatus;

  // Vaccination doses
  final List<Dose> doses;

  // PCR / Testing
  final String latestPcrResult;
  final String pcrDate;

  // Footer / metadata
  final String reportTimeAndDate;
  final String pageNumber;

  VaccinationCertificate({
    required this.idNo,
    required this.passportNo,
    required this.nameArabic,
    required this.nameEnglish,
    required this.dateOfBirth,
    required this.nationality,
    required this.bloodType,
    required this.insuranceStatus,
    required this.doses,
    this.latestPcrResult = '',
    this.pcrDate = '',
    this.reportTimeAndDate = '',
    this.pageNumber = '',
  });

  /// Example factory for quick preview/testing
  factory VaccinationCertificate.example() => VaccinationCertificate(
    idNo: '2501502154',
    passportNo: 'P12345678',
    nameArabic: 'خليفة هود سالم المهري',
    nameEnglish: 'KHAIFAH HOOD SALEM ALMAHRI',
    dateOfBirth: '1997/11/01',
    nationality: 'Saudi',
    bloodType: 'O+',
    insuranceStatus: 'Insured',
    doses: [
      Dose(
        doseNumber: 'First Dose',
        vaccineType: 'Pfizer-BionTech (COMIRNAT®)',
        date: '2021-05-10',
        batchNumber: 'FG3526',
      ),
      Dose(
        doseNumber: 'Second Dose',
        vaccineType: 'Pfizer-BionTech (COMIRNAT®)',
        date: '2021-06-10',
        batchNumber: '130521',
      ),
      Dose(
        doseNumber: 'First Booster Dose',
        vaccineType: 'Moderna (SPIKEVAX®)',
        date: '2022-02-12',
        batchNumber: '072K21A',
      ),
    ],
    latestPcrResult: '',
    pcrDate: '',
    reportTimeAndDate: '6:11 PM Saturday, October 19, 2024',
    pageNumber: 'صفحة 1 - 1',
  );
}

/// A card widget that renders a bilingual (EN/AR) vaccination certificate.
class TawakkalnaCertificateCard extends StatelessWidget {
  final VaccinationCertificate certificate;
  final double width; // optional width to constrain the card

  const TawakkalnaCertificateCard({
    super.key,
    required this.certificate,
    this.width = 420,
  });

  Widget _buildInfoRow(String labelEn, String labelAr, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // English label and value (left)
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelEn,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Arabic label and value (right)
          Expanded(
            flex: 1,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    labelAr,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoseCard(Dose d) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                d.doseNumber,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(d.date, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 6),
          Text(d.vaccineType, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.confirmation_num_outlined,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              Text(
                'Batch: ${d.batchNumber}',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = certificate;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Vaccination Certificate',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('شهادة التطعيم', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    // small logo placeholder
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.medical_services,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),

                const Divider(height: 24),

                // Personal info section
                _buildInfoRow('ID No.', 'رقم الهوية', c.idNo),
                _buildInfoRow('Passport No.', 'رقم جواز السفر', c.passportNo),
                _buildInfoRow('Name (AR)', 'الإسم', c.nameArabic),
                _buildInfoRow('Name (EN)', 'Name', c.nameEnglish),
                _buildInfoRow('Date of Birth', 'تاريخ الميلاد', c.dateOfBirth),
                _buildInfoRow('Nationality', 'الجنسية', c.nationality),
                _buildInfoRow('Blood Type', 'فصيلة الدم', c.bloodType),
                _buildInfoRow('Insurance', 'حالة التأمين', c.insuranceStatus),

                const Divider(height: 24),

                // Vaccination history
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Vaccination History',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),

                // list doses
                Column(
                  children: c.doses.map((d) => _buildDoseCard(d)).toList(),
                ),

                const Divider(height: 24),

                // PCR / footer
                _buildInfoRow(
                  'Last PCR Result',
                  'نتيجة آخر فحص كورونا',
                  c.latestPcrResult.isEmpty ? '-' : c.latestPcrResult,
                ),
                _buildInfoRow(
                  'PCR Date',
                  'تاريخ الفحص',
                  c.pcrDate.isEmpty ? '-' : c.pcrDate,
                ),

                const SizedBox(height: 12),

                // QR and validation text
                Row(
                  children: [
                    // QR placeholder
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade200,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.qr_code,
                          size: 48,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'امسح رمز الاستجابة السريعة للتحقق الإلكتروني',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Scan the QR code for electronic validation',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Footer meta
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      c.reportTimeAndDate,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        c.pageNumber,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
