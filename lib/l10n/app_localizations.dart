import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @healthPassport.
  ///
  /// In ar, this message translates to:
  /// **'الجواز الصحي'**
  String get healthPassport;

  /// No description provided for @lastUpdate.
  ///
  /// In ar, this message translates to:
  /// **'آخر تحديث'**
  String get lastUpdate;

  /// No description provided for @personalInformation.
  ///
  /// In ar, this message translates to:
  /// **'المعلومات الشخصية'**
  String get personalInformation;

  /// No description provided for @nationality.
  ///
  /// In ar, this message translates to:
  /// **'الجنسية'**
  String get nationality;

  /// No description provided for @idNumber.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهوية'**
  String get idNumber;

  /// No description provided for @issuePlace.
  ///
  /// In ar, this message translates to:
  /// **'مكان الاصدار'**
  String get issuePlace;

  /// No description provided for @issueDate.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الاصدار'**
  String get issueDate;

  /// No description provided for @birthDate.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الميلاد'**
  String get birthDate;

  /// No description provided for @profession.
  ///
  /// In ar, this message translates to:
  /// **'المهنة'**
  String get profession;

  /// No description provided for @religion.
  ///
  /// In ar, this message translates to:
  /// **'الديانة'**
  String get religion;

  /// No description provided for @employer.
  ///
  /// In ar, this message translates to:
  /// **'صاحب العمل'**
  String get employer;

  /// No description provided for @healthInformation.
  ///
  /// In ar, this message translates to:
  /// **'المعلومات الصحية'**
  String get healthInformation;

  /// No description provided for @vaccineDetails.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل لقاح كورونا'**
  String get vaccineDetails;

  /// No description provided for @firstDose.
  ///
  /// In ar, this message translates to:
  /// **'الجرعة الأولى'**
  String get firstDose;

  /// No description provided for @secondDose.
  ///
  /// In ar, this message translates to:
  /// **'الجرعة الثانية'**
  String get secondDose;

  /// No description provided for @pcrResultNotAvailable.
  ///
  /// In ar, this message translates to:
  /// **'نتيجة فحص كورونا PCR غير متوفرة'**
  String get pcrResultNotAvailable;

  /// No description provided for @travelInsurance.
  ///
  /// In ar, this message translates to:
  /// **'التأمين طبي للسفر'**
  String get travelInsurance;

  /// No description provided for @healthStatusInsuranceNotRequired.
  ///
  /// In ar, this message translates to:
  /// **'حالتك الصحية لا تتطلب تأمين طبي للسفر'**
  String get healthStatusInsuranceNotRequired;

  /// No description provided for @downloadPassport.
  ///
  /// In ar, this message translates to:
  /// **'تحميل الجواز الصحي'**
  String get downloadPassport;

  /// No description provided for @uploadPdfMessage.
  ///
  /// In ar, this message translates to:
  /// **'ارفع ملف pdf الخاص فيك'**
  String get uploadPdfMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
