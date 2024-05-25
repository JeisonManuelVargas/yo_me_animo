import 'package:flutter/cupertino.dart';
import 'package:yo_me_animo/core/widget/custom_animate_container.dart';

class ContainerWidget extends StatelessWidget {
  final String late;
  final TextStyle style;
  final TextAlign textAlign;

  const ContainerWidget({
    super.key,
    required this.late,
    required this.style,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimateContainer(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        child: Text(
          late,
          style: style,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
