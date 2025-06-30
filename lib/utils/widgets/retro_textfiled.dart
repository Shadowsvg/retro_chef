import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class RetroTextfiled extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  const RetroTextfiled({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
  });

  @override
  State<RetroTextfiled> createState() => _RetroTextfiledState();
}

class _RetroTextfiledState extends State<RetroTextfiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 12),
        TextFormField(
          controller: widget.controller,
          cursorColor: RetroColors.white,
          decoration: InputDecoration(
            filled: true,
            fillColor: RetroColors.textFieldBackground,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: RetroColors.grayShade,
              fontWeight: FontWeight.normal,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: RetroColors.secondary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: RetroColors.error, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: RetroColors.grayShade, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: RetroColors.pinkRed, width: 2),
            ),
            prefixIcon: widget.prefixIcon,
            prefixIconColor: RetroColors.grayShade,
            suffixIcon: widget.suffixIcon,
            suffixIconColor: RetroColors.grayShade,
          ),
        ),
      ],
    );
  }
}
