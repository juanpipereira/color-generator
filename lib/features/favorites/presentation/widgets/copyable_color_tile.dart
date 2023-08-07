import 'package:color_generator/features/core/domain/extensions/color_extension.dart';
import 'package:color_generator/features/favorites/presentation/widgets/copyable_color_button.dart';
import 'package:flutter/material.dart';

class CopyableColorTile extends StatelessWidget {
  const CopyableColorTile({
    required this.color,
    super.key,
  });

  static const double _borderRadius = 50.0;
  static const double _borderWidth = 1.4;
  static const double _contentPaddingLeft = 16.0;
  static const double _contentPaddingRight = 4.0;
  static const double _defaultHeight = 80.0;
  static const double _defaultWidth = 175.0;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _defaultHeight,
      width: _defaultWidth,
      child: Center(
        child: ListTile(
          contentPadding: const EdgeInsets.only(
            left: _contentPaddingLeft,
            right: _contentPaddingRight,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: _borderWidth,
            ),
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          title: Text(
            color.toHex(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: CopyableColorButton(color: color),
        ),
      ),
    );
  }
}
