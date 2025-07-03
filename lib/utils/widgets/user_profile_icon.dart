import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class UserProfileIcon extends StatelessWidget {
  const UserProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: RetroColors.accentStart,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Icon(FontAwesomeIcons.solidCircleUser),
    );
  }
}
