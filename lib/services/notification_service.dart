import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Service for handling local notifications.
class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static bool _initialized = false;

  /// Initialize the notification service.
  static Future<void> init() async {
    if (_initialized) return;

    // Android initialization settings
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS initialization settings
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    // Combine settings
    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // Initialize
    await _notifications.initialize(initSettings);

    // Request permissions on Android 13+
    await _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    _initialized = true;
  }

  /// Show OTP notification with the verification code.
  static Future<void> showOtpNotification(String otpCode) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'otp_channel',
          'رمز التحقق',
          channelDescription: 'إشعارات رمز التحقق',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'رمز التحقق',
          icon: '@mipmap/ic_launcher',
        );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(
      0, // Notification ID
      'رمز التحقق', // Title
      'رمز التحقق الخاص بك هو: $otpCode', // Body
      notificationDetails,
    );
  }
}
