import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;

  const CommonTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textColor = Colors.black,
    this.borderColor = Colors.grey,
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: textColor),
        hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
      ),
    );
  }
}
