import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/features/home/domain/color_filters.dart';
import 'package:test_task/features/home/presentation/controllers/color_filters_controller.dart';
import 'package:test_task/features/home/presentation/widgets/color_filter_tile.dart';

const _filter = ColorFilters.grayTones;

class _MockColorFiltersController extends ColorFiltersController {
  @override
  ColorFilters? build() => _filter;
}

void main() {
  testWidgets(
    'should show the data of the seleted filter',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            colorFiltersControllerProvider
                .overrideWith(_MockColorFiltersController.new),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: ColorFilterTile(filter: _filter),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(_filter.title), findsOneWidget);
      expect(find.text(_filter.subtitle), findsOneWidget);
    },
  );

  testWidgets(
    'should show the filter as checked if selected',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            colorFiltersControllerProvider
                .overrideWith(_MockColorFiltersController.new),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: ColorFilterTile(filter: _filter),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) {
            return widget is CheckboxListTile && (widget.value ?? false);
          },
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'should show the filter as unchecked if not selected',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            colorFiltersControllerProvider
                .overrideWith(_MockColorFiltersController.new),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: ColorFilterTile(filter: ColorFilters.onlyMaterialColors),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) {
            return widget is CheckboxListTile && (widget.value ?? false);
          },
        ),
        findsNothing,
      );
    },
  );
}
