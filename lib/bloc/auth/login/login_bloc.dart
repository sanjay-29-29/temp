import 'dart:io';
import 'package:BuildTek/bloc/auth/login/login_state.dart';
import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/constants/route_constants.dart';
import 'package:BuildTek/models/devices/add_device_model.dart';
import 'package:BuildTek/models/devices/fetch_device_model.dart';
import 'package:BuildTek/respositories/auth/auth_repository.dart';
import 'package:BuildTek/services/storage/store_service.dart';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  final AuthRepository authRepository;

  AuthLoginBloc({required this.authRepository}) : super(AuthInitialState()) {
    on<SubmitUserNameEvent>(_onSubmitUserNameEvent);
    on<SubmitPasswordEvent>(_onSubmitPasswordEvent);
    on<AuthGetOTPEvent>(_onGetOTPEvent);
    on<AuthSubmitOTPEvent>(_onSubmitOTPEvent);
    on<AuthSetPasswordEvent>(_onSetPasswordEvent);

    on<AuthFetchDeviceDetailsEvent>(_onFetchDeviceDetailsEvent);
    on<AuthAddDeviceEvent>(_onAddDeviceEvent);
  }

  void _onSubmitUserNameEvent(
    SubmitUserNameEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    try {
      emit(AuthLoginLoadingState());
      final response = await authRepository.fetchUsernameDetails(
        event.username,
      );

      if (response.success != true && response.statusCode == 404) {
        emit(
          AuthUserNotFoundState(
            message: "User not found",
            route: RouteConstants.userNotFound,
          ),
        );
        return;
      }

      if (response.success != true) {
        emit(AuthLoginErrorState(message: response.message ?? "Error"));
        return;
      }

      if (response.data != null && response.data!.isPasswordSet == false) {
        emit(
          AuthPasswordNotSetState(
            message: "Password not set",
            phoneNo: response.data!.phoneNo,
            route: RouteConstants.otpPage,
          ),
        );
        return;
      }

      emit(
        AuthUserIdentitySuccess(
          userIdentityModel: response.data!,
          route: RouteConstants.password,
        ),
      );
    } catch (e) {
      logger.e(e.toString());
      emit(AuthLoginErrorState(message: "Something went wrong"));
    }
  }

  void _onSubmitPasswordEvent(
    SubmitPasswordEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    emit(AuthLoginLoadingState());

    try {
      final platform = kIsWeb ? 'web' : 'mobile';
      final response = await authRepository.authenticate(
        event.username,
        event.password,
      );

      if (response.success == true) {
        final userDetails = response.data!.employee.data;

        if (userDetails.role.roleName == 'Super Admin') {
          if (platform == 'mobile') {
            add(AuthFetchDeviceDetailsEvent());
            emit(AuthPasswordSuccessState(route: RouteConstants.home));
          } else {
            emit(AuthPasswordSuccessState(route: RouteConstants.dashboard));
          }
          return;
        }

        if (userDetails.department.name == 'Accounts') {
          emit(AuthPasswordSuccessState(route: RouteConstants.dashboard));
          return;
        }

        add(AuthFetchDeviceDetailsEvent());
        final device = await StoreService.getDeviceDetails();

        final verifyResponse = await authRepository.deviceVerification();
        if (!verifyResponse.success!) {
          final msg = verifyResponse.message ?? 'Device verification failed';
          if (msg.contains('is not registered') ||
              msg.contains('deleted') ||
              msg.contains('not active') ||
              msg.contains('not found')) {
            emit(
              AuthAddDeviceState(
                message: msg,
                route: RouteConstants.addDevice,
                employee: userDetails,
                device: device,
              ),
            );
          } else {
            emit(AuthLoginErrorState(message: msg));
          }
          return;
        }

        final isVerified = verifyResponse.data?.isVerified ?? false;
        if (!isVerified) {
          emit(
            AuthPasswordSuccessState(route: RouteConstants.deviceProcessing),
          );
          return;
        }

        String? fcmTokenDefault = await StoreService.getFcmToken();
        if (fcmTokenDefault != null) {
          final fcmToken = await FirebaseMessaging.instance.getToken();
          if (fcmToken != null) {
            fcmTokenDefault = fcmToken;
            await StoreService.storeFcmToken(fcmToken);
          }
        }

        final updateModel = UpdateAddDeviceModel(
          deviceId: device.deviceId,
          deviceMake: device.deviceMake,
          deviceModel: device.deviceModel,
          fcmToken: fcmTokenDefault ?? '',
          employee: userDetails.id,
        );

        final updateResponse = await authRepository.updateDeviceWithFCMToken(
          updateModel,
        );

        if (updateResponse.success == true) {
          emit(AuthPasswordSuccessState(route: RouteConstants.home));
        } else {
          emit(
            AuthLoginErrorState(
              message: updateResponse.message ?? 'Device update failed',
            ),
          );
        }
      } else {
        emit(
          AuthLoginErrorState(
            message: response.message ?? 'Authentication failed',
          ),
        );
      }
    } catch (e) {
      logger.e(e.toString());
      emit(AuthLoginErrorState(message: "Something went wrong"));
    }
  }

  void _onGetOTPEvent(
    AuthGetOTPEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    try {
      emit(AuthLoginLoadingState());
      final response = await authRepository.sendOTP(event.phoneNo);
      if (response.success != true) {
        emit(AuthOTPSendErrorState(message: response.message ?? "Error"));
        return;
      }
      emit(
        AuthOTPSendSuccessState(
          message: response.message ?? "Success",
          otpModel: response.data!,
        ),
      );
    } catch (e) {
      logger.e(e.toString());
      emit(AuthLoginErrorState(message: "Something went wrong"));
    }
  }

  void _onSubmitOTPEvent(
    AuthSubmitOTPEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    try {
      emit(AuthLoginLoadingState());
      final response = await authRepository.validateOTP(
        event.phoneNo,
        event.otpCode,
        event.verificationId,
      );
      if (response.success != true) {
        emit(AuthOTPSendErrorState(message: response.message ?? "Error"));
        return;
      }
      emit(
        AuthOTPVerificationSuccessState(
          message: response.message ?? "Success",
          userIdentityModel: response.data!,
          route: RouteConstants.createPassword,
        ),
      );
    } catch (e) {
      logger.e(e.toString());
      emit(AuthLoginErrorState(message: "Something went wrong"));
    }
  }

  void _onSetPasswordEvent(
    AuthSetPasswordEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    try {
      emit(AuthLoginLoadingState());
      final response = await authRepository.setPassword(
        event.phoneNo,
        event.password,
      );
      if (response.success != true) {
        emit(AuthLoginErrorState(message: response.message ?? "Error"));
        return;
      }
      emit(
        AuthCreatePasswordSuccessState(
          message: response.message ?? "Success",
          route: RouteConstants.username,
        ),
      );
    } catch (e) {
      logger.e(e.toString());
      emit(AuthLoginErrorState(message: "Something went wrong"));
    }
  }

  void _onFetchDeviceDetailsEvent(
    AuthFetchDeviceDetailsEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    emit(AuthLoginLoadingState());
    try {
      FetchDeviceModel device = FetchDeviceModel(
        deviceId: '',
        deviceMake: '',
        deviceModel: '',
      );

      final deviceInfo = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final androidId = await const AndroidId().getId();
        final androidInfo = await deviceInfo.androidInfo;
        device = FetchDeviceModel(
          deviceId: androidId,
          deviceMake: androidInfo.brand,
          deviceModel: androidInfo.model,
        );
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        device = FetchDeviceModel(
          deviceId: iosInfo.identifierForVendor,
          deviceMake: iosInfo.model,
          deviceModel: iosInfo.name,
        );
      }

      await StoreService.storeDeviceDetails(device);
      await Future.delayed(const Duration(seconds: 1));
      // print("::::::::::::::Device data::::::::::::::${device.toJson()}");
      emit(AuthDeviceLoadedSuccessState(fetchDeviceModel: device));
    } catch (e) {
      emit(AuthLoginErrorState(message: e.toString()));
    }
  }

  void _onAddDeviceEvent(
    AuthAddDeviceEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    emit(AuthLoginLoadingState());
    try {
      final response = await authRepository.addDevice(event.device);
      if (response.success != true) {
        emit(AuthLoginErrorState(message: response.message ?? "Error"));
        return;
      }
      emit(
        AuthAddDeviceSuccessState(
          message: response.message ?? "Success",
          route: RouteConstants.deviceProcessing,
        ),
      );
    } catch (e) {
      logger.e(e.toString());
      emit(AuthLoginErrorState(message: "Something went wrong"));
    }
  }
}
