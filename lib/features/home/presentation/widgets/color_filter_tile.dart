import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task/features/home/domain/color_filters.dart';

import '../controllers/color_filters_controller.dart';

class ColorFilterTile extends ConsumerWidget {
  const ColorFilterTile({
    super.key,
    required this.filter,
  });

  final ColorFilters filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      onChanged: (_) =>
          ref.read(colorFiltersControllerProvider.notifier).setState = filter,
      title: Text(filter.title),
      subtitle: Text(
        filter.subtitle,
        style: const TextStyle(fontWeight: FontWeight.w300),
      ),
      value: ref.watch(
        colorFiltersControllerProvider.select(
          (selectedFilter) => selectedFilter == filter,
        ),
      ),
    );
  }
}
