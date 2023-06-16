import 'package:color_generator/features/core/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'should show drawer title',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomDrawer(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Find Your Colors'), findsOneWidget);
    },
  );

  testWidgets(
    'should show drawer items',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomDrawer(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Discover a Color'), findsOneWidget);
      expect(find.text('Favorite Colors'), findsOneWidget);
    },
  );
}
