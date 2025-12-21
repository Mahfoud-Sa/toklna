import 'package:shared_preferences/shared_preferences.dart';

/// Service class for managing user data in SharedPreferences.
class UserDataService {
  static const String _keyUserName = 'user_name';
  static const String _keyPersonalImage = 'personal_image';
  static const String _keyPassportNumber = 'passport_number';
  static const String _keyStatus = 'status';
  static const String _keyStartDate = 'start_date';
  static const String _keyBirthDate = 'birth_date';
  static const String _keyFirstDoseDate = 'first_dose_date';
  static const String _keySecondDoseDate = 'second_dose_date';
  static const String _keyCardImage = 'card_image';
  static const String _keyPassportFile = 'passport_file';
  static const String _keyIsLogin = 'is_login';
  static const String _keyWorkOwnerName = 'work_owner_name';

  static SharedPreferences? _prefs;

  /// Initialize SharedPreferences instance.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Get the SharedPreferences instance.
  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('UserDataService not initialized. Call init() first.');
    }
    return _prefs!;
  }

  /// Save all user data to SharedPreferences.
  static Future<void> saveUserData({
    required String userName,
    required String personalImage,
    required String passportNumber,
    required bool status,
    required String startDate,
    required String birthDate,
    required String firstDoseDate,
    required String secondDoseDate,
    required String workOwnerName,
  }) async {
    await prefs.setString(_keyUserName, userName);
    await prefs.setString(_keyPersonalImage, personalImage);
    await prefs.setString(_keyPassportNumber, passportNumber);
    await prefs.setBool(_keyStatus, status);
    await prefs.setString(_keyStartDate, startDate);
    await prefs.setString(_keyBirthDate, birthDate);
    await prefs.setString(_keyFirstDoseDate, firstDoseDate);
    await prefs.setString(_keySecondDoseDate, secondDoseDate);
    await prefs.setString(_keyWorkOwnerName, workOwnerName);
  }

  /// Get stored user data as a Map. Returns default values if not set.
  static Map<String, dynamic> getUserData({
    String defaultUserName = '',
    String defaultPersonalImage = '',
    String defaultPassportNumber = '',
    bool defaultStatus = false,
    String defaultStartDate = '',
    String defaultBirthDate = '',
    String defaultFirstDoseDate = '',
    String defaultSecondDoseDate = '',
    String defaultWorkOwnerName = '',
  }) {
    return {
      'userName': prefs.getString(_keyUserName) ?? defaultUserName,
      'personalImage':
          prefs.getString(_keyPersonalImage) ?? defaultPersonalImage,
      'passportNumber':
          prefs.getString(_keyPassportNumber) ?? defaultPassportNumber,
      'status': prefs.getBool(_keyStatus) ?? defaultStatus,
      'startDate': prefs.getString(_keyStartDate) ?? defaultStartDate,
      'birthDate': prefs.getString(_keyBirthDate) ?? defaultBirthDate,
      'firstDoseDate':
          prefs.getString(_keyFirstDoseDate) ?? defaultFirstDoseDate,
      'secondDoseDate':
          prefs.getString(_keySecondDoseDate) ?? defaultSecondDoseDate,
      'workOwnerName':
          prefs.getString(_keyWorkOwnerName) ?? defaultWorkOwnerName,
    };
  }

  /// Get a specific user data field by key.
  static dynamic getValue(String key, {dynamic defaultValue}) {
    switch (key) {
      case 'userName':
        return prefs.getString(_keyUserName) ?? defaultValue;
      case 'personalImage':
        return prefs.getString(_keyPersonalImage) ?? defaultValue;
      case 'passportNumber':
        return prefs.getString(_keyPassportNumber) ?? defaultValue;
      case 'status':
        return prefs.getBool(_keyStatus) ?? defaultValue;
      case 'startDate':
        return prefs.getString(_keyStartDate) ?? defaultValue;
      case 'birthDate':
        return prefs.getString(_keyBirthDate) ?? defaultValue;
      case 'firstDoseDate':
        return prefs.getString(_keyFirstDoseDate) ?? defaultValue;
      case 'secondDoseDate':
        return prefs.getString(_keySecondDoseDate) ?? defaultValue;
      case 'cardImage':
        return prefs.getString(_keyCardImage) ?? defaultValue;
      case 'passportFile':
        return prefs.getString(_keyPassportFile) ?? defaultValue;
      case 'workOwnerName':
        return prefs.getString(_keyWorkOwnerName) ?? defaultValue;
      default:
        return defaultValue;
    }
  }

  /// Save user-specific data after login (images and files).
  static Future<void> saveLoginUserData({
    required String passportNumber,
    required String cardImage,
    required String userImage,
    required String passportFile,
  }) async {
    await prefs.setString(_keyPassportNumber, passportNumber);
    await prefs.setString(_keyCardImage, cardImage);
    await prefs.setString(_keyPersonalImage, userImage);
    await prefs.setString(_keyPassportFile, passportFile);
  }

  /// Clear all saved user data.
  static Future<void> clearUserData() async {
    await prefs.remove(_keyUserName);
    await prefs.remove(_keyPersonalImage);
    await prefs.remove(_keyPassportNumber);
    await prefs.remove(_keyStatus);
    await prefs.remove(_keyStartDate);
    await prefs.remove(_keyBirthDate);
    await prefs.remove(_keyFirstDoseDate);
    await prefs.remove(_keySecondDoseDate);
  }

  /// Check if user data has been saved before.
  static bool hasUserData() {
    return prefs.containsKey(_keyUserName);
  }

  /// Save login state (set isLogin = true).
  static Future<void> saveLogin() async {
    await prefs.setBool(_keyIsLogin, true);
  }

  /// Check if user is logged in.
  static bool isLoggedIn() {
    return prefs.getBool(_keyIsLogin) ?? false;
  }

  /// Logout: clear login state and all user data.
  static Future<void> logout() async {
    await prefs.setBool(_keyIsLogin, false);
    await prefs.remove(_keyCardImage);
    await prefs.remove(_keyPersonalImage);
    await prefs.remove(_keyPassportNumber);
    await prefs.remove(_keyPassportFile);
  }
}
