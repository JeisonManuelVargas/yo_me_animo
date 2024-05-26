import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/util/app_color.dart';
import 'package:yo_me_animo/core/util/app_text_style.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validation;

  const CustomInput({
    Key? key,
    this.validation,
    required this.icon,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool isActive = false;
  final _myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _myFocusNode.addListener(() => setState(() {
          isActive = _myFocusNode.hasFocus;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isActive ? Colors.white38 : AppColors.primary,
      ),
      child: TextFormField(
        focusNode: _myFocusNode,
        validator: widget.validation,
        controller: widget.controller,
        style: AppTextStyle().buttonStyle,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: Icon(widget.icon),
          hintStyle: AppTextStyle().buttonStyle,
          labelStyle: AppTextStyle().buttonStyle,
        ),
      ),
    );
  }
}
