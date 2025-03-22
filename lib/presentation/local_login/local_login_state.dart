part of 'local_login_view_model.dart';

@freezed
class LocalLoginState with _$LocalLoginState {
  const factory LocalLoginState({
    @Default(Status.initial) Status status,
    @Default(Code.C003) Code code,
    @Default('') String message,
    @Default(
      LocalLoginModel(
        accessToken: '',
        refreshToken: '',
        tokenType: '',
        expiresIn: -1,
        userUuid: '',
        email: '',
        nickname: '',
        profileImageUrl: '',
        preferenceSet: false,
      ),
    )
    LocalLoginModel data,
  }) = _LocalLoginState;
}
