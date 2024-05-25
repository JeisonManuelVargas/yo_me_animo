import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/util/app_color.dart';

ScaffoldFeatureController customSnackBar(
  BuildContext context, {
  bool isSuccess = false,
  required String content,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: isSuccess ? AppColors.second : AppColors.error,
    content: Text(
      content,
      style: const TextStyle(color: AppColors.white, letterSpacing: 0.5),
    ),
  ));
}
