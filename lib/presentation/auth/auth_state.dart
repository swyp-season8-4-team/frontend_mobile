part of 'auth_view_model.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(Status.initial) Status statusRefreshToken,
    @Default(
      RefreshTokenModel(
        accessToken: '',
        tokenType: '',
        expiresIn: -1,
        deviceId: null,
      ),
    )
    RefreshTokenModel refreshTokenData,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _LocalLoginState;
}
