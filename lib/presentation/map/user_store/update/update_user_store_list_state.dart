part of 'update_user_store_list_view_model.dart';

@freezed
class UpdateUserStoreListState with _$UpdateUserStoreListState {
  factory UpdateUserStoreListState({
    String? newListName,
    @Default(1) int newIconColorId,
    @Default(Status.initial) Status updateUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel updateUserStoreListException,
  }) = _UpdateUserStoreListState;
}
