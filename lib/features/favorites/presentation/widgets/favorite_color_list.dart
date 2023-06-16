import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/favorite_colors_controller.dart';
import '../controllers/selected_color_controller.dart';
import 'favorite_color_item.dart';

class FavoriteColorList extends ConsumerWidget {
  const FavoriteColorList({super.key});

  static const double _maxSize = 60.0;
  static const double _minSize = 50.0;
  static const double _separatorWidth = 5.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteColors = ref.watch(favoriteColorsControllerProvider);
    return SizedBox(
      height: 80.0,
      width: double.infinity,
      child: ListView.separated(
        itemCount: favoriteColors.length,
        padding: EdgeInsets.symmetric(
          horizontal: (MediaQuery.of(context).size.width / 2) - _minSize / 2,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final selectedColor = ref.watch(selectedColorControllerProvider);
          return FavoriteColorItem(
            color: favoriteColors[index],
            isSelected: selectedColor == favoriteColors[index],
            onTap: () => ref
                .read(selectedColorControllerProvider.notifier)
                .select(favoriteColors[index]),
            maxSize: _maxSize,
            minSize: _minSize,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: _separatorWidth),
      ),
    );
  }
}
