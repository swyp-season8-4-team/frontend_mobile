part of 'stores_by_user_store_list_view_model.dart';

@freezed
class StoresByUserStoreListState with _$StoresByUserStoreListState {
  factory StoresByUserStoreListState({
    @Default(<PreferenceModel>[]) List<PreferenceModel> preferences,
    @Default(Status.loading) Status getAllPreferencesStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getAllPreferencesException,
    UserStoreListModel? stores,
    @Default(Status.loading) Status getStoresByUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoresByUserStoreListException,
  }) = _StoresByUserStoreListState;

  const StoresByUserStoreListState._();

  bool get isFirstLoading =>
      stores == null && getStoresByUserStoreListStatus.isLoading;
}
