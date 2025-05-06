// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'unverified_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnverifiedEmployeeModel _$UnverifiedEmployeeModelFromJson(
  Map<String, dynamic> json,
) => UnverifiedEmployeeModel(
  data:
      (json['data'] as List<dynamic>)
          .map(
            (e) => EmployeeModelUnVerified.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$UnverifiedEmployeeModelToJson(
  UnverifiedEmployeeModel instance,
) => <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};

EmployeeModelUnVerified _$EmployeeModelUnVerifiedFromJson(
  Map<String, dynamic> json,
) => EmployeeModelUnVerified(
  id: json['_id'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String?,
  department: DepartmentModelUnVerified.fromJson(
    json['department'] as Map<String, dynamic>,
  ),
  role: RoleModelUnverified.fromJson(json['role'] as Map<String, dynamic>),
  books:
      (json['books'] as List<dynamic>)
          .map((e) => BookModelUnVerified.fromJson(e as Map<String, dynamic>))
          .toList(),
  devices:
      (json['devices'] as List<dynamic>)
          .map(
            (e) =>
                EmpDeviceModelUnVerififed.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$EmployeeModelUnVerifiedToJson(
  EmployeeModelUnVerified instance,
) => <String, dynamic>{
  '_id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'department': instance.department,
  'role': instance.role,
  'books': instance.books,
  'devices': instance.devices,
};

RoleModelUnverified _$RoleModelUnverifiedFromJson(Map<String, dynamic> json) =>
    RoleModelUnverified(
      roleName: json['roleName'] as String,
      permissions:
          (json['permissions'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$RoleModelUnverifiedToJson(
  RoleModelUnverified instance,
) => <String, dynamic>{
  'roleName': instance.roleName,
  'permissions': instance.permissions,
};

BookModelUnVerified _$BookModelUnVerifiedFromJson(Map<String, dynamic> json) =>
    BookModelUnVerified(
      name: json['name'] as String,
      bookId: json['bookId'] as String,
    );

Map<String, dynamic> _$BookModelUnVerifiedToJson(
  BookModelUnVerified instance,
) => <String, dynamic>{'name': instance.name, 'bookId': instance.bookId};

DepartmentModelUnVerified _$DepartmentModelUnVerifiedFromJson(
  Map<String, dynamic> json,
) => DepartmentModelUnVerified(
  name: json['name'] as String,
  departmentId: json['departmentId'] as String,
);

Map<String, dynamic> _$DepartmentModelUnVerifiedToJson(
  DepartmentModelUnVerified instance,
) => <String, dynamic>{
  'name': instance.name,
  'departmentId': instance.departmentId,
};

EmpDeviceModelUnVerififed _$EmpDeviceModelUnVerififedFromJson(
  Map<String, dynamic> json,
) => EmpDeviceModelUnVerififed(
  deviceId: json['deviceId'] as String?,
  deviceMake: json['deviceMake'] as String,
  deviceModel: json['deviceModel'] as String,
  status: json['status'] as String,
  isVerified: json['isVerified'] as bool,
);

Map<String, dynamic> _$EmpDeviceModelUnVerififedToJson(
  EmpDeviceModelUnVerififed instance,
) => <String, dynamic>{
  'deviceId': instance.deviceId,
  'deviceMake': instance.deviceMake,
  'deviceModel': instance.deviceModel,
  'status': instance.status,
  'isVerified': instance.isVerified,
};
