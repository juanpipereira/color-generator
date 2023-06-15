import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  static const double _titleFontSize = 26.0;
  static const double _titleSeparation = 20.0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const ListTile(
              title: Text(
                'Find Your Colors',
                style: TextStyle(fontSize: _titleFontSize),
              ),
            ),
            const SizedBox(height: _titleSeparation),
            ListTile(
              title: const Text('Discover a Color'),
              onTap: () => context.go('/'),
            ),
            ListTile(
              title: const Text('Favorite Colors'),
              onTap: () => context.go('/favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
