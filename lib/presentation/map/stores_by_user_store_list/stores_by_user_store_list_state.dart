part of 'stores_by_user_store_list_view_model.dart';

typedef StoreOptionMenuVisible = ({String storeUuid, bool isOptionMenuVisible});

@freezed
class StoresByUserStoreListState with _$StoresByUserStoreListState {
  factory StoresByUserStoreListState({
    @Default(<PreferenceModel>[]) List<PreferenceModel> preferences,
    @Default(Status.loading) Status getAllPreferencesStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getAllPreferencesException,
    UserStoreListDetailModel? storeList,
    @Default(Status.loading) Status getStoresByUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoresByUserStoreListException,

    // 가게들의 옵션 메뉴 표시 여부
    @Default(<StoreOptionMenuVisible>[])
    List<StoreOptionMenuVisible> storeOptionMenuVisibleList,

    @Default(Status.initial) Status deleteStoreStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel deleteStoreException,
  }) = _StoresByUserStoreListState;

  const StoresByUserStoreListState._();

  bool get isFirstLoading =>
      storeList == null &&
      (getStoresByUserStoreListStatus.isLoading ||
          getAllPreferencesStatus.isLoading);

  // 가게 조회 로딩중 || 취향 정보 로딩중
  bool get isFailure =>
      getStoresByUserStoreListStatus.isFailure ||
      getAllPreferencesStatus.isFailure;
}
