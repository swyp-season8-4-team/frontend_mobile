part of 'my_user_store_list_view_model.dart';

@freezed
class MyUserStoreListState with _$MyUserStoreListState {
  factory MyUserStoreListState({
    @Default(<UserStoreListModel>[]) List<UserStoreListModel> userStoreLists,
    @Default(<UserStoreListOptionMenuVisible>[])
    List<UserStoreListOptionMenuVisible> userStoreListOptionMenuVisible,
    @Default(Status.loading) Status getUserStoreListAllStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getUserStoreListAllException,

    @Default(Status.initial) Status deleteUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel deleteUserStoreListException,
  }) = _MyUserStoreListState;
}
