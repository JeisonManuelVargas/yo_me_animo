import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/util/app_color.dart';

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
    appBarTheme: const AppBarTheme(color: AppColors.primary),
    scaffoldBackgroundColor: AppColors.primary,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
    ),
  );
}
