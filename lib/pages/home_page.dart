import 'package:flutter/material.dart';
import 'package:toklna/pages/dashboard_page.dart';
import 'package:toklna/pages/myaccount_page.dart';
import 'package:toklna/pages/services_page.dart';
import 'package:toklna/widgets/bottom_nav.dart' hide BottomNavBar;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Home is now index 0

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;

    switch (_currentIndex) {
      case 4:
        bodyContent = const MyAccountPage();
        break;

      case 2:
      case 3:
        bodyContent = const Center(child: Text('قيد التطوير'));
        break;

      case 1:
        bodyContent = const ServicesPage();
        break;

      case 0:
      default:
        bodyContent = const DashboardPage();
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
