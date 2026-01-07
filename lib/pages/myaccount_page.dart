import 'package:flutter/material.dart';
import 'package:toklna/pages/login_page.dart';
import 'package:toklna/services/user_data_service.dart';
import 'package:toklna/widgets/edit_user_data_dialog.dart';
import 'package:toklna/widgets/pdf_settings_dialog.dart';

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
                    _buildTile(
                      "إعدادات PDF",
                      Icons.picture_as_pdf_outlined,
                      onTap: () => PdfSettingsDialog.show(context),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  title: "حول التطبيق",
                  items: [
                    _buildTile("شركاء النجاح", Icons.handshake_outlined),
                    _buildTile("الأسئلة الشائعة", Icons.help_outline),
                    _buildTile("سياسة استخدام الموقع", Icons.article_outlined),
                    _buildTile(
                      "تواصل معنا",
                      Icons.mail_outline,
                      onTap: () => EditUserDataDialog.show(context),
                    ),
                  ],
                ),

                const SizedBox(height: 32),
                Image.asset(
                  'assets/brand.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Logout and clear login state
                      await UserDataService.logout();
                      // Navigate to login page and remove all previous routes
                      if (context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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

  Widget _buildTile(String text, IconData icon, {VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon),
          title: Text(text),
          trailing: const Icon(Icons.keyboard_arrow_down),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
