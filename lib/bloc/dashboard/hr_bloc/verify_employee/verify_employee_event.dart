import 'package:BuildTek/models/devices/add_device_model.dart';
import 'package:equatable/equatable.dart';

class VerifyEmployeeEvent extends Equatable {
  const VerifyEmployeeEvent();

  @override
  List<Object?> get props => [];
}

class FetchUnverifiedEmployeeEvent extends VerifyEmployeeEvent {
  @override
  List<Object?> get props => [];
}

class ActivateDeviceEvent extends VerifyEmployeeEvent {
  final DeviceActivateModel deviceActivate;

  const ActivateDeviceEvent({required this.deviceActivate});
  @override
  List<Object?> get props => [deviceActivate];
}
