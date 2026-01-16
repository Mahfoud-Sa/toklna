// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get healthPassport => 'الجواز الصحي';

  @override
  String get lastUpdate => 'آخر تحديث';

  @override
  String get personalInformation => 'المعلومات الشخصية';

  @override
  String get nationality => 'الجنسية';

  @override
  String get idNumber => 'رقم الهوية';

  @override
  String get issuePlace => 'مكان الاصدار';

  @override
  String get issueDate => 'تاريخ الاصدار';

  @override
  String get birthDate => 'تاريخ الميلاد';

  @override
  String get profession => 'المهنة';

  @override
  String get religion => 'الديانة';

  @override
  String get employer => 'صاحب العمل';

  @override
  String get healthInformation => 'المعلومات الصحية';

  @override
  String get vaccineDetails => 'تفاصيل لقاح كورونا';

  @override
  String get firstDose => 'الجرعة الأولى';

  @override
  String get secondDose => 'الجرعة الثانية';

  @override
  String get pcrResultNotAvailable => 'نتيجة فحص كورونا PCR غير متوفرة';

  @override
  String get travelInsurance => 'التأمين طبي للسفر';

  @override
  String get healthStatusInsuranceNotRequired =>
      'حالتك الصحية لا تتطلب تأمين طبي للسفر';

  @override
  String get downloadPassport => 'تحميل الجواز الصحي';

  @override
  String get uploadPdfMessage => 'ارفع ملف pdf الخاص فيك';
}
