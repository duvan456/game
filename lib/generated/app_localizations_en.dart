import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get changeLanguageButton => 'Change Language';

  @override
  String title(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'titleGame': 'Memory Match Game',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get titleGame => 'Memory Game';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get register => 'Register';

  @override
  String get currentScore => 'Current Score';

  @override
  String get bestScore => 'Best Score';

  @override
  String get resetGame => 'Reset Game';
}
