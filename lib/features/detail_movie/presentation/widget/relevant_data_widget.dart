import 'package:flutter/cupertino.dart';
import 'package:yo_me_animo/core/widget/custom_animate_container.dart';

class RelevantDataWidget extends StatelessWidget {
  final String value;
  final String label;
  final FromAnimation fromAnimation;

  const RelevantDataWidget({
    Key? key,
    required this.value,
    required this.label,
    this.fromAnimation = FromAnimation.fromRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAnimateContainer(
      fromAnimation: fromAnimation,
      child: Column(
        children: [
          Text("$value%", style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w200)),
        ],
      ),
    );
  }
}
