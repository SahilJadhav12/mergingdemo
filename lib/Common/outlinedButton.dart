import 'package:flutter/material.dart';

class CommonOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;
  final double borderRadius;

  const CommonOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 12.0, // Default rounded corner
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: textColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
    );
  }
}
