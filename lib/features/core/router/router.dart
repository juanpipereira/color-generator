import 'package:go_router/go_router.dart';
import 'package:test_task/features/favorites/presentation/pages/favorites_page.dart';
import 'package:test_task/features/home/presentation/pages/home_page.dart';

class Router {
  static const String _title = 'Find Your Colors';

  GoRouter get routes => GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) => const HomePage(title: _title),
          ),
          GoRoute(
            path: '/favorites',
            builder: (_, __) => const FavoritesPage(title: _title),
          ),
        ],
      );
}
