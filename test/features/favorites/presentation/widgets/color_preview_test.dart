import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/features/favorites/presentation/widgets/color_preview.dart';

void main() {
  testWidgets(
    'should show the preview image',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: const MaterialApp(
            home: Scaffold(body: ColorPreview()),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.image(
          AssetImage(
            'assets/images/profile-pic-background-removed.png',
          ),
        ),
        findsOneWidget,
      );
    },
  );
}
