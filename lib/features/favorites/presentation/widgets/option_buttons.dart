import 'package:color_generator/features/core/presentation/widgets/custom_outlined_icon_button.dart';
import 'package:color_generator/features/favorites/presentation/controllers/favorite_colors_controller.dart';
import 'package:color_generator/features/favorites/presentation/controllers/selected_color_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionButtons extends ConsumerWidget {
  const OptionButtons({
    super.key,
    required this.selectedColor,
  });

  static const double _buttonsSeparation = 30.0;

  final Color selectedColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomOutlinedIconButton(
          icon: Icons.replay_rounded,
          label: 'Clear',
          onPressed: () => ref.invalidate(selectedColorControllerProvider),
          tooltip: 'Clear the selected color',
        ),
        const SizedBox(width: _buttonsSeparation),
        CustomOutlinedIconButton.error(
          icon: Icons.delete_outline_rounded,
          label: 'Remove',
          onPressed: () async {
            await ref
                .read(favoriteColorsControllerProvider.notifier)
                .toggle(selectedColor);
          },
          tooltip: 'Remove the color from favorites',
        ),
      ],
    );
  }
}
