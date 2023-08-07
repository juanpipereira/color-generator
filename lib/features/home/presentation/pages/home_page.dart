import 'package:color_generator/features/auth/presentation/controllers/auth_state_controller.dart';
import 'package:color_generator/features/core/presentation/widgets/custom_appbar.dart';
import 'package:color_generator/features/core/presentation/widgets/custom_drawer.dart';
import 'package:color_generator/features/favorites/presentation/controllers/favorite_colors_controller.dart';
import 'package:color_generator/features/favorites/presentation/controllers/selected_color_controller.dart';
import 'package:color_generator/features/home/presentation/widgets/colored_background.dart';
import 'package:color_generator/features/home/presentation/widgets/floating_action_buttons.dart';
import 'package:color_generator/features/home/presentation/widgets/shaded_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  static const String _pageTitle = 'Discover a Color';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// These ones keep the states alive while navigating this page
    /// without causing to rebuild.
    ref.watch(favoriteColorsControllerProvider.select((_) {}));
    ref.watch(selectedColorControllerProvider.select((_) {}));

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          pageTitle: _pageTitle,
          title: title,
        ),
        body: const ColoredBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ShadedText('Hello there!'),
              SizedBox(height: 20.0),
              ShadedText(
                '(Touch the background to change the color)',
                fontSize: 14,
              ),
            ],
          ),
        ),
        drawer: const CustomDrawer(),
        floatingActionButton: const FloatingActionButtons(),
      ),
    );
  }
}
