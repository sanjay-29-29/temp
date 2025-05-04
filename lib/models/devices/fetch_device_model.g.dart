// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchDevice _$FetchDeviceFromJson(Map<String, dynamic> json) => FetchDevice(
  deviceId: json['deviceId'] as String?,
  deviceMake: json['deviceMake'] as String,
  deviceModel: json['deviceModel'] as String,
);

Map<String, dynamic> _$FetchDeviceToJson(FetchDevice instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceMake': instance.deviceMake,
      'deviceModel': instance.deviceModel,
    };
