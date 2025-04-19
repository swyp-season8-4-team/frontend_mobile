part of 'add_user_store_list_view_model.dart';

@freezed
class AddUserStoreListState with _$AddUserStoreListState {
  factory AddUserStoreListState({
    String? listName,
    @Default(1) int iconColorId,
    @Default(Status.initial) Status addUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel addUserStoreListException,
  }) = _AddUserStoreListState;
}
