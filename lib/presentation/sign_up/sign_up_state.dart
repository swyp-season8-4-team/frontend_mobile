part of 'sign_up_view_model.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(Status.initial) Status postVerificationRequestStatus,
    @Default(Status.initial) Status postVerifyStatus,
    @Default(EmailVerificationRequestModel(message: '', expirationMinutes: -1))
    EmailVerificationRequestModel verificationRequestData,
    @Default(EmailVerifyModel(verificationToken: '', verified: false))
    EmailVerifyModel verifyData,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _SignUpState;
}
