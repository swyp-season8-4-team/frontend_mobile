import 'package:json_annotation/json_annotation.dart';

part 'generated/password_reset_request_body.g.dart';

@JsonSerializable()
class PasswordResetRequestBody {
  PasswordResetRequestBody({
    required this.email,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  final String email;
  final String newPassword;
  final String confirmNewPassword;

  Map<String, dynamic> toJson() => _$PasswordResetRequestBodyToJson(this);
}
