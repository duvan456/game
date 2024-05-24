import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}
