// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpModel _$OtpModelFromJson(Map<String, dynamic> json) => OtpModel(
  user: UserIdentityModel.fromJson(json['user'] as Map<String, dynamic>),
  message: MessageModel.fromJson(json['message'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OtpModelToJson(OtpModel instance) => <String, dynamic>{
  'user': instance.user.toJson(),
  'message': instance.message.toJson(),
};

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
  verificationId: json['verificationId'] as String,
  mobileNumber: json['mobileNumber'] as String,
  responseCode: json['responseCode'] as String,
  timeout: json['timeout'] as String,
  transactionId: json['transactionId'] as String,
);

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'verificationId': instance.verificationId,
      'mobileNumber': instance.mobileNumber,
      'responseCode': instance.responseCode,
      'timeout': instance.timeout,
      'transactionId': instance.transactionId,
    };
