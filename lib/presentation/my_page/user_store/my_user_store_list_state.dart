part of 'my_user_store_list_view_model.dart';

@freezed
class MyUserStoreListState with _$MyUserStoreListState {
  factory MyUserStoreListState({
    @Default(Status.initial) Status deleteUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel deleteUserStoreListException,
  }) = _MyUserStoreListState;
}
