import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_identity_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserIdentityModel extends Equatable {
  final String? email;
  final String firstName;
  final String lastName;
  final String phoneNo;
  final RoleBeforeLogin role;
  final DepartmentBeforeLogin department;
  final bool isPasswordSet;
  final Map<String, dynamic>? image;

  const UserIdentityModel({
    this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.department,
    required this.role,
    required this.isPasswordSet,
    this.image,
  });

  factory UserIdentityModel.fromJson(Map<String, dynamic> json) =>
      _$UserIdentityModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdentityModelToJson(this);

  @override
  List<Object?> get props => [
        email,
        firstName,
        lastName,
        phoneNo,
        department,
        role,
        isPasswordSet,
        image
      ];
}

@JsonSerializable()
class RoleBeforeLogin extends Equatable {
  final String roleName;

  const RoleBeforeLogin({required this.roleName});

  @override
  List<Object?> get props => [roleName];

  factory RoleBeforeLogin.fromJson(Map<String, dynamic> json) =>
      _$RoleBeforeLoginFromJson(json);

  Map<String, dynamic> toJson() => _$RoleBeforeLoginToJson(this);
}

@JsonSerializable()
class DepartmentBeforeLogin extends Equatable {
  final String name;

  const DepartmentBeforeLogin({required this.name});

  @override
  List<Object?> get props => [name];

  factory DepartmentBeforeLogin.fromJson(Map<String, dynamic> json) =>
      _$DepartmentBeforeLoginFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentBeforeLoginToJson(this);
}
