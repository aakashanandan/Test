import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Color iconColor;
  final double iconSize;
  final Color titleColor;
  final FontWeight titleWeight;
  final double titleSize;
  final VoidCallback? onTap;

  const ListTileWidget({
    Key? key,
    required this.leadingIcon,
    required this.title,
    this.iconColor = Colors.black,
    this.iconSize = 20.0,
    this.titleColor = Colors.black,
    this.titleWeight = FontWeight.w500,
    this.titleSize = 13.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: iconColor,
        size: iconSize,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontWeight: titleWeight,
          fontSize: titleSize,
        ),
      ),
      onTap: onTap, // Optional onTap handler for interaction
    );
  }
}
