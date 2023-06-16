import 'package:color_generator/features/favorites/presentation/controllers/favorite_colors_controller.dart';
import 'package:color_generator/features/favorites/presentation/widgets/favorite_color_item.dart';
import 'package:color_generator/features/favorites/presentation/widgets/favorite_color_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

const _colors = [Colors.red, Colors.amber, Colors.green];

class _MockFavoritesController extends FavoriteColorsController {
  @override
  List<Color> build() => _colors;
}

void main() {
  testWidgets(
    'should draw the proper amount of children',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            favoriteColorsControllerProvider
                .overrideWith(_MockFavoritesController.new),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: FavoriteColorList(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(FavoriteColorItem), findsNWidgets(_colors.length));
    },
  );
}
