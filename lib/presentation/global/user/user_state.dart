part of 'user_view_model.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(Status.initial) Status status,
    @Default(
      UserDetailModel(
        userUuid: '',
        nickname: '',
        gender: null,
        profileImageUrl: null,
        preferences: <int>[],
        mbti: null,
        email: '',
        name: null,
        phoneNumber: null,
        address: null,
        isPreferencesSet: false,
      ),
    )
    UserDetailModel data,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _LocalLoginState;

  const UserState._();

  bool get isMale => data.gender == 'MALE';
}
