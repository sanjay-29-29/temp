import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthLoginState extends Equatable {
  const AuthLoginState();
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthLoginState {}

class AuthLoginLoadingState extends AuthLoginState {}

class AuthUserIdentitySuccess extends AuthLoginState {
  final UserIdentityModel userIdentityModel;
  final String route;
  const AuthUserIdentitySuccess({
    required this.userIdentityModel,
    required this.route,
  });
  @override
  List<Object?> get props => [userIdentityModel, route];
}

class AuthLoginErrorState extends AuthLoginState {
  final String message;
  const AuthLoginErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class AuthUserNotFoundState extends AuthLoginState {
  final String message;
  final String route;

  const AuthUserNotFoundState({required this.message, required this.route});
  @override
  List<Object?> get props => [message, route];
}
