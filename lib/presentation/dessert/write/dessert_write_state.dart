part of 'dessert_write_view_model.dart';

@freezed
class DessertWriteState with _$DessertWriteState {
  const factory DessertWriteState({
    @Default(Status.initial) Status status,
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
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _DessertWriteState;
}
