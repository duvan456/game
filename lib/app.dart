import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_board.dart';
import 'game_controller.dart';
import 'theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => GameController(),
      child: MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
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
    return Scaffold(
      appBar: AppBar(title: const Text('Memory Match Game')),
      body: const GameBoard(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeProvider.toggleTheme();
        },
        child: Icon(themeProvider.themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
      ),
    );
  }
}

