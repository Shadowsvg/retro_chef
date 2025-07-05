import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/utils/constants/app_constants.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/icon_title_widget.dart';
import 'package:retro_chef/utils/widgets/retro_container.dart';

class RecentRecipeWidget extends StatelessWidget {
  const RecentRecipeWidget({
    super.key,
    required this.recentRecipeTitle,
    required this.minutes,
    required this.difficulty,
  });

  final String recentRecipeTitle;
  final int minutes;
  final RecipeDifficulty difficulty;

  @override
  Widget build(BuildContext context) {
    return RetroContainer(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recentRecipeTitle,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: RetroColors.highlight,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconTitleWidget(
                    icon: FontAwesomeIcons.clock,
                    iconColor: RetroColors.grayShade,
                    title: '$minutes ${AppConstants.minutes.toUpperCase()}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: RetroColors.grayShade,
                    ),
                  ),
                  SizedBox(width: 8),
                  IconTitleWidget(
                    icon: FontAwesomeIcons.fire,
                    iconColor: RetroColors.grayShade,
                    title: difficulty.getDifficulty(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: RetroColors.grayShade,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            FontAwesomeIcons.angleRight,
            color: RetroColors.pinkRed,
            size: 12,
          ),
        ],
      ),
    );
  }
}
