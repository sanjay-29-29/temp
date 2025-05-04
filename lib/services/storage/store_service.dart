import 'dart:convert';

import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/client_models/customer/customer_model.dart';
import 'package:BuildTek/models/devices/fetch_device_model.dart';
import 'package:BuildTek/services/storage/secure_storage.dart';

class StoreService {
  static Future<void> storeDeviceDetails(FetchDeviceModel device) async {
    final jsonString = jsonEncode(device.toJson());
    logger.i("::::::::::: Device data stored :::::::::::::");
    await SecureStorageService.write('device', jsonString);
  }

  static Future<void> storeCustomers(
      List<CustomerDetailsModel> customers) async {
    final jsonString =
        jsonEncode(customers.map((customer) => customer.toJson()).toList());
    logger.i("::::::::::: Customer data stored :::::::::::::");

    await SecureStorageService.write('customers', jsonString);
  }

  static Future<List<CustomerDetailsModel>> getCustomers() async {
    String? customers = await SecureStorageService.read('customers');
    if (customers != null) {
      return (jsonDecode(customers) as List)
          .map((data) => CustomerDetailsModel.fromJson(data))
          .toList();
    } else {
      return [];
    }
  }

  static Future<void> storeToken(User tokenDetails) async {
    final jsonString = jsonEncode(tokenDetails.toJson());
    await SecureStorageService.write('tokenDetails', jsonString);
    logger.i("::::::::::: Token stored :::::::::::::");
  }

  static Future<User> getToken() async {
    String? tokenDevice = await SecureStorageService.read('tokenDetails');
    if (tokenDevice != null) {
      return User.fromJson(jsonDecode(tokenDevice));
    } else {
      throw Exception('No token found');
    }
  }

  static Future<void> storeFcmToken(String fcmToken) async {
    await SecureStorageService.write('fcmToken', fcmToken);
    logger.i("::::::::::: fcm token stores:::::::::::::");
  }

  static Future<FetchDeviceModel> getDeviceDetails() async {
    String? deviceDataJson = await SecureStorageService.read('device');
    if (deviceDataJson != null) {
      return FetchDeviceModel.fromJson(jsonDecode(deviceDataJson));
    } else {
      throw Exception('No device data found');
    }
  }

  static Future<void> storeEmployeeData(UserDetails employeeData) async {
    final jsonString = jsonEncode(employeeData.toJson());
    logger.i("::::::::Employee data stored::::::::::");
    await SecureStorageService.write('employee', jsonString);
  }

  static Future<String?> getFcmToken() async {
    String? fcmTokenJson = await SecureStorageService.read('fcmToken');
    if (fcmTokenJson != null) {
      return fcmTokenJson;
    } else {
      throw Exception('No fcm token found');
    }
  }

  static Future<UserDetails> getEmployeeData() async {
    String? employeeDataJson = await SecureStorageService.read('employee');
    if (employeeDataJson != null) {
      return UserDetails.fromJson(jsonDecode(employeeDataJson));
    } else {
      throw Exception('No employee data found');
    }
  }

  static Future<void> deleteAllData() async {
    await SecureStorageService.delete('device');
    await SecureStorageService.delete('employee');
    await SecureStorageService.delete('fcmToken');
    logger.i(":::::::::::All data deleted::::::::::::");
  }
}
