import 'selected_color_controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorite_colors_controller.g.dart';

@Riverpod(keepAlive: true)
class FavoriteColorsController extends _$FavoriteColorsController {
  @override
  List<Color> build() => [];

  void toggle(Color color) {
    final colors = <Color>[];
    colors.addAll(state);

    if (state.contains(color)) {
      colors.remove(color);
      ref.read(selectedColorControllerProvider.notifier).unselect(color);
    } else {
      colors.add(color);
    }
    state = colors;
  }
}
