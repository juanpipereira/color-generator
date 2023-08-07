import 'package:color_generator/features/home/domain/color_filters.dart';
import 'package:color_generator/features/home/presentation/widgets/color_filter_tile.dart';
import 'package:color_generator/features/home/presentation/widgets/color_filters_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'should show the title',
    (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ColorFiltersDialog(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Choose a filter'), findsOneWidget);
    },
  );

  testWidgets(
    'should show a list of filters',
    (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ColorFiltersDialog(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byType(ColorFilterTile),
        findsNWidgets(ColorFilters.values.length),
      );
    },
  );
}
