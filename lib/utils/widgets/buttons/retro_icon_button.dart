import 'package:flutter/material.dart';
import 'package:retro_chef/utils/widgets/retro_container.dart';

class RetroIconButton extends StatelessWidget {
  const RetroIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.borderColor,
    this.backgroundColor,
    this.borderRadius,
  });
  final IconData icon;
  final Color? iconColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RetroContainer(
        backgroundColor: backgroundColor,
        borderRadius: borderRadius ?? 4,
        borderColor: borderColor,

        padding: EdgeInsets.all(10),

        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
