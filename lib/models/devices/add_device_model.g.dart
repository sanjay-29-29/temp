// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDeviceModel _$AddDeviceModelFromJson(Map<String, dynamic> json) =>
    AddDeviceModel(
      deviceId: json['deviceId'] as String?,
      deviceMake: json['deviceMake'] as String,
      deviceModel: json['deviceModel'] as String,
      employee: json['employee'] as String,
    );

Map<String, dynamic> _$AddDeviceModelToJson(AddDeviceModel instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceMake': instance.deviceMake,
      'deviceModel': instance.deviceModel,
      'employee': instance.employee,
    };

UpdateAddDeviceModel _$UpdateAddDeviceModelFromJson(
  Map<String, dynamic> json,
) => UpdateAddDeviceModel(
  fcmToken: json['fcmToken'] as String,
  deviceId: json['deviceId'] as String?,
  deviceMake: json['deviceMake'] as String,
  deviceModel: json['deviceModel'] as String,
  employee: json['employee'] as String,
);

Map<String, dynamic> _$UpdateAddDeviceModelToJson(
  UpdateAddDeviceModel instance,
) => <String, dynamic>{
  'deviceId': instance.deviceId,
  'deviceMake': instance.deviceMake,
  'deviceModel': instance.deviceModel,
  'employee': instance.employee,
  'fcmToken': instance.fcmToken,
};

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
  deviceId: json['deviceId'] as String?,
  deviceMake: json['deviceMake'] as String,
  deviceModel: json['deviceModel'] as String,
  status: json['status'] as String,
  isVerified: json['isVerified'] as bool,
);

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceMake': instance.deviceMake,
      'deviceModel': instance.deviceModel,
      'status': instance.status,
      'isVerified': instance.isVerified,
    };

DeviceActivateModel _$DeviceActivateModelFromJson(Map<String, dynamic> json) =>
    DeviceActivateModel(
      deviceId: json['deviceId'] as String?,
      employee: json['employee'] as String,
    );

Map<String, dynamic> _$DeviceActivateModelToJson(
  DeviceActivateModel instance,
) => <String, dynamic>{
  'deviceId': instance.deviceId,
  'employee': instance.employee,
};

DeviceVerficationModel _$DeviceVerficationModelFromJson(
  Map<String, dynamic> json,
) => DeviceVerficationModel(isVerified: json['isVerified'] as bool);

Map<String, dynamic> _$DeviceVerficationModelToJson(
  DeviceVerficationModel instance,
) => <String, dynamic>{'isVerified': instance.isVerified};
