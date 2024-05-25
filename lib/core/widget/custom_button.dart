import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/util/app_color.dart';
import 'package:yo_me_animo/core/util/app_text_style.dart';

enum CustomButtonEnum {
  enable,
  disable,
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final CustomButtonEnum state;

  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.state = CustomButtonEnum.enable,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: _generateColor(),
      shadowColor: AppColors.disable,
      borderRadius: BorderRadius.circular(40),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(label, style: AppTextStyle().buttonStyle),
        ),
      ),
    );
  }

  Color _generateColor() {
    switch (state) {
      case CustomButtonEnum.enable:
        return AppColors.primary;
      case CustomButtonEnum.disable:
        return AppColors.disable;
    }
  }
}
