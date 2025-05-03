import 'package:buildtek_ui/ui/pages/auth/login.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: LoginPage.route,
    routes: [
      GoRoute(
        path: LoginPage.route,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
