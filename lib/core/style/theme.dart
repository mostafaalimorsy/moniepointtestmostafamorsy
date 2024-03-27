import 'package:flutter/material.dart';

import '../../config/app_export/app_export.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsManager.orange,
        brightness: Brightness.light,
        primary: ColorsManager.orange,
        onPrimary: Colors.white,
        secondary: ColorsManager.orange,
        onSecondary: ColorsManager.orange,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black),
    primaryColor: ColorsManager.orange,
  );
}
