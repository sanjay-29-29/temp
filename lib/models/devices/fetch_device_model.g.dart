// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchDeviceModel _$FetchDeviceModelFromJson(Map<String, dynamic> json) =>
    FetchDeviceModel(
      deviceId: json['deviceId'] as String?,
      deviceMake: json['deviceMake'] as String,
      deviceModel: json['deviceModel'] as String,
    );

Map<String, dynamic> _$FetchDeviceModelToJson(FetchDeviceModel instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceMake': instance.deviceMake,
      'deviceModel': instance.deviceModel,
    };
