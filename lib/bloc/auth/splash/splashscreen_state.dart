import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();

  @override
  List<Object> get props => [];
}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenLoading extends SplashScreenState {}

class SplashScreenLoaded extends SplashScreenState {
  final String route;

  const SplashScreenLoaded(this.route);

  @override
  List<Object> get props => [route];
}

class SplashScreenError extends SplashScreenState {
  final String message;

  const SplashScreenError(this.message);

  @override
  List<Object> get props => [message];
}
