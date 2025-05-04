import 'package:equatable/equatable.dart';

abstract class AuthLoginEvent extends Equatable {
  const AuthLoginEvent();
  @override
  List<Object?> get props => [];
}

class SubmitUserNameEvent extends AuthLoginEvent {
  final String username;

  const SubmitUserNameEvent({required this.username});

  @override
  List<Object> get props => [username];
}
