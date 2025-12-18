// Your BottomNavBar Widget (as provided)
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      items: [
        // Left-most: Home
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'الرئيسية',
        ),

        // Second from left: Services
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/menu_icon.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 1 ? const Color(0xFF00A66A) : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'الخدمات',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.wallet_membership_outlined),
          label: 'المحفظة الرقمية',
        ),

        // Middle: Data Dashboard
        const BottomNavigationBarItem(
          icon: Icon(Icons.layers_outlined),
          label: 'لوحة البيانات',
        ),

        // Second from right: Wallet

        // Right-most: My Account
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'حسابي',
        ),
      ],
    );
  }
}
