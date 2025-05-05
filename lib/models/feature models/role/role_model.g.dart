// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
  id: json['_id'] as String,
  roleName: json['roleName'] as String,
  permissions:
      (json['permissions'] as List<dynamic>?)?.map((e) => e as String).toList(),
  createdAt: json['createdAt'] as String?,
  roleId: json['roleId'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['__v'] as num?)?.toInt(),
);

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
  '_id': instance.id,
  'roleName': instance.roleName,
  'permissions': instance.permissions,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'roleId': instance.roleId,
  '__v': instance.v,
};

FetchRoleModel _$FetchRoleModelFromJson(Map<String, dynamic> json) =>
    FetchRoleModel(
      role:
          (json['role'] as List<dynamic>)
              .map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$FetchRoleModelToJson(FetchRoleModel instance) =>
    <String, dynamic>{'role': instance.role};
