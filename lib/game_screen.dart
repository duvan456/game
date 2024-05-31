import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'language_provider.dart';
import 'game_controller.dart';

import 'game_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final gameController = Provider.of<GameController>(context);
    final AppLocalizations localizations = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.titleGame),
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: () {
              Locale newLocale = languageProvider.locale == Locale('en')
                  ? Locale('es')
                  : Locale('en');
              languageProvider.changeLocale(newLocale);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Text('${localizations.currentScore}: ${gameController.currentScore}'),
          Text('${localizations.bestScore}: ${gameController.bestScore}'),
          Expanded(child: GameBoard()),
          ElevatedButton(
            onPressed: gameController.resetGame,
            child: Text(localizations.resetGame),
          ),
        ],
      ),
    );
  }
}
