part of 'local_login_view_model.dart';

@freezed
class LocalLoginState with _$LocalLoginState {
  const factory LocalLoginState({
    @Default(Status.initial) Status status,
    @Default(
      LocalLoginModel(
        accessToken: '',
        refreshToken: '',
        tokenType: '',
        expiresIn: -1,
        userUuid: '',
        email: '',
        nickname: '',
        profileImageUrl: null,
        deviceId: '',
        preferenceSet: false,
      ),
    )
    LocalLoginModel data,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _LocalLoginState;
}
