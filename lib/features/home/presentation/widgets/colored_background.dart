import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/background_color_controller.dart';
import '../controllers/color_filters_controller.dart';

class ColoredBackground extends ConsumerWidget {
  const ColoredBackground({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColorFilter = ref.watch(colorFiltersControllerProvider);

    return InkWell(
      onTap: () => ref
          .read(backgroundColorControllerProvider.notifier)
          .setRandomColor(selectedColorFilter),
      child: Container(
        color: ref.watch(backgroundColorControllerProvider) ??
            Theme.of(context).colorScheme.surface,
        child: Center(child: child),
      ),
    );
  }
}
