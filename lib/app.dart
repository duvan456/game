import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_board.dart';
import 'game_controller.dart';
import 'theme_provider.dart';
import 'language_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game/generated/app_localizations.dart';
import 'package:game/utils/constants/text_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameController()),
        ChangeNotifierProvider(create: (_) => languageProvider),
      ],
      child: MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        locale: languageProvider.locale,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('es', ''),
        ],
        home: const AppScaffold(),
      ),
    );
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.titleGame(context)),
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: () {
              Locale newLocale = languageProvider.locale == Locale('en') ? Locale('es') : Locale('en');
              languageProvider.changeLocale(newLocale);
            },
          ),
        ],
      ),
      body: const GameBoard(),
    );
  }
}

