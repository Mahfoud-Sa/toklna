import 'dart:math';
import 'package:flutter/material.dart';
import 'package:toklna/pages/myaccount_page.dart';
import 'package:toklna/pages/services_page.dart';
import 'package:toklna/widgets/bottom_nav.dart' hide BottomNavBar;
import 'package:toklna/widgets/progress_square.dart';
import 'package:toklna/widgets/twakilna_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 4;

  // ⬅⬅ Added these so ProgressSquare works
  double _value = 0.0;
  bool _auto = true;

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;

    switch (_currentIndex) {
      case 0:
        bodyContent = const MyAccountPage();
        break;

      case 1:
      case 2:
        bodyContent = const Center(child: Text('قيد التطوير'));
        break;

      case 3:
        bodyContent = const ServicesPage();
        break;

      case 4:
      default:
        bodyContent = SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                /// ------------------------------------
                /// 🔵 PROGRESS SQUARE AT TOP OF COLUMN
                /// ------------------------------------
                const SizedBox(height: 20),

                /// Tawakkalna Card
                TawakkalnaIdCard(
                  name: 'خليفة هود سالم بن سالم',
                  idNumber: '٢٩٥٢٧٩٩٩٤',
                  imageUrl: 'https://example.com/profile.jpg',
                ),

                const SizedBox(height: 16),

                /// Status + QR
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
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
                        progress: _value,
                        size: 80,
                        strokeWidth: 6,
                        trackColor: Colors.transparent,
                        progressColor: Colors.white,
                        auto: _auto,
                        duration: const Duration(seconds: 14),
                        child: Image.asset(
                          'assets/qr_code_example_svg.jpg', // Replace with your actual image path
                          width: 60,
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'غير محصن',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'آخر تحديث: الخميس ٤ ديسمبر ٢٠٢٤م',
                            style: TextStyle(fontSize: 12, color: Colors.white),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
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
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F5F7),
        body: bodyContent,
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
