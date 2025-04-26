part of 'update_profile_info_view_model.dart';

@freezed
class UpdateProfileInfoState with _$UpdateProfileInfoState {
  factory UpdateProfileInfoState({
    File? newImageFile,
    String? oldImageUrl,
    @Default('') String nickName,
    @Default(<int>[]) List<int> userPreferences,

    @Default(Status.initial) Status postNicknameStatus,
    @Default(NicknameAvailabilityModel(available: false))
    NicknameAvailabilityModel nicknameAvailabilityData,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel postNicknameException,

    @Default(Status.initial) Status updateProfileImageStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel updateProfileImageException,

    @Default(Status.initial) Status updateUserInfoStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel updateUserInfoException,
  }) = _UpdateProfileInfoState;
}
