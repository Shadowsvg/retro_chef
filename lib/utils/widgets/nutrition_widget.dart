import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/retro_container.dart';

class NutritionWidget extends StatelessWidget {
  const NutritionWidget({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
  });
  final IconData icon;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RetroContainer(
        backgroundColor: RetroColors.textFieldBackground,
        padding: const EdgeInsets.all(12),
        child: Column(
          spacing: 4,
          children: [
            Icon(icon, color: RetroColors.highlight, size: 16),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: RetroColors.grayShade,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
