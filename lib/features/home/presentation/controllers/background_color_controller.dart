import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/color_utils.dart';
import '../../domain/color_filters.dart';
part 'background_color_controller.g.dart';

@riverpod
class BackgroundColorController extends _$BackgroundColorController {
  @override
  Color? build() {
    return null;
  }

  set setState(Color? value) => state = value;

  void setRandomColor(ColorFilters? filter) {
    state = ColorUtils.getRandomColor(filter: filter);
  }
}
