import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class RetroOutlinedButton extends StatelessWidget {
  const RetroOutlinedButton({
    super.key,
    required this.label,
    this.style,
    required this.onTap,
  });
  final String label;
  final TextStyle? style;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: RetroColors.background,
        border: Border.all(color: RetroColors.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style:
            style ??
            Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
