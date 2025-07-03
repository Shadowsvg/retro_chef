import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/utils/constants/app_constants.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class GenerateRecipeTextfield extends StatefulWidget {
  const GenerateRecipeTextfield({super.key});

  @override
  State<GenerateRecipeTextfield> createState() =>
      _GenerateRecipeTextfieldState();
}

class _GenerateRecipeTextfieldState extends State<GenerateRecipeTextfield> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: RetroColors.grayShade,
      cursorHeight: 16,
      decoration: InputDecoration(
        prefixIcon: Icon(
          FontAwesomeIcons.greaterThan,
          size: 12,
          color: RetroColors.accentStart,
        ),
        prefixIconConstraints: BoxConstraints(),
        suffixIconConstraints: BoxConstraints(),
        suffixIcon: _suffixIcons(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        hint: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            AppConstants.insertIngredientsText,
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: RetroColors.grayShade),
          ),
        ),
      ),
    );
  }

  Widget _suffixIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(FontAwesomeIcons.solidCircleXmark, size: 16),
        SizedBox(width: 8),
        Icon(
          FontAwesomeIcons.microphone,
          size: 16,
          color: RetroColors.accentStart,
        ),
      ],
    );
  }
}
