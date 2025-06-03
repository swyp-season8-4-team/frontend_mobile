import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/password_reset_params.freezed.dart';

@freezed
class PasswordResetParams with _$PasswordResetParams {
  const factory PasswordResetParams({
    required String emailToken,
    required String email,
    required String newPassword,
    required String confirmNewPassword,
  }) = _PasswordResetParams;
}
