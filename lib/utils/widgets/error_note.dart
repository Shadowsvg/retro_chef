import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class ErrorNote extends StatelessWidget {
  final String errorMessage;
  const ErrorNote({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: RetroColors.errorNote,
        border: Border.all(color: RetroColors.errorNoteBorder, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.circleExclamation, size: 16),
          SizedBox(width: 8),
          Text(errorMessage, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
