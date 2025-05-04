// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_identity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIdentityModel _$UserIdentityModelFromJson(Map<String, dynamic> json) =>
    UserIdentityModel(
      email: json['email'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNo: json['phoneNo'] as String,
      department: DepartmentBeforeLogin.fromJson(
        json['department'] as Map<String, dynamic>,
      ),
      role: RoleBeforeLogin.fromJson(json['role'] as Map<String, dynamic>),
      isPasswordSet: json['isPasswordSet'] as bool,
      image: json['image'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UserIdentityModelToJson(UserIdentityModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNo': instance.phoneNo,
      'role': instance.role.toJson(),
      'department': instance.department.toJson(),
      'isPasswordSet': instance.isPasswordSet,
      'image': instance.image,
    };

RoleBeforeLogin _$RoleBeforeLoginFromJson(Map<String, dynamic> json) =>
    RoleBeforeLogin(roleName: json['roleName'] as String);

Map<String, dynamic> _$RoleBeforeLoginToJson(RoleBeforeLogin instance) =>
    <String, dynamic>{'roleName': instance.roleName};

DepartmentBeforeLogin _$DepartmentBeforeLoginFromJson(
  Map<String, dynamic> json,
) => DepartmentBeforeLogin(name: json['name'] as String);

Map<String, dynamic> _$DepartmentBeforeLoginToJson(
  DepartmentBeforeLogin instance,
) => <String, dynamic>{'name': instance.name};
