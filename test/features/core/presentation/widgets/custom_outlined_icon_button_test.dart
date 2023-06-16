import 'package:color_generator/features/core/presentation/widgets/custom_outlined_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group(
    'Simple Custom Outlined Icon Button',
    () {
      testWidgets(
        'should show the icon of the icon button',
        (tester) async {
          const icon = Icons.abc;

          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: CustomOutlinedIconButton(
                  icon: icon,
                  label: '',
                  onPressed: null,
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.byIcon(icon), findsOneWidget);
        },
      );

      testWidgets(
        'should show the label',
        (tester) async {
          const label = 'label';

          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: CustomOutlinedIconButton(
                  icon: Icons.abc,
                  label: label,
                  onPressed: null,
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.text(label), findsOneWidget);
        },
      );
    },
  );

  group(
    'Custom Outlined Icon Button With Error',
    () {
      testWidgets(
        'should set the error flag as true',
        (tester) async {
          const icon = Icons.abc;

          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: CustomOutlinedIconButton.error(
                  icon: icon,
                  label: '',
                  onPressed: null,
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is CustomOutlinedIconButton &&
                    widget.isError == true;
              },
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}
