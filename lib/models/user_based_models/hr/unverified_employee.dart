import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unverified_employee.g.dart';

@JsonSerializable(explicitToJson: true)
class UnverifiedEmployeeModel extends Equatable {
  final List<EmployeeModelUnVerified> data;

  const UnverifiedEmployeeModel({required this.data});

  @override
  List<Object?> get props => [data];

  factory UnverifiedEmployeeModel.fromJson(List<dynamic> json) =>
      UnverifiedEmployeeModel(
        data:
            json
                .map((e) => EmployeeModelUnVerified.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

  List<dynamic> toJson() => data.map((e) => e.toJson()).toList();
}

@JsonSerializable()
class EmployeeModelUnVerified extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String firstName;
  final String lastName;
  final String? email;
  final DepartmentModelUnVerified department;
  final RoleModelUnverified role;
  final List<BookModelUnVerified> books;
  final List<EmpDeviceModelUnVerififed> devices;

  const EmployeeModelUnVerified({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    required this.department,
    required this.role,
    required this.books,
    required this.devices,
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    department,
    role,
    books,
    devices,
  ];

  factory EmployeeModelUnVerified.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelUnVerifiedFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EmployeeModelUnVerifiedToJson(this);
}

@JsonSerializable()
class RoleModelUnverified extends Equatable {
  final String roleName;
  final List<String> permissions;

  const RoleModelUnverified({
    required this.roleName,
    required this.permissions,
  });

  @override
  List<Object> get props => [roleName, permissions];

  factory RoleModelUnverified.fromJson(Map<String, dynamic> json) =>
      _$RoleModelUnverifiedFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelUnverifiedToJson(this);
}

@JsonSerializable()
class BookModelUnVerified extends Equatable {
  final String name;
  final String bookId;

  const BookModelUnVerified({required this.name, required this.bookId});

  @override
  List<Object> get props => [name, bookId];

  factory BookModelUnVerified.fromJson(Map<String, dynamic> json) =>
      _$BookModelUnVerifiedFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelUnVerifiedToJson(this);
}

@JsonSerializable()
class DepartmentModelUnVerified extends Equatable {
  final String name;
  final String departmentId;

  const DepartmentModelUnVerified({
    required this.name,
    required this.departmentId,
  });

  @override
  List<Object> get props => [name, departmentId];

  factory DepartmentModelUnVerified.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelUnVerifiedFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentModelUnVerifiedToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EmpDeviceModelUnVerififed extends Equatable {
  final String? deviceId;
  final String deviceMake;
  final String deviceModel;
  final String status;
  final bool isVerified;

  const EmpDeviceModelUnVerififed({
    this.deviceId,
    required this.deviceMake,
    required this.deviceModel,
    required this.status,
    required this.isVerified,
  });

  @override
  List<Object> get props => [
    deviceId ?? '',
    deviceMake,
    deviceModel,
    status,
    isVerified,
  ];

  factory EmpDeviceModelUnVerififed.fromJson(Map<String, dynamic> json) =>
      _$EmpDeviceModelUnVerififedFromJson(json);
  Map<String, dynamic> toJson() => _$EmpDeviceModelUnVerififedToJson(this);
}
