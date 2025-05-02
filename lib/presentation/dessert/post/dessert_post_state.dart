part of 'dessert_post_view_model.dart';

@freezed
class DessertPostState with _$DessertPostState {
  const factory DessertPostState({
    @Default(Status.initial) Status mateDetailStatus,
    @Default(Status.initial) Status postMateStatus,
    @Default(Status.initial) Status deleteMateStatus,
    @Default(Status.initial) Status leaveMateStatus,
    @Default(Status.initial) Status pendingMateStatus,
    @Default(Status.initial) Status acceptMateStatus,
    @Default(Status.initial) Status rejectMateStatus,
    @Default(Status.initial) Status getMateStatus,
    @Default(Status.initial) Status banMateStatus,
    @Default(
      MateDetailModel(
        mateUuid: '',
        storeId: -1,
        userUuid: '',
        capacity: -1,
        currentMemberCount: -1,
        nickname: '',
        title: '',
        content: '',
        recruitYn: false,
        mateImage: '',
        profileImage: '',
        place: PlaceModel(
          placeName: null,
          address: null,
          latitude: null,
          longitude: null,
        ),
        createdAt: '',
        updatedAt: '',
        saved: false,
        applyStatus: '',
        gender: '',
        mateCategory: '',
      ),
    )
    MateDetailModel data,
    @Default(<MateMemberDetailModel>[]) List<MateMemberDetailModel> pendingData,
    @Default(<MateMemberDetailModel>[]) List<MateMemberDetailModel> memberData,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _DessertPostState;
}
