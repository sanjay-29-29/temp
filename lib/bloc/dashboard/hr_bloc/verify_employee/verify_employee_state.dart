import 'package:BuildTek/models/user_based_models/hr/unverified_employee.dart';
import 'package:equatable/equatable.dart';

class VerifyEmployeeState extends Equatable {
  const VerifyEmployeeState();

  @override
  List<Object?> get props => [];
}

class VerifyEmployeeInital extends VerifyEmployeeState {}

class VerifyEmployeeLoading extends VerifyEmployeeState {}

class UnverifiedEmployeeLoadedSuccess extends VerifyEmployeeState {
  final UnverifiedEmployeeModel employees;

  const UnverifiedEmployeeLoadedSuccess({required this.employees});

  @override
  List<Object?> get props => [employees];
}

class UnverifiedEmployeeLoadedFailure extends VerifyEmployeeState {
  final String error;

  const UnverifiedEmployeeLoadedFailure({required this.error});

  @override
  List<Object?> get props => [error];
}

class ActivateDeviceSuccess extends VerifyEmployeeState {
  final String message;

  const ActivateDeviceSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class ActivateDeviceFailure extends VerifyEmployeeState {
  final String error;

  const ActivateDeviceFailure({required this.error});

  @override
  List<Object?> get props => [error];
}

class VerifyEmployeeFailure extends VerifyEmployeeState {
  final String error;

  const VerifyEmployeeFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
