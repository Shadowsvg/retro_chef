import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/retro_container.dart';

class SuggestedPromptsWidget extends StatelessWidget {
  const SuggestedPromptsWidget({super.key, required this.prompt});
  final String prompt;

  @override
  Widget build(BuildContext context) {
    return RetroContainer(
      backgroundColor: RetroColors.accentEnd,
      borderColor: RetroColors.pinkRed,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Text(
        prompt,
        textAlign: TextAlign.center,
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
