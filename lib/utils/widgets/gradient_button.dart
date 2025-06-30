import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const GradientButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [RetroColors.pinkRed, RetroColors.accentEnd],
          ),
        ),
        child: Center(
          child: Text(label, style: Theme.of(context).textTheme.labelLarge),
        ),
      ),
    );
  }
}
