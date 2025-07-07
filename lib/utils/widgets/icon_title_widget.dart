import 'package:flutter/material.dart';

class IconTitleWidget extends StatelessWidget {
  const IconTitleWidget({
    super.key,
    required this.icon,
    required this.title,
    this.style,
    this.iconColor,
    this.iconSize,
  });
  final IconData icon;
  final Color? iconColor;
  final String title;
  final TextStyle? style;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: iconSize ?? 12),
        SizedBox(width: 8),
        Text(
          title,
          style:
              style ??
              Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: iconColor,
              ),
        ),
      ],
    );
  }
}
