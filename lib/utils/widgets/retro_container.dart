import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class RetroContainer extends StatelessWidget {
  const RetroContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.onTap,
  });

  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor ?? RetroColors.suggestionBox,
          border: Border.all(
            color: borderColor ?? RetroColors.secondary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
        child: child,
      ),
    );
  }
}
