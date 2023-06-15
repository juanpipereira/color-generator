import 'package:flutter/material.dart';
import 'package:test_task/features/home/presentation/widgets/color_filter_tile.dart';

import '../../domain/color_filters.dart';

class ColorFiltersDialog extends StatelessWidget {
  const ColorFiltersDialog({super.key});

  static const double _bottomPadding = 10.0;
  static const double _rightPadding = 15.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(
        bottom: _bottomPadding,
        right: _rightPadding,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          ColorFilters.values.length,
          (index) => ColorFilterTile(
            filter: ColorFilters.values[index],
          ),
        ),
      ),
      title: const Text('Choose a filter'),
    );
  }
}
