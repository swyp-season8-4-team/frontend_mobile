import 'package:json_annotation/json_annotation.dart';

part 'generated/password_reset_request_body.g.dart';

@JsonSerializable()
class PasswordResetRequestBody {
  PasswordResetRequestBody({
    required this.email,
    required this.currentPassword,
    required this.newPassword,
  });

  final String email;
  final String currentPassword;
  final String newPassword;

  Map<String, dynamic> toJson() => _$PasswordResetRequestBodyToJson(this);
}
