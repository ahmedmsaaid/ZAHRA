import 'package:flutter/material.dart';

class AppLocalizationsConstants {
  static final AppLocalizationsConstants _instance =
  AppLocalizationsConstants._internal();

  factory AppLocalizationsConstants() => _instance;

  AppLocalizationsConstants._internal() {
    arLocale = Locale(arLanguage, arRegion);
    enLocale = Locale(enLanguage, enRegion);
    supportedLocales = [arLocale, enLocale];
  }

  // Languages
  final String arLanguage = 'ar';
  final String enLanguage = 'en';

  // Regions
  final String arRegion = 'EG';
  final String enRegion = 'US';

  // Path
  final String path = "assets/translations";

  // Locales
  late final Locale arLocale;
  late final Locale enLocale;
  late final List<Locale> supportedLocales;
}
