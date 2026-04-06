import 'package:flutter/material.dart';
import 'package:toklna/pages/health_status_page.dart';
import 'package:toklna/widgets/progress_square.dart';
import 'package:toklna/widgets/user_profile_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

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
            UserProfileDialog(
              triggerImagePath: 'assets/‏‏‏‏icon_mohmmed.jpeg',
              profileImagePath: 'assets/user_phone_mohammed_2.jpeg',
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
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => DraggableScrollableSheet(
                            initialChildSize: 0.9,
                            minChildSize: 0.5,
                            maxChildSize: 0.95,
                            expand: false,
                            builder: (context, scrollController) => Column(
                              children: [
                                // Drag handle
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  width: 40,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                // Content
                                Expanded(
                                  child: HealthStatusPage(
                                    scrollController: scrollController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(
                  'https://play.google.com/store/apps/details?id=sa.gov.nic.twkhayat',
                );
                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception('Could not launch $url');
                }
              },
              child: SizedBox(
                //  height: 48,
                width: double.infinity,
                child: Image.asset(
                  'assets/toklna_band.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
