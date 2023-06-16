import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/widgets/custom_appbar.dart';
import '../../../core/presentation/widgets/custom_drawer.dart';
import '../controllers/selected_color_controller.dart';
import '../widgets/color_preview.dart';
import '../widgets/copyable_color_tile.dart';
import '../widgets/favorite_color_list.dart';
import '../widgets/option_buttons.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
    required this.title,
  });

  static const _pageTitle = 'Favorite Colors';

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
              fontSize: 24.0,
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
                      height: 80.0,
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
            height: 80.0,
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
