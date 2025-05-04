import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_device_model.g.dart';

@JsonSerializable()
class FetchDevice extends Equatable {
  final String? deviceId;
  final String deviceMake;
  final String deviceModel;

  const FetchDevice({
    required this.deviceId,
    required this.deviceMake,
    required this.deviceModel,
  });

  @override
  List<Object> get props => [
        deviceId ?? 'N/A',
        deviceMake,
        deviceModel,
      ];

  factory FetchDevice.fromJson(Map<String, dynamic> json) =>
      _$FetchDeviceFromJson(json);
  Map<String, dynamic> toJson() => _$FetchDeviceToJson(this);
}
