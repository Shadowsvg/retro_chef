import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/app_constants.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
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
          child: Column(children: [

      ],),
        ),
      ],
    );
  }
}
