import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;
  final Color backgroundColor;
  final double borderRadius;
  final double iconSize;
  final double padding;

  const CommonIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 12.0,
    this.iconSize = 24.0,
    this.padding = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor, size: iconSize),
        onPressed: onPressed,
        padding: EdgeInsets.all(padding),
        splashRadius: iconSize + 8, // Optional ripple effect radius
      ),
    );
  }
}
