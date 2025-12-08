import 'package:flutter/material.dart';

/// A centered popup card that mimics the attached design for the Data Dashboard.
///
/// Usage: place `const DataPopup()` where you want the card to appear.
class DataPopup extends StatelessWidget {
  const DataPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top gradient header
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 92,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/red_s.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Circular icon overlapping
                    Positioned(
                      top: 56, // overlaps the header
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.layers_outlined,
                            color: Color.fromARGB(255, 76, 150, 139),
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Body content
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 40, 18, 18),
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          'لخدمتكم بشكل أفضل يمكنكم الوصول إلى لوحة البيانات من خلال توكلنا',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14, height: 1.4),
                        ),
                      ),

                      const SizedBox(height: 18),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              76,
                              150,
                              139,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            // hook: open Tawakkalna link or navigator
                          },
                          child: const Text(
                            'تحميل توكلنا',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'العودة إلى الصفحة الرئيسية',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                    ],
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
