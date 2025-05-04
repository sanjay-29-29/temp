import 'package:BuildTek/models/auth/otp_model.dart';
import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:BuildTek/ui/pages/auth/add_device.dart';
import 'package:BuildTek/ui/pages/auth/create_password.dart';
import 'package:BuildTek/ui/pages/auth/device_processing.dart';
import 'package:BuildTek/ui/pages/auth/forget_password.dart';
import 'package:BuildTek/ui/pages/auth/notfound.dart';
import 'package:BuildTek/ui/pages/auth/otp.dart';
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
    GoRoute(
      name: "createPassword",
      path: CreatePasswordPage.route,
      builder: (context, state) {
        UserIdentityModel userIdentity = state.extra as UserIdentityModel;
        return CreatePasswordPage(usernameDetails: userIdentity);
      },
    ),
    GoRoute(
      name: "otp",
      path: OTPPage.route,
      builder: (context, state) {
        OtpModel otpModel = state.extra as OtpModel;
        return OTPPage(otpModel: otpModel);
      },
    ),
    GoRoute(
      path: AddDevicePage.route,
      name: "addDevice",
      builder: (context, state) {
        var param = state.extra as Map<String, dynamic>;
        return AddDevicePage(
          device: param['device'],
          employee: param['emaployee'],
        );
      },
    ),
    GoRoute(
      name: "deviceProcessing",
      path: DeviceProcessingPage.route,
      builder: (context, state) => DeviceProcessingPage(),
    ),
    GoRoute(
      name: "forgetPassword",
      path: ForgetPasswordPage.route,
      builder: (context, state) {
        String username = state.extra as String;
        return ForgetPasswordPage(
          userName: username,
        );
      },
    ),
    GoRoute(
      name: "userNotFound",
      path: UserNotFountPage.route,
      builder: (context, state) {
        String userName = state.extra as String;
        return UserNotFountPage(userName: userName);
      },
    ),
  ];
}
