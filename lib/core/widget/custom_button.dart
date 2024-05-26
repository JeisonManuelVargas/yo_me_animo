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
  final double? verticalPadding;

  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.verticalPadding,
    this.state = CustomButtonEnum.enable,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: _generateColor(),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: verticalPadding??5),
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
