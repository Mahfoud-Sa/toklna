import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F5F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "إعدادات الحساب",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),

        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/pattern.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildSection(
                  title: "إعدادات الحساب",
                  items: [
                    _buildTile("اللغة", Icons.language),
                    _buildTile("تحديث رقم الجوال", Icons.phone_android),
                    _buildTile("تغيير كلمة المرور", Icons.lock_outline),
                    _buildTile("تحديث موقع السكن", Icons.home_outlined),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  title: "حول التطبيق",
                  items: [
                    _buildTile("شركاء النجاح", Icons.handshake_outlined),
                    _buildTile("الأسئلة الشائعة", Icons.help_outline),
                    _buildTile("سياسة استخدام الموقع", Icons.article_outlined),
                    _buildTile("تواصل معنا", Icons.mail_outline),
                  ],
                ),

                const SizedBox(height: 32),
                Image.asset(
                  'assets/brand.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helpers
  Widget _buildSection({required String title, required List<Widget> items}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          ...items,
        ],
      ),
    );
  }

  Widget _buildTile(String text, IconData icon) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon),
          title: Text(text),
          trailing: const Icon(Icons.keyboard_arrow_down),
        ),
        const Divider(),
      ],
    );
  }
}
