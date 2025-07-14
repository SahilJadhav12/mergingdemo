import 'package:flutter/material.dart';

class CommonDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String? hintText;
  final ValueChanged<T?> onChanged;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;

  const CommonDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.value,
    this.hintText,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        hintText: hintText,
        hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      dropdownColor: backgroundColor,
      style: TextStyle(color: textColor),
      items: items.map<DropdownMenuItem<T>>((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            item.toString(),
            style: TextStyle(color: textColor),
          ),
        );
      }).toList(),
    );
  }
}
