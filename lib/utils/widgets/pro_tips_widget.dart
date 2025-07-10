import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/utils/constants/app_constants.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/bullet_list_widget.dart';
import 'package:retro_chef/utils/widgets/retro_container.dart';
import 'package:retro_chef/utils/widgets/section_title_widget.dart';

class ProTipsWidget extends StatelessWidget {
  const ProTipsWidget({super.key, required this.proTipsList});
  final List<String> proTipsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(title: AppConstants.chefTips),
        SizedBox(height: 16),
        RetroContainer(
          borderColor: RetroColors.highlight,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LightBulbIcon(),
                  SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      AppConstants.proTips,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: RetroColors.highlight,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              BulletListWidget(proTipsList: proTipsList),
            ],
          ),
        ),
      ],
    );
  }
}

class LightBulbIcon extends StatelessWidget {
  const LightBulbIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: RetroColors.highlight,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),

      child: Icon(
        FontAwesomeIcons.solidLightbulb,
        color: RetroColors.background,
        size: 18,
      ),
    );
  }
}
