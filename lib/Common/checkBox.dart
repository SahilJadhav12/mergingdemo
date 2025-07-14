import 'package:flutter/material.dart';

class CommonCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final Color checkboxColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;

  const CommonCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.checkboxColor = Colors.blue,
    this.textColor = Colors.black,
    this.borderRadius = 4.0,
    this.padding = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: checkboxColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          Flexible(
            child: Text(
              label,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
