part of 'find_password_view_model.dart';

@freezed
class FindPasswordState with _$FindPasswordState {
  const factory FindPasswordState({
    @Default(Status.initial) Status postVerificationRequestStatus,
    @Default(Status.initial) Status postVerifyStatus,
    @Default(Status.initial) Status passwordResetStatus,

    @Default(EmailVerificationRequestModel(message: '', expirationMinutes: -1))
    EmailVerificationRequestModel verificationRequestData,
    @Default(EmailVerifyModel(verificationToken: '', verified: false))
    EmailVerifyModel verifyData,
    @Default(
      PasswordResetModel(
        success: false,
        message: '',
        status: -1,
        timestamp: '',
      ),
    )
    PasswordResetModel passwordResetData,

    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _FindPasswordState;
}
