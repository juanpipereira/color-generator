import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task/features/favorites/presentation/controllers/selected_color_controller.dart';

class ColorPreview extends StatelessWidget {
  const ColorPreview({super.key});

  static const double _elevation = 5.0;
  static const double _size = 200.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      elevation: _elevation,
      child: Consumer(
        builder: (context, ref, _) {
          final color = ref.watch(selectedColorControllerProvider);
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              color: color ?? Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            height: _size,
            width: _size,
            child: Image.asset(
              'assets/images/profile-pic-background-removed.png',
            ),
          );
        },
      ),
    );
  }
}
