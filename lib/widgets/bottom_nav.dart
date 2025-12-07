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
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'sadfasd',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.layers_outlined),
          label: 'لوحة البيانات',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_membership_outlined),
          label: 'المحفظة الرقمية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
          label: 'الخدمات',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'الرئيسية',
        ),
      ],
    );
  }
}
