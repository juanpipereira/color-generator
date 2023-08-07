import 'package:color_generator/features/core/constants/custom_gradient.dart';
import 'package:color_generator/features/home/presentation/widgets/shaded_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'should show the given text',
    (tester) async {
      const title = 'Title';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            floatingActionButton: ShadedText(title),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(title), findsOneWidget);
    },
  );

  testWidgets(
    'should show the background of the text with gradient',
    (tester) async {
      const title = 'Title';
      final gradient = LinearGradient(
        colors: CustomGradient.blackShaded.colors,
        stops: CustomGradient.blackShaded.stops,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            floatingActionButton: ShadedText(title),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) {
            return widget is Container &&
                widget.decoration is BoxDecoration &&
                (widget.decoration as BoxDecoration).gradient == gradient;
          },
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'should show text in given size',
    (tester) async {
      const title = 'Title';
      const fontSize = 50.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            floatingActionButton: ShadedText(
              title,
              fontSize: fontSize,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) {
            return widget is Text &&
                widget.style is TextStyle &&
                widget.style?.fontSize == fontSize;
          },
        ),
        findsOneWidget,
      );
    },
  );
}
