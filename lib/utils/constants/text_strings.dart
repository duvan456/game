import 'package:flutter/material.dart';
import 'package:game/generated/app_localizations.dart';
import 'package:get/get.dart';

class AppText {
  
  AppText._();

  static String titleGame(BuildContext context) {
    return AppLocalizations.of(context)?.title('titleGame') ?? 'Title not found';}

}