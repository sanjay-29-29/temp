import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/constants/api_response_model.dart';
import 'package:BuildTek/models/devices/add_device_model.dart';
import 'package:BuildTek/services/auth/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<ApiResponse<UserIdentityModel>> fetchUsernameDetails(
    String email,
  ) async {
    final response = await authService.fetchUsernameDetails(email);
    return response;
  }

  Future<ApiResponse<UserDetails>> authenticate(
    String email,
    String password,
  ) async {
    final response = await authService.authenticate(email, password);
    return response;
  }

  Future addDevice(AddDeviceModel deviceRequest) async {
    final device = await authService.addDevice(deviceRequest);
    return device;
  }

  Future activateDevice(DeviceActivateModel devices) async {
    final device = await authService.activateDevice(devices);
    return device;
  }

  Future deviceVerification() async {
    final device = await authService.deviceVerification();
    return device;
  }

  Future updateDeviceWithFCMToken(UpdateAddDeviceModel deviceRequest) async {
    final device = await authService.updateDeviceWithFCMToken(deviceRequest);
    return device;
  }

  //   Future<ApiResponse> sendFcmToken(String fcmToken) async {
  //     final response = await authService.sendFcmToken(fcmToken);
  //     return response;
  //   }

    Future<ApiResponse> sendOTP(String phoneNo) async {
      final response = await authService.sendOTP(phoneNo);
      return response;
    }

    Future<ApiResponse> validateOTP(
        String phoneNo, String otp, String verificationId) async {
      final response = await authService.validateOTP(phoneNo, otp, verificationId);
      return response;
    }

    Future<ApiResponse> setPassword(String userId, String password) async {
      final response = await authService.setPassword(userId, password);
      return response;
    }
}
