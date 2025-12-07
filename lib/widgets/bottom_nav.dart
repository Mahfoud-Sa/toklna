// Your BottomNavBar Widget (as provided)
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF00A66A),
      unselectedItemColor: Colors.grey,
      onTap: onTap,
      items: const [
        // Left-most: Home
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'الرئيسية',
        ),

        // Second from left: Services
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
          label: 'الخدمات',
        ),

        // Middle: Data Dashboard
        BottomNavigationBarItem(
          icon: Icon(Icons.layers_outlined),
          label: 'لوحة البيانات',
        ),

        // Second from right: Wallet
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_membership_outlined),
          label: 'المحفظة الرقمية',
        ),

        // Right-most: My Account
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'حسابي',
        ),
      ],
    );
  }
}
