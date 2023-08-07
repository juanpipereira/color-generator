import 'package:color_generator/features/favorites/presentation/controllers/favorite_colors_controller.dart';
import 'package:color_generator/features/favorites/presentation/controllers/selected_color_controller.dart';
import 'package:color_generator/features/favorites/presentation/widgets/favorite_color_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteColorList extends ConsumerWidget {
  const FavoriteColorList({super.key});

  static const int _alignmentFactor = 2;
  static const double _itemHeight = 80.0;
  static const double _maxSize = 60.0;
  static const double _minSize = 50.0;
  static const double _separatorWidth = 5.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteColors = ref.watch(favoriteColorsControllerProvider);

    return favoriteColors.when(
      data: (colors) => SizedBox(
        height: _itemHeight,
        width: double.infinity,
        child: ListView.separated(
          itemCount: colors.length,
          padding: EdgeInsets.symmetric(
            horizontal: (MediaQuery.of(
                      context,
                    ).size.width /
                    _alignmentFactor) -
                _minSize / _alignmentFactor,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final selectedColor = ref.watch(selectedColorControllerProvider);

            return FavoriteColorItem(
              color: colors[index],
              isSelected: selectedColor == colors[index],
              onTap: () => ref
                  .read(
                    selectedColorControllerProvider.notifier,
                  )
                  .select(
                    colors[index],
                  ),
              maxSize: _maxSize,
              minSize: _minSize,
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: _separatorWidth),
        ),
      ),
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
