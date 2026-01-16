// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get healthPassport => 'Health Passport';

  @override
  String get lastUpdate => 'Last Update';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get nationality => 'Nationality';

  @override
  String get idNumber => 'ID Number';

  @override
  String get issuePlace => 'Issue Place';

  @override
  String get issueDate => 'Issue Date';

  @override
  String get birthDate => 'Birth Date';

  @override
  String get profession => 'Profession';

  @override
  String get religion => 'Religion';

  @override
  String get employer => 'Employer';

  @override
  String get healthInformation => 'Health Information';

  @override
  String get vaccineDetails => 'COVID-19 Vaccine Details';

  @override
  String get firstDose => 'First Dose';

  @override
  String get secondDose => 'Second Dose';

  @override
  String get pcrResultNotAvailable => 'COVID-19 PCR Test Result not available';

  @override
  String get travelInsurance => 'Travel Medical Insurance';

  @override
  String get healthStatusInsuranceNotRequired =>
      'Your health status does not require travel medical insurance';

  @override
  String get downloadPassport => 'Download Health Passport';

  @override
  String get uploadPdfMessage => 'Please upload your PDF file';
}
