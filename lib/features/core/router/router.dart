import 'package:color_generator/features/favorites/presentation/pages/favorites_page.dart';
import 'package:color_generator/features/home/presentation/pages/home_page.dart';
import 'package:color_generator/features/login/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

class Router {
  static const String _title = 'Find Your Colors';

  GoRouter get routes => GoRouter(
        initialLocation: '/login',
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) => const HomePage(title: _title),
          ),
          GoRoute(
            path: '/login',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              child: LoginPage(title: _title),
            ),
          ),
          GoRoute(
            path: '/favorites',
            builder: (_, __) => const FavoritesPage(title: _title),
          ),
        ],
      );
}
