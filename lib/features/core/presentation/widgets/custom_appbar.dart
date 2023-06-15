import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.pageTitle,
    required this.title,
  });

  static const double _elevation = 7.0;
  static const double _titleFontSize = 12.0;
  static const double _titleSeparation = 1.0;
  static const double _pageTitleSeparation = 12.0;

  final String pageTitle;
  final String title;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Theme.of(context).colorScheme.onSurface,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.background,
      elevation: _elevation,
      title: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: _titleFontSize),
          ),
          const SizedBox(height: _titleSeparation),
          Text(pageTitle),
          const SizedBox(height: _pageTitleSeparation),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
