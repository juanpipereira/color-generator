import 'package:color_generator/features/core/presentation/widgets/custom_outlined_icon_button.dart';
import 'package:color_generator/features/favorites/presentation/widgets/option_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const amountOfWidgets = 2;
  testWidgets(
    'should show the two button children',
    (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: OptionButtons(selectedColor: Colors.red),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byType(CustomOutlinedIconButton),
        findsNWidgets(amountOfWidgets),
      );
      expect(find.byIcon(Icons.replay_rounded), findsOneWidget);
      expect(find.byIcon(Icons.delete_outline_rounded), findsOneWidget);
    },
  );
}
