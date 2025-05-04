import 'package:BuildTek/ui/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'auth/auth_routers.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: SplashScreenPage.route,
    routes: [
      GoRoute(
        path: SplashScreenPage.route,
        builder: (context, state) => const SplashScreenPage(),
      ),
      ...AuthRouters.routes
    ],
  );
}
