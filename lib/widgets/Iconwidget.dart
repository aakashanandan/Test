import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final double iconSize;
  final TextStyle? textStyle;

  const IconTextWidget({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor = Colors.blue,
    this.iconSize = 30.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: textStyle ?? const TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
