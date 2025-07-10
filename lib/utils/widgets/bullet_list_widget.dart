import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class BulletListWidget extends StatelessWidget {
  const BulletListWidget({super.key, required this.proTipsList});

  final List<String> proTipsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: proTipsList.map((tip) {
        return Row(
          children: [
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: RetroColors.highlight,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                tip,
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
