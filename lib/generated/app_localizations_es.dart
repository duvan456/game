import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String appTitle(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'title': 'Juego de memoria',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
