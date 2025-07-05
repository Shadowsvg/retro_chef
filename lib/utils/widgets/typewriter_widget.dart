import 'dart:async';

import 'package:flutter/material.dart';

class TypewriterWidget extends StatefulWidget {
  const TypewriterWidget({
    super.key,
    required this.text,
    this.style,
    this.gradient,
  });

  final String text;
  final TextStyle? style;
  final Gradient? gradient;

  @override
  State<TypewriterWidget> createState() => _TypewriterWidgetState();
}

class _TypewriterWidgetState extends State<TypewriterWidget> {
  Timer? timer;
  String textToDisplay = '';
  int charIndex = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (charIndex == widget.text.length) {
        timer.cancel();
      } else {
        setState(() {
          textToDisplay += widget.text[charIndex];
          charIndex++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gradient != null) {
      return ShaderMask(
        shaderCallback: (bounds) => widget.gradient!.createShader(bounds),
        blendMode: BlendMode.srcIn,
        child: Text(textToDisplay, style: widget.style),
      );
    } else {
      return Text(textToDisplay, style: widget.style);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
