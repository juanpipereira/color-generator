import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/utils/color_utils.dart';

enum ColorFilters {
  grayTones(
    apply: ColorFilters._filterGreyTones,
    title: 'Gray Tones',
    subtitle: 'Only gray tones',
  ),
  onlyMaterialColors(
    apply: ColorFilters._filterMaterial,
    title: 'Material Colors',
    subtitle: 'A set of 16 selected vivid colors',
  ),
  rgbTones(
    apply: ColorFilters._filterRgbTones,
    title: 'RGB Tones',
    subtitle: 'Only red, green and blue tones',
  );

  const ColorFilters({
    required this.apply,
    required this.title,
    required this.subtitle,
  });

  static const double _colorOpacity = 1.0;

  final Color Function() apply;
  final String title;
  final String subtitle;

  static Color _filterGreyTones() {
    final colorItem = ColorUtils.getRandomColorItem();
    return Color.fromRGBO(
      colorItem,
      colorItem,
      colorItem,
      _colorOpacity,
    );
  }

  static Color _filterMaterial() {
    final colorIndex = Random().nextInt(Colors.primaries.length);
    return Colors.primaries[colorIndex];
  }

  static Color _filterRgbTones() {
    const baseColors = [Colors.red, Colors.green, Colors.blue];

    final baseColor = baseColors[Random().nextInt(3)];
    final inputList = [baseColor.red, baseColor.green, baseColor.blue];
    final outputList = <int>[];

    for (var e in inputList) {
      final variability = (Random().nextInt(21) - 10) * 2;
      final value = e + variability;
      outputList.add(
        value > 255
            ? 255
            : value < 0
                ? 0
                : value,
      );
    }

    return Color.fromRGBO(
      outputList[0],
      outputList[1],
      outputList[2],
      _colorOpacity,
    );
  }
}
