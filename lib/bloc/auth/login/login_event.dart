import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/devices/fetch_device_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthLoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitUserNameEvent extends AuthLoginEvent {
  final String username;

  SubmitUserNameEvent({required this.username});
}

class SubmitPasswordEvent extends AuthLoginEvent {
  final String username;
  final String password;

  SubmitPasswordEvent({required this.username, required this.password});
}

class AuthGetOTPEvent extends AuthLoginEvent {
  final String phoneNo;

  AuthGetOTPEvent({required this.phoneNo});
}

class AuthSubmitOTPEvent extends AuthLoginEvent {
  final String phoneNo;
  final String otpCode;
  final String verificationId;

  AuthSubmitOTPEvent({
    required this.phoneNo,
    required this.otpCode,
    required this.verificationId,
  });
}

class AuthSetPasswordEvent extends AuthLoginEvent {
  final String phoneNo;
  final String password;

  AuthSetPasswordEvent({required this.phoneNo, required this.password});
}

class AuthFetchDeviceDetailsEvent extends AuthLoginEvent {}

class AuthDeviceVerificationEvent extends AuthLoginEvent {}

class AuthUpdateDeviceEvent extends AuthLoginEvent {}

class AuthAddDeviceEvent extends AuthLoginEvent {
  final FetchDeviceModel device;
  final Employee employee;

  AuthAddDeviceEvent({required this.device, required this.employee});
}
