import 'package:flutter/material.dart';
import 'package:toklna/pages/dashboard_page.dart';
import 'package:toklna/pages/myaccount_page.dart';
import 'package:toklna/pages/services_page.dart';
import 'package:toklna/widgets/bottom_nav.dart';
import 'package:toklna/widgets/data_popup.dart';

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
      case 0:
        // Home (dashboard)
        bodyContent = const DashboardPage();
        break;

      case 1:
        // Services
        bodyContent = const ServicesPage();
        break;

      case 2:
        // Data Dashboard (uses popup)
        bodyContent = const DataPopup();
        break;

      case 3:
        // Wallet (placeholder)
        bodyContent = const DataPopup();
        break;

      case 4:
      default:
        // My Account
        bodyContent = const MyAccountPage();
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
