import 'package:flutter/material.dart';

class CustomToast {
  static void show(
      BuildContext context, {
        required String message,
        double fontSize = 14.0,
        Color textColor = Colors.white,
        Color backgroundColor = Colors.black87,
        int? seconds,
      }) {
    // Check if the context is still valid and mounted
    if (!context.mounted) return;

    // Try to get the overlay, but handle the case where it might not exist
    final overlay = Overlay.maybeOf(context);
    if (overlay == null) {
      // If no overlay is available, schedule the toast for the next frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          show(context,
            message: message,
            fontSize: fontSize,
            textColor: textColor,
            backgroundColor: backgroundColor,
            seconds: seconds,
          );
        }
      });
      return;
    }

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 100,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: _ToastWidget(
            message: message,
            fontSize: fontSize,
            textColor: textColor,
            backgroundColor: backgroundColor,
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: seconds ?? 2)).then((_) {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}

class _ToastWidget extends StatelessWidget {
  final String message;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;

  const _ToastWidget({
    required this.message,
    required this.fontSize,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          message,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}