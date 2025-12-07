import 'package:flutter/material.dart';
import 'package:toklna/widgets/progress_square.dart';
import 'package:toklna/widgets/twakilna_card_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double _value = 0.0;
  bool _auto = true;

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// ------------------------------------
            /// 🔵 PROGRESS SQUARE AT TOP OF COLUMN
            /// ------------------------------------
            const SizedBox(height: 20),
            Image(
              image: AssetImage('assets/icon.jpeg'),
              width: 400,
              height: 400,
            ),

            const SizedBox(height: 16),

            /// Status + QR
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
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
                    child: Image.asset(
                      'assets/qr_code.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                    speed: 3.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'محصن',
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
                  const SizedBox(width: 8),
                  const Icon(color: Colors.white, Icons.refresh, size: 20),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// Promo Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Explore the new features on Tawakkalna Services',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white24,
                        ),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'توكلنا',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
