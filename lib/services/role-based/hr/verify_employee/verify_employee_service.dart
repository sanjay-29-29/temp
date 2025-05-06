
import 'package:BuildTek/constants/api_constants.dart';
import 'package:BuildTek/models/constants/api_response_model.dart';
import 'package:BuildTek/models/devices/add_device_model.dart';
import 'package:BuildTek/models/user_based_models/hr/unverified_employee.dart';
import 'package:BuildTek/services/api_service.dart';

class VerifyEmployeeService {
  final ApiService apiService;

  VerifyEmployeeService({required this.apiService});

  Future<ApiResponse<UnverifiedEmployeeModel>> unVerifiedEmployee() async {
    try {
      final response = await apiService.get(
        ApiEndpoints.getAllUnverifiedEmployees,
        (json) => UnverifiedEmployeeModel.fromJson(json),
      );
      return response;
    } catch (error) {
      return ApiResponse(error: error.toString());
    }
  }

  Future<ApiResponse> activateDevice(DeviceActivateModel deviceDetails) async {
    try {
      final response = await apiService.request(
        'POST',
        ApiEndpoints.activateDevice,
        (json) => ApiResponse.fromJson(json, json),
        data: deviceDetails,
      );
      return response;
    } catch (error) {
      return ApiResponse(error: error.toString());
    }
  }
}
