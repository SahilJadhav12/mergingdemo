import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;

  const CommonElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
