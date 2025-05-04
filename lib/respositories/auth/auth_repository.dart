
import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/constants/api_response_model.dart';
import 'package:BuildTek/services/auth/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<ApiResponse<UserIdentityModel>> fetchUsernameDetails(
      String email) async {
    final response = await authService.fetchUsernameDetails(email);
    return response;
  }

  Future<ApiResponse<UserDetails>> authenticate(
      String email, String password) async {
    final response = await authService.authenticate(email, password);
    return response;
  }

//   Future<ApiResponse> sendFcmToken(String fcmToken) async {
//     final response = await authService.sendFcmToken(fcmToken);
//     return response;
//   }

//   Future<ApiResponse> sendOTP(String phoneNo) async {
//     final response = await authService.sendOTP(phoneNo);
//     return response;
//   }

//   Future<ApiResponse> validateOTP(
//       String phoneNo, String otp, String verificationId) async {
//     final response = await authService.validateOTP(phoneNo, otp, verificationId);
//     return response;
//   }

//   Future<ApiResponse> setPassword(String userId, String password) async {
//     final response = await authService.setPassword(userId, password);
//     return response;
//   }
}
