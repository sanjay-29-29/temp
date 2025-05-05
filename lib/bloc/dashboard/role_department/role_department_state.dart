import 'package:BuildTek/constants/department_constants.dart';
import 'package:BuildTek/constants/role_constants.dart';
import 'package:equatable/equatable.dart';

abstract class RoleDepartmentState extends Equatable {
  const RoleDepartmentState();

  @override
  List<Object> get props => [];
}

class RoleDepartmentInitial extends RoleDepartmentState {}

class RoleDepartmentLoading extends RoleDepartmentState {}

class RoleDepartmentLoaded extends RoleDepartmentState {
  final UserDepartment department;
  final UserRole role;
  final String id;

  const RoleDepartmentLoaded(
      {required this.department, required this.role, required this.id});

  @override
  List<Object> get props => [department, role];
}

class RoleDepartmentError extends RoleDepartmentState {
  final String message;

  const RoleDepartmentError({required this.message});

  @override
  List<Object> get props => [message];
}
