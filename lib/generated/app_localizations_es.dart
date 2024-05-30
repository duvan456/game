import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Mi Aplicación';

  @override
  String get changeLanguageButton => 'Cambiar Idioma';

  @override
  String title(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'titleGame': 'Juego de memoria',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
