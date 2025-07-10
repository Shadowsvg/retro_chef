import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/retro_container.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget({
    super.key,
    required this.instruction,
    required this.index,
  });
  final int index;
  final String instruction;
  @override
  Widget build(BuildContext context) {
    return RetroContainer(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InstructionIndex(index: index),

          SizedBox(width: 8),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                instruction,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InstructionIndex extends StatelessWidget {
  const InstructionIndex({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: RetroColors.textFieldBackground,
        shape: BoxShape.circle,
        border: Border.all(color: RetroColors.pinkRed, width: 2),
      ),
      child: Text(
        index.toString(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: RetroColors.pinkRed,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
