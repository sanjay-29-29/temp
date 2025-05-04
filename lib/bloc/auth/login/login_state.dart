import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/devices/fetch_device_model.dart';
import 'package:BuildTek/models/auth/otp_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthLoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthLoginState {}

class AuthLoginLoadingState extends AuthLoginState {}

class AuthLoginErrorState extends AuthLoginState {
  final String message;

  AuthLoginErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class AuthUserNotFoundState extends AuthLoginState {
  final String message;
  final String route;

  AuthUserNotFoundState({required this.message, required this.route});
}

class AuthPasswordNotSetState extends AuthLoginState {
  final String message;
  final String phoneNo;
  final String route;

  AuthPasswordNotSetState({
    required this.message,
    required this.phoneNo,
    required this.route,
  });
}

class AuthUserIdentitySuccess extends AuthLoginState {
  final UserIdentityModel userIdentityModel;
  final String route;

  AuthUserIdentitySuccess({
    required this.userIdentityModel,
    required this.route,
  });
}

class AuthOTPSendSuccessState extends AuthLoginState {
  final String message;
  final OtpModel otpModel;

  AuthOTPSendSuccessState({required this.message, required this.otpModel});
}

class AuthOTPSendErrorState extends AuthLoginState {
  final String message;

  AuthOTPSendErrorState({required this.message});
}

class AuthOTPVerificationSuccessState extends AuthLoginState {
  final String message;
  final String route;
  final UserIdentityModel userIdentityModel;

  AuthOTPVerificationSuccessState({
    required this.message,
    required this.route,
    required this.userIdentityModel,
  });
}

class AuthCreatePasswordSuccessState extends AuthLoginState {
  final String message;
  final String route;

  AuthCreatePasswordSuccessState({required this.message, required this.route});
}

class AuthPasswordSuccessState extends AuthLoginState {
  final String route;

  AuthPasswordSuccessState({required this.route});
}

class AuthAddDeviceState extends AuthLoginState {
  final String message;
  final String route;
  final Employee employee;
  final FetchDeviceModel device;

  AuthAddDeviceState({
    required this.message,
    required this.route,
    required this.employee,
    required this.device,
  });
}

class AuthDeviceLoadedSuccessState extends AuthLoginState {
  final FetchDeviceModel fetchDeviceModel;

  AuthDeviceLoadedSuccessState({required this.fetchDeviceModel});
}

class AuthDeviceVerificationSuccessState extends AuthLoginState {
  final String message;
  final String route;

  AuthDeviceVerificationSuccessState({
    required this.message,
    required this.route,
  });
}
