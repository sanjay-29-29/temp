import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OtpModel extends Equatable {
  final UserIdentityModel user;
  final MessageModel message;

  const OtpModel({
    required this.user,
    required this.message,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) =>
      _$OtpModelFromJson(json);
  Map<String, dynamic> toJson() => _$OtpModelToJson(this);

  @override
  List<Object?> get props => [
        user,
        message,
      ];
}

@JsonSerializable()
class MessageModel extends Equatable {
  final String verificationId;
  final String mobileNumber;
  final String responseCode;
  final String timeout;
  final String transactionId;

  const MessageModel({
    required this.verificationId,
    required this.mobileNumber,
    required this.responseCode,
    required this.timeout,
    required this.transactionId,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  @override
  List<Object?> get props => [
        verificationId,
        mobileNumber,
        responseCode,
        timeout,
        transactionId,
      ];
}
