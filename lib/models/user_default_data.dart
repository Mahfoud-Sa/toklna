import 'package:toklna/data.dart';
import 'package:toklna/services/user_data_service.dart';

/// Static holder for user-default data. Access fields directly as globals.
class UserDefaultData {
  static String userName = '';
  static String cardImage = '';
  static String personalImage = '';
  static String passportNumber = '';
  static bool status = false;
  static String startDate = '';
  static String birthDate = '';
  static String firstDoseDate = '';
  static String secondDoseDate = '';
  static String passportFile = '';
  static String workOwnerName = '';
  static String userNameEn = '';
  static String workOwnerNameEn = '';
  static String nationality = '';
  static String nationalityEn = '';
  static String issuePlace = '';
  static String issuePlaceEn = '';
  static String profession = '';
  static String professionEn = '';
  static String religion = '';
  static String religionEn = '';
  static double pdfTextWidth = 200.0;
  static double pdfLineHeight = 10.0;
  static double pdfLeftMargin = 50.0;
  static double pdfBottomMargin = 50.0;

  /// Load values from storage (uses `Data.getUserData()` to include defaults).
  static void load() {
    final map = Data.getUserData();
    userName = map['userName'] as String? ?? '';
    cardImage = map['cardImage'] as String? ?? '';
    personalImage = map['personalImage'] as String? ?? '';
    passportNumber = map['passportNumber'] as String? ?? '';
    status = map['status'] as bool? ?? false;
    startDate = map['startDate'] as String? ?? '';
    birthDate = map['birthDate'] as String? ?? '';
    firstDoseDate = map['firstDoseDate'] as String? ?? '';
    secondDoseDate = map['secondDoseDate'] as String? ?? '';
    passportFile = map['passportFile'] as String? ?? '';
    workOwnerName = map['workOwnerName'] as String? ?? '';
    userNameEn = map['userNameEn'] as String? ?? '';
    workOwnerNameEn = map['workOwnerNameEn'] as String? ?? '';
    nationality = map['nationality'] as String? ?? '';
    nationalityEn = map['nationalityEn'] as String? ?? '';
    issuePlace = map['issuePlace'] as String? ?? '';
    issuePlaceEn = map['issuePlaceEn'] as String? ?? '';
    profession = map['profession'] as String? ?? '';
    professionEn = map['professionEn'] as String? ?? '';
    religion = map['religion'] as String? ?? '';
    religionEn = map['religionEn'] as String? ?? '';
    pdfTextWidth = (map['pdfTextWidth'] is double)
        ? map['pdfTextWidth'] as double
        : (map['pdfTextWidth'] is int)
        ? (map['pdfTextWidth'] as int).toDouble()
        : pdfTextWidth;
    pdfLineHeight = (map['pdfLineHeight'] is double)
        ? map['pdfLineHeight'] as double
        : (map['pdfLineHeight'] is int)
        ? (map['pdfLineHeight'] as int).toDouble()
        : pdfLineHeight;
    pdfLeftMargin = (map['pdfLeftMargin'] is double)
        ? map['pdfLeftMargin'] as double
        : (map['pdfLeftMargin'] is int)
        ? (map['pdfLeftMargin'] as int).toDouble()
        : pdfLeftMargin;
    pdfBottomMargin = (map['pdfBottomMargin'] is double)
        ? map['pdfBottomMargin'] as double
        : (map['pdfBottomMargin'] is int)
        ? (map['pdfBottomMargin'] as int).toDouble()
        : pdfBottomMargin;
  }

  /// Return all fields as a map.
  static Map<String, dynamic> toMap() {
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
      'userNameEn': userNameEn,
      'workOwnerNameEn': workOwnerNameEn,
      'nationality': nationality,
      'nationalityEn': nationalityEn,
      'issuePlace': issuePlace,
      'issuePlaceEn': issuePlaceEn,
      'profession': profession,
      'professionEn': professionEn,
      'religion': religion,
      'religionEn': religionEn,
      'pdfTextWidth': pdfTextWidth,
      'pdfLineHeight': pdfLineHeight,
      'pdfLeftMargin': pdfLeftMargin,
      'pdfBottomMargin': pdfBottomMargin,
    };
  }

  /// Persist current static values to storage.
  static Future<void> saveToService() async {
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
      userNameEn: userNameEn,
      workOwnerNameEn: workOwnerNameEn,
      nationality: nationality,
      nationalityEn: nationalityEn,
      issuePlace: issuePlace,
      issuePlaceEn: issuePlaceEn,
      profession: profession,
      professionEn: professionEn,
      religion: religion,
      religionEn: religionEn,
      pdfTextWidth: pdfTextWidth,
      pdfLineHeight: pdfLineHeight,
      pdfLeftMargin: pdfLeftMargin,
      pdfBottomMargin: pdfBottomMargin,
    );
  }

  /// Save passport file path.
  static Future<void> savePassportFile(String path) async {
    passportFile = path;
    await UserDataService.savePassportFile(path);
  }
}
