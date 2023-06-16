import 'package:color_generator/features/home/presentation/controllers/background_color_controller.dart';
import 'package:color_generator/features/home/presentation/widgets/colored_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

const _color = Colors.pink;

class _MockBackgroundColorController extends BackgroundColorController {
  @override
  Color? build() => _color;
}

void main() {
  testWidgets(
    'should show the given child',
    (tester) async {
      const child = CircleAvatar();
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ColoredBackground(child: child),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byWidget(child), findsOneWidget);
    },
  );

  testWidgets(
    'should show the default theme color in a container',
    (tester) async {
      const color = Colors.amber;
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ThemeData.light().colorScheme.copyWith(
                        surface: color,
                      ),
                ),
                child: const ColoredBackground(),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) {
            return widget is Container && widget.color == color;
          },
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'should show a container with the color assigned by the background controller',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            backgroundColorControllerProvider
                .overrideWith(_MockBackgroundColorController.new),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: const ColoredBackground(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) {
            return widget is Container && widget.color == _color;
          },
        ),
        findsOneWidget,
      );
    },
  );
}
