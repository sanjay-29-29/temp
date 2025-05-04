import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/constants/api_constants.dart';
import 'package:BuildTek/models/auth/otp_model.dart';
import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/constants/api_response_model.dart';
import 'package:BuildTek/models/devices/add_device_model.dart';
import 'package:BuildTek/services/api_service.dart';
import 'package:BuildTek/services/storage/store_service.dart';

class AuthService {
  final ApiService apiService;
  AuthService({required this.apiService});
  Future<ApiResponse<UserIdentityModel>> fetchUsernameDetails(
    String email,
  ) async {
    try {
      final response = await apiService.request(
        'POST',
        ApiEndpoints.fetchUsernameDetails,
        (json) => UserIdentityModel.fromJson(json),
        data: {'username': email},
        includeDeviceId: false,
        includeToken: false,
      );
      return response;
    } catch (e) {
      return ApiResponse(data: null, error: e.toString());
    }
  }

  Future<ApiResponse<UserDetails>> authenticate(
    String email,
    String password,
  ) async {
    try {
      final response = await apiService.request(
        'POST',
        ApiEndpoints.authenticate,
        (json) => UserDetails.fromJson(json),
        data: {'username': email, 'password': password},
        includeDeviceId: false,
        includeToken: false,
      );
      if (response.success == true) {
        StoreService.storeEmployeeData(response.data!);
        StoreService.storeToken(response.data!.user);
      }
      return response;
    } catch (e) {
      return ApiResponse(data: null, error: e.toString());
    }
  }

  Future<ApiResponse> addDevice(AddDeviceModel deviceRequest) async {
    try {
      final response = await apiService.request(
        'POST',
        ApiEndpoints.addDevice,
        (json) => ApiResponse.fromJson(json, json),
        data: deviceRequest,
      );
      return response;
    } catch (error) {
      return ApiResponse(data: null, error: error.toString());
    }
  }

  Future<ApiResponse> activateDevice(DeviceActivateModel device) async {
    try {
      final response = await apiService.request(
        'POST',
        ApiEndpoints.activateDevice,
        (json) => ApiResponse.fromJson(json, json),
        data: device,
      );
      return response;
    } catch (error) {
      return ApiResponse(data: null, error: error.toString());
    }
  }

  Future<ApiResponse<DeviceVerficationModel>> deviceVerification() async {
    try {
      final response = await apiService.request(
        'POST',
        ApiEndpoints.isRegisteredDevice,
        (json) => DeviceVerficationModel.fromJson(json),
        includeDeviceId: true,
        includeToken: true,
      );
      return response;
    } catch (error) {
      return ApiResponse(data: null, error: error.toString());
    }
  }

  Future<ApiResponse> updateDeviceWithFCMToken(
    UpdateAddDeviceModel deviceRequest,
  ) async {
    try {
      logger.i('Device Service: updateDeviceWithFCMToken $deviceRequest');
      final response = await apiService.request(
        'POST',
        ApiEndpoints.updateDevice,
        (json) => ApiResponse.fromJson(json, json),
        data: deviceRequest,
      );
      return response;
    } catch (error) {
      return ApiResponse(data: null, error: error.toString());
    }
  }

  //   Future<ApiResponse<EmployeeDetails>> fetchEmployeeByEmployeeId(
  //       String id) async {
  //     try {
  //       final response = await apiService.get(
  //         ApiEndpoints.fetchUsernameDetails,
  //         (json) => EmployeeDetails.fromJson(json),
  //       );
  //       return response;
  //     } catch (error) {
  //       return ApiResponse(data: null, error: error.toString());
  //     }
  //   }

  //   Future<ApiResponse> sendFcmToken(String fcmToken) async {
  //     try {
  //       logger.i('Fetching token :::  $fcmToken');
  //       return ApiResponse(data: null, success: true);
  //     } catch (e) {
  //       return ApiResponse(data: null, error: e.toString());
  //     }
  //   }

  Future<ApiResponse<OtpModel>> sendOTP(String phoneNo) async {
    try {
      final response = await apiService.request(
        'POST',
        ApiEndpoints.sendOTP,
        (json) => OtpModel.fromJson(json),
        data: {'phoneNo': phoneNo},
        includeDeviceId: false,
        includeToken: false,
      );
      return response;
    } catch (e) {
      return ApiResponse(data: null, error: e.toString());
    }
  }

  Future<ApiResponse<UserIdentityModel>> validateOTP(
    String phoneNo,
    String otpCode,
    String verificationId,
  ) async {
    try {
      final response = await apiService.request(
        'POST',
        ApiEndpoints.validateOTP,
        (json) => UserIdentityModel.fromJson(json),
        data: {
          'phoneNo': phoneNo,
          'otpCode': otpCode,
          'verificationId': verificationId,
        },
        includeDeviceId: false,
        includeToken: false,
      );
      return response;
    } catch (e) {
      return ApiResponse(data: null, error: e.toString());
    }
  }

    Future<ApiResponse> setPassword(String userId, String password) async {
      try {
        final response = await apiService.request(
          'POST',
          ApiEndpoints.setPassword,
          (json) => ApiResponse.fromJson(json, json),
          data: {'phoneNo': userId, 'password': password},
          includeDeviceId: false,
          includeToken: false,
        );
        return response;
      } catch (e) {
        return ApiResponse(data: null, error: e.toString());
      }
    }
}
