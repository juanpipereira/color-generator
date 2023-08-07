import 'package:flutter/material.dart';

class FavoriteColorItem extends StatelessWidget {
  const FavoriteColorItem({
    required this.color,
    this.isSelected = false,
    super.key,
    required this.onTap,
    required this.maxSize,
    required this.minSize,
  });

  static const double _width = 60.0;

  final Color color;
  final bool isSelected;
  final void Function()? onTap;
  final double maxSize;
  final double minSize;

  @override
  Widget build(BuildContext context) {
    final size = isSelected ? maxSize : minSize;

    return SizedBox(
      width: _width,
      child: Center(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          width: size,
          height: size,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
