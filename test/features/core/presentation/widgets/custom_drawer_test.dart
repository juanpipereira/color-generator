import 'package:color_generator/features/auth/presentation/controllers/auth_state_controller.dart';
import 'package:color_generator/features/core/presentation/widgets/custom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _MockAuthStateController extends AuthStateController {
  @override
  Stream<User?> build() => Stream.value(null);
}

void main() {
  testWidgets(
    'should show drawer title',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authStateControllerProvider
                .overrideWith(_MockAuthStateController.new),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: CustomDrawer(),
            ),
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
        ProviderScope(
          overrides: [
            authStateControllerProvider
                .overrideWith(_MockAuthStateController.new),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: CustomDrawer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Discover a Color'), findsOneWidget);
      expect(find.text('Favorite Colors'), findsOneWidget);
    },
  );
}
