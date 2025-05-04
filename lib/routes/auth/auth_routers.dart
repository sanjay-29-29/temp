import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:BuildTek/ui/pages/auth/password.dart';
import 'package:BuildTek/ui/pages/auth/username.dart';
import 'package:go_router/go_router.dart';

class AuthRouters {
  static const route = '/login';

  static final List<GoRoute> routes = [
    GoRoute(
      name: "username",
      path: UserNamePage.route,
      builder: (context, state) => const UserNamePage(),
    ),
    GoRoute(
      name: "password",
      path: PasswordPage.route,
      builder: (context, state) {
        UserIdentityModel userIdentity = state.extra as UserIdentityModel;
        return PasswordPage(userIdentity: userIdentity);
      },
    ),
  ];
}
