import 'package:color_generator/features/core/presentation/widgets/custom_floating_action_button.dart';
import 'package:color_generator/features/favorites/presentation/controllers/favorite_colors_controller.dart';
import 'package:color_generator/features/home/presentation/controllers/background_color_controller.dart';
import 'package:color_generator/features/home/presentation/widgets/color_filters_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({super.key});

  static const double _buttonsSeparation = 15.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomFloatingActionButton(
          heroTag: 'choose-a-filter',
          icon: Icons.filter_alt,
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return const ColorFiltersDialog();
              },
            );
          },
          tooltip: 'Apply filters',
        ),
        const SizedBox(height: _buttonsSeparation),
        Consumer(
          builder: (_, ref, __) {
            final backgroundColor =
                ref.watch(backgroundColorControllerProvider);
            final isColorFavorite = ref.watch(
              favoriteColorsControllerProvider.select(
                (colors) => colors.contains(backgroundColor),
              ),
            );

            return backgroundColor != null
                ? CustomFloatingActionButton.withStates(
                    activeIcon: Icons.favorite_rounded,
                    activeTooltip: 'Remove from favorites',
                    heroTag: 'add-to-favorites',
                    inactiveIcon: Icons.favorite_border_rounded,
                    inactiveTooltip: 'Add to favorites',
                    isActive: isColorFavorite,
                    onPressed: () => ref
                        .read(favoriteColorsControllerProvider.notifier)
                        .toggle(backgroundColor),
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
