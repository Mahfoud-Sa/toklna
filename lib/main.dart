import 'package:flutter/material.dart';
import 'package:toklna/pages/splash_screen.dart';
import 'package:toklna/services/notification_service.dart';
import 'package:toklna/services/user_data_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize SharedPreferences for user data storage
  await UserDataService.init();
  // Initialize notification service
  await NotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
