part of 'add_store_to_user_store_list_view_model.dart';

@freezed
class AddStoreToUserStoreListState with _$AddStoreToUserStoreListState {
  factory AddStoreToUserStoreListState({
    @Default(Status.initial) Status addStoreToUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel addStoreToUserStoreListException,

    int? listId,
  }) = _AddStoreToUserStoreListState;
}
