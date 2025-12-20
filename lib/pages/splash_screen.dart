import 'package:flutter/material.dart';
import 'package:toklna/pages/home_page.dart';
import 'package:toklna/pages/login_page.dart';
import 'package:toklna/services/user_data_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Wait for splash display
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      // Check if user is already logged in
      if (UserDataService.isLoggedIn()) {
        // User is logged in, navigate to home page
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // User is not logged in, navigate to login page
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/full_splash_screen.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
