import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${title.toUpperCase()}:',
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: RetroColors.secondary,
      ),
    );
  }
}
