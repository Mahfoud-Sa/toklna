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
  static const String _keyUserNameEn = 'user_name_en';
  static const String _keyWorkOwnerNameEn = 'work_owner_name_en';
  static const String _keyPdfTextWidth = 'pdf_text_width';
  static const String _keyPdfLineHeight = 'pdf_line_height';
  static const String _keyPdfLeftMargin = 'pdf_left_margin';
  static const String _keyPdfBottomMargin = 'pdf_bottom_margin';
  static const String _keyNationality = 'nationality';
  static const String _keyNationalityEn = 'nationality_en';
  static const String _keyIssuePlace = 'issue_place';
  static const String _keyIssuePlaceEn = 'issue_place_en';
  static const String _keyProfession = 'profession';
  static const String _keyProfessionEn = 'profession_en';
  static const String _keyReligion = 'religion';
  static const String _keyReligionEn = 'religion_en';

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
    String? userNameEn,
    String? workOwnerNameEn,
    double? pdfTextWidth,
    double? pdfLineHeight,
    double? pdfLeftMargin,
    double? pdfBottomMargin,
    String? nationality,
    String? nationalityEn,
    String? issuePlace,
    String? issuePlaceEn,
    String? profession,
    String? professionEn,
    String? religion,
    String? religionEn,
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
    if (userNameEn != null) await prefs.setString(_keyUserNameEn, userNameEn);
    if (workOwnerNameEn != null) {
      await prefs.setString(_keyWorkOwnerNameEn, workOwnerNameEn);
    }
    if (pdfTextWidth != null) {
      await prefs.setDouble(_keyPdfTextWidth, pdfTextWidth);
    }
    if (pdfLineHeight != null) {
      await prefs.setDouble(_keyPdfLineHeight, pdfLineHeight);
    }
    if (pdfLeftMargin != null) {
      await prefs.setDouble(_keyPdfLeftMargin, pdfLeftMargin);
    }
    if (pdfBottomMargin != null) {
      await prefs.setDouble(_keyPdfBottomMargin, pdfBottomMargin);
    }
    if (nationality != null)
      await prefs.setString(_keyNationality, nationality);
    if (nationalityEn != null) {
      await prefs.setString(_keyNationalityEn, nationalityEn);
    }
    if (issuePlace != null) await prefs.setString(_keyIssuePlace, issuePlace);
    if (issuePlaceEn != null) {
      await prefs.setString(_keyIssuePlaceEn, issuePlaceEn);
    }
    if (profession != null) await prefs.setString(_keyProfession, profession);
    if (professionEn != null) {
      await prefs.setString(_keyProfessionEn, professionEn);
    }
    if (religion != null) await prefs.setString(_keyReligion, religion);
    if (religionEn != null) await prefs.setString(_keyReligionEn, religionEn);
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
    String defaultUserNameEn = '',
    String? defaultWorkOwnerNameEn,
    String? defaultNationality = '',
    String? defaultNationalityEn = '',
    String? defaultIssuePlace = '',
    String? defaultIssuePlaceEn = '',
    String? defaultProfession = '',
    String? defaultProfessionEn = '',
    String? defaultReligion = '',
    String? defaultReligionEn = '',
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
      'userNameEn': prefs.getString(_keyUserNameEn) ?? defaultUserNameEn,
      'workOwnerNameEn':
          prefs.getString(_keyWorkOwnerNameEn) ?? defaultWorkOwnerNameEn,
      'nationality': prefs.getString(_keyNationality) ?? defaultNationality,
      'nationalityEn':
          prefs.getString(_keyNationalityEn) ?? defaultNationalityEn,
      'issuePlace': prefs.getString(_keyIssuePlace) ?? defaultIssuePlace,
      'issuePlaceEn': prefs.getString(_keyIssuePlaceEn) ?? defaultIssuePlaceEn,
      'profession': prefs.getString(_keyProfession) ?? defaultProfession,
      'professionEn': prefs.getString(_keyProfessionEn) ?? defaultProfessionEn,
      'religion': prefs.getString(_keyReligion) ?? defaultReligion,
      'religionEn': prefs.getString(_keyReligionEn) ?? defaultReligionEn,
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
      case 'userNameEn':
        return prefs.getString(_keyUserNameEn) ?? defaultValue;
      case 'workOwnerNameEn':
        return prefs.getString(_keyWorkOwnerNameEn) ?? defaultValue;
      case 'pdfTextWidth':
        return prefs.getDouble(_keyPdfTextWidth) ?? defaultValue;
      case 'pdfLineHeight':
        return prefs.getDouble(_keyPdfLineHeight) ?? defaultValue;
      case 'pdfLeftMargin':
        return prefs.getDouble(_keyPdfLeftMargin) ?? defaultValue;
      case 'pdfBottomMargin':
        return prefs.getDouble(_keyPdfBottomMargin) ?? defaultValue;
      case 'nationality':
        return prefs.getString(_keyNationality) ?? defaultValue;
      case 'nationalityEn':
        return prefs.getString(_keyNationalityEn) ?? defaultValue;
      case 'issuePlace':
        return prefs.getString(_keyIssuePlace) ?? defaultValue;
      case 'issuePlaceEn':
        return prefs.getString(_keyIssuePlaceEn) ?? defaultValue;
      case 'profession':
        return prefs.getString(_keyProfession) ?? defaultValue;
      case 'professionEn':
        return prefs.getString(_keyProfessionEn) ?? defaultValue;
      case 'religion':
        return prefs.getString(_keyReligion) ?? defaultValue;
      case 'religionEn':
        return prefs.getString(_keyReligionEn) ?? defaultValue;
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
    await prefs.remove(_keyWorkOwnerName);
    await prefs.remove(_keyUserNameEn);
    await prefs.remove(_keyWorkOwnerNameEn);
    await prefs.remove(_keyNationality);
    await prefs.remove(_keyNationalityEn);
    await prefs.remove(_keyIssuePlace);
    await prefs.remove(_keyIssuePlaceEn);
    await prefs.remove(_keyProfession);
    await prefs.remove(_keyProfessionEn);
    await prefs.remove(_keyReligionEn);
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

  /// Save the passport file path.
  static Future<void> savePassportFile(String path) async {
    await prefs.setString(_keyPassportFile, path);
  }
}
