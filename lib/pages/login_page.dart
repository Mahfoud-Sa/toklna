import 'package:flutter/material.dart';
import 'package:toklna/pages/home_page.dart';
import 'package:toklna/widgets/otp_verification_sheet.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isResident = true; // true = مواطن / مقيم, false = زائر / خليجي
  bool _obscurePassword = true;
  bool _idError = false;
  bool _passwordError = false;

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    setState(() {
      _idError = _idController.text.trim().isEmpty;
      _passwordError = _passwordController.text.trim().isEmpty;
    });

    if (_idError || _passwordError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'هذا الحقل مطلوب',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 150,
            left: 16,
            right: 16,
          ),
        ),
      );
      return;
    }

    // Show OTP verification bottom sheet with notification
    OtpVerificationSheet.showWithNotification(context).then((success) {
      if (success == true && mounted) {
        // Navigate to home page on successful verification
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 24),

                // Header with logos
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Right logo (branding.jpeg) - appears on right in RTL
                    Image.asset(
                      'assets/branding.jpeg',
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    // Left logo (left.jpeg) - appears on left in RTL
                    Image.asset(
                      'assets/left.jpeg',
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Language selector
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.language, color: Colors.grey[600], size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'العربية',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 220),

                // Page indicator dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2E9687),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Tab selector
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _isResident = true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: _isResident
                                  ? const Color(0xFF2E9687)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'مواطن / مقيم',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: _isResident
                                    ? Colors.white
                                    : Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _isResident = false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: !_isResident
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'زائر / خليجي',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: !_isResident
                                    ? Colors.black
                                    : Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // ID Number field
                Row(
                  children: [
                    Icon(Icons.person_outline, color: const Color(0xFF2E9687)),
                    const SizedBox(width: 8),
                    const Text(
                      'رقم الهوية الوطنية/هوية مقيم',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _idController,
                  keyboardType: TextInputType.number,
                  onChanged: (_) => setState(() => _idError = false),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _idError ? Colors.red : Colors.grey[300]!,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _idError ? Colors.red : Colors.grey[300]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _idError ? Colors.red : const Color(0xFF2E9687),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Password field
                Row(
                  children: [
                    Icon(Icons.lock_outline, color: const Color(0xFF2E9687)),
                    const SizedBox(width: 8),
                    const Text('كلمة المرور', style: TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  onChanged: (_) => setState(() => _passwordError = false),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _passwordError ? Colors.red : Colors.grey[300]!,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _passwordError ? Colors.red : Colors.grey[300]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _passwordError
                            ? Colors.red
                            : const Color(0xFF2E9687),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Links row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'استرجاع كلمة المرور ؟',
                        style: TextStyle(color: Color(0xFF2E9687)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'الخدمات العامة',
                        style: TextStyle(color: Color(0xFF2E9687)),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Register link
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'ليس لديك حساب؟ تسجيل جديد',
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ),

                const SizedBox(height: 24),

                // Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E9687),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'التالي',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Contact us
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'تواصل معنا',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ),

                // Version
                Text(
                  'v 3.8.6',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
