import 'package:color_generator/features/auth/presentation/controllers/auth_instance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 2,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 2,
              child: Consumer(
                builder: (ctx, ref, __) {
                  return OutlinedButton(
                    onPressed: () async {
                      await ref
                          .read(
                            authInstanceControllerProvider.notifier,
                          )
                          .signInWithGoogle(ctx);
                      if (ctx.mounted) context.go('/');
                    },
                    child: const Text('Sign in with Google'),
                  );
                },
              ),
            ),
            Flexible(
              flex: 2,
              child: OutlinedButton(
                onPressed: () => context.go('/'),
                child: const Text('Continue as guest'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
