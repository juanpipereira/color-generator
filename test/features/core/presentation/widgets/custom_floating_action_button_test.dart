import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/features/core/presentation/widgets/custom_floating_action_button.dart';

main() {
  group(
    'Simple Custom Floating Action Button',
    () {
      testWidgets(
        'should show the icon',
        (tester) async {
          const icon = Icons.abc;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                floatingActionButton: CustomFloatingActionButton(
                  heroTag: 'hero-tag',
                  icon: icon,
                  onPressed: () {},
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.byIcon(icon), findsOneWidget);
        },
      );

      testWidgets(
        'should have a hero tag',
        (tester) async {
          const heroTag = 'hero-tag';

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                floatingActionButton: CustomFloatingActionButton(
                  heroTag: heroTag,
                  icon: Icons.key,
                  onPressed: () {},
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is CustomFloatingActionButton &&
                    widget.heroTag == heroTag;
              },
            ),
            findsOneWidget,
          );
        },
      );
    },
  );

  group(
    'Custom Floating Action Button With States',
    () {
      testWidgets(
        'should show the active data if active is true',
        (tester) async {
          const activeTooltip = 'active';
          const inactiveTooltip = 'inactive';

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                floatingActionButton: CustomFloatingActionButton.withStates(
                  activeIcon: Icons.check,
                  activeTooltip: activeTooltip,
                  heroTag: 'hero-tag',
                  inactiveIcon: Icons.close,
                  inactiveTooltip: inactiveTooltip,
                  isActive: true,
                  onPressed: () {},
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.byIcon(Icons.check), findsOneWidget);
          expect(find.byIcon(Icons.close), findsNothing);
          expect(find.byTooltip(activeTooltip), findsOneWidget);
          expect(find.byTooltip(inactiveTooltip), findsNothing);
        },
      );

      testWidgets(
        'should show the inactive data if active is false',
        (tester) async {
          const activeTooltip = 'active';
          const inactiveTooltip = 'inactive';

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                floatingActionButton: CustomFloatingActionButton.withStates(
                  activeIcon: Icons.check,
                  activeTooltip: activeTooltip,
                  heroTag: 'hero-tag',
                  inactiveIcon: Icons.close,
                  inactiveTooltip: inactiveTooltip,
                  isActive: false,
                  onPressed: () {},
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.byIcon(Icons.check), findsNothing);
          expect(find.byIcon(Icons.close), findsOneWidget);
          expect(find.byTooltip(activeTooltip), findsNothing);
          expect(find.byTooltip(inactiveTooltip), findsOneWidget);
        },
      );
    },
  );
}
