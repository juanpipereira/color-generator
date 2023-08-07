import 'package:color_generator/features/auth/presentation/controllers/auth_instance_controller.dart';
import 'package:color_generator/features/auth/presentation/controllers/auth_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
            const Divider(
              endIndent: 12.0,
              indent: 12.0,
            ),
            Consumer(
              builder: (_, ref, __) {
                final userState = ref.watch(authStateControllerProvider);

                return userState.when(
                  data: (user) {
                    return user != null
                        ? Column(
                            children: [
                              if (user.displayName != null)
                                ListTile(
                                  title: Text(user.displayName ?? ''),
                                ),
                              ListTile(
                                title: const Text('Log Out'),
                                onTap: () async {
                                  await ref
                                      .read(
                                        authInstanceControllerProvider.notifier,
                                      )
                                      .signOut();
                                  if (context.mounted) context.go('/login');
                                },
                              ),
                            ],
                          )
                        : ListTile(
                            title: const Text('Log In'),
                            onTap: () {
                              context.go('/login');
                            },
                          );
                  },
                  loading: () => const LinearProgressIndicator(),
                  error: (error, stackTrace) => Text(error.toString()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
