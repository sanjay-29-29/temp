import 'package:equatable/equatable.dart';

abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();

  @override
  List<Object> get props => [];
}

class InitializeApp extends SplashScreenEvent {}

class InitializeWeb extends SplashScreenEvent {}