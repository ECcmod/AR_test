import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class AppLocalizations {
  final Locale locale;
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    final jsonStr = await rootBundle.loadString(
      'assets/locales/${locale.languageCode}.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonStr);
    _localizedStrings = jsonMap.map(
      (key, value) => MapEntry(key, value.toString()),
    );
    return true;
  }

  String translate(String key) => _localizedStrings[key] ?? key;

  // Helper methods
  String get menu => translate('menu');
  String get addProduct => translate('addProduct');
  String get captureInstructions => translate('captureInstructions');
  String get horizontal => translate('horizontal');
  String get vertical => translate('vertical');
  String get circular => translate('circular');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
