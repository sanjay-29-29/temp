import 'package:bloc/bloc.dart';

import 'splashscreen_event.dart';
import 'splashscreen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<InitializeApp>(_onInitializeApp);
    on<InitializeWeb>(_onInitializeWeb);
  }

  Future _onInitializeApp(
    InitializeApp event,
    Emitter<SplashScreenState> emit,
  ) async {
    emit(SplashScreenLoading());

    await Future.delayed(const Duration(milliseconds: 800));
    emit(SplashScreenLoaded('/login'));
  }

  Future _onInitializeWeb(
    InitializeWeb event,
    Emitter<SplashScreenState> emit,
  ) async {
    emit(SplashScreenLoading());

    await Future.delayed(const Duration(milliseconds: 800));
    emit(SplashScreenLoaded('/login'));
  }
}
