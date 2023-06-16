import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/custom_appbar.dart';
import '../../../core/presentation/widgets/custom_drawer.dart';
import '../widgets/colored_background.dart';
import '../widgets/floating_action_buttons.dart';
import '../widgets/shaded_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  static const String _pageTitle = 'Discover a Color';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
