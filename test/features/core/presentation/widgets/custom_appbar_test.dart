import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/features/core/presentation/widgets/custom_appbar.dart';

main() {
  testWidgets(
    'should show the page title and title if they are provided',
    (tester) async {
      const pageTitle = 'The Main Page';
      const title = 'Main Title';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppbar(
              pageTitle: pageTitle,
              title: title,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(title), findsOneWidget);
      expect(find.text(pageTitle), findsOneWidget);
    },
  );
}
