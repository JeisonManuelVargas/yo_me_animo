import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/util/app_color.dart';

class AppTextStyle {
  TextStyle get h1Title => _base.copyWith(
        fontSize: 35,
        fontWeight: FontWeight.bold,
      );

  TextStyle get title => _base.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subTitle => _base.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  TextStyle get buttonStyle => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );

  TextStyle get menuStyle => _base.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w100,
      );

  TextStyle get description => const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
      );

  final TextStyle _base = const TextStyle(
    color: AppColors.textButton,
    fontFamily: "bebasNeue"
  );
}
