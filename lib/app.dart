import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:game/modules/game/controllers/game_controller.dart';
import 'package:game/modules/login/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameController()),
      ],
      child: MaterialApp(
        title: 'Memory Match Game',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}