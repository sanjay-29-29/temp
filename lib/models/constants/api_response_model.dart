import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class ApiResponse<T> extends Equatable {
  final T? data;
  final dynamic error;
  final String? statusCode;
  final String? message;
  final bool? success;

  const ApiResponse({
    this.data,
    this.error,
    this.statusCode,
    this.message,
    this.success,
  });

  @override
  List<Object?> get props => [data, error, statusCode, message, success];
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    final data = json['data'];

    if (data is List) {
      return ApiResponse<T>(
        data: data.map((item) => fromJsonT(item)).toList() as T,
        error: json['error'],
        statusCode: json['statusCode'],
        message: json['message'],
        success: json['success'],
      );
    } else if (data is String) {
      return ApiResponse<T>(
        data: fromJsonT(data),
        error: json['error'],
        statusCode: json['statusCode'],
        message: json['message'],
        success: json['success'],
      );
    } else if (data is Map) {
      return ApiResponse<T>(
        data: fromJsonT(data),
        error: json['error'],
        statusCode: json['statusCode'],
        message: json['message'],
        success: json['success'],
      );
    } else {
      return ApiResponse<T>(
        data: null,
        error: json['error'],
        statusCode: json['statusCode'],
        message: json['message'],
        success: json['success'],
      );
    }
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
