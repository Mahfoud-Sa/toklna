import 'package:flutter/material.dart';

/// ServicesPage
///
/// A single, clean implementation of the Services page. This file previously
/// contained multiple duplicate class definitions and even an embedded
/// `main()`/app scaffold. Those duplicates have been removed so other parts
/// of the app (like `main.dart` / `home_page.dart`) can own the app entrypoint
/// and navigation.
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'الخدمات',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildSectionHeader('العامة'),
            _buildServiceItem(
              icon: Icons.verified,
              title: 'رمز توكلنا',
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('خدمات التصاريح'),
            _buildServiceItem(
              icon: Icons.person,
              title: 'التصاريح الشخصية',
              color: Colors.green,
            ),
            _buildServiceItem(
              icon: Icons.health_and_safety,
              title: 'تصاريح التحقق الآلي للحالة الصحية',
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('الصحة'),
            _buildServiceItem(
              icon: Icons.local_hospital,
              title: 'لقاح كورونا',
              color: Colors.red,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('خدمات السفر'),
            _buildServiceItem(
              icon: Icons.airplanemode_active,
              title: 'الجواز الصحي',
              color: Colors.purple,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('أفراد الأسرة'),
            _buildServiceItem(
              icon: Icons.family_restroom,
              title: 'رعاية أفراد الأسرة',
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('الرقمية'),
            _buildServiceItem(
              icon: Icons.dashboard,
              title: 'لوحة البيانات',
              color: Colors.teal,
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

  Widget _buildServiceItem({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle service item tap
        },
      ),
    );
  }
}
