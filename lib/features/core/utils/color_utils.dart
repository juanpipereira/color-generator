import 'dart:math';

import 'package:flutter/material.dart';

import '../../home/domain/color_filters.dart';

class ColorUtils {
  static Color _getAnyRandomColor() {
    const colorItemsAmount = 3;
    const opacity = 1.0;
    final colorItems = <int>[];

    for (var i = 0; i < colorItemsAmount; i++) {
      colorItems.add(getRandomColorItem());
    }

    return Color.fromRGBO(
      colorItems[0],
      colorItems[1],
      colorItems[2],
      opacity,
    );
  }

  static int getRandomColorItem() {
    const colorItemLimit = 256;
    return Random().nextInt(colorItemLimit);
  }

  static Color getRandomColor({ColorFilters? filter}) {
    return filter != null ? filter.apply() : _getAnyRandomColor();
  }
}
