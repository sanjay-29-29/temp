class AuthenticationEvent {
  const AuthenticationEvent();
}

class LogoutEvent extends AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {}
