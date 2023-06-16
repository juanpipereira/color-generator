import 'package:flutter/material.dart';

import '../../../core/constants/custom_gradient.dart';

class ShadedText extends StatelessWidget {
  const ShadedText(
    this.text, {
    this.fontSize,
    super.key,
  });

  static const double _fontHeight = 1.25;
  static const double _fontSize = 32.0;
  static const double _horizontalPadding = 40.0;
  static const double _verticalPadding = 5.0;

  final double? fontSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: CustomGradient.blackShaded.colors,
          stops: CustomGradient.blackShaded.stops,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
        vertical: _verticalPadding,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize ?? _fontSize,
          height: _fontHeight,
        ),
      ),
    );
  }
}
