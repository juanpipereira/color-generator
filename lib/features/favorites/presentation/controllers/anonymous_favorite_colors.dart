import 'package:color_generator/features/favorites/presentation/controllers/favorite_colors_controller.dart';
import 'package:color_generator/features/favorites/presentation/controllers/i_colors_controller.dart';
import 'package:color_generator/features/favorites/presentation/controllers/selected_color_controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/src/framework.dart';

class AnonymousFavoriteColors extends IColorsController {
  List<Color> _toggleColorInList({
    required List<Color> colors,
    required Color color,
    required Ref ref,
  }) {
    final newColors = [...colors];

    if (newColors.contains(color)) {
      newColors.remove(color);
      ref.read(selectedColorControllerProvider.notifier).unselect(color);
    } else {
      newColors.add(color);
    }

    return newColors;
  }

  @override
  Future<void> toggle({
    required Color color,
    required Ref ref,
  }) async {
    final colors = await ref.read(favoriteColorsControllerProvider.future);

    final newColors = _toggleColorInList(
      colors: colors,
      color: color,
      ref: ref,
    );

    ref.read(favoriteColorsControllerProvider.notifier).value = newColors;
  }

  @override
  Stream<List<Color>> getAllFavoriteColors({required Ref ref}) {
    return Stream.value([]);
  }
}
