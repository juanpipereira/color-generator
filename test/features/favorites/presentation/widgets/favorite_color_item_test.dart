import 'package:color_generator/features/favorites/presentation/widgets/favorite_color_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Favorite Color Item',
    () {
      testWidgets(
        'should show a container with the given color',
        (tester) async {
          const color = Colors.red;
          const maxSize = 20.0;
          const minSize = 30.0;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: FavoriteColorItem(
                  color: color,
                  maxSize: maxSize,
                  minSize: minSize,
                  onTap: () {},
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is Container &&
                    widget.decoration != null &&
                    (widget.decoration as BoxDecoration).color == color;
              },
            ),
            findsOneWidget,
          );
        },
      );
    },
  );

  group(
    'Favorite Color Item Selection',
    () {
      testWidgets(
        'should be drawn with max size if selected',
        (tester) async {
          const color = Colors.red;
          const maxSize = 20.0;
          const minSize = 30.0;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: FavoriteColorItem(
                  color: color,
                  isSelected: true,
                  maxSize: maxSize,
                  minSize: minSize,
                  onTap: () {},
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.byWidgetPredicate(
              (widget) {
                if (widget is! Container) return false;
                final width = widget.constraints?.widthConstraints();
                if (width == null) return false;

                return (width.minWidth == width.maxWidth) &&
                    (width.minWidth == maxSize);
              },
            ),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'should be drawn with min size if not selected',
        (tester) async {
          const color = Colors.red;
          const maxSize = 20.0;
          const minSize = 30.0;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: FavoriteColorItem(
                  color: color,
                  isSelected: false,
                  maxSize: maxSize,
                  minSize: minSize,
                  onTap: () {},
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.byWidgetPredicate(
              (widget) {
                if (widget is! Container) return false;
                final width = widget.constraints?.widthConstraints();
                if (width == null) return false;

                return (width.minWidth == width.maxWidth) &&
                    (width.minWidth == minSize);
              },
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}
