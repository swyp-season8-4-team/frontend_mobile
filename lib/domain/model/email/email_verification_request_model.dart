import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/email_verification_request_model.g.dart';

@JsonSerializable()
class EmailVerificationRequestModel {
  const EmailVerificationRequestModel({
    required this.message,
    required this.expirationMinutes,
  });

  factory EmailVerificationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestModelFromJson(json);

  final String message;
  final int expirationMinutes;
}
