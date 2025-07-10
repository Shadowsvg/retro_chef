import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final TextStyle? labelStyle;
  const GradientButton({
    super.key,
    required this.label,
    required this.onTap,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [RetroColors.pinkRed, RetroColors.accentEnd],
          ),
        ),
        child: Text(
          label,
          style:
              labelStyle ??
              Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
