import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:toklna/l10n/app_localizations.dart';
import 'package:toklna/pages/splash_screen.dart';
import 'package:toklna/services/notification_service.dart';
import 'package:toklna/services/user_data_service.dart';

// Global ValueNotifier to manage application locale
final ValueNotifier<Locale> appLocale = ValueNotifier(const Locale('ar'));

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
    return ValueListenableBuilder<Locale>(
      valueListenable: appLocale,
      builder: (context, locale, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar'), // Arabic
            Locale('en'), // English
          ],
          home: const SplashScreen(),
        );
      },
    );
  }
}
