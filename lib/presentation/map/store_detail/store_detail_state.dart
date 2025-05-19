part of 'store_detail_view_model.dart';

typedef ReviewMenuOptionVisible =
    ({String reviewUuid, bool isOptionMenuVisible});

@freezed
class StoreDetailState with _$StoreDetailState {
  factory StoreDetailState({
    StoreDetailModel? storeDetail,
    @Default(Status.loading) Status getStoreDetailStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoreDetailException,

    @Default(<ReviewMenuOptionVisible>[])
    List<ReviewMenuOptionVisible> reviewMenuOptionsVisible,

    @Default(false) bool todayReviewExist,
    @Default(Status.loading) Status checkTodayReviewStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel checkTodayReviewException,

    @Default('') String blockedNickname,
    @Default(Status.initial) Status blockUserStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel blockUserException,
  }) = _StoreDetailState;

  const StoreDetailState._();

  List<String> get thumbnailImageUrls => <String>[
    ...storeDetail!.ownerPickImages?.map(
          (StoreDetailImageModel e) => e.url ?? '',
        ) ??
        <String>[],
    ...storeDetail!.menus
        .map((StoreDetailMenuModel e) => e.images ?? <String>[])
        .expand((List<String> e) => e),
    ...storeDetail!.storeReviews
            ?.map((StoreDetailReviewModel e) => e.images ?? <String>[])
            .expand((List<String> e) => e) ??
        <String>[],
  ];
}
