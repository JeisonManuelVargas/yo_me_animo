import 'package:flutter/cupertino.dart';
import 'package:yo_me_animo/core/util/app_text_style.dart';
import 'package:yo_me_animo/core/extension/context_extension.dart';

class TitleCustom extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final CrossAxisAlignment? crossAxisAlignment;

  const TitleCustom({
    super.key,
    this.crossAxisAlignment,
    required this.firstTitle,
    required this.secondTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          firstTitle,
          style: AppTextStyle().subTitle,
        ),
        SizedBox(height: context.sizeHeight(0.01)),
        Text(
          secondTitle,
          style: AppTextStyle().title,
        ),
      ],
    );
  }
}
