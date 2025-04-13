import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/email_verification_request_entity.g.dart';

@JsonSerializable()
class EmailVerificationRequestEntity {
  EmailVerificationRequestEntity({
    this.message = '',
    this.expirationMinutes = -1,
  });

  factory EmailVerificationRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestEntityFromJson(json);

  final String message;
  final int expirationMinutes;
}
