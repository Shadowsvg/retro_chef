import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class CheckboxTitleWidget extends StatefulWidget {
  const CheckboxTitleWidget({super.key, required this.title});
  final String title;

  @override
  State<CheckboxTitleWidget> createState() => _CheckboxTitleWidgetState();
}

class _CheckboxTitleWidgetState extends State<CheckboxTitleWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            activeColor: RetroColors.pinkRed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(4)),
            ),
            splashRadius: 40,
            side: BorderSide(
              color: RetroColors.secondary,
              width: 2,
              strokeAlign: 0,
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (value) {
              setState(() {
                isSelected = value!;
              });
            },
          ),
          SizedBox(width: 8),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: isSelected ? RetroColors.grayShade : RetroColors.white,
              decoration: isSelected
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
