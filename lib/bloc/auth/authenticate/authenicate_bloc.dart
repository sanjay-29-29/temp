import 'package:flutter_bloc/flutter_bloc.dart';

import 'authenticate_event.dart';
import 'authenticate_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(AuthenticationState(AuthenticationStatus.authenticated)) {
    on<LogoutEvent>((event, emit) {
      emit(AuthenticationState(AuthenticationStatus.unauthenticated));
    });
    on<LoginEvent>((event, emit) {
      emit(AuthenticationState(AuthenticationStatus.authenticated));
    });
  }
}
