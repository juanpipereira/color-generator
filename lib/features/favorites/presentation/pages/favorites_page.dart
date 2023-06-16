import 'package:color_generator/features/core/presentation/widgets/custom_appbar.dart';
import 'package:color_generator/features/core/presentation/widgets/custom_drawer.dart';
import 'package:color_generator/features/favorites/presentation/controllers/selected_color_controller.dart';
import 'package:color_generator/features/favorites/presentation/widgets/color_preview.dart';
import 'package:color_generator/features/favorites/presentation/widgets/copyable_color_tile.dart';
import 'package:color_generator/features/favorites/presentation/widgets/favorite_color_list.dart';
import 'package:color_generator/features/favorites/presentation/widgets/option_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
    required this.title,
  });

  static const double _extraButtonsHeight = 80.0;
  static const String _pageTitle = 'Favorite Colors';
  static const double _titleFontSize = 24.0;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        pageTitle: _pageTitle,
        title: title,
      ),
      body: Column(
        children: [
          const Spacer(),
          const Spacer(flex: 2),
          const ColorPreview(),
          const Spacer(flex: 2),
          Text(
            'Copy a color you like',
            style: TextStyle(
              fontSize: _titleFontSize,
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(flex: 1),
          Consumer(
            builder: (_, ref, __) {
              final selectedColor = ref.watch(selectedColorControllerProvider);

              return selectedColor == null
                  ? SizedBox(
                      height: _extraButtonsHeight,
                      child: Text(
                        'Select a color to preview it',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    )
                  : CopyableColorTile(color: selectedColor);
            },
          ),
          const Spacer(flex: 7),
          SizedBox(
            height: _extraButtonsHeight,
            child: Consumer(
              builder: (_, ref, __) {
                final selectedColor =
                    ref.watch(selectedColorControllerProvider);

                return selectedColor != null
                    ? OptionButtons(selectedColor: selectedColor)
                    : const SizedBox.shrink();
              },
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: FavoriteColorList(),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
