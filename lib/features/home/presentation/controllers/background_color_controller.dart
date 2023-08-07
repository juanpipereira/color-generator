import 'package:color_generator/features/core/utils/color_utils.dart';
import 'package:color_generator/features/home/domain/color_filters.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'background_color_controller.g.dart';

@riverpod
class BackgroundColorController extends _$BackgroundColorController {
  set setState(Color? value) => state = value;

  @override
  Color? build() {
    return null;
  }

  void setRandomColor(ColorFilters? filter) {
    final newColor = ColorUtils.getRandomColor(filter: filter);
    state = newColor;
  }
}
