import 'package:toklna/services/user_data_service.dart';

/// Data class providing user information.
/// Loads from SharedPreferences if available, otherwise uses defaults.
class Data {
  // Default values (used when SharedPreferences has no data)
  static const String _defaultUserName = "عيسى سعيد صالح التميمي";
  static const String _defaultCardImage = "assets/‏‏‏‏icon_k.jpeg";
  static const String _defaultPersonalImage = "assets/user_photo_k.png";
  static const String _defaultPassportNumber = '2493594598';
  static const bool _defaultStatus = true;
  static const String _defaultStartDate = "1442/03/15";
  static const String _defaultBirthDate = "2007/07/03";
  static const String _defaultFirstDoseDate = "2021/06/13";
  static const String _defaultSecondDoseDate = "2021/10/17";
  static const String _defaultPassportFile = "assets/certificate.pdf";

  /// Get user name from storage or default.
  static String get userName =>
      UserDataService.getValue('userName', defaultValue: _defaultUserName)
          as String;

  /// Card image is always from assets.
  static String get cardImage => _defaultCardImage;

  /// Get personal image from storage or default.
  static String get personalImage =>
      UserDataService.getValue(
            'personalImage',
            defaultValue: _defaultPersonalImage,
          )
          as String;

  /// Get passport number from storage or default.
  static String get passportNumber =>
      UserDataService.getValue(
            'passportNumber',
            defaultValue: _defaultPassportNumber,
          )
          as String;

  /// Get status from storage or default.
  static bool get status =>
      UserDataService.getValue('status', defaultValue: _defaultStatus) as bool;

  /// Get status as string (for display purposes).
  static String get statusString => status ? "محصّن" : "غير محصّن";

  /// Get start date from storage or default.
  static String get startDate =>
      UserDataService.getValue('startDate', defaultValue: _defaultStartDate)
          as String;

  /// Get birth date from storage or default.
  static String get birthDate =>
      UserDataService.getValue('birthDate', defaultValue: _defaultBirthDate)
          as String;

  /// Get first dose date from storage or default.
  static String get firstDoseDate =>
      UserDataService.getValue(
            'firstDoseDate',
            defaultValue: _defaultFirstDoseDate,
          )
          as String;

  /// Get second dose date from storage or default.
  static String get secondDoseDate =>
      UserDataService.getValue(
            'secondDoseDate',
            defaultValue: _defaultSecondDoseDate,
          )
          as String;

  /// Passport file is always from assets.
  static String get passportFile => _defaultPassportFile;

  /// Get all user data as a Map.
  static Map<String, dynamic> getAllData() {
    return {
      'userName': userName,
      'cardImage': cardImage,
      'personalImage': personalImage,
      'passportNumber': passportNumber,
      'status': status,
      'startDate': startDate,
      'birthDate': birthDate,
      'firstDoseDate': firstDoseDate,
      'secondDoseDate': secondDoseDate,
      'passportFile': passportFile,
    };
  }

  /// Save user data to SharedPreferences.
  static Future<void> saveData({
    required String userName,
    required String personalImage,
    required String passportNumber,
    required bool status,
    required String startDate,
    required String birthDate,
    required String firstDoseDate,
    required String secondDoseDate,
  }) async {
    await UserDataService.saveUserData(
      userName: userName,
      personalImage: personalImage,
      passportNumber: passportNumber,
      status: status,
      startDate: startDate,
      birthDate: birthDate,
      firstDoseDate: firstDoseDate,
      secondDoseDate: secondDoseDate,
    );
  }

  /// Get default values (for form reset).
  static Map<String, dynamic> getDefaults() {
    return {
      'userName': _defaultUserName,
      'cardImage': _defaultCardImage,
      'personalImage': _defaultPersonalImage,
      'passportNumber': _defaultPassportNumber,
      'status': _defaultStatus,
      'startDate': _defaultStartDate,
      'birthDate': _defaultBirthDate,
      'firstDoseDate': _defaultFirstDoseDate,
      'secondDoseDate': _defaultSecondDoseDate,
      'passportFile': _defaultPassportFile,
    };
  }
}
