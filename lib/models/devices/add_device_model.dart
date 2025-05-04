import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_device_model.g.dart';

@JsonSerializable()
class AddDeviceModel extends Equatable {
  final String? deviceId;
  final String deviceMake;
  final String deviceModel;
  final String employee;

  const AddDeviceModel({
    this.deviceId,
    required this.deviceMake,
    required this.deviceModel,
    required this.employee,
  });

  factory AddDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$AddDeviceModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddDeviceModelToJson(this);

  @override
  List<Object?> get props => [deviceId, deviceMake, deviceModel, employee];
}

@JsonSerializable()
class UpdateAddDeviceModel extends Equatable {
  final String? deviceId;
  final String deviceMake;
  final String deviceModel;
  final String employee;
  final String fcmToken;

  const UpdateAddDeviceModel({
    required this.fcmToken,
    required this.deviceId,
    required this.deviceMake,
    required this.deviceModel,
    required this.employee,
  });

  @override
  List<Object?> get props => [
    deviceId ?? 'N/A',
    deviceMake,
    deviceModel,
    employee,
    fcmToken,
  ];

  factory UpdateAddDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddDeviceModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateAddDeviceModelToJson(this);
}

@JsonSerializable()
class DeviceModel extends Equatable {
  final String? deviceId;
  final String deviceMake;
  final String deviceModel;
  final String status;
  final bool isVerified;

  const DeviceModel({
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

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);
}

@JsonSerializable()
class DeviceActivateModel extends Equatable {
  final String? deviceId;
  final String employee;

  const DeviceActivateModel({required this.deviceId, required this.employee});

  @override
  List<Object?> get props => [deviceId, employee];

  factory DeviceActivateModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceActivateModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceActivateModelToJson(this);
}

@JsonSerializable()
class DeviceVerficationModel extends Equatable {
  final bool isVerified;

  const DeviceVerficationModel({required this.isVerified});

  @override
  List<Object> get props => [isVerified];

  factory DeviceVerficationModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceVerficationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceVerficationModelToJson(this);
}
