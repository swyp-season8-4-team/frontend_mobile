part of 'sign_up_view_model.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(Status.initial) Status postVerificationRequestStatus,
    @Default(Status.initial) Status postVerifyStatus,
    @Default(Status.initial) Status postNicknameStatus,
    @Default(EmailVerificationRequestModel(message: '', expirationMinutes: -1))
    EmailVerificationRequestModel verificationRequestData,
    @Default(EmailVerifyModel(verificationToken: '', verified: false))
    EmailVerifyModel verifyData,
    @Default(NicknameAvailabilityModel(available: false))
    NicknameAvailabilityModel nicknameAvailabilityData,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _SignUpState;
}
