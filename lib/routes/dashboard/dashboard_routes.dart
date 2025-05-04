import 'package:BuildTek/ui/pages/dashboard/dashboard_page.dart';
import 'package:go_router/go_router.dart';

class DashboardRoutes {
  static const route = '/home';
  static final List<GoRoute> routes = [
    GoRoute(
      name: "home",
      path: DashboardPage.route,
      builder: (context, state) => const DashboardPage(),
    ),
  ];
}
