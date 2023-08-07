import 'package:color_generator/features/favorites/domain/favorite_color.dart';
import 'package:color_generator/features/favorites/domain/mappers/favorite_colors_list_mapper.dart';
import 'package:flutter/material.dart';

extension FavoriteColorsStreamMapper on Stream<Iterable<FavoriteColor>> {
  Stream<List<Color>> toColorsList() => map((e) => e.toColorList());
}
