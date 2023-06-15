import 'package:flutter/material.dart';

enum CustomGradient {
  blackShaded(
    colors: const [
      Colors.transparent,
      Color.fromRGBO(0, 0, 0, .65),
      Color.fromRGBO(0, 0, 0, .65),
      Colors.transparent,
    ],
    stops: const [
      0.0,
      0.15,
      0.85,
      1.0,
    ],
  );

  const CustomGradient({
    required this.colors,
    required this.stops,
  });

  final List<Color> colors;
  final List<double> stops;
}
