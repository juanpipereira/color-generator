import 'package:color_generator/features/favorites/domain/favorite_color.dart';
import 'package:flutter/material.dart';

extension FavoriteColorsListMapper on Iterable<FavoriteColor> {
  List<Color> toColorList() {
    return map((favoriteColor) {
      final color = Color(int.parse(favoriteColor.code));
      return color;
    }).toList();
  }
}
