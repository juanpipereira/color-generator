import 'package:color_generator/features/core/presentation/widgets/custom_floating_action_button.dart';
import 'package:color_generator/features/favorites/presentation/controllers/favorite_colors_controller.dart';
import 'package:color_generator/features/home/presentation/controllers/background_color_controller.dart';
import 'package:color_generator/features/home/presentation/widgets/floating_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

const _color = Colors.pink;

class _MockBackgroundColorController extends BackgroundColorController {
  @override
  Color? build() => _color;
}

class _MockNullBackgroundColorController extends BackgroundColorController {
  @override
  Color? build() => null;
}

class _MockFavoriteColorsController extends FavoriteColorsController {
  @override
  List<Color> build() => [_color];
}

void main() {
  group(
    'Floating Action Buttons Items',
    () {
      testWidgets(
        'should show filter and favorites floating action buttons if background color is set',
        (tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                backgroundColorControllerProvider
                    .overrideWith(_MockBackgroundColorController.new)
              ],
              child: const MaterialApp(
                home: Scaffold(
                  floatingActionButton: FloatingActionButtons(),
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.byType(CustomFloatingActionButton), findsNWidgets(2));
        },
      );

      testWidgets(
        'should show only filter floating action button if background color is not set',
        (tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                backgroundColorControllerProvider
                    .overrideWith(_MockNullBackgroundColorController.new)
              ],
              child: const MaterialApp(
                home: Scaffold(
                  floatingActionButton: FloatingActionButtons(),
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.byType(CustomFloatingActionButton), findsOneWidget);
        },
      );
    },
  );

  group(
    'Correct Favorite Floating Action Button',
    () {
      testWidgets(
        'should show the favorites floating action button as active if background color is in favorites',
        (tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                backgroundColorControllerProvider
                    .overrideWith(_MockBackgroundColorController.new),
                favoriteColorsControllerProvider
                    .overrideWith(_MockFavoriteColorsController.new),
              ],
              child: const MaterialApp(
                home: Scaffold(
                  floatingActionButton: FloatingActionButtons(),
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is CustomFloatingActionButton &&
                    widget.icon == Icons.favorite_rounded;
              },
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should show the favorites floating action button as inactive if background color is not in favorites',
        (tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                backgroundColorControllerProvider
                    .overrideWith(_MockBackgroundColorController.new)
              ],
              child: const MaterialApp(
                home: Scaffold(
                  floatingActionButton: FloatingActionButtons(),
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is CustomFloatingActionButton &&
                    widget.icon == Icons.favorite_outline_rounded;
              },
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}
