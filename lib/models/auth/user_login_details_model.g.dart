// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
  employee: EmployeeModel.fromJson(json['employee'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'role': instance.role.toJson(),
      'employee': instance.employee.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  displayName: json['displayName'] as String?,
  uid: json['uid'] as String,
  idToken: json['idToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'displayName': instance.displayName,
  'uid': instance.uid,
  'idToken': instance.idToken,
  'refreshToken': instance.refreshToken,
};

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      success: json['success'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: Employee.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
  id: json['_id'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
  phoneNo: json['phoneNo'] as String,
  email: json['email'] as String?,
  books:
      (json['books'] as List<dynamic>)
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  department: Department.fromJson(json['department'] as Map<String, dynamic>),
  reportsTo: json['reportsTo'] as String?,
  accountExecutive: json['accountExecutive'] as String?,
  employeeId: json['employeeId'] as String,
  devices:
      (json['devices'] as List<dynamic>)
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
  status: json['status'] as String?,
  location:
      (json['location'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
  '_id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'role': instance.role,
  'phoneNo': instance.phoneNo,
  'email': instance.email,
  'books': instance.books,
  'department': instance.department,
  'reportsTo': instance.reportsTo,
  'accountExecutive': instance.accountExecutive,
  'status': instance.status,
  'employeeId': instance.employeeId,
  'devices': instance.devices,
  'location': instance.location,
};

Book _$BookFromJson(Map<String, dynamic> json) =>
    Book(name: json['name'] as String, bookId: json['bookId'] as String);

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
  'name': instance.name,
  'bookId': instance.bookId,
};

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
  name: json['name'] as String,
  departmentId: json['departmentId'] as String,
);

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'name': instance.name,
      'departmentId': instance.departmentId,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
  deviceId: json['deviceId'] as String,
  deviceMake: json['deviceMake'] as String,
  deviceModel: json['deviceModel'] as String,
  status: json['status'] as String,
  isVerified: json['isVerified'] as bool,
);

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
  'deviceId': instance.deviceId,
  'deviceMake': instance.deviceMake,
  'deviceModel': instance.deviceModel,
  'status': instance.status,
  'isVerified': instance.isVerified,
};
