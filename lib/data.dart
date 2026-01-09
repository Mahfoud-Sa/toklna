import 'package:toklna/services/user_data_service.dart';

/// Data class providing user information.
/// Loads from SharedPreferences if available, otherwise uses defaults.
class Data {
  /// Map of users: passport number -> user data
  /// Contains password, pdfFile, cardImage, and userImage for each user
  static const Map<String, Map<String, String>> users = {
    '2493594598': {
      'password': '123456',
      'pdfFile': 'assets/certificate_k.pdf',
      'cardImage': 'assets/‏‏‏‏icon_k.jpeg',
      'userImage': 'assets/user_photo_k.png',
    },
    '2382722680': {
      'password': '123456789',
      'pdfFile': 'assets/certificate_s.pdf',
      'cardImage': 'assets/‏‏‏‏icon_s.jpeg',
      'userImage': 'assets/user_photo_s.png',
    },
    '2501502154': {
      'password': 'admin123',
      'pdfFile': 'assets/certificate_khalifah.pdf',
      'cardImage': 'assets/‏‏icon_1.jpeg',
      'userImage': 'assets/user_photo.png',
    },
    '2605496864': {
      'password': '123456',
      'pdfFile': 'assets/certificate_salim.pdf',
      'cardImage': 'assets/‏‏‏‏icon_salem.jpeg',
      'userImage': 'assets/user_photo_salem.jpeg',
    },
    '2502140193': {
      'password': '123456',
      'pdfFile': 'assets/certificate_abobaker.pdf',
      'cardImage': 'assets/‏‏‏‏‏‏icon_abobaker.jpeg',
      'userImage': 'assets/user_photo_abobaker.png',
    },
    '2492891052': {
      'password': '123456789',
      'pdfFile': 'assets/certificate_abdullah.pdf',
      'cardImage': 'assets/‏‏‏‏‏‏icon_abdullah.jpeg',
      'userImage': 'assets/user_photo_abdullah.png',
    },
    '2501273859': {
      'password': '123456789',
      'pdfFile': 'assets/certificate_saeed.pdf',
      'cardImage': 'assets/‏‏‏‏icon_saeed.jpeg',
      'userImage': 'assets/user_photo_saeed.png',
    },
    '2502584219': {
      'password': '123456789',
      'pdfFile': 'assets/certificate_mostafa.pdf',
      'cardImage': 'assets/‏‏‏‏icon_mostafa.jpeg',
      'userImage': 'assets/user_photo_mostafa.jpeg',
    },
    '2463993127': {
      'password': '123456789',
      'pdfFile': 'assets/certificate_abdullah_1.pdf',
      'cardImage': 'assets/‏‏‏‏icon_abdullah_1.jpeg',
      'userImage': 'assets/user_photo_abdullah_1.jpeg',
    },
    '2501732895': {
      'password': '123456789',
      'pdfFile': 'assets/certificate_omer',
      'cardImage': 'assets/‏‏‏‏icon_omer.jpeg',
      'userImage': 'assets/user_photo_omer.jpeg',
    },
  };

  // Default values (used when SharedPreferences has no data)
  static const String _defaultUserName = "عيسى سعيد صالح التميمي";
  static const String _defaultPassportNumber = '';
  static const bool _defaultStatus = true;
  static const String _defaultStartDate = "1442/03/15";
  static const String _defaultBirthDate = "2007/07/03";
  static const String _defaultFirstDoseDate = "2021/06/13";
  static const String _defaultSecondDoseDate = "2021/10/17";
  static const String _defaultPassportFile = "assets/certificate.pdf";
  static const String _defaultWorkOwnerName = "عيسى بن عمرون بن سليمان المهري";

  // Default PDF margin values
  static const double _defaultPdfTextWidth = 200;
  static const double _defaultPdfLineHeight = 14;
  static const double _defaultPdfLeftMargin = 20;
  static const double _defaultPdfBottomMargin = 165;

  /// Get user name from storage or default.
  static String get userName =>
      UserDataService.getValue('userName', defaultValue: _defaultUserName)
          as String;

  /// Get card image from storage (set after login).
  static String get cardImage =>
      UserDataService.getValue('cardImage', defaultValue: '') as String;

  /// Get personal image from storage (set after login).
  static String get personalImage =>
      UserDataService.getValue('personalImage', defaultValue: '') as String;

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

  /// Get passport file from storage or default.
  static String get passportFile =>
      UserDataService.getValue(
            'passportFile',
            defaultValue: _defaultPassportFile,
          )
          as String;

  /// Get work owner name from storage or default.
  static String get workOwnerName =>
      UserDataService.getValue(
            'workOwnerName',
            defaultValue: _defaultWorkOwnerName,
          )
          as String;

  /// Get PDF text width.
  static double get pdfTextWidth =>
      UserDataService.getValue(
            'pdfTextWidth',
            defaultValue: _defaultPdfTextWidth,
          )
          as double;

  /// Get PDF line height.
  static double get pdfLineHeight =>
      UserDataService.getValue(
            'pdfLineHeight',
            defaultValue: _defaultPdfLineHeight,
          )
          as double;

  /// Get PDF left margin.
  static double get pdfLeftMargin =>
      UserDataService.getValue(
            'pdfLeftMargin',
            defaultValue: _defaultPdfLeftMargin,
          )
          as double;

  /// Get PDF bottom margin.
  static double get pdfBottomMargin =>
      UserDataService.getValue(
            'pdfBottomMargin',
            defaultValue: _defaultPdfBottomMargin,
          )
          as double;

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
      'workOwnerName': workOwnerName,
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
    required String workOwnerName,
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
      workOwnerName: workOwnerName,
    );
  }

  /// Save PDF settings to SharedPreferences.
  static Future<void> savePdfSettings({
    required double textWidth,
    required double lineHeight,
    required double leftMargin,
    required double bottomMargin,
  }) async {
    final data = getUserData();
    await UserDataService.saveUserData(
      userName: data['userName'],
      personalImage: data['personalImage'],
      passportNumber: data['passportNumber'],
      status: data['status'],
      startDate: data['startDate'],
      birthDate: data['birthDate'],
      firstDoseDate: data['firstDoseDate'],
      secondDoseDate: data['secondDoseDate'],
      workOwnerName: data['workOwnerName'],
      pdfTextWidth: textWidth,
      pdfLineHeight: lineHeight,
      pdfLeftMargin: leftMargin,
      pdfBottomMargin: bottomMargin,
    );
  }

  /// Get stored user data as a Map.
  static Map<String, dynamic> getUserData() {
    return UserDataService.getUserData(
      defaultUserName: _defaultUserName,
      defaultPassportNumber: _defaultPassportNumber,
      defaultStatus: _defaultStatus,
      defaultStartDate: _defaultStartDate,
      defaultBirthDate: _defaultBirthDate,
      defaultFirstDoseDate: _defaultFirstDoseDate,
      defaultSecondDoseDate: _defaultSecondDoseDate,
      defaultWorkOwnerName: _defaultWorkOwnerName,
    );
  }

  /// Get default values (for form reset).
  static Map<String, dynamic> getDefaults() {
    return {
      'userName': _defaultUserName,
      'cardImage': '',
      'personalImage': '',
      'passportNumber': _defaultPassportNumber,
      'status': _defaultStatus,
      'startDate': _defaultStartDate,
      'birthDate': _defaultBirthDate,
      'firstDoseDate': _defaultFirstDoseDate,
      'secondDoseDate': _defaultSecondDoseDate,
      'passportFile': _defaultPassportFile,
      'workOwnerName': _defaultWorkOwnerName,
    };
  }
}
