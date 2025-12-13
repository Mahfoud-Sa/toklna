import 'package:flutter/material.dart';
import 'package:toklna/widgets/progress_square.dart';
import 'package:toklna/widgets/twakilna_card_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final double _value = 0.0;
  final bool _auto = true;

  String _getArabicDateTime() {
    final now = DateTime.now();

    const arabicDays = [
      'الإثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
      'الأحد',
    ];

    const arabicMonths = [
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
    final minute = now.minute.toString().padLeft(2, '0');

    return 'آخر تحديث يوم $dayName ${now.day} $monthName $hour:$minute$period';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// ------------------------------------
            /// 🔵 PROGRESS SQUARE AT TOP OF COLUMN
            /// ------------------------------------
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(
                                  'assets/user_photo_1.png',
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'صالح سالم عبدالله المهري',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '2501136468',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Image(
                image: AssetImage('assets/‏‏‏‏icon.jpeg'),
                width: 300,
                height: 300,
              ),
            ),

            const SizedBox(height: 16),

            /// Status + QR
            Center(
              child: Container(
                width: 375, // Fixed narrower width
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 23, 100, 26),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProgressSquare(
                      innerPadding: 4,
                      progress: _value,
                      size: 80,
                      strokeWidth: 4,
                      trackColor: Colors.transparent,
                      progressColor: Colors.white,
                      auto: _auto,
                      duration: const Duration(seconds: 14),
                      speed: 3.0,
                      child: Image.asset(
                        'assets/qr_code.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'محصَّن',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "كمل جرعات لقاح كورونا (كوفيد_19)",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _getArabicDateTime(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    const Icon(color: Colors.white, Icons.refresh, size: 20),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Promo Banner — fill full width with fixed height
            SizedBox(
              //  height: 48,
              width: double.infinity,
              child: Image.asset(
                'assets/toklna_band.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
