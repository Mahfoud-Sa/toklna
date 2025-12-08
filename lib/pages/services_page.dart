import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toklna/utils/pdf_generator.dart';
import 'package:toklna/widgets/tawakkalna_certificate.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'الخدمات',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            _buildSectionHeader('العامة'),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildServiceItem(
                  context,
                  icon: Icons.verified,
                  title: 'رمز توكلنا',
                  color: Colors.blue,
                ),
              ],
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('خدمات التصاريح'),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildServiceItem(
                  context,
                  icon: Icons.person,
                  title: 'التصاريح الشخصية',
                  color: Colors.green,
                ),
                _buildServiceItem(
                  context,
                  icon: Icons.health_and_safety,
                  title: 'تصاريح التحقق الآلي للحالة الصحية',
                  color: Colors.green,
                ),
                _buildServiceItem(
                  context,
                  icon: Icons.health_and_safety,
                  title: 'ماسح كود التحقق',
                  color: Colors.green,
                ),
                _buildServiceItem(
                  context,
                  icon: Icons.health_and_safety,
                  title: 'اصدار تسريح تحقق الي للحالة الصحية',
                  color: Colors.green,
                ),
              ],
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('الصحة'),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildServiceItem(
                  context,
                  icon: Icons.local_hospital,
                  title: 'اسل عن مساعدة',
                  color: Colors.red,
                ),
                _buildServiceItem(
                  context,
                  icon: Icons.local_hospital,
                  title: 'لقاح كورونا',
                  color: Colors.red,
                  onTap: () async {
                    final cert = VaccinationCertificate.example();
                    try {
                      await generateAndOpenCertificatePdf(
                        cert,
                        filename: 'tawakkalna_certificate.pdf',
                      );
                    } on MissingPluginException catch (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'PDF is not available on this platform. Try a full rebuild.',
                          ),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to generate PDF: $e')),
                      );
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('خدمات السفر'),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildServiceItem(
                  context,
                  icon: Icons.airplanemode_active,
                  title: 'الجواز الصحي',
                  color: Colors.purple,
                ),
              ],
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('أفراد الأسرة'),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildServiceItem(
                  context,
                  icon: Icons.family_restroom,
                  title: 'رعاية أفراد الأسرة',
                  color: Colors.orange,
                ),
                _buildServiceItem(
                  context,
                  icon: Icons.family_restroom,
                  title: 'افراد الاسرة والعاملين',
                  color: Colors.orange,
                ),
              ],
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('الرقمية'),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildServiceItem(
                  context,
                  icon: Icons.dashboard,
                  title: 'لوحة البيانات',
                  color: Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildServiceItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    double preferredSize = 110,
    VoidCallback? onTap,
  }) {
    // Use a fixed tile size for consistent appearance
    const double tileSize = 110;

    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: tileSize,
        height: tileSize,
        child: Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/icon_1.jpeg",
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
