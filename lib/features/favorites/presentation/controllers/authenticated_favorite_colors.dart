import 'package:color_generator/features/auth/presentation/controllers/auth_state_controller.dart';
import 'package:color_generator/features/favorites/data/favorite_colors_repository.dart';
import 'package:color_generator/features/favorites/domain/favorite_color.dart';
import 'package:color_generator/features/favorites/domain/mappers/favorite_colors_stream_mapper.dart';
import 'package:color_generator/features/favorites/presentation/controllers/favorite_colors_controller.dart';
import 'package:color_generator/features/favorites/presentation/controllers/selected_color_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'i_colors_controller.dart';

class AuthenticatedFavoriteColorsController extends IColorsController {
  @override
  Future<void> toggle({
    required Color color,
    required Ref ref,
  }) async {
    final colors = await ref.read(favoriteColorsControllerProvider.future);
    final repository = ref.read(favoriteColorsRepositoryProvider);
    final user = await ref.read(authStateControllerProvider.future);

    if (user != null) {
      final userId = user.uid;

      if (!colors.contains(color)) {
        repository.addFavoriteColor(
          color: FavoriteColor(color.value.toString()),
          id: DateTime.now().millisecondsSinceEpoch,
          userId: user.uid,
        );
      } else {
        repository.removeFavoriteColor(
          id: color.value,
          userId: userId,
        );

        ref.read(selectedColorControllerProvider.notifier).unselect(color);
      }
    }
  }

  @override
  Stream<List<Color>> getAllFavoriteColors({required Ref ref}) {
    final user = ref.read(authStateControllerProvider).value;
    final repository = ref.read(favoriteColorsRepositoryProvider);

    return user != null
        ? repository.getAllFavoriteColors(user.uid).toColorsList()
        : Stream.empty();
  }
}
