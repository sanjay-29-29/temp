import 'package:BuildTek/models/feature%20models/book/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../feature models/role/role_model.dart';

part 'user_login_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDetails extends Equatable {
  final User user;
  final RoleModel role;
  final EmployeeModel employee;

  const UserDetails({
    required this.user,
    required this.role,
    required this.employee,
  });

  @override
  List<Object> get props => [
        user,
        role,
        employee,
      ];

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}

@JsonSerializable()
class User extends Equatable {
  final String? displayName;
  final String uid;
  final String idToken;
  final String refreshToken;

  const User({
    this.displayName,
    required this.uid,
    required this.idToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [uid, displayName, idToken, refreshToken];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}



@JsonSerializable()
class EmployeeModel extends Equatable {
  final bool success;
  final int statusCode;
  final String message;
  final Employee data;

  const EmployeeModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  @override
  List<Object> get props => [success, statusCode, message, data];

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  get length => null;

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}

@JsonSerializable()
class Employee extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String firstName;
  final String lastName;
  final RoleModel role;
  final String phoneNo;
  final String? email;
  final List<BookModel> books;
  final Department department;
  final String? reportsTo;
  final String? accountExecutive;
  final String? status;
  final String employeeId;
  final List<Device> devices;
  final List<String> location;

  const Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.phoneNo,
    this.email,
    required this.books,
    required this.department,
    required this.reportsTo,
    this.accountExecutive,
    required this.employeeId,
    required this.devices,
    this.status,
    required this.location,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        role,
        phoneNo,
        email,
        books,
        department,
        reportsTo,
        accountExecutive,
        employeeId,
        devices,
        status,
        location,
      ];

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}

@JsonSerializable()
class Book extends Equatable {
  final String name;
  final String bookId;

  const Book({
    required this.name,
    required this.bookId,
  });

  @override
  List<Object> get props => [name, bookId];

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable()
class Department extends Equatable {
  final String name;
  final String departmentId;

  const Department({
    required this.name,
    required this.departmentId,
  });

  @override
  List<Object> get props => [name, departmentId];

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Device extends Equatable {
  final String deviceId;
  final String deviceMake;
  final String deviceModel;
  final String status;
  final bool isVerified;

  const Device({
    required this.deviceId,
    required this.deviceMake,
    required this.deviceModel,
    required this.status,
    required this.isVerified,
  });

  @override
  List<Object> get props =>
      [deviceId, deviceMake, deviceModel, status, isVerified];

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
