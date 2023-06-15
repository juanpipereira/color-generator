import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/features/core/domain/extensions/color_extension.dart';
import 'package:test_task/features/favorites/presentation/widgets/copyable_color_tile.dart';

void main() {
  testWidgets(
    'should show the color hex code',
    (tester) async {
      const color = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CopyableColorTile(color: color)),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(color.toHex()), findsOneWidget);
    },
  );
}
