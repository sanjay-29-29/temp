import 'package:equatable/equatable.dart';

abstract class RoleDepartmentEvent extends Equatable {
  const RoleDepartmentEvent();

  @override
  List<Object> get props => [];
}

class FetchRoleDepartment extends RoleDepartmentEvent {}
