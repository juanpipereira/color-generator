import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/features/core/presentation/widgets/custom_outlined_icon_button.dart';
import 'package:test_task/features/favorites/presentation/widgets/option_buttons.dart';

void main() {
  testWidgets(
    'should show the two button children',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: OptionButtons(selectedColor: Colors.red),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CustomOutlinedIconButton), findsNWidgets(2));
      expect(find.byIcon(Icons.replay_rounded), findsOneWidget);
      expect(find.byIcon(Icons.delete_outline_rounded), findsOneWidget);
    },
  );
}
