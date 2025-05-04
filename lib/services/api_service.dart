import 'dart:convert';
import 'dart:io';
import 'package:BuildTek/bloc/auth/authenticate/authenicate_bloc.dart';
import 'package:BuildTek/bloc/auth/authenticate/authenticate_event.dart';
import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/config/url_config.dart';
import 'package:BuildTek/constants/api_constants.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/constants/api_response_model.dart';
import 'package:BuildTek/models/devices/fetch_device_model.dart';
import 'package:BuildTek/services/storage/store_service.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class ApiService {
  final String baseUrl = Config.baseUrl;
  final AuthenticationBloc authenticationBloc;
  ApiService({required this.authenticationBloc});
  Future<Map<String, String>> _getHeaders({
    bool includeToken = true,
    bool includeDeviceId = true,
  }) async {
    final headers = <String, String>{'Content-Type': 'application/json'};

    if (includeToken) {
      String token = await _getToken();
      headers['Authorization'] = 'Bearer $token';
    }

    if (includeDeviceId) {
      String deviceId = await _getDeviceId();
      headers['deviceid'] = deviceId;
    }

    return headers;
  }

  Future<String> _getToken() async {
    final User token = await StoreService.getToken();
    return token.idToken;
  }

  Future<String> _getDeviceId() async {
    FetchDevice device = await StoreService.getDeviceDetails();
    if (device.deviceId != null) {
      return device.deviceId!;
    }
    return 'N/A';
  }

  Future<String> getRefreshToken() async {
    User refreshToken = await StoreService.getToken();
    return refreshToken.refreshToken;
  }

  Future<ApiResponse<R>> request<R, D>(
    String method,
    String endpoint,
    R Function(dynamic) fromJson, {
    D? data,
    Map<String, dynamic>? urlParams,
    Map<String, dynamic>? queryParams,
    bool multipart = false,
    bool includeToken = true,
    bool includeDeviceId = true,
  }) async {
    final headers = await _getHeaders(
      includeToken: includeToken,
      includeDeviceId: includeDeviceId,
    );

    var uri = Uri.parse('$baseUrl$endpoint');
    if (urlParams != null) {
      urlParams.forEach((key, value) {
        uri.replace(path: uri.path.replaceAll(':$key', value.toString()));
      });
    }

    if (queryParams != null && queryParams.isNotEmpty) {
      final queryString = Uri(queryParameters: queryParams).query;
      uri = uri.replace(query: queryString);
    }
    if (multipart) {
      return multipartRequest(method, endpoint, data, fromJson);
    }
    final response = await http.Client().send(
      http.Request(method, uri)
        ..headers.addAll(headers)
        ..body = data != null ? json.encode(data) : '',
    );

    final responseStream = await response.stream.bytesToString();
    // -----
    if (response.statusCode == 401) {
      final refreshToken = await getRefreshToken();
      print('Refresh Token: $refreshToken');
      var uri = Uri.parse('$baseUrl${ApiEndpoints.refreshToken}');
      final refreshTokenResponse = await http.Client().send(
        http.Request('POST', uri)
          ..headers.addAll(headers)
          ..body = json.encode({'refreshToken': refreshToken}),
      );
      final refreshTokenResponseStream =
          await refreshTokenResponse.stream.bytesToString();
      if (refreshTokenResponse.statusCode == 401) {
        authenticationBloc.add(LogoutEvent());
      }
      if (refreshTokenResponse.statusCode <= 300) {
        final refreshTokenResponseJson = json.decode(
          refreshTokenResponseStream,
        );
        StoreService.storeToken(refreshTokenResponseJson['data']);
        return request(
          method,
          endpoint,
          fromJson,
          data: data,
          urlParams: urlParams,
          queryParams: queryParams,
          multipart: multipart,
          includeToken: includeToken,
          includeDeviceId: includeDeviceId,
        );
      }
    }
    return handleResponse(
      http.Response(responseStream, response.statusCode),
      fromJson,
    );
  }

  Future<ApiResponse<R>> get<R>(
    String endpoint,
    R Function(dynamic) fromJson, {
    bool includeToken = true,
    bool includeDeviceId = true,
  }) async {
    final headers = await _getHeaders(
      includeToken: includeToken,
      includeDeviceId: includeDeviceId,
    );
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    if (response.statusCode == 401) {
      String refreshToken = getRefreshToken() as String;
      var uri = Uri.parse('$baseUrl${ApiEndpoints.refreshToken}');
      final refreshTokenResponse = await http.Client().send(
        http.Request('POST', uri)
          ..headers.addAll(headers)
          ..body = json.encode({'refreshToken': refreshToken}),
      );
      final refreshTokenResponseStream =
          await refreshTokenResponse.stream.bytesToString();
      if (refreshTokenResponse.statusCode == 401) {
        authenticationBloc.add(LogoutEvent());
      }
      if (refreshTokenResponse.statusCode < 300) {
        final refreshTokenResponseJson = json.decode(
          refreshTokenResponseStream,
        );
        StoreService.storeToken(refreshTokenResponseJson['data']);
        return get(
          endpoint,
          fromJson,
          includeToken: includeToken,
          includeDeviceId: includeDeviceId,
        );
      }
    }
    return handleResponse(response, fromJson);
  }

  Future<ApiResponse<R>> multipartRequest<R, D>(
    String method,
    String endpoint,
    D data,
    R Function(dynamic) fromJson, {
    bool includeToken = true,
    bool includeDeviceId = true,
  }) async {
    final headers = await _getHeaders(
      includeToken: includeToken,
      includeDeviceId: includeDeviceId,
    );

    final request = http.MultipartRequest(
      method,
      Uri.parse('$baseUrl$endpoint'),
    )..headers.addAll(headers);

    if (data is Map<String, dynamic>) {
      var imageProcessingFuture = Future.value();

      if (data.containsKey('image')) {
        final imageValue = data['image'];
        if (imageValue is String) {
          imageProcessingFuture = processImageFile(request, imageValue);
        }
      } else if (data.containsKey('documentList')) {
        final documentList = data['documentList'];
        for (var document in documentList) {
          if (document is String) {
            imageProcessingFuture = processImageFile(request, document);
          }
        }
      }

      await imageProcessingFuture;

      data.forEach((key, value) async {
        if (key != 'image' && key != 'documentList') {
          if (value is List) {
            for (var i = 0; i < value.length; i++) {
              request.fields['$key[$i]'] = value[i].toString();
            }
          } else {
            if (key != 'email') {
              request.fields[key] = value.toString();
            } else {
              if (value.isNotEmpty) {
                request.fields[key] = value.toString();
              }
            }
          }
        }
      });
    }
    logger.i('Request fields ::::::::::;: ${request.fields}');
    logger.i('Request files ::::::::::;: ${request.files}');
    final response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 401) {
      String refreshToken = getRefreshToken() as String;
      var uri = Uri.parse('$baseUrl${ApiEndpoints.refreshToken}');
      final refreshTokenResponse = await http.Client().send(
        http.Request('POST', uri)
          ..headers.addAll(headers)
          ..body = json.encode({'refreshToken': refreshToken}),
      );
      final refreshTokenResponseStream =
          await refreshTokenResponse.stream.bytesToString();
      if (refreshTokenResponse.statusCode == 401) {
        authenticationBloc.add(LogoutEvent());
      }
      if (refreshTokenResponse.statusCode == 300) {
        final refreshTokenResponseJson = json.decode(
          refreshTokenResponseStream,
        );
        StoreService.storeToken(refreshTokenResponseJson['data']);
        return multipartRequest(
          method,
          endpoint,
          data,
          fromJson,
          includeToken: includeToken,
          includeDeviceId: includeDeviceId,
        );
      }
    }
    return handleResponse(response, fromJson);
  }

  Future<void> processImageFile(
    http.MultipartRequest request,
    String value,
  ) async {
    logger.i('Processing image file');
    try {
      File imageFile = File(value);
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
        'file',
        stream,
        length,
        filename: path.basename(value),
      );
      request.files.add(multipartFile);
    } catch (e) {
      logger.e('Error processing image: $e');
    }
  }

  Future<ApiResponse<R>> handleResponse<R>(
    http.Response response,
    R Function(dynamic) fromJson,
  ) async {
    try {
      final resp = json.decode(response.body);
      logger.i('Response Body $resp');
      if (resp['success'] == true) {
        return ApiResponse(
          data:
              resp['data'] != null
                  ? fromJson(
                    resp['data'] is String
                        ? json.decode(resp['data'])
                        : resp['data'],
                  )
                  : null,
          success: resp['success'],
          message: resp['message'],
          statusCode: response.statusCode.toString(),
        );
      } else {
        String errorMessage;
        try {
          errorMessage = resp['message'];
        } catch (e) {
          errorMessage = 'Something went wrong';
        }
        return ApiResponse(
          data: null,
          error: resp['errors'],
          message: errorMessage,
          statusCode: response.statusCode.toString(),
          success: resp['success'],
        );
      }
    } catch (e) {
      logger.e('Error handling response: $e');
      return ApiResponse(
        data: null,
        error: 'Something went wrong',
        message: 'Something went wrong',
        statusCode: response.statusCode.toString(),
        success: false,
      );
    }
  }
}
