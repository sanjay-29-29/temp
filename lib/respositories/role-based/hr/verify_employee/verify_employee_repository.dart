import 'package:BuildTek/models/devices/add_device_model.dart';
import 'package:BuildTek/services/role-based/hr/verify_employee/verify_employee_service.dart';

class VerifyEmployeeRepository {
  final VerifyEmployeeService verifyEmployeeService;

  VerifyEmployeeRepository({required this.verifyEmployeeService});

  Future unVerifiedEmployee() async {
    final response = await verifyEmployeeService.unVerifiedEmployee();
    return response;
  }

  Future activateDevice(DeviceActivateModel deviceDetails) async {
    final response = await verifyEmployeeService.activateDevice(deviceDetails);
    return response;
  }
}
