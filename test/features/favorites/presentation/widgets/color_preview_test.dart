import 'package:color_generator/features/favorites/presentation/widgets/color_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'should show the preview image',
    (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: ColorPreview()),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.image(
          const AssetImage(
            'assets/images/profile-pic-background-removed.png',
          ),
        ),
        findsOneWidget,
      );
    },
  );
}
