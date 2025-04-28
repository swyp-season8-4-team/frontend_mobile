part of 'update_store_to_user_store_list_view_model.dart';

@freezed
class UpdateStoreToUserStoreListState with _$UpdateStoreToUserStoreListState {
  factory UpdateStoreToUserStoreListState({
    @Default(<int>[]) List<int> listIds,
    @Default(Status.initial) Status updateStoreToUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel updateStoreToUserStoreListException,
  }) = _UpdateStoreToUserStoreListState;

  const UpdateStoreToUserStoreListState._();

  // 전체 저장 삭제 가능 여부
  bool get canDeleteAll =>
      listIds.isEmpty && !updateStoreToUserStoreListStatus.isLoading;
}
