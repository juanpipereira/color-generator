import 'package:color_generator/features/favorites/domain/favorite_color.dart';
import 'package:flutter/material.dart';

extension ColorsListMapper on Iterable<Color> {
  List<FavoriteColor> toFavoriteColors() =>
      map((c) => FavoriteColor(c.value.toString())).toList();
}
