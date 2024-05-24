import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String appTitle(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'title': 'Memory match game',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
