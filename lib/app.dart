import 'package:flutter/material.dart';
import 'package:game/game_board.dart';
import 'package:game/game_controller.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameController(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Memory Match Game')),
          body: const GameBoard(),
        ),
      ),
    );
  }
}


