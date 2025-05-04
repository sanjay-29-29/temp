import 'package:BuildTek/bloc/auth/login/login_event.dart';
import 'package:BuildTek/bloc/auth/login/login_state.dart';
import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/constants/route_constants.dart';
import 'package:BuildTek/respositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  final AuthRepository authRepository;

  AuthLoginBloc({required this.authRepository}) : super(AuthInitialState()) {
    on<SubmitUserNameEvent>(_onSubmitUserNameEvent);
  }

  void _onSubmitUserNameEvent(
    SubmitUserNameEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    try {
      emit(AuthLoginLoadingState());
      final response = await authRepository.fetchUsernameDetails(
        event.username,
      );
      if (response.success != true && response.statusCode == 404) {
        emit(
          AuthUserNotFoundState(
            message: "User not found",
            route: RouteConstants.userNotFound,
          ),
        );
        return;
      }
      if (response.success != true) {
        emit(AuthLoginErrorState(message: response.message ?? "Error"));
        return;
      }
      emit(
        AuthUserIdentitySuccess(
          userIdentityModel: response.data!,
          route: RouteConstants.password,
        ),
      );
    } catch (e) {
      logger.e(e.toString());
      emit(AuthLoginErrorState(message: "Something went wrong"));
    }
  }
}
