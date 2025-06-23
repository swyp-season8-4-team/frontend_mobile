part of 'oauth_view_model.dart';

@freezed
class OauthState with _$OauthState {
  const factory OauthState({
    @Default(Status.initial) Status kakaoStatus,
    @Default(Status.initial) Status appleStatus,

    KakaoModel? kakaoData,
    AppleModel? appleData,

    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _OauthState;
}
