import 'package:flutter/material.dart';
import 'package:toklna/pages/health_status_page.dart';
import 'package:toklna/pages/services_page.dart';
import 'package:toklna/services/pdf_date_service.dart';

// Main widget for the health passport page
class HealthPassportPage extends StatelessWidget {
  final String? userImage; // User image path from assets or file

  const HealthPassportPage({super.key, this.userImage});

  @override
  Widget build(BuildContext context) {
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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            // Add navigation back logic here
          },
        ),
        centerTitle: true,
        title: const Text(
          'الجواز الصحي', // "Health Passport" in Arabic
          style: TextStyle(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            // Top section with gradient background and profile info
            Stack(
              clipBehavior: Clip.none, // Allow the white card to overlap
              alignment: Alignment.topCenter,
              children: [
                // Gradient background container
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
                        // Left side - Icons and text
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _buildCircularIcon(
                                  Icons.qr_code,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const HealthStatusPage(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 10),
                                _buildCircularIcon(Icons.translate),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'خليفة هود سالم المهري',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Right side - Profile picture (centered vertically)
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 42,
                            backgroundImage: AssetImage(
                              'assets/user_photo.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // The white card with personal information
                Container(
                  margin: const EdgeInsets.only(top: 150, left: 15, right: 15),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .end, // Align text to the right for Arabic
                    children: [
                      // Last update text
                      const Center(
                        child: Text(
                          'آخر تحديث: الأربعاء 10 ديسمبر 11:01 ص', // "Last update: Wednesday 10 December 11:01 AM"
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Personal Information Section Title
                      const Text(
                        'المعلومات الشخصية', // "Personal Information"
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Personal Information Rows
                      _buildInfoRow('الجنسية', 'حصن ن'), // "Nationality"
                      _buildInfoRow('رقم الهوية', '2501502154'), // "ID Number"
                      _buildInfoRow(
                        'مكان الاصدار',
                        'وكالة الأمارة للشرون الأمنية',
                      ), // "Place of Issue"
                      _buildInfoRow(
                        'تاريخ الاصدار',
                        '1442/05/28',
                      ), // "Issue Date"
                      _buildInfoRow(
                        'تاريخ الميلاد',
                        '1997/11/01',
                      ), // "Date of Birth"
                      _buildInfoRow('المهنة', 'عامل'), // "Profession"
                      _buildInfoRow('الديانة', 'الاسلام'), // "Religion"
                      _buildInfoRow(
                        'صاحب العمل',
                        'عيسى بن عمرون بن سليمان المهري',
                      ), // "Employer"
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 15),
                      // Health Information Section Title
                      const Text(
                        'المعلومات الصحية', // "Health Information"
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'تفاصيل لقاح كورونا', // "Corona Vaccine Details"
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 15),
                      // Vaccine Doses Information
                      _buildVaccineInfoRow(
                        'الجرعة الأولى',
                        '2021/06/30',
                        'فايزر-بيونتيك',
                      ), // "First Dose", Date, Vaccine Name
                      const SizedBox(height: 10),
                      _buildVaccineInfoRow(
                        'الجرعة الثانية',
                        '2021/07/21',
                        'فايزر-بيونتيك',
                      ), // "Second Dose", Date, Vaccine Name
                      const SizedBox(height: 20),
                      const Divider(thickness: 1, color: Color(0xFFEEEEEE)),
                      const SizedBox(height: 20),
                      // 1. PCR Test Result Section
                      Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.analytics_outlined,
                              size: 50,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'نتيجة فحص كورونا PCR غير متوفرة',
                              style: TextStyle(
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
                      // 2. Travel Medical Insurance Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'التأمين طبي للسفر',
                            style: TextStyle(
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
                                const Text(
                                  'حالتك الصحية لا تتطلب تأمين طبي للسفر',
                                  style: TextStyle(
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Extra space at the bottom

            const SizedBox(height: 40),

            // 3. Download Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF009688,
                  ), // The specific Teal color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                onPressed: () async {
                  try {
                    // Use the new PDF service to add date and get file path
                    final filePath = await PdfDateService.generatePdfWithDate();
                    // Navigate to in-app PDF viewer
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PdfViewerPage(path: filePath),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to open PDF: $e')),
                    );
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.picture_as_pdf, color: Colors.white, size: 28),
                    SizedBox(width: 10),
                    Text(
                      'تحميل الجواز الصحي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --- END OF NEW SECTION ---
          ],
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
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  // Helper widget for a single row of personal information
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }

  // Helper widget for vaccine information rows
  Widget _buildVaccineInfoRow(String dose, String date, String vaccine) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              dose,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              vaccine,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            // You can add more details here like lot number if needed
          ],
        ),
      ],
    );
  }
}
