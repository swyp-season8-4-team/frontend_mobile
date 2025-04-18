part of 'stores_by_user_store_list_view_model.dart';

@freezed
class StoresByUserStoreListState with _$StoresByUserStoreListState {
  factory StoresByUserStoreListState({
    UserStoreListModel? stores,
    @Default(Status.loading) Status getStoresByUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoresByUserStoreListException,
  }) = _StoresByUserStoreListState;

  const StoresByUserStoreListState._();

  bool get isFirstLoading =>
      stores == null && getStoresByUserStoreListStatus.isLoading;
}
